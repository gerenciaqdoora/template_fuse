# Crear imagen docker de fuse-demo: docker build -t qdoora-chile-fuse-demo .;

# Dockerfile para Angular v18
FROM node:20

# Crea el directorio de trabajo
WORKDIR /usr/src/app

# Copia los archivos package.json y package-lock.json
COPY package.json package-lock.json ./

# Instala las dependencias del proyecto
RUN npm install -g @angular/cli@18 \
    && npm ci --legacy-peer-deps

# Copia el resto del código del proyecto
COPY . .

# Construye el proyecto
RUN npm run build

# Expone el puerto en el que Angular escuchará
EXPOSE 4202

CMD ["ng", "serve", "--host", "0.0.0.0", "--port", "4202"]
