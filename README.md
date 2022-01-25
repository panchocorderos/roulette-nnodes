# Readme
##How to run

Copy the .env.example file and make .env file and then put your token in API_KEY variable


## Feature list:

* Start game
* Add players (CRUD, name, cash=1000)
* Class Round (play rounds)
* Class for Consume WeatherAPI
* End day command +10.000
* Show rounds


## Models 

### Round
- result
- weather
- updated_at
- created_at


### Bet
- id_round
- id_player
- amount
- color
- updated_at
- created_at

### Player
- name
- cash
- created_at
- updated_at


## To do list:

- [X] Initialize the project
- [X] Create models
- [X] Create view roulette (/)
- [X] CRUD player (/player/:id)
- [X] Fix enum ActiveRecord from bet and round
- [x] Create method start game (Round)
    - [x] 10.000 player default cash
    - [x] if cash > 1000 8%-15% of bet amount
    - [x] if cash < 1000 all in
    - [x] if temperature of 7 days is upper than 29°C => 3%-7% of bet amount
    - [x] Green 2%, Red 49%, Black 49%
    - [x] if result is Red or Black player win bet_amount x2
    - [x] if result is Green player win bet_amunt x15
- [x] Create method end day (Round)
    - [x] End of day players win 10.000 of cash
- [x] Consume weatherApi
- [x] Get max_temp
- [X] Create basic layout view
- [X] Create .env and enviroment variable
- [ ] Deploy heroku
- [ ] Create jobs execute start game y end day in heroku
- [ ] Documentation