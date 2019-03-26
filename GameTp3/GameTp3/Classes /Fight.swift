//
//  Fight.swift
//  GameTp3
//
//  Created by Frédéric on 25/03/2019.
//  Copyright © 2019 fpired. All rights reserved.
//

import Foundation

class Fight {
    
    var validation = true
    var maxNumberOfLive1 = 0
    var maxNumberOfLive2 = 0
    var numberPointOfLiveGame = ["fight" : 100, "magus": 80, "colossus": 120, "dwarf": 60, "rider": 150]
    var trunk = Trunk()
    
    func displayBattleResul(maxPointOfLiveTeam1: Int, maxPointOfLiveTeam2: Int) {
        print("\n=====================================================")
        print("Here is the number of life points of the team 1: \(maxPointOfLiveTeam1)\n"
            + "    and the number of life points of the team 2: \(maxPointOfLiveTeam2)\n"
            + "=====================================================")
    }
    
    func displayMenu(team: [Soldiers], gamerNumber: Int, oneTime: Int) -> Soldiers {
        
        let team = team
        var soldier = Soldiers()
        
        if let choice = readLine() {
            switch choice {
            case "1":
                soldier = team[0]
            case "2":
                soldier = team[1]
            case "3":
                soldier = team[2]
            default:
                print("I don't understand")
                validation = false
            }
        }
        return soldier
    }
    
