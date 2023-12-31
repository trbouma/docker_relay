FROM python:3.10
# RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev
# RUN pip3 install psycopg2-binary

WORKDIR /app

COPY ./requirements.txt /app/requirements.txt
COPY ./config.yaml /app/config.yaml
RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt


COPY . .


# CMD [ "uvicorn","app.main:app", "--host","0.0.0.0","--port","80"] 

CMD ["nostr-relay", "-c", "config.yaml", "serve"]
EXPOSE 6969