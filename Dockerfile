FROM node:lts-alpine AS builder

WORKDIR /app

COPY ./app .

FROM nginx:alpine

COPY --from=builder /app /user/share/nginx/html
COPY default.conf /etc/nginx/conf.default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]