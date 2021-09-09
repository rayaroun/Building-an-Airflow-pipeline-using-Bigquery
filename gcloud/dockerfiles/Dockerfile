FROM puckel/docker-airflow

ARG AIRFLOW_DEPS: gcp_api,s3
ARG PYTHON_DEPS: sqlalchemy==1.2.0


RUN pip install requests
RUN pip install pandas