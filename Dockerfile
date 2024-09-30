# Mengunduh base image dari Docker Hub, jika sudah pernah diuduh docker akan mengambil dari lokal.
FROM node:14-alpine

# Membuat direktori bernama app dalam container dan menjadikannya working directory.
WORKDIR /app

# Menyalin semua berkas yang ada di local working directory saat ini ke container working directory.
COPY . . 

# Menentukan aplikasi berjalan dalam production mode, dan menggunakan container bernama item-db sebagai database host.
ENV NODE_ENV=production DB_HOST=item-db

# Menginstal dependencies untuk production dan kemudian build aplikasi.
RUN npm install --production --unsafe-perm && npm run build

# Ekspos port 8080 yang akan digunakan oleh container.
EXPOSE 8080

# Eksekusi perintah untuk menjalankan aplikasi.
CMD ["npm", "start"]