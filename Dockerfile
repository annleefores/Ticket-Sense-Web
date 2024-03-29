#don't change this to latest version, build might fail
FROM library/python:3.8-slim-buster

# set environment variables  
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1 

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY ./requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt \
    && rm -rf /requirements.txt

COPY . /usr/src/app

EXPOSE 8000

CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]