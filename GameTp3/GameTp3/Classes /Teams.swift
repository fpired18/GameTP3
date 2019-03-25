//
//  Teams.swift
//  GameTp3
//
//  Created by Frédéric on 25/03/2019.
//  Copyright © 2019 fpired. All rights reserved.
//

import Foundation

class Teams {
    
    var temporaryName = [String]()
    var check = true
    var numberTime = 1
    var nameSoldier = ""
    var maxNumberOfLive = 0
    
    func createTeam (team: [Soldiers], gamerPseudo: String, gamerNumber: Int) -> [Soldiers] {
        
        var team: [Soldiers] = team
        maxNumberOfLive = 0
        print("\n\(gamerPseudo) SELECT 3 SOLDIERS FROM THE ONES LISTED BELOW...")
        repeat {
            print("\nWhat character number \(numberTime) do you want in your team :"
                + "\n--------------------------------------------------"
                + "\nStep : 1 to have a   fight  with 100 health and 10 strength"
                + "\nStep : 2 to have a   magus  with  80 health and 10 strength"
                + "\nStep : 3 to have a colossus with 120 health and  7 strength"
                + "\nStep : 4 to have a   dwarf  with  60 health and 15 strength"
                + "\nStep : 5 to have a   rider  with 150 health and 30 strength")
            
            if let choice = readLine() {
                var choiceSoldierTeam = 0
                if Int(choice) != nil {
                    choiceSoldierTeam = Int(choice)!
                }
                if choiceSoldierTeam <= 5 && choiceSoldierTeam > 0 {
                    print("\nHow do you want to call it ?")
                    
                    if let name = readLine() {
                        check = false
                        temporaryName.append(name)
                        check = checkName(name: name)
                        if !check {
                            nameSoldier = name
                        }
                    }
                    switch choice {
                    case "1":
                        if !check {
                            let fight = Fights()
                            fight.name = nameSoldier
                            maxNumberOfLive += fight.numberPointsOfLive
                            team.append(fight)
                        }
                    case "2":
                        if !check {
                            let magus = Magus()
                            magus.name = nameSoldier
                            maxNumberOfLive += magus.numberPointsOfLive
                            team.append(magus)
                        }
                    case "3":
                        if !check {
                            let colossus = Colossus()
                            colossus.name = nameSoldier
                            maxNumberOfLive += colossus.numberPointsOfLive
                            team.append(colossus)
                        }
                    case "4":
                        if !check {
                            let dwarf = Dwarfs()
                            dwarf.name = nameSoldier
                            maxNumberOfLive += dwarf.numberPointsOfLive
                            team.append(dwarf)
                        }
                    case "5":
                        if !check {
                            let rider = Riders()
                            rider.name = nameSoldier
                            maxNumberOfLive += rider.numberPointsOfLive
                            team.append(rider)
                        }
                    default:
                        print("I don't understand.")
                        numberTime -= 1
                    }
                } else {
                    print("The value must be between 1 and 5 ")
                    numberTime -= 1
                }
                numberTime += 1
            }
            
        } while numberTime <= 3
        
        numberTime = 1
        return team
    }
    
    func totalLifeTeam () -> Int {
        return maxNumberOfLive
    }
    
    func checkName(name: String) -> Bool {
        // fonction de control du nom
        var timeName = 0
        for i in 0...temporaryName.count-1 {
            if temporaryName[i] == name {
                timeName += 1
                if timeName == 2 {
                    print("\n            =========================================="
                        + "\n                      THE NAME IS ALREADY USED."
                        + "\n                       REPEAT YOUR CHOICE..."
                        + "\n            ==========================================")
                    numberTime -= 1
                    check = true
                    temporaryName.remove(at: temporaryName.count-1)
                }
            }
        }
        return check
    }
    func viewTeam(team: [Soldiers], gamerNumber: Int) {
        // This function display the teams
        let team = team
        var maxPointOfLiveTeamSwap = 0
        var oneTime = 1
        
        if oneTime == 1 {
            print("\nHere are the team members: \(gamerNumber) ")
            print("-----------------------------")
            for i in 0..<team.count {
                print("Step :", i+1, "to have", team[i].name, "is a", team[i].type , "who has",team[i].numberPointsOfLive ,"life and", team[i].numberPointsOfAttack , "attack")
                maxPointOfLiveTeamSwap += team[i].numberPointsOfLive
                oneTime += 1
            }
            print("----------------------------------------------")
            print("The number of life points of team \(gamerNumber) is to: \(maxPointOfLiveTeamSwap)")
            print("----------------------------------------------")
        }
    }
}
