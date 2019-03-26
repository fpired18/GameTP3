//
//  Soldiers.swift
//  GameTp3
//
//  Created by Frédéric on 25/03/2019.
//  Copyright © 2019 fpired. All rights reserved.
//

import Foundation

enum TypeWeapon: Int {
    case arbalette = 28
    case spear = 40
    case sword = 10
    case menhir = 7
    case choppen = 15
    case massue = 22
    case caress = 5
    case medicaments = 18
    case Kiss = 20
    case injection = 25
    case dopage = 35
    
    
}
// This parent class defines the generic object of the soldier
class Soldiers {
    var name: String
    var type: String
    //var numberPointsOfLive: Int
    var numberPointsOfAttack: Int
    var numberPointsOfLive: Int {
        willSet {
            print("I AM HURT !!!!")
            print("--------------\n")
        }
        didSet {
            if oldValue < numberPointsOfLive {
                print("Thank you mage for treating me ")
                print("------------------------------/n")
            } else {
                print("Ouch... I just took a serious attack !!!")
                print("----------------------------------------")
            }
        }
    }
    var weapon: TypeWeapon
    
    init(name: String, type: String, numberPointOfLive: Int, numberPointOfAttack: Int, weapon: TypeWeapon) {
        self.name = name
        self.type = type
        self.numberPointsOfLive = numberPointOfLive
        self.numberPointsOfAttack = numberPointOfAttack
        self.weapon = weapon
    }
    convenience init() {
        self.init(name: "", type: "", numberPointOfLive: 0, numberPointOfAttack: 0, weapon: .caress)
    }
    
    func randomWeapon() -> TypeWeapon {
        
        let randomNumber: Int = Int.random(in: 1...6)
        
        switch randomNumber {
        case 1:
            weapon = .sword
        case 2:
            weapon = .menhir
        case 3:
            weapon = .choppen
        case 4:
            weapon = .massue
        case 5:
            weapon = .arbalette
        case 6:
            weapon = .spear
        default:
            break
        }
        return weapon
    }
}
//This classes girl allows to bring a complementary property
class Fights: Soldiers {
    init() {
        super.init(name: "", type: "fight", numberPointOfLive: 100, numberPointOfAttack: 10, weapon: .sword)
    }
}

class Colossus : Soldiers {
    init() {
        super.init(name: "", type: "colossus", numberPointOfLive: 150, numberPointOfAttack: 7, weapon: .menhir)
    }
}

class Dwarfs: Soldiers {
    init() {
        super.init(name: "", type: "dwarf", numberPointOfLive: 60, numberPointOfAttack: 15, weapon: .choppen)
    }
}

class Magus: Soldiers {
    init() {
        super.init(name: "", type: "magus", numberPointOfLive: 80, numberPointOfAttack: 10, weapon: .injection)
    }
    
    func randomWeaponMagus() -> TypeWeapon {
        
        let randomNumber: Int = Int.random(in: 1...5)
        
        switch randomNumber {
        case 1:
            weapon = .Kiss
        case 2:
            weapon = .injection
        case 3:
            weapon = .medicaments
        case 4:
            weapon = .caress
        case 5:
            weapon = .dopage
        default:
            break
        }
        return weapon
    }
}

class Riders: Soldiers {
    init() {
        super.init(name: "",  type: "rider", numberPointOfLive: 150, numberPointOfAttack: 30, weapon: .spear)
    }
}
