MODULE="my_messenger/Resources/Resources/API/Sources/API"

openapi-generator generate -i "api.yml" -g swift5 -o "api"
rm -r $MODULE""*
cp -R "api/OpenAPIClient/Classes/OpenAPIs/". $MODULE
rm -r "api"