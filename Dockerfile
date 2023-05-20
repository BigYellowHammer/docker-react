FROM node:16-alpine as builder
#Define compilation folder
WORKDIR '/app'
#Copy and install dependencies
COPY package.json .
RUN npm install
#Copy and build code
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html