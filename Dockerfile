FROM python:3.7.2

RUN apt-get update \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ARG app_dir=/app
ARG font_dir=/font
RUN mkdir ${app_dir} ${font_dir}

WORKDIR ${app_dir}
ADD requirements.txt ${app_dir}
RUN pip install -r requirements.txt

ADD font ${font_dir}
ADD src ${app_dir}

ENV FLASK_APP ${app_dir}/app.py
ENV FLASK_ENV development

CMD flask run -h 0.0.0.0 -p $PORT
