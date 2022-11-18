#!/bin/bash

LOCATION='eastus'


RESOURCEGROUPNAME='az400m17l01a-RG'
SERVICEPLANNAME='az400l17-sp'
WEBAPPNAME=partsunlimited$RANDOM$RANDOM
USERNAME="Student"
SQLSERVERPASSWORD="Pa55w.rd1234"
SERVERNAME="partsunlimitedserver$RANDOM"
STARTIP="0.0.0.0"
ENDIP="0.0.0.0"

az group create --name $RESOURCEGROUPNAME --location $LOCATION

az appservice plan create --resource-group $RESOURCEGROUPNAME  --name $SERVICEPLANNAME --sku B3

az webapp create --resource-group $RESOURCEGROUPNAME --plan $SERVICEPLANNAME --name $WEBAPPNAME

az monitor app-insights component create --app $WEBAPPNAME  --location $LOCATION  --kind web --application-type web  --resource-group $RESOURCEGROUPNAME 
az monitor app-insights component connect-webapp --app $WEBAPPNAME  --resource-group $RESOURCEGROUPNAME --web-app $WEBAPPNAME

az sql server create --name $SERVERNAME --resource-group $RESOURCEGROUPNAME  --location $LOCATION --admin-user $USERNAME --admin-password $SQLSERVERPASSWORD

az sql server firewall-rule create --server $SERVERNAME --resource-group $RESOURCEGROUPNAME  --name AllowAzureResources --start-ip-address $STARTIP --end-ip-address $ENDIP

az sql db create --server $SERVERNAME --resource-group $RESOURCEGROUPNAME --name PartsUnlimited  --service-objective S0



