FROM python:3.6.2

ADD . /flask-deploy

WORKDIR /flask-deploy

RUN source venv/bin/activate

RUN pip install gunicorn gevent

EXPOSE 3000

CMD gunicorn --worker-class gevent --workers 8 --bind 0.0.0.0:3000 app:app --max-requests 10000 --timeout 5 --keep-alive 5 --log-level info



