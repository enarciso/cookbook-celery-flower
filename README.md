celery-flower Cookbook
======================
Installs and configures [flower](http://flower.readthedocs.org/en/latest/), a basic monitoring tool for celery clusters.

NOTE: This cookbook is a modified version of [BNOTIONS's](https://github.com/BNOTIONS/cookbook-flower) cookbook. It uses runit instead of supervisor to deamonize the process

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
TODO: (optional) If this is a public cookbook, detail the process for contributing. If this is a private cookbook, remove this section.

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: TODO: List authors
