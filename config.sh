SSO_PROJECT_NAME="sso"
ONBOARDING_PROJECT_NAME="onboarding"
UPLOAD_PROJECT_NAME="upload"

PLAN_SERVICE="${APPLICATION_NAME}_plan_service"
RESOURCE_GROUP="${APPLICATION_NAME}_resource_group"

SSO="${APPLICATION_NAME}-${SSO_PROJECT_NAME}-webapp"
ONBOARDING="${APPLICATION_NAME}-${ONBOARDING_PROJECT_NAME}-webapp"
UPLOAD="${APPLICATION_NAME}-${UPLOAD_PROJECT_NAME}-webapp"

DB_SERVER="${APPLICATION_NAME}-sqlserver"
SSO_DB_SERVER="${DB_SERVER}-${SSO_PROJECT_NAME}"
ONBOARDING_DB_SERVER="${DB_SERVER}-${ONBOARDING_PROJECT_NAME}"

BLOB_AZURE_ACCOUNT_NAME="${APPLICATION_NAME}production"
BLOB_AZURE_CONTAINER="documents"
BLOB_AZURE_SHARED_ACCESS_EXPIRY_TIME="15"

SSO_DATABASE_CONNECTION="Server=tcp:${DB_SERVER}.database.windows.net,1433;Initial Catalog=${SSO_DB_SERVER};Persist Security Info=False;User ID=${DB_USER};Password=${DB_PASSWORD};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"
ONBOARDING_DATABASE_CONNECTION="Server=tcp:${DB_SERVER}.database.windows.net,1433;Initial Catalog=${ONBOARDING_DB_SERVER};Persist Security Info=False;User ID=${DB_USER};Password=${DB_PASSWORD};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"

az webapp config appsettings set --name $SSO --resource-group $RESOURCE_GROUP --settings PROJECT="SSO/${SSO_PROJECT_NAME}.csproj"
az webapp config appsettings set --name $SSO --resource-group $RESOURCE_GROUP --settings EMAIL_SENDER="${SSO_PROJECT_NAME}@${MAILER_DOMAIN}"

az webapp config appsettings set --name $UPLOAD --resource-group $RESOURCE_GROUP --settings PROJECT="UPLOAD/${SSO_PROJECT_NAME}.csproj"
az webapp config appsettings set --name $UPLOAD --resource-group $RESOURCE_GROUP --settings EMAIL_SENDER="${UPLOAD_PROJECT_NAME}@${MAILER_DOMAIN}"
az webapp config appsettings set --name $UPLOAD --resource-group $RESOURCE_GROUP --settings BLOB_AZURE_ACCOUNT_NAME=$BLOB_AZURE_ACCOUNT_NAME
az webapp config appsettings set --name $UPLOAD --resource-group $RESOURCE_GROUP --settings BLOB_AZURE_ACCESS_KEY=$BLOB_AZURE_ACCESS_KEY
az webapp config appsettings set --name $UPLOAD --resource-group $RESOURCE_GROUP --settings BLOB_AZURE_CONTAINER=$BLOB_AZURE_CONTAINER
az webapp config appsettings set --name $UPLOAD --resource-group $RESOURCE_GROUP --settings BLOB_AZURE_SHARED_ACCESS_EXPIRY_TIME=$BLOB_AZURE_SHARED_ACCESS_EXPIRY_TIME

az webapp config appsettings set --name $ONBOARDING --resource-group $RESOURCE_GROUP --settings PROJECT="ONBOARDING/${SSO_PROJECT_NAME}.csproj"
az webapp config appsettings set --name $ONBOARDING --resource-group $RESOURCE_GROUP --settings EMAIL_SENDER="${ONBOARDING_PROJECT_NAME}@${MAILER_DOMAIN}"

