echo "Make Sure kong runs before you continue! and click any key after"
read -r confirm

echo "$confirm"

curl -i -X POST \
  --url http://localhost:8001/services/ \
  --data 'name=ms-sample-auth' \
  --data 'url=http://ms_sample_auth:7702/external'

curl -i -X POST \
  --url http://localhost:8001/services/ \
  --data 'name=ms-sample-web-app' \
  --data 'url=http://ms_sample_web_app:7702'

curl -i -X POST \
  --url http://localhost:8001/services/ \
  --data 'name=ms-sample-user' \
  --data 'url=http://ms_sample_user:7702/external'

curl -i -X POST \
  --url http://localhost:8001/services/ \
  --data 'name=ms-sample-company' \
  --data 'url=http://ms_sample_company:7702/external'


curl -i -X POST \
  --url http://localhost:8001/services/ms-sample-auth/routes \
  --data 'name=ms-sample-auth' \
  --data 'hosts[]=auth.example.com'

curl -i -X POST \
  --url http://localhost:8001/services/ms-sample-web-app/routes \
  --data 'name=ms-sample-web-app' \
  --data 'hosts[]=app.example.com'

curl -i -X POST \
  --url http://localhost:8001/services/ms-sample-user/routes \
  --data 'name=ms-sample-user' \
  --data 'paths=/user' \
  --data 'hosts[]=api.example.com'

curl -i -X POST \
  --url http://localhost:8001/services/ms-sample-company/routes \
  --data 'name=ms-sample-company' \
  --data 'paths=/company' \
  --data 'hosts[]=api.example.com'

curl -X POST http://localhost:8001/consumers --data "username=anon"

echo ""
echo "Copy username anon s UUID: "
read -r anon

curl -X POST http://localhost:8001/plugins/ \
  --data "name=oauth2"  \
  --data "config.scopes=anon" \
  --data "config.scopes=user" \
  --data "config.scopes=admin" \
  --data "config.mandatory_scope=true" \
  --data "config.global_credentials=true" \
  --data "config.anonymous=$anon" \
  --data "config.enable_client_credentials=true"

