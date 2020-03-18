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

## Using the API

### Creating the First Course with CURL
A curl example to create a new course:
```shell
curl --location --request POST 'http://localhost:3001/api/courses' \
--header 'Content-Type: application/json' \
--data-raw '{
    "course": {
    "name": "Course Name",
    "details": "Nice Details about it"
    }
}'
```
We also add in this repository the [School.postman_collection.json](https://github.com/CesarOliveira/school/blob/master/School.postman_collection.json "School.postman_collection.json") file that you can import in Postman app and see all the routes available.

Tip: How to import a collection in Postman: https://www.youtube.com/watch?v=hMbF3fZitic
