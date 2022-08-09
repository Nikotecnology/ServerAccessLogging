# Server Access Logging (Telegram-Bot Based)
This scripts allows you to see who log-in to your server with a telegram bot and manage their sessions!

This is the first version of this script, i will update it with new features and you can create pull requests to contribute to this project.

If you wanna support my work

[!["Buy Me A Coffee"](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/nikotecnology){:target="_blank"}

# Features

- Automatic Configuration
- Telegram Message on ssh login(with every method)
- Multiple messages by user id
- Custom Bot
- Cusomizable Message

# TO-DO

- Customizable Info's on message(Like hostname and so on)
- Manage sessions directly from the telegram bot
- Adding login log file (Different from the system's one, it will store the custom info)
- Other Things you can add either...

# Installation 

> Creating Telegram Bot

See: https://core.telegram.org/bots#6-botfather

**After creating your bot you should start it to make it work**

> Installing it on server

Clone the repository in a folder of your server

    git clone https://github.com/Nikotecnology/ServerAccessLogging.git

Then enter the folder and give permissions to install.sh file

    cd ServerAccessLogging
    chmod +x install.sh

Now let's start the script

	sh install.sh

You should receive this message:

    Completed! Now the file .env.local is in this folder: /var/serveraccesslogging/.env.local, and you can customize the message in the same folder but in the file message.txt

## Configuration

Now you should configure the script to send message to you(or others) when a ssh session is started.

Let's open the configuration file, i'm using nano but you can use other text editor:

    nano /var/serveraccesslogging/.env.local

![Now you are seeing something like this](https://imgur.com/HIfwAF0.png)
You can see that we have 2 variables:

- USERS: Is the list of the users that will recive the message (it should be in this format: "id : id: id : id" without the double-quotes and the spaces)
- BOT_TOKEN: Is the telegram bot token that botfather has gived to you (you should write it without spaces and without double-quotes) 

Here it is a sample config:

    USERS=254374020
    BOT_TOKEN=DDDDDDDDDD:AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA

Now exit your text editor(crtl+x - y for nano)

You're done! You have finished the installation! Now you can try re-login to your server and you see that you will receive the message

## Personalization

Message Personalization:

**Default Message:**

    📲 New Server Login (${hostname})
    Logged User: ${login_name}
    IP-Address: ${login_ip}
    Date: ${login_date}
    Session: ${session_id}
    Method: ${method}
    
    Use: "pkill -9 -t ${session_id}" to kill that session

You can customize it but remember that you should include all the tags to make it work.

## Updating

After finishing the installation don't delete the cloned folder, because when i release an update you simply do:
    
    git pull
    sh install.sh
    
And you have updated the project.

## Conclusion

Thank you for reading, remember that you can fork this repository and contribute, if you are having any issue there is a section for that.

Greetings!
