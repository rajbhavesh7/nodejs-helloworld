FROM alpine

# Install required packages
RUN apk add --no-cache --update nodejs npm

# Copy nodejs application to /app directory
COPY . /app

# Change CWD
WORKDIR /app/hello-world

# Install app dependencies
RUN npm install -g

# Set entrypoint
CMD ["node", "app.js"]
