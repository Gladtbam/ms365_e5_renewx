#!/bin/bash

if [ -n "${LoginPassword}" ]; then
	sed -i "s/<LoginPassword>.*<\/LoginPassword>/<LoginPassword>$LoginPassword<\/LoginPassword>/" /renewx/Deploy/Config.xml
fi

dotnet /renewx/Microsoft365_E5_Renew_X.dll
