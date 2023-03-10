FROM node:lts-buster

RUN apt-get update && \

apt-get install -y \

ffmpeg \

neofetch \

chromium \

wget \

graphicsmagick \

imagemagick \

webp && \

apt-get upgrade -y && \

rm -rf /var/lib/apt/lists/*

COPY package.json .

COPY . .

RUN npm -g npm

RUN npm install pm2 -g && npm install && npm install qrcode-terminal && npm i -g pm2

EXPOSE 5000

CMD ["pm2-runtime", "next.js"]
