---
layout: post
title: "Streaming image from file using shell."
categories: [til, tech]
tags: [shell, image]
---


When a process is continuously updating an image, it can be opened with reload option for continuous refresh :

```sh
$ apt-get install feh
$ feh --reload 1 /path/to/image.png
```
