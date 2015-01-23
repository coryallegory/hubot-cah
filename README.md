# Cards Against Humanity for Hubot

https://www.npmjs.com/package/hubot-humanity
v0.0.1

## Usage

`hubot cah restart` to begin a new game. (note: this overwrites any games in progress)

Players add themselves to the game at any time by typing `hubot cah register`. The first person to register automatically becomes the initial dealer, at which point the first Black Card should be presented.

Each round:

Players can see their hand of 5 White Cards by typing `hubot cah hand`. It is recommended to do this in a private message with Hubot so other players can't see each others' hands. Once a player has selected a card (or optionally two cards depending on the current Black Card), they can submit it using `hubot cah submit # #`.

When all players have submitted cards or 120 seconds have passed since the round began, the game will no longer accept submissions, and will switch to the dealer choice phase. The dealer can type `hubot cah status` to view all of the available choices, then select one by typing `hubot cah choose #`.

The round then ends. The player whose submission was chosen earns a point, and becomes the new dealer for the next round.

## Installation

Add the package `hubot-cah` as a dependency in your Hubot package.json file. Then add `hubot-cah` to the list in the `external-scripts.json` file.

## Credits

Card dictionary taken from [hubot-humanity](https://github.com/jakswa/hubot-humanity) 
