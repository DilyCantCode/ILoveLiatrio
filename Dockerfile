# apologies for the overcommenting, im learning docker and it serves to refresh my memory
# gonna use alpine, cause i remmeber joshua saying it is lightweight, bare bones, but secure
FROM node:alpine 
# copy all the curr dir. files (dependancies) because thats whats what docker does
# scratch that, we've discovered caching, optimization? dont reinstall dependancies!
#set workdir to inside of our container
WORKDIR /app
#copy any package.json and package-lock.json dependancies to container working directory
COPY package*.json ./
#install production dependancies
# RUN executes at buildtime, CMD executes at Runtime, 
# only production reduces image size (fewer packages)
RUN npm install -only=production
#now we can copy the rest of the app code (curre dire -> container filesys)
COPY . .
#time to expose the application port (at runtime)
EXPOSE 3000

#run the application, instead of a shell (CMD node index.js) (no bin/sh or bin/bash)
# execute the command as a binary inside the container
CMD ["node", "index.js"]
