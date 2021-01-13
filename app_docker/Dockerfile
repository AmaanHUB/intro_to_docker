# from the nodejs one, can refer to it as app
FROM node:alpine as app
# maintainer
LABEL maintainer=ahashmi-ubhi@spartaglobal.com
# copy the app folder from the localhost to the container
COPY ./app /
# set the work directory, need to double check this bit and see if there is a fix
WORKDIR /app/
# update the package cache
CMD ["apk", "update", "-y;"]

# install the app, have to specify the directory for some reason
CMD ["npm", "install", "/app/;"]


# creating a multi-stage layer, in theory would create a smaller image, but since mine is already small it is fine, the first stage is for testing, this stage is for compressing
FROM node:alpine

COPY --from=app /app /

WORKDIR /app/

# expose port 3000, since the app uses this
EXPOSE 3000

# run the app, have to specify the directory for some reason
CMD ["npm", "start", "/app/;"]
