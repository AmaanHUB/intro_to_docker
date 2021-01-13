# from the nodejs one, can refer to it as app
FROM node:current-alpine3.10 as app

# maintainer
LABEL maintainer=ahashmi-ubhi@spartaglobal.com

# copy the app folder from the localhost to the container
COPY ./app /

# set the work directory, need to double check this bit and see if there is a fix
WORKDIR /app/

# run the commands that will set up the app

# update the package cache
CMD ["apk", "update", "-y;"]

# install npm for installing dependencies
# CMD ["apk", "add", "npm;"]

# install the app, have to specify the directory for some reason
CMD ["npm", "install", "/app/;"]


# creating a multi-stage layer, in theory would create a smaller image, but since mine is already small it is fine, the first stage is for testing, this stage is for compressing
FROM node:current-alpine3.10

COPY --from=app /app /app

WORKDIR /app/

# expose port 3000, since the app uses this
EXPOSE 3000

# run the app, have to specify the directory for some reason
CMD ["npm", "start", "/app/;"]
