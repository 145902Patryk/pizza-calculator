# syntax=docker/dockerfile:1
FROM python:3.10

ENV PYTHONUNBUFFERED=1
ENV PYTHONDONTWRITEBYTECODE 1
WORKDIR /code
COPY requirements.txt /code/
COPY requirements_docker.txt /code/
RUN pip install --upgrade pip && \
    pip install -r requirements_docker.txt
COPY . /code/
RUN mkdir -p /code/public/uploads/tmp/ && \
    chmod -R 755 /code/public
RUN python manage.py migrate
