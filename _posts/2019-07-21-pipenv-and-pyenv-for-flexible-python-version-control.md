


# Pipenv + pyenv

[This](https://hackernoon.com/reaching-python-development-nirvana-bb5692adf30c) is a good article, but the gist is pyenv, amongst other things, lets you easily install specific python version, and pipenv lets you select specific installed version.

```sh
$ pyenv install 3.7.0

Installed Python-3.7.0 to /Users/dvf/.pyenv/versions/3.7.0

# other helpful commands for controlling global and local versions
$ pyenv global 3.7.0 
# and
$ pyenv local 3.6.7 #e.g.

# after install appropriate version, use pipenv to create virtualenv
$ pipenv --python  3.7.0 

```
