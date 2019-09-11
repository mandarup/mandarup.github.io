---
layout: post
title: Add search to Jekyll static site.
categories: [til, tech]
tags: [python, numpy]
---


- TOC
{:toc}



##### Step 1

Create `search.json` and save in root dir.


{% raw %}
~~~liquid
    ---
    ---
    [
      {% for post in site.posts %}
        {

          "title"    : "{{ post.title | strip_html | escape }}",
          "url"      : "{{ site.baseurl }}{{ post.url }}",
          "category" : "{{post.categories | join: ', '}}",
          "tags"     : "{{ post.tags | join: ', ' }}",
          "date"     : "{{ post.date }}",
          "discription" : "{{post.description | strip_html | strip_newlines | escape }}"

        } {% unless forloop.last %},{% endunless %}
      {% endfor %}
    ]
~~~
{% endraw %}


##### Step 2

Grab this [javascript](https://raw.githubusercontent.com/christian-fei/Simple-Jekyll-Search/master/dest/simple-jekyll-search.min.js) and save it in your javascripts dir (e.g. `/assets/js/` - remember to update this path to js in next html file)



##### Step 3
Create `search.html` with content below and save it (e.g. to `_includes`).


```html
<!-- Html Elements for Search -->
<div id="search-container">
<input type="text" id="search-input" placeholder="search...">
<ul id="results-container"></ul>
</div>

<!-- Script pointing to search-script.js -->
<script src="/assets/js/search-script.js" type="text/javascript"></script>

<!-- Configuration -->
<script>
SimpleJekyllSearch({
  searchInput: document.getElementById('search-input'),
  resultsContainer: document.getElementById('results-container'),
  json: '/search.json'
})
</script>
```


##### References

- [blog.webjeda.com](https://blog.webjeda.com/instant-jekyll-search/)
