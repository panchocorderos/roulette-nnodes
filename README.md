# Readme

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
- [ ] Create models
- [ ] Create view roulette (/)
- [ ] CRUD player (/player/:id)
- [ ] Create method start game (Round)
- [ ] Create method end day (Round)
- [ ] Create Job execute start game y end day
- [ ] queue Jobs
- [ ] consume Jobs with delayed_job periodically
- [ ] Deploy heroku
- [ ] Cron job heroku