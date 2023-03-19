@echo off
:loop
echo.
set /p var1="Ask ChatGPT: "
set auth=Authorization: Bearer <YOUR-API-KEY>
set url=https://api.openai.com/v1/chat/completions
curl -s -H "%auth%" -H "Content-Type: application/json" -d "{\"model\": \"gpt-3.5-turbo\", \"messages\": [{\"role\": \"user\", \"content\": \"%var1%\"}]}" %url% | powershell.exe -Command "$json = ConvertFrom-Json -InputObject $input; $content = $json.choices.message.content; Write-Host $content -ForegroundColor Green; Remove-Item .\response.json -ErrorAction SilentlyContinue" 
goto loop
