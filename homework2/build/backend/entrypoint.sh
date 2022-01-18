#!/bin/bash
cd /app
. ./venv/bin/activate

python3 manage.py makemigrations
python3 manage.py migrate

## for the next step you shall define variables
## - DJANGO_SUPERUSER_USERNAME,
## - DJANGO_SUPERUSER_EMAIL,
## - DJANGO_SUPERUSER_PASSWORD
if [ -z $DJANGO_SUPERUSER_USERNAME ]; then
    DJANGO_SUPERUSER_USERNAME="admin"
fi
if [ -z $DJANGO_SUPERUSER_PASSWORD ]; then
    DJANGO_SUPERUSER_PASSWORD="catalogP@$$W)RD"
fi
if [ -z $DJANGO_SUPERUSER_EMAIL ]; then
    DJANGO_SUPERUSER_EMAIL="admin@local.com"
fi

python3 manage.py createsuperuser \
    --noinput \
    --username $DJANGO_SUPERUSER_USERNAME \
    --email $DJANGO_SUPERUSER_EMAIL

# load data
python3  manage.py loaddata catalog/fixtures/bbk_data.json

python3 manage.py runserver 0.0.0.0:8000
