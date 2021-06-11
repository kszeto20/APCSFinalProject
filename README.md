# APCSFinalProject
Here's the prototype doc

Group name: Galago

Members: Jonathan Ho, Kirsten Szeto

Project description: Galaga-inspired (just galaga) game.  We’re gonna have most of the aspects that the actual Galaga game has including a player controlled spaceship, enemies that attack the player, and different types of enemies.  Certain groups of enemy ships will move in geometrical patterns while others move horizontally across the screen. We may implement a boss fight after a certain amount of time depending on our progress. We’re gonna add a life system and 1-ups as the original game has and a score counter. We’ll add sound effects if applicable. hehe 🧛

https://docs.google.com/document/d/1Q7UMiH_Ij0yi7uksWHtDGH4c1utSSgY0uF96kxaX7Jc/edit?ts=60aacf0a

How to Play Our Game:
Pull all code and run with the play button on Processing.

Devlog
May 23rd- began working on the project.  Made the prototype document and started on the actual code.  Made the background stars and coded basic movement for the player ship.  Movement is still janky as the directions of the movement messes up when doing sequential moves

May 24th- created a basic UML diagram showing the relationships that classes and objects have towards each other.

added a push to start feature, movements limited to left right motion to model the actual game

May 25th - movements now expanded again to include left, right, up, down; movement is smooth for player now. bullet class and enemy class (implemented) - (update: move method works best in driver class) + "impact" from bullets need to be implemented

May 28th- began working on algorithm for colliding bullets and players and enemies

June 3rd - finished collide method, enemy bullets now kill player (fixed again), game over screen added

June 5th - changed how we removed bullets off screen and enemies that were shot, actually removes enemies now + prelim spawn method

June 7th - fixed bullet speed issue and updated hitboxes for player, bullet speed is no longer proportional to the number of enemies and the top of the bullet now has proper collision with the player

June 8th- fixed method kind of (random generation), need to implement random formations every level not just game.

June 11th- made restart button, fixed spawn and spawnmove methods, made spawn methods more random, fixed enemy hitboxes
