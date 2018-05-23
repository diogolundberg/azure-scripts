source ./config.sh
source ./default_names.sh

APPLICATION_DOMAIN="azurewebsites.net"
BLOB_AZURE_ACCESS_KEY=$(az storage account keys list --account-name $BLOB_AZURE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP| grep -o '"value": "[^"]*' | grep -o -m 1 '[^"]*$')

az webapp config appsettings set --name $SSO --resource-group $RESOURCE_GROUP --settings PROJECT="SSO/${SSO_PROJECT_NAME}.csproj"
az webapp config appsettings set --name $SSO --resource-group $RESOURCE_GROUP --settings EMAIL_SENDER="${SSO_PROJECT_NAME}@${MAILER_DOMAIN}"

az webapp config appsettings set --name $UPLOAD --resource-group $RESOURCE_GROUP --settings PROJECT="UPLOAD/${SSO_PROJECT_NAME}.csproj"
az webapp config appsettings set --name $UPLOAD --resource-group $RESOURCE_GROUP --settings EMAIL_SENDER="${UPLOAD_PROJECT_NAME}@${MAILER_DOMAIN}"
az webapp config appsettings set --name $UPLOAD --resource-group $RESOURCE_GROUP --settings BLOB_AZURE_ACCOUNT_NAME=$BLOB_AZURE_ACCOUNT_NAME
az webapp config appsettings set --name $UPLOAD --resource-group $RESOURCE_GROUP --settings BLOB_AZURE_ACCESS_KEY=$BLOB_AZURE_ACCESS_KEY
az webapp config appsettings set --name $UPLOAD --resource-group $RESOURCE_GROUP --settings BLOB_AZURE_CONTAINER=$UPLOAD_PROJECT_NAME
az webapp config appsettings set --name $UPLOAD --resource-group $RESOURCE_GROUP --settings BLOB_AZURE_SHARED_ACCESS_EXPIRY_TIME="15"

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
