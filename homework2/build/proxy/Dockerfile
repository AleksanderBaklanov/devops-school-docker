FROM nginx:stable-alpine
COPY ./build/proxy/nginx_conf /etc/nginx/conf.d
CMD ["nginx", "-g", "daemon off;"]