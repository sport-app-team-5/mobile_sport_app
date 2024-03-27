FROM node:20

RUN npm install -g @ionic/cli @capacitor/cli

WORKDIR /app

COPY . .

RUN npm install

RUN ionic build --prod

RUN ionic integrations enable capacitor && npm install @capacitor/android
RUN npx cap add android

RUN npm run build
RUN npx cap copy
RUN npx cap open android

VOLUME ["/app/android/app/build/outputs/apk/release"]

CMD ["echo", "Especifica los valores de KEYSTORE_FILE, KEY_ALIAS, KEY_PASSWORD, y STORE_PASSWORD al ejecutar el contenedor para firmar el APK."]
