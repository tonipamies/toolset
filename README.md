# toolset

Toolset bundles Ansible developing and testing tools in a single container.

```bash
# or use podman instead of docker if you wish
docker run -it quay.io/ansible/toolset /bin/bash
```

## What is bundled inside the container

Container [](https://github.com/ansible-community/toolset/blob/main/requirements.txt)

* [ansible](https://pypi.org/project/ansible/)
* [ansible-lint](https://pypi.org/project/ansible-lint/)
* [molecule](https://pypi.org/project/molecule/) and most of its plugins
* [pytest](https://pypi.org/project/pytest/) and several of its plugins
