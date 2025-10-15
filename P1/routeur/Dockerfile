FROM frrouting/frr:v8.4.0

COPY confs/daemons.conf /etc/frr/daemons
RUN chown frr:frr /etc/frr/daemons

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
