---
layout: post
title: 'Programming A Real Self Driving Car'
---


This project explains how to implement core components of the backend of a self driving car, which includes traffic lights detection, steering and throttle control, and waypoint following. Core logic is implemented using python and ROS.


The source code is hosted [here](https://github.com/mandarup/CarND-Capstone)



#### Deployment

This code was  tested in a simulator and then  deployed on a real car, giving it self driving capability. Below is a video recording from the deployment run, demonstrating smooth braking and stopping at a stop light and then acceleration. The waypoints of this route are predefined for this exercise.

![Deployment](/assets/img/projects/programming-a-self-driving-car/deployment-video.gif)




#### System Architecture


This project uses ROS nodes to implement core functionality of the autonomous vehicle system, including traffic light detection, control, and waypoint following. Code is tested using a simulator, and only after thourough testing, is deployed on a real car.

The following is a system architecture diagram showing the ROS nodes and topics used in the project. The ROS nodes and topics shown in the diagram are described briefly in the Code Structure section below, and more detail is provided for each node in later classroom concepts of this lesson.


![System Architecture](/assets/img/projects/programming-a-self-driving-car/system-architecture.png)

Next section covers some module specific details.


#### Code Structure

##### Traffic Light Detector

![Traffic Light Detector](/assets/img/projects/programming-a-self-driving-car/tl-node.png)

This package contains the traffic light detection node: `tl_detector.py`. This node takes in data from the `/image_color`, `/current_pose`, and `/base_waypoints` topics and publishes the locations to stop for red traffic lights to the `/traffic_waypoint` topic.

The /current_pose topic provides the vehicle's current position, and `/base_waypoints` provides a complete list of waypoints the car will be following.

This is both a traffic light detection node and a traffic light classification node. Traffic light detection  takes place within `tl_detector.py`, whereas traffic light classification  takes place within `../tl_detector/light_classification_model/tl_classfier.py`



#### Waypoint Updater

![Waypoint Updater](/assets/img/projects/programming-a-self-driving-car/waypoint-updater-node.png)

This package contains the waypoint updater node: `waypoint_updater.py`. The purpose of this node is to update the target velocity property of each waypoint based on traffic light and obstacle detection data. This node will subscribe to the `/base_waypoints`, `/current_pose`, `/obstacle_waypoint`, and `/traffic_waypoint` topics, and publish a list of waypoints ahead of the car with target velocities to the `/final_waypoints` topic.


#### Drive-by-Wire (DBW) Node

![DBW Node](/assets/img/projects/programming-a-self-driving-car/dbw-node.png)

The car used for deployment is equipped with a drive-by-wire (dbw) system, meaning the throttle, brake, and steering have electronic control. This package contains the files that are responsible for control of the vehicle: the node dbw_node.py and the file twist_controller.py, along with a pid and lowpass filter that  is used in the  implementation. The `dbw_node` subscribes to the `/current_velocity` topic along with the /twist_cmd topic to receive target linear and angular velocities. Additionally, this node will subscribe to `/vehicle/dbw_enabled`, which indicates if the car is under dbw or driver control. This node will publish throttle, brake, and steering commands to the `/vehicle/throttle_cmd`, `/vehicle/brake_cmd`, and `/vehicle/steering_cmd` topics.


#### Additional Packages


In addition to these packages, the following packages are taken off-the-shelf without any changes. The styx and styx_msgs packages are used to provide a link between the simulator and ROS, and to provide custom ROS message types:

- (path_to_project_repo)/ros/src/styx/
A package that contains a server for communicating with the simulator, and a bridge to translate and publish simulator messages to ROS topics.
- (path_to_project_repo)/ros/src/styx_msgs/
A package which includes definitions of the custom ROS message types used in the project.
- (path_to_project_repo)/ros/src/waypoint_loader/
A package which loads the static waypoint data and publishes to /base_waypoints.
- (path_to_project_repo)/ros/src/waypoint_follower/
A package containing code from Autoware which subscribes to /final_waypoints and publishes target vehicle linear and angular velocities in the form of twist commands to the /twist_cmd topic.



#### Installation, Setup and Usage

Please use **one** of the two installation options, either native **or** docker installation.

##### Native Installation

* Be sure that your workstation is running Ubuntu 16.04 Xenial Xerus or Ubuntu 14.04 Trusty Tahir. [Ubuntu downloads can be found here](https://www.ubuntu.com/download/desktop).
* If using a Virtual Machine to install Ubuntu, use the following configuration as minimum:
  * 2 CPU
  * 2 GB system memory
  * 25 GB of free hard drive space

  The Udacity provided virtual machine has ROS and Dataspeed DBW already installed, so you can skip the next two steps if you are using this.

* Follow these instructions to install ROS
  * [ROS Kinetic](http://wiki.ros.org/kinetic/Installation/Ubuntu) if you have Ubuntu 16.04.
  * [ROS Indigo](http://wiki.ros.org/indigo/Installation/Ubuntu) if you have Ubuntu 14.04.
* [Dataspeed DBW](https://bitbucket.org/DataspeedInc/dbw_mkz_ros)
  * Use this option to install the SDK on a workstation that already has ROS installed: [One Line SDK Install (binary)](https://bitbucket.org/DataspeedInc/dbw_mkz_ros/src/81e63fcc335d7b64139d7482017d6a97b405e250/ROS_SETUP.md?fileviewer=file-view-default)
* Download the [Udacity Simulator](https://github.com/udacity/CarND-Capstone/releases).

##### Docker Installation
[Install Docker](https://docs.docker.com/engine/installation/)

Build the docker container
```bash
docker build . -t capstone
```

Run the docker file
```bash
docker run -p 4567:4567 -v $PWD:/capstone -v /tmp/log:/root/.ros/ --rm -it capstone
```

<!-- ##### Port Forwarding
To set up port forwarding, please refer to the [instructions from term 2](https://classroom.udacity.com/nanodegrees/nd013/parts/40f38239-66b6-46ec-ae68-03afd8a601c8/modules/0949fca6-b379-42af-a919-ee50aa304e6a/lessons/f758c44c-5e40-4e01-93b5-1a82aa4e044f/concepts/16cf4a78-4fc7-49e1-8621-3450ca938b77) -->

##### Usage

1. Clone the project repository
```bash
git clone https://github.com/mandarup/CarND-Capstone.git
```

2. Install python dependencies
```bash
cd CarND-Capstone
pip install -r requirements.txt
```
3. Make and run styx
```bash
cd ros
catkin_make
source devel/setup.sh
roslaunch launch/styx.launch
```
4. Run the simulator

##### Real world testing
1. Download [training bag](https://s3-us-west-1.amazonaws.com/udacity-selfdrivingcar/traffic_light_bag_file.zip) that was recorded on the Udacity self-driving car.
2. Unzip the file
```bash
unzip traffic_light_bag_file.zip
```
3. Play the bag file
```bash
rosbag play -l traffic_light_bag_file/traffic_light_training.bag
```
4. Launch your project in site mode
```bash
cd CarND-Capstone/ros
roslaunch launch/site.launch
```
5. Confirm that traffic light detection works on real life images


#### Credits

This project developed as part of Self Driving Engineer curriculum on Udacity, and was made succussful by a team effort from following members:
- Abdi Ibrahim
- Alberto Escarlate
- Anton Bossenbroek
- Mandar Upadhye
- Martin Lippl
