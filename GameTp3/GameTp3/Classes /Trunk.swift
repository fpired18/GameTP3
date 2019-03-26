//
//  Trunk.swift
//  GameTp3
//
//  Created by Frédéric on 25/03/2019.
//  Copyright © 2019 fpired. All rights reserved.
//

import Foundation

class Trunk {
    
    var soldier = Soldiers()
    var magus = Magus()
    
    func openingTrunk(soldier: Soldiers, choice: String) -> Soldiers {
        let newWeapon: TypeWeapon
        // Step 3 : We change the strength of the weapon in this function
        let soldier = soldier
        if soldier.type == "magus" {
            newWeapon = magus.randomWeaponMagus()
        } else {
            newWeapon = soldier.randomWeapon()
        }
        
        let controle = 1
        soldier.numberPointsOfAttack = newWeapon.rawValue
        print("\n===========================================================================")
        print("                    WATCH THE CHEST OPEN !!!!!!!")
        print("===========================================================================")
        print("Here's what came out of the chest: \(newWeapon) with the strong value of: \(newWeapon.rawValue)")
        
        if controle == 1 {
            print("\nHere the new strike force of \(soldier.type): \(soldier.numberPointsOfAttack)"
                + "\n--------------------------------------")
        }
        return soldier
    }
    
}
