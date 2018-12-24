FROM python
ENV TRIGGERMESH_VERSION v0.0.7
ENV GCLOUD_DL google-cloud-sdk-228.0.0-linux-x86_64

# Install GCloud SDK
WORKDIR /
RUN curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/${GCLOUD_DL}.tar.gz
RUN tar zxvf ${GCLOUD_DL}.tar.gz google-cloud-sdk
RUN rm ${GCLOUD_DL}.tar.gz google-cloud-sdk
RUN chmod +x /google-cloud-sdk/install.sh
RUN /google-cloud-sdk/install.sh --usage-reporting=true --path-update=true --bash-completion=true --rc-path=/.bashrc --additional-components app kubectl alpha beta
RUN /google-cloud-sdk/bin/gcloud config set --installation component_manager/disable_update_check true
ENV PATH /google-cloud-sdk/bin:$PATH

# Install TriggerMesh CLI
RUN wget https://github.com/triggermesh/tm/releases/download/${TRIGGERMESH_VERSION}/tm
RUN mv tm /usr/local/bin/tm
RUN chmod +x /usr/local/bin/tm

CMD ["tm", "--version"]
