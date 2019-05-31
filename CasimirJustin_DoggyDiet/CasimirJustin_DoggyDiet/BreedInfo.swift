//
//  BreedInfo.swift
//  CasimirJustin_DoggyDiet
//
//  Created by Justin Casimir on 5/30/19.
//  Copyright © 2019 Justin Casimir. All rights reserved.
//

import Foundation
import UIKit

class BreedInfo {
    let name: String
    let breedGroup: String
    let temperament: String
    let lifeSpan: String
    let id: Int
    
    init(name: String, breedGroup: String, temperament: String, lifeSpan: String, id: Int){
        self.name = name
        self.breedGroup = breedGroup
        self.temperament = temperament
        self.lifeSpan = lifeSpan
        self.id = id
    }
}
