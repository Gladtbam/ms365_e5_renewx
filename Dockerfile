FROM mcr.microsoft.com/dotnet/aspnet:3.1 AS ontology

WORKDIR /renewx

RUN apt update \
    && apt install -y unzip

COPY Microsoft365_E5_Renew_X.zip /renewx/Microsoft365_E5_Renew_X.zip

RUN unzip Microsoft365_E5_Renew_X.zip -d /renewx \
    && rm -rf Microsoft365_E5_Renew_X.zip

FROM mcr.microsoft.com/dotnet/aspnet:3.1

LABEL MAINTAINER="Gladtbam"

ENV LANG=zh_CN.UTF-8 \
    TZ=Asia/Shanghai

WORKDIR /renewx

EXPOSE 1066

COPY --from=ontology /renewx /renewx

ENTRYPOINT ["dotnet", "Microsoft365_E5_Renew_X.dll"]
