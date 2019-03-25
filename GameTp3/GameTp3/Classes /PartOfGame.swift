//
//  PartOfGame.swift
//  GameTp3
//
//  Created by Frédéric on 25/03/2019.
//  Copyright © 2019 fpired. All rights reserved.
//

import Foundation

class PartOfGame {
    
    var gamer1 = Gamers()
    var gamer2 = Gamers()
    var gamer = Gamers()
    var fight = Fight()
    
    var gamers: [Gamers] = []
    var numberGamer1 = 0
    var numberGamer2 = 1
    var numberGamer = 0
    var numberTurn = 0
    var team = Teams()
    var team1: [Soldiers] = []
    var team2: [Soldiers] = []
    
    let banner2 = """
          __
         |  )
         |--  /) _  | / _       |||
         |__)/(_(_(_|/_(_)      |||
                           °°°  °°°
                    
        """
    let banner3 = """
        ,_____,
              
             ) )  _   , ,   | /| / _   _      |||
            (_(__(_|_(_(_  _|/_|/_(_)_| )     |||
             /)                          °°°  °°°
            (/
                   
        """
    
    func game() {
        
        gamer1 = gamer.presentation(gamer: gamer1, gamerNumber: 1)
        gamers.append(gamer1)
        team1 = team.createTeam(team: team1, gamerPseudo: gamers[numberGamer1].pseudo, gamerNumber: gamers[numberGamer1].number)
        fight.maxNumberOfLive1 = team.totalLifeTeam()
        team.viewTeam(team: team1, gamerNumber: gamers[numberGamer1].number)
        
        gamer2 = gamer.presentation(gamer: gamer2, gamerNumber: 2)
        gamers.append(gamer2)
        team2 = team.createTeam(team: team2, gamerPseudo: gamers[numberGamer2].pseudo, gamerNumber: gamers[numberGamer2].number)
        fight.maxNumberOfLive2 = team.totalLifeTeam()
        team.viewTeam(team: team2, gamerNumber: gamers[numberGamer2].number)
        
        //print("Voici le total des point de vie de l'équipe 2 : \(fight.maxNumberOfLive2)")
        for i in 0...gamers.count-1 {
            print("Voici le contenu du tableau des joueurs:  \(gamers[i].name), \(gamers[i].number), \(gamers[i].pseudo)")
        }
        print("\n              ============================================")
        print("\n                           TEAMS REMINDER")
        print("\n              ============================================")
        
        team.viewTeam(team: team1, gamerNumber: gamers[numberGamer1].number)
        team.viewTeam(team: team2, gamerNumber: gamers[numberGamer2].number)
        
        repeat {
            // numberTurn comptabilise le nombre de tour pour informer le gagnant en fin de partie
            numberTurn += 1
            for i in 0...gamers.count-1 {
                print("\n================================"
                    + "\n\(gamers[i].pseudo): WANT TO FIGHT OR CARE ? "
                    + "\n================================"
                    + "\nStape : 1 to fight "
                    + "\nStape : 2 to care ")
                numberGamer = gamers[i].number
                
                if let choice = readLine() {
                    switch choice {
                    case "1":
                        fight.choiceSoldier(choice: choice, numberGamer: gamers[i].number, team1: team1, team2: team2)
                    case "2":
                        fight.choiceSoldier(choice: choice, numberGamer: gamers[i].number, team1: team1, team2: team2)
                    default:
                        print("I don't understand.")
                    }
                }
            }
        } while fight.maxNumberOfLive1 != 0 && fight.maxNumberOfLive2 != 0
        if fight.maxNumberOfLive1 <= 0 {
            print(banner2)
            print("Bravo \(gamers[numberGamer1].pseudo) your team has won !!!")
            print("It took \(numberTurn) laps to win the fight...")
            print(banner3)
        }
        if fight.maxNumberOfLive2 <= 0 {
            print(banner2)
            print("Bravo \(gamers[numberGamer2].pseudo) your team has won !!!")
            print("It took \(numberTurn) laps to win the fight...")
            print(banner3)
        }
    }
}
