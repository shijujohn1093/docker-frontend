FROM node:alpine
WORKDIR '/app'
COPY  ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

# -------------------------------
# Run custom docekr files
# > docker build -f Dockerfile.dev -t cuckoo/simpleweb .
# make sure to run on git bash ; her ewe are mapping  locla file with docker container
# > docker run -p 3000:3000 -v $(pwd):/app cuckoo/simpleweb
# Run on powershell
# > docker run -it -p 3000:3000 -v /app/node_modules -v ${pwd}:/app cuckoo/simpleweb


# Powershell
# > docker run -it -p 3000:3000 -v /app/node_modules -v ${pwd}:/app cuckoo/simpleweb

# Git Bash
# winpty docker run -it -p 3000:3000 -v /app/node_modules -v "/$(PWD)":/app cuckoo/simpleweb

# Or Either crate .env file or run following command on gitbash
#> docker run -it -p 3000:3000 -v /app/node_modules -v /c/Users/username/frontend:/app -e CHOKIDAR_USEPOLLING=true cuckoo/simpleweb

# -it === allow us to provide input to the container


# If you are using any version of Windows and your React app is not automatically reloading after a code change, you can add this environment variable to your compose file:
# services:
#   web:
#     environment:
#       - CHOKIDAR_USEPOLLING=true


#------------- 
# Just to  override the command or if ew want t run only react test the 
# > docker run -it cuckoo/simpleweb npm run test