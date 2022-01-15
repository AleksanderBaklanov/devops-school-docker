FROM nginx:stable-alpine
RUN apk add busybox-extras
COPY ./build/proxy/nginx_conf /etc/nginx/conf.d
CMD ["nginx", "-g", "daemon off;"]