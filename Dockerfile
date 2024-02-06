FROM --platform=$TARGETPLATFORM mcr.microsoft.com/dotnet/aspnet:3.1

COPY --chown=root:root renewx /renewx/
COPY --chown=root:root init.sh /renewx/

VOLUME [ "/renewx/Deploy", "/renewx/appdata" ]

ENV LANG=zh_CN.UTF-8 \
    TZ=Asia/Shanghai \
    LoginPassword=12345678

EXPOSE 1066

WORKDIR /renewx

RUN chmod +x init.sh

ENTRYPOINT ["./init.sh"]
