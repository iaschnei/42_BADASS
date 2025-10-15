FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y

# Install frr routing suite (contains Zebra, BGPd etc...) and basic utils
RUN apt-get install -y frr frr-pythontools iproute2 net-tools

# Clear cache to reduce image size
RUN rm -rf /var/lib/apt/lists/*

# Enable daemons 
RUN sed -i 's/zebra=no/zebra=yes/' /etc/frr/daemons && \
    sed -i 's/bgpd=no/bgpd=yes/' /etc/frr/daemons && \
    sed -i 's/ospfd=no/ospfd=yes/' /etc/frr/daemons && \
    sed -i 's/isisd=no/isisd=yes/' /etc/frr/daemons

# Create configs directory
RUN mkdir -p /etc/frr

COPY confs/zebra.conf /etc/frr/zebra.conf
COPY confs/bgpd.conf /etc/frr/bgpd.conf
COPY confs/ospfd.conf /etc/frr/ospfd.conf
COPY confs/isisd.conf /etc/frr/isisd.conf

RUN chown frr:frr /etc/frr/*.conf

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Run every daemon, see script for details
ENTRYPOINT ["/entrypoint.sh"]
