//
//  main.swift
//  LearnStrongWeak
//
//  Created by Sezer İltekin on 22.01.2022.
//

import Foundation

class Singer {
    func playSong() {
        print("Shake it off!")
    }
}

func sing() -> () -> Void {
    let taylor = Singer()

    let singing = { //[weak taylor] in
        taylor.playSong()
        return
    }

    return singing
}

let singFunction = sing()
singFunction()
