FROM python:2.7-alpine
MAINTAINER Prasad Tengse <code@prasadt.com>
# Perform build and cleanup artifacts
WORKDIR /srv
ADD requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
# Expose MkDocs development server port
EXPOSE 8000
# Start development server by default
ENTRYPOINT ["mkdocs"]
CMD ["serve", "--dev-addr=0.0.0.0:80"]
