# Introduction

Scripts to help with installation of CoCo on OpenShift.
Includes the following
- /install-helpers/coco-baremetal: CoCo installation on baremetal OpenShift cluster
- /install-helpers/trustee: Trustee operator installation and configuration

## Usage

Copy the helper scripts to your local directory and follow the individual
instructions

```bash
podman run -v $HOME:/host quay.io/openshift_sandboxed_containers/install-helpers:0.1.0 cp -a /install-helpers /host/install-helpers
```

