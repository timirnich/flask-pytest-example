FROM python:3

RUN apt-get clean \
    && apt-get -y update

RUN apt-get -y install \
    python3-pip

WORKDIR /app

COPY requirements.txt /app/requirements.txt
RUN pip3 install -r requirements.txt

COPY app.py /app/app.py
COPY templates /app/templates
COPY handlers /app/handlers

EXPOSE 5000

CMD [ "python3", "app.py"]