FROM node:24-alpine AS builder
WORKDIR /app
COPY . .
RUN npm i
RUN npm run build
# CMD [ "echo", "Build Success" ]

FROM nginx:latest
COPY --from=builder /app/nginx.conf /etc/nginx/nginx.conf
COPY --from=builder /app/app/public /usr/share/nginx/html/public
# CMD [ "echo", "Nginx is running in http://localhost:8080" ]