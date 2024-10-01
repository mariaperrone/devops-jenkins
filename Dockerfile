FROM python:3.11-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

RUN pip install --upgrade pip && \
    pip install jupyter-book

COPY . /app

EXPOSE 8000

CMD ["jupyter-book", "serve", ".", "--port", "8000", "--host", "0.0.0.0"]

