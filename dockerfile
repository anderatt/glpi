# 1. Comece com uma imagem base (ex: Nginx)
FROM glpi/glpi:11.0.1

# 2. Defina o diretório de trabalho (opcional)
WORKDIR /usr/share/glpi

# 3. Copie seus arquivos customizados para dentro da imagem
# Neste caso, estamos substituindo o index.html padrão do Nginx
#COPY index.html .

# 4. Exponha a porta que seu aplicativo usa (Nginx usa a 80 por padrão)
EXPOSE 8080

# 5. O comando para iniciar o container (o Nginx base já faz isso, 
# mas em um app Node.js, por exemplo, seria: CMD ["node", "app.js"])