az webapp config appsettings set --name $SSO --resource-group $RESOURCE_GROUP --settings SSO_HOST="https://${SSO}.${APPLICATION_DOMAIN}"
az webapp config appsettings set --name $SSO --resource-group $RESOURCE_GROUP --settings UPLOAD_HOST="https://${UPLOAD}.${APPLICATION_DOMAIN}"
az webapp config appsettings set --name $SSO --resource-group $RESOURCE_GROUP --settings ONBOARDING_HOST="https://${ONBOARDING}.${APPLICATION_DOMAIN}"
az webapp config appsettings set --name $SSO --resource-group $RESOURCE_GROUP --settings SECURITY_KEY=$SECURITY_KEY
az webapp config appsettings set --name $SSO --resource-group $RESOURCE_GROUP --settings SENTRY_API=$SENTRY_API
az webapp config appsettings set --name $SSO --resource-group $RESOURCE_GROUP --settings SMTP_USERNAME=$SMTP_USERNAME
az webapp config appsettings set --name $SSO --resource-group $RESOURCE_GROUP --settings SMTP_PASSWORD=$SMTP_PASSWORD
az webapp config appsettings set --name $SSO --resource-group $RESOURCE_GROUP --settings WEBSITE_TIME_ZONE='E. South America Standard Time'

az webapp config appsettings set --name $ONBOARDING --resource-group $RESOURCE_GROUP --settings SSO_HOST="https://${SSO}.${APPLICATION_DOMAIN}"
az webapp config appsettings set --name $ONBOARDING --resource-group $RESOURCE_GROUP --settings UPLOAD_HOST="https://${UPLOAD}.${APPLICATION_DOMAIN}"
az webapp config appsettings set --name $ONBOARDING --resource-group $RESOURCE_GROUP --settings ONBOARDING_HOST="https://${ONBOARDING}.${APPLICATION_DOMAIN}"
az webapp config appsettings set --name $ONBOARDING --resource-group $RESOURCE_GROUP --settings SECURITY_KEY=$SECURITY_KEY
az webapp config appsettings set --name $ONBOARDING --resource-group $RESOURCE_GROUP --settings SENTRY_API=$SENTRY_API
az webapp config appsettings set --name $ONBOARDING --resource-group $RESOURCE_GROUP --settings SMTP_USERNAME=$SMTP_USERNAME
az webapp config appsettings set --name $ONBOARDING --resource-group $RESOURCE_GROUP --settings SMTP_PASSWORD=$SMTP_PASSWORD
az webapp config appsettings set --name $ONBOARDING --resource-group $RESOURCE_GROUP --settings WEBSITE_TIME_ZONE='E. South America Standard Time'

az webapp config appsettings set --name $UPLOAD --resource-group $RESOURCE_GROUP --settings SSO_HOST="https://${SSO}.${APPLICATION_DOMAIN}"
az webapp config appsettings set --name $UPLOAD --resource-group $RESOURCE_GROUP --settings UPLOAD_HOST="https://${UPLOAD}.${APPLICATION_DOMAIN}"
az webapp config appsettings set --name $UPLOAD --resource-group $RESOURCE_GROUP --settings ONBOARDING_HOST="https://${ONBOARDING}.${APPLICATION_DOMAIN}"
az webapp config appsettings set --name $UPLOAD --resource-group $RESOURCE_GROUP --settings SECURITY_KEY=$SECURITY_KEY
az webapp config appsettings set --name $UPLOAD --resource-group $RESOURCE_GROUP --settings SENTRY_API=$SENTRY_API
az webapp config appsettings set --name $UPLOAD --resource-group $RESOURCE_GROUP --settings SMTP_USERNAME=$SMTP_USERNAME
az webapp config appsettings set --name $UPLOAD --resource-group $RESOURCE_GROUP --settings SMTP_PASSWORD=$SMTP_PASSWORD
az webapp config appsettings set --name $UPLOAD --resource-group $RESOURCE_GROUP --settings WEBSITE_TIME_ZONE='E. South America Standard Time'

az storage account keys list --account-name $BLOB_AZURE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP
