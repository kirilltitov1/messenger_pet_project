MODULE="Modules/InstagramAPI/Sources/InstagramAPI"

openapi-generator generate -i "api.yaml" -g swift5 -o "api"
rm -r $MODULE""*
cp -R "instagramAPI/OpenAPIClient/Classes/OpenAPIs/". $MODULE
rm -r "instagramAPI"