FROM node:16.10.0-buster

RUN apt-get update && \
  apt-get install -y \
  neofetch \
  chromium \
  ffmpeg \
  wget \
  imagemagick \
  graphicsmagick \
  webp \
  mc && \
  rm -rf /var/lib/apt/lists/*

COPY package.json .
COPY ..
RUN npm install -g npm@8.1.3
RUN npm install -g pm2
RUN npm update
RUN npm install pm2 -g && npm install && npm install qrcode-terminal && npm i -g pm2
RUN pm2 save
EXPOSE 5000
CMD ["pm2-runtime", "next.js"]`