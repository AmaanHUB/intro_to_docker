# from the nodejs one
FROM node:current-alpine3.10

# maintainer
LABEL maintainer=ahashmi-ubhi@spartaglobal.com

# copy the app folder from the localhost to the container
COPY ../app/ /

# expose port 3000, since the app uses this
EXPOSE 3000


# set the work directory
WORKDIR /app
# run the relevant commands

# update the package cache
CMD ["apk", "update", "-y;"]

# install npm for installing dependencies
CMD ["apk", "add", "npm;"]

# install the app
CMD ["npm", "install;"]

# run the app
CMD ["npm", "start;"]
