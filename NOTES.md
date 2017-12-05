# Notes
## SPOILER ALERT
#### READING THIS COULD RUIN THE GAME FOR YOU
## !!!!!!!

##### Enemies

| Number | Color | Health | Speed | Damage | Bonus |
|--------|-------|--------|-------|
|1|White|10|10/pps|5|0.5|
|2|Yellow|20|20/pps|10|1|
|3|Green|50|30/pps|20|2|
|4|Red|500|10/pps|40|5|
|5|Purple|5000|20/pps|70|10|

##### Turrets

| Number | Damage | Rate of Fire | Cost |
|---|---|---|
|1|5|0.33/s|10|
|2|10|1/s|100|
|3|50|2/s|500|
|4|500|1/s|5,000|
|5|100|3/s|100,000|


##### Gameplay example
User clicked "Start" at mainmenu.
The path is shown in background (lighter grey on same color as mainmenu background).
The top bar is shown. (see documentation on top bar)
"Stage 1" flashes across screen (fades in/out in middle of screen).
Enemies come in, begin to work their way to the exit.
One enemy hits exit. Its damage is subtracted from total player health.
The user plants the cheapest turret close to exit (grid locked turrets), costing its cost of blip. The cost is taken from total player blip, which started at 10 or some shit. The user had to click the non-darkened (because enough blip) turret, and it followed his mouse, and when he clicked down it subtracted blip and placed it. He cant move/delete it.
The turret kills the second balloon, adding its bonus to total player blip.
The screen flashes Stage 2 like it did for Stage 1.
The player lets the stages go until his health is at 0 which ends the game.
The player is taken back to the main menu, where at the bottom it says "highscore = whatever"
The player plays again and then returns to work, because someone blew up his teams slack channel with an issue that he caused. The commit that introduced the issue was poorly commented, saying "fuck it all, im quitting monday". It was wednesday and the player had still not quit his job. He had forgotten over the weekend of the minor social altercation with Beth that caused this reaction. The player wants to play blip again, because blip is the only thing left that provides him happiness. When he tires of blip, he will hear word of another creation, from the creator, which will keep him going on for a while. The player will never read The Conquest of Bread, safely marking his hopelessness and ignorance as "static". This example has gone way too far. Blip!


##### text description of top bar
The top bar should have a background the color of the pathway but a little lighter maybe
It should have strings on left side, stacked, saying "Back" and "Pause"
The middle should be where the available turrets are showed. They are darkened if not accessible. Perhaps put the cost under them.
There should be a lightly marked grid on the screen, showing that turret placement is grid locked...etc...
The right side should have a text visualization of how much blip the player has, and its health, which could just be text (100 to 0 perhaps) for now. It should also show the score.
