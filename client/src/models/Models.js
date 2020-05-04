// these classes are roughly based on the Logical design
// a lot of info is still missing
// it probaly needs some work

export class Tournament {
  constructor(
    id, name, startDate, endDate, matches
    ) {
    this.id = id
    this.name = name
    this.startDate = startDate
    this.endDate = endDate
    this.matches = matches
    }
}

export class Match {
  constructor(
    id, date, team1, team2, field, goals=0, score1=0, score2=0
  ) {
      this.id = id
      this.date = date
      this.team1 = team1
      this.team2 = team2
      this.field = field
      this.goals = goals
      this.score1 = score1
      this.score2 = score2
    }
}

export class Team {
  constructor(
    id, name, players=[], scored=0, recieved=0, points=0, rank=0
  ) {
    this.id = id
    this.name = name
    this.players = players
    this.scored = scored
    this.recieved = recieved
    this.points = points
    this.rank = rank
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

// probably these classes won`t be really useful
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
    this.id = id
    this.first_name = first_name
    this.last_name = last_name
  }
}

export class Card {
  constructor(id, type) {
    this.id = id
    this.type = type
  }
}