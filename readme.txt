DOCUMENTATION
J.Robles 7.25.17

Quickstart ( Prerequisites: nodejs, docker, npm )
—————————————————————————————————————————————————

Install the appropriate project in the install_scripts directory, for example:
cd install_scripts
./aetn.ott.speecher_pull.js

to save the project, use the corresponding *_push.js, for example:
cd install_scripts
./aetn.ott.speeches_push.js

1: Only on first install, run ./buildcontainers to get dependencies & build needed containers
2. usage:
        a>  ./startcontainers to start the project 
        b>  ./stopcontainers  to stop the project
   NOTE: you may have to run ./stopcontainers before ./startcontainers if you left it running the previous session
           

reference
—————————
docker ps # list running containers
docker ps -a # list all containers
docker rm [container id] # remove container
docker rm $(docker ps -a -q) # remove all containers
docker stop [container id] # stop container
docker stop $(docker ps -a -q) #stop all containers
docker exec -it [container id] /bin/bash # container shell
docker inspect [container id] # inspect container
docker images -a #list images
docker rmi [image] #remove image
docker rmi $(docker images -q) # remove all images

to backup/restore sql database
——————————————————————————————
mysqldump -ppassword wordpress > tmp/backup.sql (docker exec -ti wordpressdb sh -c "mysqldump -ppassword wordpress > tmp/backup.sql")
mysql -ppassword wordpress < tmp/backup.sql (docker exec -ti wordpressdb sh -c "mysql -ppassword wordpress < tmp/backup.sql")

nodeJS console
——————————————
docker logs -f nodeJS



PROJECT SPECIFIC


Ports
—————
localhost:3000 nodeJS
localhost:8080 apache
localhost:8000 apache + /domain/search @ nodeJS

Project Files (under /SOURCE)
—————————————————————————————
• /haproxy : the haproxy config
• /html : the apache root directory
• /node(symbolic link created on startcontainers) : node server files
• /sql : the last sql backup

wordpress info: (not currently used)
————————————————————————————————————
• title: api.assistant.db
• login: administrator
• password: pa55w0rd123456789!
• email: jrobles@aenetworks.com

GET query example:
——————————————————
http://127.0.0.1:8000/search?firstname=barack&lastname=obama&year=2000s&category=U.S.

POST query example:
———————————————————
endpoint: http://127.0.0.1:8000/search
JSON:
{
  "id": "xxx",
  "timestamp": "xxx",
  "lang": "en",
  "result": {
    "source": "agent",
    "resolvedQuery": "play a speech by Obama",
    "action": "speeches.search",
    "actionIncomplete": false,
    "parameters": {
      "given-name": "barack",
      "last-name": "obama",
      "my-action": "search",
      "speech_categories": "U.S.",
      "speech_decades": "2000s"
    },
    "contexts": [...],
    "metadata": {...},
    "fulfillment": {...},
    "score": 0.3700000047683716
  },
  "status": {...},
  "sessionId": "xxx"
}