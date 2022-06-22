FROM python:3.9-slim

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

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
