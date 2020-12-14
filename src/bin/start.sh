#!/bin/bash

export $(grep -v '^#' prod.env | xargs)

python manage.py compress
python manage.py collectstatic --noinput

gunicorn --bind :8000 PROJECT_NAME.wsgi:application