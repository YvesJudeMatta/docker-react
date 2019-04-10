FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# second from means previous terminates first block
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# we don't need to add command to start since it does nginx by default
