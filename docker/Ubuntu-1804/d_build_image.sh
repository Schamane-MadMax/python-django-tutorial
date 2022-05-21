#!/bin/bash
projectName="python-django-tutorial"
export projectPath="/mnt/c/Users/mhent/Courses/$projectName"
export internalPath="/opt/courses/$projectName"
mkdir -p $projectPath

envsubst < ./tempDockerfile > ./Dockerfile

conName="con_$projectName"
imgName="img_$projectName"
volName="vol_$projectName"

docker stop $contName >/dev/null 2>&1
docker rm $contName >/dev/null 2>&1

echo "docker build -t $imgName"
#docker build --no-cache -t $imgName .
docker build -t $imgName .
docker volume create $volName
docker run -itd --name $conName --rm -p 8001:8001 --mount type=bind,source=$projectPath,target=$internalPath $imgName
docker attach $conName



#docker volume remove python_project

