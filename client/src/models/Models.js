// these classes are roughly based on the Logical design
// a lot of info is still missing
// it probaly needs some work


export class Tournament {
  constructor(
    id, name, startDate, endDate, matches, teams
    ) {
    this.id = id
    this.name = name
    this.startDate = startDate
    this.endDate = endDate
    this.matches = matches
    this.teams = teams
  }
}

export class Match {
  constructor(
    id, date, time, team1, team2, field, referee, goals
  ) {
      this.id = id
      this.date = date
      this.time = time
      this.team1 = team1
      this.team2 = team2
      this.field = field
      this.referee = referee
      this.goals = goals
    }
}

export class Team {
  constructor(
    id, name, players
  ) {
    this.id = id
    this.name = name
    this.player = players
  }
}

export class Player {
  constructor(
    id, first_name, last_name, team, goals, cards
    ) {
      this.id = id
      this.first_name = first_name
      this.last_name = last_name
      this.team = team
      this.goals = goals
      this.cards = cards
    }
}

export class Goal {
  constructor(
    player, time
  ) {
    this.player = player
    this.time = time
  }
}

export class Field {
  constructor(
    id, name
  ) {
    this.id = id
    this.name = name
  }
}

export class Referee {
  constructor(
    id, first_name, last_name
  ) {

  }
}

export class Card {
  constructor(id, type) {
    this.id = id
    this.type = type
  }
}