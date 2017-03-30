FROM python:2.7

RUN pip install logicmonitor_core
RUN mkdir /usr/local/logicmonitor

# NTP is needed for some collector operations
# MySQL client is needed for script based mysql datasources
RUN apt-get update && apt-get install -y \
  ntp \
  mysql-client

COPY ./startup.py /startup.py
COPY ./startup.sh /startup.sh
COPY ./shutdown.py /shutdown.py

ENTRYPOINT ["/startup.sh"]
