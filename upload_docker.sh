dockerpath=mohoss/pro4
echo "Docker ID and Image: $dockerpath"
docker login
docker push $dockerpath