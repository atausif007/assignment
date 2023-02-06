FROM node:10
COPY . .
RUN yarn install
#RUN npm run build
RUN CI=true
CMD ["yarn", "start"]
