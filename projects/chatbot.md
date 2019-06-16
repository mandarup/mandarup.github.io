---
layout: post
title: 'Feeling Chatty?'
---

TL;DR

Chatbots are amazing, aren't they? If you are in a rush, feel free to click on the above demo link to see it in action.

{% include image.html url="http://chat.curiositybytes.com" image="projects/chatbot/chatbot.gif" %}

Or, try it out below:

{% include embed.html url="https://chat.curiositybytes.com"  %}


#### Version 1 - Monolithic App

Version 1 uses a monolithic architecture for hosting the chatbot, supporting
both frontend and model hosting in a single server.

Several versions of chat models are available with  architectural variations,
- Character RNN
- Word level RNN
- Word level Seq2Seq with attention, based on Neural Machine Translation model
- Word level Transformer model

Original idea was to allow users choose and compare different models, but
this feature is currently disabled as current hosting capacity is limited
for this hobby project. At the time of writing the model deployed is Seq2Seq,
but this may change without any notice or update to this document.


#### Version 2 - Microservices approach

This is currently under development. Separating chatbot inference part
from the frontend will allow easy management of models without
messing with the frontend server. Also, this modular architecture will offer freedom on the model
serving part and allow experimentation with native (to model library) tools such as
tf-serving.

<!-- {% include image.html url="http://www.gratisography.com" image="projects/chatbot/wall.jpg" %} -->
