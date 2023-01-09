server {
     // Port block
     listen ${LISTEN_PORT};

     // Location block 
     location /static {
          // todo : map volume to a running container that contain static files nginx needs to serve
          alias /vol/static;
     }


     location / {
          uwsgi_pass               ${APP_HOST}:${APP_PORT};
          include                  /etc/nginx/uwsgi_params
          client_max_body_size     10M;

     }
}