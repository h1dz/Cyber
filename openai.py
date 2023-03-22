import openai
     
openai.api_key = '<OPENAI-KEY>'

messages = [
    {"role": "system", "content": "You are a kind helpful assistant and a master professional in coding and secure code reviewing.."},
]
     

while True:
    message = input("User : ")
    if message:
        messages.append(
            {"role": "user", "content": message},
        )
        chat = openai.ChatCompletion.create(
            model="gpt-3.5-turbo", messages=messages
        )
    
    reply = chat.choices[0].message.content
    print(f"ChatGPT: {reply}")
    messages.append({"role": "assistant", "content": reply})
