FROM busybox

RUN wget -O /dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.1/dumb-init_1.2.1_amd64
RUN echo "057ecd4ac1d3c3be31f82fc0848bf77b1326a975b4f8423fe31607205a0fe945  /dumb-init" | sha256sum -c
RUN chmod +x /dumb-init

COPY init-scripts/ /init-scripts
COPY entrypoint.sh /entrypoint.sh
COPY setup-apprunner.sh /setup-apprunner.sh
