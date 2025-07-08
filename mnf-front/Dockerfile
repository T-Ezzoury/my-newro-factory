# Stage 1: Build the Angular application
FROM node:20 as build

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci

COPY . .
RUN npm run build

# Stage 2: Serve the application with Nginx
FROM nginx:alpine

# Copy Angular dist files
COPY --from=build app/dist/mnf-front/ /usr/share/nginx/html/

# Add NGINX config
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
