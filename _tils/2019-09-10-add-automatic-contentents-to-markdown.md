---
layout: post
title: Add automatic contents to Markdown docs.
categories: [til, tech]
tags: [jekyll, toc]
---


##### Table of Contents (ToC)

A ToC is so awesome and easy to produce. Automatically generate by Kramdown with this simple markup:

```
- TOC
{:toc}
```

All the file headings will be all automatically included in the ToC, except for those we don't want there. For these, we apply a class called no_toc, and Kramdown will respect our will:

```
#### This heading will not be included in the ToC.
{: .no_toc}
```

And of course, we can make the ToC an ordered list instead of unordered:

```
1. TOC
{:toc}
```


##### Reference
- [gitlab](https://about.gitlab.com/2016/07/19/markdown-kramdown-tips-and-tricks/#table-of-contents-toc)
