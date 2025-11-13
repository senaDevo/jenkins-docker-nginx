FROM alpine
RUN echo "Hello from Docker image!" > /message.txt
CMD cat /message.txt
