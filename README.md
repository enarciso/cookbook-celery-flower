celery-flower Cookbook
======================
Installs and configures [flower](http://flower.readthedocs.org/en/latest/), a basic monitoring tool for celery clusters.

NOTE: This cookbook is a modified version of [BNOTIONS's](https://github.com/BNOTIONS/cookbook-flower) cookbook. RunIT is used instead of supervisor to deamonize the process. Added [apache2](https://github.com/onehealth-cookbooks/apache2) and [Posie's proxy](https://github.com/poise/poise-proxy) cookbook as reverse proxy 

Attributes
----------
TODO: List your cookbook attributes here.

e.g.
#### celery-flower::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['celery-flower']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### celery-flower::default
TODO: Write usage instructions for each cookbook.

e.g.
Just include `celery-flower` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[celery-flower]"
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