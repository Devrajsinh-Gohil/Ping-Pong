# Ping Pong
#### Video Demo:  https://youtu.be/xTAn1C66-fI
#### Description:
- This is a game made with love and lua
- lua is a programming language
- love is a framework used
- to run this game:
    - intall love from: https://love2d.org
    - and drag and drop your file on it as shown in video.
    - like c++ require main function, love require main.lua file to start the game engine.

##### Game:
- This a is a basic Ping Pong game.
- It is a single player game.
- In this game the player plays against a bot.
- there are two pedals or bars tobe specifice in this game.
- The player has to try recieveing the ball everytime it comes towards it.
- The ball will bounce back towards the ball if ball touches the pedal.
- else if not recieved on time it will go behind the pedal and a point will be given to bot.
- And same applies to bot which will try to hit back the ball by itself.
- ###### Assets:
    - here I have used images to design the game play.

- ###### Game Codes:
    - Here there are six program files with .lua extention:
        - main.lua
            - code that love runs to play the game
        - conf.lua
            - game configuration file which includes game name, screen size, and all other stuff.
        - ball.lua
            - file contains code to handle collisions and movement of ball object in the game.
        - player.lua
            - here the code for the plyer pedal is written
        - ai.lua
            - the code for the movment and decision making of AI is written here.
        - background.lua
            - Background of the game is given by this file.

    - Each lua file consists of main three functions:
        - load()
            - a function like preprocessors in C, which loads allthe functions and variables into the game at beginning
        - update(dt)
            - a functions which updates the screen for movment, here dt means time difference which is claculated by love framework
        - draw()
            - as the name suggests it draws the elements on the gameplay screen.

    - Logics implemented:
        - pedal movement
        - ball movement
        - automatic movement of AI pedal
        - decision making of AI
        - ball collision with pedals
        - ball collision with top and bottom walls.
        - ball bouncing back after collision top/bottom wall or pedals
        - repositioning the ball after either of the oppenent has scored a point.
        - score updating
        - continuously rotating background.