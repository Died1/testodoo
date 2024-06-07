# Usa una imagen base de Node.js
FROM node:18-alpine

# Establece el directorio de trabajo en el contenedor
WORKDIR /app

# Copia el package.json y el package-lock.json
COPY package*.json ./

# Instala las dependencias del proyecto
RUN npm install

# Copia el resto del código de la aplicación
COPY . .

# Construye la aplicación para producción
RUN npm run build

# Instala un servidor web simple para servir la aplicación
RUN npm install -g serve

# Expon el puerto definido por Cloud Run
EXPOSE $PORT

# Comando para ejecutar la aplicación
CMD ["sh", "-c", "serve -s dist -l $PORT"]
