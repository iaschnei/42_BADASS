FROM alpine:3.14
# Make sure busybox is installed. Also add iproute2 and iputils to have access to ping and other useful functions
RUN apk update && apk upgrade && apk add busybox iproute2 iputils
# Define a specific IP address to connect later
RUN ip addr add 30.1.1.2/24 dev eth1
