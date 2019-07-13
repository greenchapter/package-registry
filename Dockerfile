FROM node:lts
WORKDIR "/home/node/verdaccio"

ADD logo.png /home/node/verdaccio/
ADD htpasswd config.yaml /home/node/verdaccio/
ADD package.json package-lock.json /home/node/verdaccio/

RUN npm install
RUN mkdir -p storage
RUN chown node:node . -R

EXPOSE 4873
USER node
VOLUME ["/home/node/verdaccio/storage"]

CMD ["npm", "run", "verdaccio", "--", "--config", "/home/node/verdaccio/config.yaml"]
