FROM jetbrains/teamcity-agent

USER root

# Replace shell with bash so we can source files
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Install NVM
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update

ENV NVM_DIR /root/.nvm
ENV NODE_VERSION v10.19.0

RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION 

# Install Yarn
RUN apt-get install -y --no-install-recommends yarn

# Setup link for node
#ENV PATH="${NVM_DIR}:${PATH}"
COPY ./update-link.sh /root/.nvm/
RUN chmod +x /root/.nvm/update-link.sh
#RUN /root/.nvm/update-link.sh

RUN ln -s /root/.nvm/versions/node/v10.19.0/bin/node /usr/bin/node
RUN ln -s /root/.nvm/versions/node/v10.19.0/bin/npm /usr/bin/npm