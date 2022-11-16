# We need to create the following Resources

## Azure Container Registry 
## Azure Web App for Containers
## Azure SQL Databases




## To provision the above resources will be Azure CLI.

```
sh azure-env.sh 
```

## Setup a Database Connection String 
```
CONNECTION_STRING="Data Source=tcp:$SQLDB_SRV_NAME.database.windows.net,1433;Initial Catalog=$SQLDB_NAME;User Id=sqladmin;Password=Pa55w.rd1234;"
az webapp config connection-string set --name $WEB_APP_NAME --resource-group $RG_NAME --connection-string-type SQLAzure --settings defaultConnection="$CONNECTION_STRING"
```


