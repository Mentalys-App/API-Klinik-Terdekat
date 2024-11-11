# Menggunakan image Node.js sebagai base image
FROM node:16-alpine as build

# Set working directory
WORKDIR /usr/src/app

# Menyalin package.json dan package-lock.json
COPY package*.json ./

# Menginstall dependensi untuk production
RUN npm install --only=production

# Menyalin seluruh kode sumber ke dalam container
COPY . .

# Membangun aplikasi TypeScript
RUN npm run build

# Mengatur port yang akan digunakan
EXPOSE 3000

# Menjalankan aplikasi
CMD ["npm", "start"]