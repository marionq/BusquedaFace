FROM python:3.9.13-alpine3.16

RUN mkdir /application
WORKDIR /application

COPY * .
RUN pip install --upgrade pip
RUN pip install webdriver-manager
RUN pip install -r requirements.txt

COPY config .

ENV PYTHONUNBUFFERED 1

EXPOSE 8001
STOPSIGNAL SIGINT

CMD ["gunicorn", "--config", "gunicorn_config.py", "main:app"]
