# docker-nginx-reverse-proxy

# Usage

Edit followings.

```Makefile:Makefile
DOMAINS=-d example.com -d www.example.com
EMAIL=me@mail.com
```


## test run in local environment
```
$ make test_generate_template

# edit service_settings

$ make test_generate_conf
$ make test_run
```
