FROM perl:5.20

# install nodejs, just so we can use NPM to install bower so we can install jQuery and Bootstrap. :/
RUN apt-get update && apt-get install -y nodejs-legacy
RUN apt-get install -y npm

# Create app directory
WORKDIR /usr/src/app

COPY package.json .
COPY bower.json .
COPY .bowerrc .
RUN npm install --global bower
RUN bower install --allow-root

# install mojolicious
RUN curl -L cpanmin.us | perl - Mojolicious@6.01

# copy in app src files and set working dir
COPY . .
WORKDIR .
EXPOSE 3000
CMD [ "morbo", "app.pl"]