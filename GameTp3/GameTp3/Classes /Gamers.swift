//
//  Gamers.swift
//  GameTp3
//
//  Created by Frédéric on 25/03/2019.
//  Copyright © 2019 fpired. All rights reserved.
//

import Foundation

class Gamers {
    var name = ""
    var pseudo = ""
    var pseudo1 = ""
    var number = 0
    let banner = """
          
                 |  |  _          _              _         ,|
                 |--| (_ | |  _  (   _  |  _| ° (_ /)  _ °  |
                 |  |_(__|_|_(_)__)_(_)_|_(_|_|_(_/(__| )___|_
                          
                         
        """
    let banner1 = """

                 |  |  _          _              _         ,__
                 |--| (_ | |  _  (   _  |  _| ° (_ /)  _ ° | /
                 |  |_(__|_|_(_)__)_(_)_|_(_|_|_(_/(__| )___/__


        """
    
    func presentation(gamer: Gamers, gamerNumber: Int) -> Gamers {
        let gamerNumber = gamerNumber
        var gamerPseudoControl = ""
        let gamer = gamer
        var gamerName = ""
        var gamerPseudo = ""
        var controlPseudo = false
        
        if gamerNumber == 1
        {
            print("\n"
                + "        " + banner)
        } else {
            print("\n"
                + "        " + banner1)
        }
        print("\nWhat is your Name ? \n")
        
        gamerName = entranceControl()
        
        repeat {
            controlPseudo = false
            
            print("Hello \(gamerName), what nickname did you choose to participate in this game ? ")
            gamerPseudoControl = entranceControl()
            print("Voici la valeur du retour de entranceControl() \(gamerPseudoControl)")
            if gamerNumber == 1 {
                pseudo1 = gamerPseudoControl
                print("Voici la valeur de pseudo1 \(pseudo1)")
            } else {
                controlPseudo = caseControl(pseudo1Case: pseudo1, gamerPseudoControlCase: gamerPseudoControl)
                if controlPseudo {
                    print("This nickname is already used. Start again...")
                }
            }
            
        } while controlPseudo
        
        gamerPseudo = gamerPseudoControl
        gamer.name = gamerName
        gamer.pseudo = gamerPseudo
        gamer.number = gamerNumber
        print("\nOk gamer N°\(gamer.number), you are called \(gamer.name) and you will play under the nickname: \(gamer.pseudo)")
        return gamer
    }
    
    private func entranceControl() -> String {
        var gamerControl = ""
        var control = true
        repeat {
            control = true
            if let answerName = readLine() {
                if answerName.isEmpty {
                    print("I did not understand...")
                    control = false
                }
                gamerControl = answerName
            }
        } while !control
        
        return gamerControl
    }
    
    private func caseControl(pseudo1Case: String, gamerPseudoControlCase: String) -> Bool {
        var controlCase = false
        if pseudo1Case == gamerPseudoControlCase {
            controlCase = true
        }
        if pseudo1Case == gamerPseudoControlCase.lowercased() {
            controlCase = true
        }
        return controlCase
    }
}