    func choiceSoldier(choice: String, numberGamer: Int, team1: [Soldiers], team2: [Soldiers]) {
        // The soldier selection function inverts the team accordint to the palyer's number
        var teamSwap1 = team1
        var teamSwap2 = team2
        let team = Teams()
        var soldierSwap1 = Soldiers()
        var soldierSwap2 = Soldiers()
        var maxNumberOfLive = maxNumberOfLive2
        var maxNumberOfLiveSoldier = 0
        var initialForce = 0
        let numberGamerSwap = numberGamer
        var numberGamerSwap2 = 2
        
        if numberGamer == 2 {
            teamSwap1 = team2
            teamSwap2 = team1
            numberGamerSwap2 = 1
            maxNumberOfLive = maxNumberOfLive1
        }
        
        if choice == "1" {
            var validationMage = true
            var numberMage = 0
            // This function is ot count the number of mages in the team
            for i in 0..<teamSwap1.count-1 {
                if teamSwap1[i].type == "magus" {
                    numberMage += 1
                }
            }
            if numberMage == 3 {
                print("You only have mages in your team, you can't attack ! ")
                validationMage = false
            } else {
                repeat {
                    validation = true
                    print("\nCHOOSE A MEMBER OF YOUR TEAM... ")
                    
                    team.viewTeam(team: teamSwap1, gamerNumber: numberGamerSwap)
                    soldierSwap1 = displayMenu(team: teamSwap1, gamerNumber: numberGamerSwap, oneTime: 1)
                    
                    // Here we capture the initial value of the attack of the soldier
                    initialForce = soldierSwap1.numberPointsOfAttack
                    
                    if soldierSwap1.numberPointsOfLive <= 0 {
                        print("Can't select it is dead")
                        validation = false
                    }
                    if soldierSwap1.type == "magus" {
                        print("CAN NOT SELECT HIM TO FIGHT, HE CAN ONLY CARE \n")
                        validationMage = false
                    }
                } while !validation
                
                // The result af openingTrunk is safe to the "numberPointsOfAttack" property of the previously sent soldier
                if validationMage {
                    soldierSwap1 = trunk.openingTrunk(soldier: soldierSwap1, choice: choice)
                }
            }
            repeat {
                if validationMage {
                    print("\nCHOOSE A MEMBER OF THE OTHER TEAM... ")
                    team.viewTeam(team: teamSwap2, gamerNumber: numberGamerSwap2)
                    
                    soldierSwap2 = displayMenu(team: teamSwap2, gamerNumber: numberGamerSwap2, oneTime: 2)
                    if soldierSwap2.numberPointsOfLive <= 0 {
                        print("Can't select it is dead")
                        validation = false
                    }
                }
            } while !validation
            
            if validationMage {
                print("==============================================================")
                print("You just selected \(soldierSwap1.name) with numberPointsOfAttack property: \(soldierSwap1.numberPointsOfAttack)")
                print("You just selected \(soldierSwap2.name) with numberPointsOfLife  property: \(soldierSwap2.numberPointsOfLive)")
                print("==============================================================\n")
            
                if soldierSwap1.numberPointsOfAttack > soldierSwap2.numberPointsOfLive {
                    maxNumberOfLive -= soldierSwap2.numberPointsOfLive
                    soldierSwap2.numberPointsOfLive = 0
                    
                } else {
                    soldierSwap2.numberPointsOfLive -= soldierSwap1.numberPointsOfAttack
                    maxNumberOfLive -= soldierSwap1.numberPointsOfAttack
                }
            }
            
            // Return of the initial strike force
            soldierSwap1.numberPointsOfAttack = initialForce
            if numberGamer == 1 {
                maxNumberOfLive2 = maxNumberOfLive
            } else {
                maxNumberOfLive1 = maxNumberOfLive
            }
            displayBattleResul(maxPointOfLiveTeam1: maxNumberOfLive1, maxPointOfLiveTeam2: maxNumberOfLive2)
        }
        
        if choice == "2" {
            validation = true
            // This loop has the mission to control the presence of a magus in the team and if it is still alive
            
            for i in 0..<teamSwap1.count {
                if teamSwap1[i].type == "magus" {
                    soldierSwap1 = teamSwap1[i]
                    // Here we capture the initial value of the attack of the soldier
                    initialForce = teamSwap1[i].numberPointsOfAttack
                    if soldierSwap1.numberPointsOfLive == 0 {
                        print("You don't have a magus in your team able to act ")
                        validation = false
                    }
                }
            }
                if validation {
                    
                    soldierSwap1 = trunk.openingTrunk(soldier: soldierSwap1, choice: choice)
                    print("\nCHOOSE THE PERSON TO LOOK AFTER ")
                    team.viewTeam(team: teamSwap1, gamerNumber: numberGamerSwap)
                    
                    soldierSwap2 = displayMenu(team: teamSwap1, gamerNumber: numberGamerSwap, oneTime: 2)
                    
                    for (typeSoldier, numberPointOfLive) in numberPointOfLiveGame {
                        if typeSoldier == soldierSwap2.type {
                            // recovery of the maximum number of life points depending on the type of soldier
                            maxNumberOfLiveSoldier = numberPointOfLive
                        }
                    }
                    if soldierSwap2.numberPointsOfLive == maxNumberOfLiveSoldier {
                        print("No need to treat him he is in great shape ! ")
                        validation = false
                    }
                    if soldierSwap2.numberPointsOfLive <= 0 {
                        print("You arrive too late, your soldier is dead \n")
                        validation = false
                    }
                    if (soldierSwap2.numberPointsOfLive + soldierSwap1.numberPointsOfAttack) > maxNumberOfLiveSoldier {
                        soldierSwap2.numberPointsOfLive = maxNumberOfLiveSoldier
                    } else {
                        soldierSwap2.numberPointsOfLive += soldierSwap1.numberPointsOfAttack
                    }
                    
                    if numberGamer == 1 && validation {
                        maxNumberOfLive1 += soldierSwap1.numberPointsOfAttack
                    }
                    if numberGamer == 2 && validation {
                        maxNumberOfLive2 += soldierSwap1.numberPointsOfAttack
                    }
                    
                    if validation {
                        print("Here is the result of the treatment \(soldierSwap1.type) he added \(soldierSwap1.numberPointsOfAttack) life")
                        displayBattleResul(maxPointOfLiveTeam1: maxNumberOfLive1, maxPointOfLiveTeam2: maxNumberOfLive2)
                    }
                    
                    // Return of the initial strike
                    soldierSwap1.numberPointsOfAttack = initialForce
                
            }
        }
    }
}
