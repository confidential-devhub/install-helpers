FROM registry.access.redhat.com/ubi9/ubi:latest

LABEL konflux.additional-tags="latest 0.2.0"

RUN dnf install -y \
    git

# Directory to keep the install scripts
RUN mkdir -p /install-helpers

# OCP install helpers
# For releases use the tag eg. v0.1.0
ARG OCP_REF=devel
ENV OCP_REF=${OCP_REF}

# For REF with main or devel use refs/head/$OCP_REF or refs/head/OCP_REF instead of refs/tags/OCP_REF

RUN git clone --single-branch --branch ${OCP_REF} https://github.com/openshift/sandboxed-containers-operator.git && \
    mv sandboxed-containers-operator/scripts/install-helpers/baremetal-coco /install-helpers/

# Trustee install helpers
ARG TRUSTEE_REF=main
ENV TRUSTEE_REF=${TRUSTEE_REF}
RUN git clone --single-branch --branch ${TRUSTEE_REF}  https://github.com/openshift/trustee-operator.git && \
    mv trustee-operator/scripts/install-helpers /install-helpers/trustee

# Cleanup
RUN rm -fr sandboxed-containers-operator trustee-operator && \
    dnf remove -y git
