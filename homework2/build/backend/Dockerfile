FROM python:3.7.4 as builder

RUN apt-get update -y && apt-get install -y apt-utils

WORKDIR /app
COPY ./docker_homework/* ./
COPY ./build/backend/entrypoint.sh /app/entrypoint.sh

ENV VIRTUAL_ENV=/app/venv
RUN python -m venv $VIRTUAL_ENV && pip install --upgrade pip
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
RUN cd /app && pip install -r requirements.txt


FROM python:3.7.4
LABEL maintaner="Aleksandr Baklanov <Aleksandr_Baklanov@epam.com>"

RUN apt-get update -y && apt-get install -y telnet apt-utils

RUN mkdir -p /app
RUN addgroup app && useradd -g app app
USER app
WORKDIR /app

COPY --from=builder --chown=app:app /app /app
COPY --from=builder --chown=app:app /app/venv/lib/python3.7/site-packages/rest_framework/static /app/static
COPY --from=builder --chown=app:app /app/venv/lib/python3.7/site-packages/django/contrib/admin/static/admin /app/static/admin

EXPOSE 3000
