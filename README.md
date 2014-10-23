celery-flower Cookbook
======================
Installs and configures [flower](http://flower.readthedocs.org/en/latest/), a basic monitoring tool for celery clusters.

NOTE: This cookbook is a modified version of [BNOTIONS's](https://github.com/BNOTIONS/cookbook-flower) cookbook. RunIT is used instead of supervisor to deamonize the process. Added [apache2](https://github.com/onehealth-cookbooks/apache2) and [Posie's proxy](https://github.com/poise/poise-proxy) cookbook as reverse proxy 

Requirements
============

Chef 0.10.0 or higher required (for Chef environment use)

Platform
========
* Ubuntu 12.04 LTS
* Centos 6.5

Usage
-----
#### celery-flower::default
Just include `celery-flower` in your node's `run_list` to get flower running. Add `celery-flower:apache` access it via port 80

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[celery-flower]",
    "recipe[celery-flower::apache]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

Testing
-------
```
bundle install
```
```
kitchen test
```

License and Authors
-------------------
- Author:: Eugene Narciso (<eugene.narciso@gmail.com>)

```text
Copyright 2014, Eugene Narciso

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

   http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```