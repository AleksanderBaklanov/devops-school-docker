
## My DevOps school homework project

In the project I managed to develop the **building part** for the Github project [asilnikov/docker_homework](https://github.com/asilnikov/docker_homework):

To start it you need to put .env file next to the docker-compose.yaml file.
Next is an example how it could looks like:

`.env`  
DJANGO_SUPERUSER_USERNAME='admin'  
DJANGO_SUPERUSER_EMAIL='admin@local.net'  
DJANGO_SUPERUSER_PASSWORD='password'  
DJANGO_SECRET_KEY='unen%+=v7wr#d%&rz@u&1n)2h)128&j0y2w&bk73r=03h(+!df'  
DATABASE_HOST='database'  
DATABASE_PORT=5432  
DJANGO_ALLOWED_HOSTS='*'  
DATABASE_ENGINE='postgresql'  
DATABASE_NAME='django'  
DATABASE_USERNAME='django'  
DATABASE_PASSWORD='django'  
PYTHONDONTWRITEBYTECODE=1  
PYTHONUNBUFFERED=1  
DEBUG=False  
POSTGRES_USER=django  
POSTGRES_DB=django  
POSTGRES_PASSWORD=django  

You shall use `docker-compose build` for building it and `docker-compose up -d` to make it run.
Also, you always may always check it's status with `docker-compose ps`. 
To check that backend has sucessfuly connected to the DataBase run `docker logs -f backend`.
After it finally starts, to access the web interface you shall open [http://127.0.0.1/bbks/](http://127.0.0.1/bbks/))
in your favorite browser and as a result you must see something like this:
 
![web page shall look like](https://github.com/AleksanderBaklanov/devops-school-docker/raw/main/homework2/Screenshot_2022-01-16_06-14-58.png)

After all,
you may find it useful to clean it up. To do so just run `docker-compose down -v`.
