FROM python:3.10


WORKDIR /app

COPY ./requirements.txt /app/requirements.txt
COPY ./config.yaml /app/config.yaml
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt


COPY . .


CMD ["nostr-relay", "-c", "config.yaml", "serve"]
EXPOSE 6969