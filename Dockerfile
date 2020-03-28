FROM kworker1:30001/microservice-base:0.1.0 AS build

#Build Service
COPY Makefile ./
ADD src ./src
RUN g++ -std=c++17 -O3 src/main.cpp -o test -lpistache -lpthread
RUN ls -la

FROM ubuntu:eoan
RUN apt-get update
RUN apt-get install -y software-properties-common apt-utils
RUN add-apt-repository ppa:pistache+team/unstable
RUN apt-get update 
RUN apt-get install -y libpistache-dev

WORKDIR /opt/test

COPY --from=build /test ./

CMD ["./test"]