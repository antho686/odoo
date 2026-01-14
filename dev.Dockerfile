FROM ubuntu:noble

WORKDIR /usr/src/app

RUN apt-get update && \
        apt-get upgrade -y && \
        apt-get install -y software-properties-common

RUN add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y wget \
        python3.12 \
        python3-pip \
        python3.12-venv \
        python3.12-dev \
        build-essential \
        libjpeg-dev \
        libpq-dev \
        libjpeg8-dev \
        libxml2-dev \
        libssl-dev \
        libffi-dev \
        libmysqlclient-dev \
        libxslt1-dev \
        zlib1g-dev \
        libsasl2-dev \
        libldap2-dev \
        liblcms2-dev \
        npm

RUN ln -s /usr/bin/nodejs/usr/bin/node

RUN npm install -g less less-plugin-clean-css

RUN apt-get install -y fontconfig \
        xfonts-75dpi \
        xfonts-base

RUN wget https://github.com/wkhtmltopdf/packaging/releases/download/0.12.6.1-2/wkhtmltox_0.12.6.1-2.jammy_amd64.deb \
  && dpkg -i wkhtmltox_0.12.6.1-2.jammy_amd64.deb \
  && apt-get -f install

COPY requirements.txt requirements.txt

RUN python3.12 -m venv odoo18-venv && \
        . odoo18-venv/bin/activate && \
        pip install -r requirements.txt

COPY . .
