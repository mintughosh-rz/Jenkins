#! /bin/bash

# Declare the container ID
CONTAINER_ID=$(sudo docker ps -aqf "name=masterdb" | head -1)

# Export the current running continer to a tar file
sudo docker export $CONTAINER_ID > masterdb_$(date +%F)_$CONTAINER_ID.tar

# Import the tar file  into an image
cat masterdb_$(date +%F)_$CONTAINER_ID.tar | sudo docker import - goldenrat/masterdb:cog-prod01-$(date +%F)

# Upload the image to the docker hub
sudo docker push goldenrat/masterdb:cog-prod01-$(date +%F)


