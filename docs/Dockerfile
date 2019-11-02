FROM python:3.7-alpine
LABEL maintainer="Prasad Tengse <tprasadtp@users.noreply.github.com>"
RUN addgroup -g 1000 user \
    && adduser -G user -u 1000 -D -h /home/user -s /usr/bin/bash user \
    && mkdir -p /home/user/app \
    && chown -R 1000:1000 /home/user/app
USER user

# ENV stuff
WORKDIR /home/user/app
ENV PATH "$PATH:/home/user/.local/bin"

COPY --chown=1000:1000 requirements.txt requirements.txt
RUN pip install --user \
        --upgrade --progress-bar=off -U \
        --no-cache-dir \
        -r requirements.txt \
    && rm -rf /home/user/.cache \
    && rm -rf /tmp/*.* /tmp/**/*.* /tmp/**/*
# Expose MkDocs development server port
EXPOSE 8000
# Start development server by default
ENTRYPOINT ["mkdocs"]
