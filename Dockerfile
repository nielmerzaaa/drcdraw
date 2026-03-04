FROM nginx:alpine

# Remove default content
RUN rm -rf /usr/share/nginx/html/*

# Copy production build files
COPY app/ /usr/share/nginx/html/

# Remove nginx version exposure
RUN sed -i 's/server_tokens on;/server_tokens off;/' /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]