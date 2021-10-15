FROM python:3.6-slim-buster

WORKDIR /usr/src/app
ENV PYTHONPATH "${PYTHONPATH}:/usr/src/app"

COPY requirements.txt .

RUN apt update && apt install -y python3-dev build-essential
RUN pip install -r requirements.txt

COPY . .

RUN chmod +x /usr/src/app/run.sh
RUN chmod +x /usr/src/app/entrypoint.sh

CMD [ "ls", "/usr/src/app" ]