FROM nginxinc/nginx-unprivileged:1-alpha

LABEL maintainer="maintainer@londonappdev.com"

#   Copy terraform configuratino files and nginx uwsgi parameters 
COPY ./default.conf.tpl /etc/nginx/default.conf.tpl
COPY ./uwsgi_params /etc/nginx/uwsagi_params

# Setting default values  
ENV LISTEN_PORT=8000
ENV APP_HOST=app
ENV APP_PORT=9000

#  Switch to a root user 
USER root

RUN mkdir -p /vol/static
RUN chmod 755 /vol/static
RUN touch /etc/nginx/conf.d/default.conf
RUN chown nginx:nginx /etc/nginx/conf.d/default.conf

# Copying entrypoint file
COPY ./entrypoint.sh /entrypoint.sh 
RUN chmod +x /entrypoint.sh

USER nginx 

CMD ["/entrypoint.sh"]



