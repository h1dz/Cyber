#!/bin/bash
G='\033[0;92m' #${G}
N='\033[0m'    #${N}
Y='\033[0;33m' #${Y}

while true; do
  printf "${G}Ask ChatGPT: ${N}"
  read var1
  printf "${Y}"
  response=$(curl -s https://api.openai.com/v1/chat/completions \
   -H "Authorization: Bearer <YOUR-API-KEY>" \
   -H "Content-Type: application/json" \
   -d '{
   "model": "gpt-3.5-turbo",
   "messages": [{"role": "user", "content": "'"$var1"'"}] 
   }')
  content=$(echo "$response" | sed 's/^\\n\\n//' | grep -oP '(?<="content":")[^"]*')
  printf "\nChatGPT: ${Y}${content}${N}\n"
done
