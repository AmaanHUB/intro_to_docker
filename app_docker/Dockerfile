# from the nodejs one, can refer to it as app
FROM node:alpine as app
# maintainer
LABEL maintainer=ahashmi-ubhi@spartaglobal.com
# set the work directory, need to double check this bit and see if there is a fix
WORKDIR /usr/src/app
# copy the app folder from the localhost to the container
COPY ./app/ .
# update the package cache
CMD ["apk", "update", "-y;"]



# creating a multi-stage layer, in theory would create a smaller image, but since mine is already small it is fine, the first stage is for testing, this stage is for compressing
FROM node:alpine

COPY --from=app /usr/src/app/ /usr/src/app

WORKDIR /usr/src/app/

# expose port 3000, since the app uses this
EXPOSE 3000

# install the app, have to specify the directory for some reason
CMD ["npm", "install", "/usr/src/app/;"]
# seeds
CMD ["npm", "run", "/usr/src/app/seeds/seed.js;"]
# run the app, have to specify the directory for some reason
CMD ["npm", "start", "/usr/src/app/;"]
