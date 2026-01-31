#!/bin/bash
#docker exec -it ollama ollama create custom-mistral -f ./modelfiles/custommistral

for i in $(ls ./modelfiles)
do
	echo "Creating $i"
	docker exec -it ollama ollama create $i -f ./modelfiles/$i
done
