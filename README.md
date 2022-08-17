# ms-starter
 microservices starter


1. [db-migrations](https://github.com/lukasa1993/sample-db-migrations)
2. [auth](https://github.com/lukasa1993/ms-sample-auth)
3. [files](https://github.com/lukasa1993/ms-sample-file)
4. [web-app](https://github.com/lukasa1993/ms-sample-web-app)


if you want to use this out of box without your custom domain
please change your hosts file 

```
192.168.5.1 auth.example.com
192.168.5.1 app.example.com
```

where `192.168.5.1` is your local lan address


# Out of Box usage

```

mkdir microservices-starter
cd microservices-starter

git clone https://github.com/lukasa1993/ms-starter.git
git clone https://github.com/lukasa1993/sample-db-migrations.git
git clone https://github.com/lukasa1993/ms-sample-auth.git
git clone https://github.com/lukasa1993/ms-sample-file.git
git clone https://github.com/lukasa1993/ms-sample-web-app.git

cd ms-starter

echo ""
echo ".env s need to be filled at this point checkout example .env-s"
echo "promise they are filled"
read -r 

docker compose up -d

./first_run.sh


```
