source ./config.sh
source ./default_names.sh

LOCATION="brazilsouth"

az group create --name $RESOURCE_GROUP --location $LOCATION

az sql server create --name $DB_SERVER --resource-group $RESOURCE_GROUP --location $LOCATION --admin-user $DB_USER --admin-password $DB_PASSWORD
az sql db create --resource-group $RESOURCE_GROUP --server $DB_SERVER --name $SSO_DB_SERVER --service-objective S0
az sql db create --resource-group $RESOURCE_GROUP --server $DB_SERVER --name $ONBOARDING_DB_SERVER --service-objective S0

az appservice plan create --name $PLAN_SERVICE --resource-group $RESOURCE_GROUP --location $LOCATION --sku B1

az webapp create --name $SSO --resource-group $RESOURCE_GROUP --plan $PLAN_SERVICE
az webapp deployment source config-local-git --name $SSO --resource-group $RESOURCE_GROUP --query url --output tsv

az webapp create --name $ONBOARDING --resource-group $RESOURCE_GROUP --plan $PLAN_SERVICE
az webapp deployment source config-local-git --name $ONBOARDING --resource-group $RESOURCE_GROUP --query url --output tsv

az webapp create --name $UPLOAD --resource-group $RESOURCE_GROUP --plan $PLAN_SERVICE
az webapp deployment source config-local-git --name $UPLOAD --resource-group $RESOURCE_GROUP --query url --output tsv

az storage account create -n $BLOB_AZURE_ACCOUNT_NAME -g $RESOURCE_GROUP -l $LOCATION --sku Standard_RAGRS
az storage container create --account-name $BLOB_AZURE_ACCOUNT_NAME --name documents
