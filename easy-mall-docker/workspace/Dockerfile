FROM golang:latest

LABEL maintainer="Zou You <1075820342@qq.com>"

# 添加 alias
COPY ./aliases.sh /root/aliases.sh

RUN sed -i 's/\r//' /root/aliases.sh && \
    echo "" >> ~/.bashrc && \
    echo "# Load Custom Aliases" >> ~/.bashrc && \
    echo "source ~/aliases.sh" >> ~/.bashrc && \
    echo "" >> ~/.bashrc

# 安装更新
RUN apt-get update -y && \
    apt-get upgrade -y
RUN apt-get install -y apt-utils autoconf automake libtool curl make g++ musl-dev vim net-tools

# 设置时区
ARG TZ=PRC
ENV TZ ${TZ}
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 设置环境变量
# 可配置 https://goproxy.io、https://goproxy.cn
ARG GOPROXY=https://goproxy.cn
ENV GOPROXY ${GOPROXY}
ENV GO111MODULE on
RUN go env -w GOPROXY=${GOPROXY},direct

# 安装 micro、go-micro
RUN go get github.com/micro/micro && \
    go get github.com/micro/go-micro && \
    go get github.com/micro/protoc-gen-micro && \
    go get -u github.com/golang/protobuf/protoc-gen-go

# protobuf
WORKDIR /usr
RUN git clone https://github.com/protocolbuffers/protobuf.git

WORKDIR /usr/protobuf
RUN git submodule update --init --recursive && ./autogen.sh && ./configure && make && make check && make install

WORKDIR /var/www

ENTRYPOINT [ "micro", "web" ]

EXPOSE 8082
