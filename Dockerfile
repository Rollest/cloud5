FROM python:3.9-alpine

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
RUN pip install flask-sqlalchemy flask-migrate psycopg2-binary redis Flask-Caching prometheus-flask-exporter

ENV SQLALCHEMY_DATABASE_URI=postgresql://user:password@db:5432/flask_db
ENV REDIS_HOST=redis

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]