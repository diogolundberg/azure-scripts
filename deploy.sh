source ./config.sh
source ./default_names.sh

az group create --name $RESOURCE_GROUP --location $LOCATION
az sql server create --name $DB_SERVER --resource-group $RESOURCE_GROUP --location $LOCATION --admin-user $DB_USER --admin-password $DB_PASSWORD
az appservice plan create --name $PLAN_SERVICE --resource-group $RESOURCE_GROUP --location $LOCATION --sku B1
az storage account create -n $BLOB_AZURE_ACCOUNT_NAME -g $RESOURCE_GROUP -l $LOCATION --sku Standard_RAGRS

az sql db create --name $SSO --resource-group $RESOURCE_GROUP --server $DB_SERVER --service-objective S0
az sql db create --name $ONBOARDING --resource-group $RESOURCE_GROUP --server $DB_SERVER --service-objective S0
az storage container create --name $UPLOAD --account-name $BLOB_AZURE_ACCOUNT_NAME

az webapp create --name $SSO_WEB_APP --resource-group $RESOURCE_GROUP --plan $PLAN_SERVICE
az webapp deployment source config-local-git --name $SSO_WEB_APP --resource-group $RESOURCE_GROUP --query url --output tsv

az webapp create --name $ONBOARDING_WEB_APP --resource-group $RESOURCE_GROUP --plan $PLAN_SERVICE
az webapp deployment source config-local-git --name $ONBOARDING_WEB_APP --resource-group $RESOURCE_GROUP --query url --output tsv

az webapp create --name $UPLOAD_WEB_APP --resource-group $RESOURCE_GROUP --plan $PLAN_SERVICE
az webapp deployment source config-local-git --name $UPLOAD_WEB_APP --resource-group $RESOURCE_GROUP --query url --output tsv
