source ./config.sh
source ./default_names.sh

APPLICATION_DOMAIN="azurewebsites.net"
BLOB_AZURE_ACCESS_KEY=$(az storage account keys list --account-name $BLOB_AZURE_ACCOUNT_NAME --resource-group $RESOURCE_GROUP| grep -o '"value": "[^"]*' | grep -o -m 1 '[^"]*$')

for PROJECT in $SSO $UPLOAD $ONBOARDING; do
  PROJECT_UPPERCASE=$(echo $PROJECT | awk '{print toupper($0)}')
  WEBAPP=${APPLICATION_NAME}-${ENVIRONMENT_NAME}-${PROJECT}-webapp

  az webapp config appsettings set --name $WEBAPP --resource-group $RESOURCE_GROUP --settings PROJECT="${PROJECT_UPPERCASE}/${PROJECT}.csproj"
  az webapp config appsettings set --name $WEBAPP --resource-group $RESOURCE_GROUP --settings EMAIL_SENDER="${PROJECT}@${MAILER_DOMAIN}"

  az webapp config appsettings set --name $WEBAPP --resource-group $RESOURCE_GROUP --settings SECURITY_KEY=$SECURITY_KEY
  az webapp config appsettings set --name $WEBAPP --resource-group $RESOURCE_GROUP --settings SENTRY_API=$SENTRY_API
  az webapp config appsettings set --name $WEBAPP --resource-group $RESOURCE_GROUP --settings SMTP_USERNAME=$SMTP_USERNAME
  az webapp config appsettings set --name $WEBAPP --resource-group $RESOURCE_GROUP --settings SMTP_PASSWORD=$SMTP_PASSWORD
  az webapp config appsettings set --name $WEBAPP --resource-group $RESOURCE_GROUP --settings WEBSITE_TIME_ZONE='E. South America Standard Time'

  az webapp config appsettings set --name $WEBAPP --resource-group $RESOURCE_GROUP --settings SSO_HOST="https://${SSO_WEB_APP}.${APPLICATION_DOMAIN}"
  az webapp config appsettings set --name $WEBAPP --resource-group $RESOURCE_GROUP --settings UPLOAD_HOST="https://${UPLOAD_WEB_APP}.${APPLICATION_DOMAIN}"
  az webapp config appsettings set --name $WEBAPP --resource-group $RESOURCE_GROUP --settings ONBOARDING_HOST="https://${ONBOARDING_WEB_APP}.${APPLICATION_DOMAIN}"

  az webapp config appsettings set --name $WEBAPP --resource-group $RESOURCE_GROUP --settings ${PROJECT_UPPERCASE}_DATABASE_CONNECTION="Server=tcp:${DB_SERVER}.database.windows.net,1433;Initial Catalog=${PROJECT};Persist Security Info=False;User ID=${DB_USER};Password=${DB_PASSWORD};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"

  az webapp config appsettings set --name $WEBAPP --resource-group $RESOURCE_GROUP --settings BLOB_AZURE_ACCOUNT_NAME=$BLOB_AZURE_ACCOUNT_NAME
  az webapp config appsettings set --name $WEBAPP --resource-group $RESOURCE_GROUP --settings BLOB_AZURE_ACCESS_KEY=$BLOB_AZURE_ACCESS_KEY
  az webapp config appsettings set --name $WEBAPP --resource-group $RESOURCE_GROUP --settings BLOB_AZURE_CONTAINER=$PROJECT
  az webapp config appsettings set --name $WEBAPP --resource-group $RESOURCE_GROUP --settings BLOB_AZURE_SHARED_ACCESS_EXPIRY_TIME="15"
done

