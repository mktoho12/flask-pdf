FROM python:3.7.2

RUN apt-get update \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

ARG project_dir=/app
RUN mkdir $project_dir

ADD requirements.txt $project_dir

WORKDIR $project_dir
RUN pip install -r requirements.txt

ADD src $project_dir
ADD font /usr/local/lib/python3.7/site-packages/fpdf/font

ENV FLASK_APP /app/app.py
ENV FLASK_ENV development

CMD flask run -h 0.0.0.0 -p $PORT
