export PLAN_SERVICE="${APPLICATION_NAME}-plan-service"
export RESOURCE_GROUP="${APPLICATION_NAME}-resource-group"
export DB_SERVER="${APPLICATION_NAME}-sqlserver"

export SSO_PROJECT_NAME="sso"
export SSO="${APPLICATION_NAME}-${SSO_PROJECT_NAME}-webapp"
export SSO_DB_SERVER="${DB_SERVER}-${SSO_PROJECT_NAME}"
export SSO_DATABASE_CONNECTION="Server=tcp:${DB_SERVER}.database.windows.net,1433;Initial Catalog=${SSO_DB_SERVER};Persist Security Info=False;User ID=${DB_USER};Password=${DB_PASSWORD};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"

export ONBOARDING_PROJECT_NAME="onboarding"
export ONBOARDING="${APPLICATION_NAME}-${ONBOARDING_PROJECT_NAME}-webapp"
export ONBOARDING_DB_SERVER="${DB_SERVER}-${ONBOARDING_PROJECT_NAME}"
export ONBOARDING_DATABASE_CONNECTION="Server=tcp:${DB_SERVER}.database.windows.net,1433;Initial Catalog=${ONBOARDING_DB_SERVER};Persist Security Info=False;User ID=${DB_USER};Password=${DB_PASSWORD};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;"

export UPLOAD_PROJECT_NAME="upload"
export UPLOAD="${APPLICATION_NAME}-${UPLOAD_PROJECT_NAME}-webapp"

export BLOB_AZURE_ACCOUNT_NAME="${APPLICATION_NAME}production"
