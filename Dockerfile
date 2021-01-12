# build this image from the official image of nginx
FROM nginx

# LABEL is used as a reference, can put maintainer does not need to be caps
LABEL maintainer=ahashmi-ubhi@spartaglobal.com

# from localhost to default location of index.html inside the nginx container
COPY index.html /usr/share/nginx/html/

# expose port 80 to launch in the browser
EXPOSE 80

# will run this command once all other instructions are done
CMD ["nginx", "-g", "daemon off"]
