FROM registry.access.redhat.com/ubi9/ubi:latest

LABEL konflux.additional-tags="latest 0.2.0"

RUN dnf install -y \
    git

# Directory to keep the install scripts
RUN mkdir -p /install-helpers

# OCP install helpers
# For releases use the tag eg. v0.1.0
ARG OCP_REF=954acc35c32d1b8bb2b138ddf8359bb42609751a
ENV OCP_REF=${OCP_REF}

RUN git clone --single-branch --branch devel https://github.com/openshift/sandboxed-containers-operator.git && \
    cd sandboxed-containers-operator && \
    git checkout ${OCP_REF} && \
    mv scripts/install-helpers/baremetal-coco /install-helpers/

# Trustee install helpers
ARG TRUSTEE_REF=19aebe234cb2c0ad1829368ad86fde78064c553d
ENV TRUSTEE_REF=${TRUSTEE_REF}
RUN git clone --single-branch --branch main  https://github.com/openshift/trustee-operator.git && \
    cd trustee-operator && \
    git checkout ${TRUSTEE_REF} && \
    mv scripts/install-helpers /install-helpers/trustee

# Cleanup
RUN rm -fr sandboxed-containers-operator trustee-operator && \
    dnf remove -y git
