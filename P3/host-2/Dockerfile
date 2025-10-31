FROM alpine:3.14
# Make sure busybox is installed. Also add iproute2 and iputils to have access to ping and other useful functions
RUN apk update && apk upgrade && apk add busybox iproute2 iputils

COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

ENTRYPOINT ["/startup.sh"]
