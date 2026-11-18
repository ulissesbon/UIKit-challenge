//
//  BeltLevel.swift
//  UIKit-challenge
//
//  Created by Ulisses Bonfim on 16/11/26.
//

import Foundation

enum BeltLevel: String, Codable, CaseIterable, Identifiable {
    case white  = "Branca"
    case blue   = "Azul"
    case purple = "Roxa"
    case brown  = "Marrom"
    case black  = "Preta"
    
    var id: String { self.rawValue }
}
