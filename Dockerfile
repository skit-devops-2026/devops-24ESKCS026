FROM nginx:1.27-alpine

COPY index.html /usr/share/nginx/html/index.html
COPY css /usr/share/nginx/html/css
COPY js /usr/share/nginx/html/js
COPY nginx.conf.template /etc/nginx/templates/default.conf.template

ENV PORT=8080
ENV NGINX_ENVSUBST_FILTER='$PORT'
EXPOSE 8080

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD wget -q -O /dev/null "http://127.0.0.1:${PORT}/health" || exit 1
