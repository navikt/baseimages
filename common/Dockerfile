FROM busybox

RUN wget -O /dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.1/dumb-init_1.2.1_amd64
RUN chmod +x /dumb-init

COPY init-scripts/ /init-scripts
COPY entrypoint.sh /entrypoint.sh
COPY setup-apprunner.sh /setup-apprunner.sh
