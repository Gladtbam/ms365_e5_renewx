FROM mcr.microsoft.com/dotnet/aspnet:3.1 AS ontology

WORKDIR /renewx

RUN sed -i 's/deb.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list \
    && sed -i 's/security.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list \
    && apt update \
    && apt install -y wget unzip\
    && wget https://pan.gladtbam.top/auto/%E8%BD%AF%E4%BB%B6/E5/Microsoft365_E5_Renew_X.zip \
    && unzip Microsoft365_E5_Renew_X.zip -d /renewx \
    && rm -rf Microsoft365_E5_Renew_X.zip

FROM mcr.microsoft.com/dotnet/aspnet:3.1

LABEL MAINTAINER="Gladtbam"

ENV LANG=zh_CN.UTF-8 \
    TZ=Asia/Shanghai

WORKDIR /renewx

EXPOSE 1066

COPY --from=ontology /renewx /renewx

ENTRYPOINT ["dotnet", "Microsoft365_E5_Renew_X.dll"]
