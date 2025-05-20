# Introduction

Scripts to help with installation of CoCo on OpenShift.
Includes the following
- /install-helpers/coco-baremetal: CoCo installation on baremetal OpenShift cluster
- /install-helpers/trustee: Trustee operator installation and configuration

## Usage

Copy the helper scripts to your local directory and follow the individual
instructions

```bash
export VERSION=<SET> #0.1.0, 0.2.0 etc..
podman run -v $HOME:/host quay.io/openshift_sandboxed_containers/install-helpers:$VERSION cp -a /install-helpers /host/install-helpers
```
You can check the available tags directly in the quay repo - `quay.io/openshift_sandboxed_containers/install-helpers`
