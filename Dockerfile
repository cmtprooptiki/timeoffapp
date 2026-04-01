FROM node:18-bullseye

WORKDIR /app

RUN apt-get update && apt-get install -y \
    python3 \
    python-is-python3 \
    make \
    g++ \
    sqlite3 \
    ca-certificates \
 && rm -rf /var/lib/apt/lists/*

COPY package*.json ./
RUN npm install

COPY . .

# Create a persistent data folder for sqlite
RUN mkdir -p /data

EXPOSE 3000

CMD ["npm", "start"]

