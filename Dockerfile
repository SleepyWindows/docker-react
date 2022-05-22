# PRODUCTION ENV DOCKER FILE THAT IS MULTISTEP.

FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
# PULLS IMAGE FROM PREVIOUS STAGE. HERE IT IS MARKED AS BUILDER.
COPY --from=builder /app/build /usr/share/nginx/html


