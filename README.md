# Cards Against Humanity for Hubot

https://www.npmjs.com/package/hubot-humanity
v0.0.1

## Usage

`hubot cah restart` to begin a new game. (note: this overwrites any games in progress)

Players add themselves to the game by typing `hubot cah register`. The first person to register automatically becomes the initial dealer, at which point the first Black Card should be presented.

Players can see their hand of 5 White Cards with the command `hubot cah hand`. It is recommended to do this is a private message with Hubot.

Once a player has selected a card (or two cards if the Black Card requires 2), they can submit it using `hubot cah submit # #`.

When either 120 seconds have passed, or all players have submitted cards, the game will no longer accept submissions, and will switch to the dealer choice phase. The dealer can type `hubot cah status` to view all of the available choices, then select one by typing `hubot cah choose #`.

The round then ends. The player whose submission was chosen earns a point, and becomes the new dealer for the next round.

## Installation

Add the package `hubot-cah` as a dependency in your Hubot package.json file. Then add `hubot-cah` to the list in the `external-scripts.json` file.

## Credits

Card dictionary taken from [hubot-humanity](https://github.com/jakswa/hubot-humanity) 
