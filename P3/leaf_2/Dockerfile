FROM frrouting/frr:v8.4.0

# Create empty configuration files to make sure everything starts up properly
RUN touch /etc/frr/vtysh.conf /etc/frr/zebra.conf /etc/frr/bgpd.conf /etc/frr/ospfd.conf /etc/frr/isisd.conf && chown frr:frr /etc/frr/*.conf

RUN touch /etc/frr/vtysh.conf
COPY confs/daemons.conf /etc/frr/daemons
RUN chown frr:frr /etc/frr/daemons

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
