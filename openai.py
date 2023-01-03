#<---To INSTALL openai module, first run: pip3 install openai
#<---USAGE: python openai.py
import openai
import sys
import readline

# Your unique openai API from signing up
openai.api_key = "<YOURAPI>"

model_engine = "text-davinci-003"

def copy_text():
    # code to handle the copy operation goes here
    pass

def backspace():
    # Erase the character to the left of the cursor
    sys.stdout.write("\b")

def get_input():
    # Get user input
    prompt = input("\n\033[1;32mAsk: \033[0m")
    return prompt

def history_up():
    # Go to previous command in history
    return readline.get_history_item(readline.get_current_history_length() - 1)

def history_down():
    # Go to next command in history
    return readline.get_history_item(readline.get_current_history_length() - readline.get_current_history_length() - 1)

def left():
    # Go one character to the left
    sys.stdout.write('\033[1D')

def right():
    # Go one character to the right
    sys.stdout.write('\033[1C')

def process_input(prompt):
    if prompt == '\x1b[A':
        # Up arrow pressed
        return history_up()
    elif prompt == '\x1b[C':
        # Right arrow pressed
        return right()
    elif prompt == '\x1b[D':
        # Left arrow pressed
        return left()
    elif prompt == "\x7f":
        # Backspace key pressed
        return backspace()
    elif prompt.lower() == "exit":
        # Exit the script
        print("Exiting script")
        sys.exit()
    else:
        return prompt

# Bind the Control + Shift + C shortcut to the copy_text function
readline.parse_and_bind("\C-\S-c: copy_text")

while True:
    try:
        prompt = get_input()
        prompt = process_input(prompt)
        completions = openai.Completion.create(
            engine=model_engine,
            prompt=prompt,
            # If response is short and cut off try increase tokens, or limit it for shorter response, most responses will be short.
            max_tokens=1000,
            n=1,
            stop=None,
            # Sets the randomness value, default being 0.5.
            temperature=0.5,
        )

        message = completions.choices[0].text
        print("\033[1;31m#\033[0m" + message + "\n")
        print("\033[1;31m#\033[0m")


    except KeyboardInterrupt:
        # Exit the script when the user presses Ctrl+C
        print("Exiting script")
        break

    except openai.api_requestor.exceptions.ApiException as error:
        print("An error occurred: {}".format(error))
