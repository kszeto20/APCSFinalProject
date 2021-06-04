# APCSFinalProject
Here's the prototype doc

Group name: Galago

Members: Jonathan Ho, Kirsten Szeto

Project description: Galaga-inspired (just galaga) game.  We’re gonna have most of the aspects that the actual Galaga game has including a player controlled spaceship, enemies that attack the player, and different types of enemies.  Certain groups of enemy ships will move in geometrical patterns while others move horizontally across the screen. We may implement a boss fight after a certain amount of time depending on our progress. We’re gonna add a life system and 1-ups as the original game has and a score counter. We’ll add sound effects if applicable. hehe 🧛

https://docs.google.com/document/d/1Q7UMiH_Ij0yi7uksWHtDGH4c1utSSgY0uF96kxaX7Jc/edit?ts=60aacf0a

Devlog
May 23rd- began working on the project.  Made the prototype document and started on the actual code.  Made the background stars and coded basic movement for the player ship.  Movement is still janky as the directions of the movement messes up when doing sequential moves

May 24th- created a basic UML diagram showing the relationships that classes and objects have towards each other.

added a push to start feature, movements limited to left right motion to model the actual game

May 25th - movements now expanded again to include left, right, up, down; movement is smooth for player now. bullet class and enemy class (implemented) - (update: move method works best in driver class) + "impact" from bullets need to be implemented

May 28th- began working on algorithm for colliding bullets and players and enemies

June 3rd - finished collide method, enemy bullets now kill player (fixed again), game over screen added
