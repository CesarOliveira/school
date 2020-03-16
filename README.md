# Welcome to School project

### Prerequisites

- You need to have docker installed in your machine;
- Check Docker Documentation to install it https://docs.docker.com/install/;

## Bulding the Application
First you need to  build the docker application with:

```
docker-compose up --build -d
```
After that you need to create the databse:
```
docker exec -it api rake db:create db:migrate db:seed
```
If everything wen't well, now you could access the `app` by opening the following url in your browser: `http://localhost:3001`.  You will see the welcome from rails.