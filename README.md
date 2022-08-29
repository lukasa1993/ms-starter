# ms-starter

microservices starter

1. [auth](https://github.com/lukasa1993/ms-sample-auth)
2. [files](https://github.com/lukasa1993/ms-sample-file)
3. [web-app](https://github.com/lukasa1993/ms-sample-web-app)
4. [admin-web-app](https://github.com/lukasa1993/ms-sample-admin-web-app)
5. [user](https://github.com/lukasa1993/ms-sample-user)
6. [company](https://github.com/lukasa1993/ms-sample-company)
7. [email](https://github.com/lukasa1993/ms-sample-email)

if you want to use this out of box without your custom domain
please change your hosts file

```
192.168.5.1 auth.example.com
192.168.5.1 app.example.com
192.168.5.1 admin.example.com
192.168.5.1 api.example.com
```

where `192.168.5.1` is your local lan address

# Out of Box usage

```

mkdir microservices-starter
cd microservices-starter

git clone https://github.com/lukasa1993/ms-starter.git
git clone https://github.com/lukasa1993/ms-sample-auth.git
git clone https://github.com/lukasa1993/ms-sample-file.git
git clone https://github.com/lukasa1993/ms-sample-web-app.git
git clone https://github.com/lukasa1993/ms-sample-admin-web-app.git
git clone https://github.com/lukasa1993/ms-sample-user.git
git clone https://github.com/lukasa1993/ms-sample-company.git

cd ms-starter

echo ""
echo ".env s need to be filled at this point checkout example .env-s"
echo "promise they are filled"
read -r 

docker compose up -d

docker run -it --rm --network=host --platform=linux/amd64 -v $PWD/kong:/data -w /data kong/deck sync

```

# Adding new MS

```
git clone https://github.com/lukasa1993/ms-sample-blank.git
```

# Testing production run on local

## in real production s3 and db must be services not in our stack

### First run

```
mkdir -P ./db_prod_test/data
mkdir -P ./storage_prod_test/minio

docker swarm init

docker stack deploy -c docker-compose-prod-test.yml --prune --with-registry-auth test
```

### Single image update

```

docker pull ghcr.io/lukasa1993/ms-sample-auth:latest

docker service update --update-order start-first test_ms_sample_auth --image=ghcr.io/lukasa1993/ms-sample-auth:latest --with-registry-auth --detach

```

### new migration for a service
#### will work on any ms you include ms-db
```
docker exec -it ms_sample_company sh -c "npx ms-db new init"
```


