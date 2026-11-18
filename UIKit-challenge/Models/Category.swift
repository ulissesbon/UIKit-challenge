//
//  TechniqueCategoryModel.swift
//  UIKit-challenge
//
//  Created by Ulisses Bonfim on 16/11/26.
//

import Foundation

enum TechniqueCategory: String, Codable, CaseIterable, Identifiable {
    case submission = "Finalização"
    case takedown   = "Queda"
    case sweep      = "Raspagem"
    case guardPass  = "Passagem de Guarda"
    case escape     = "Reposição / Escape"
    case control    = "Imobilização / Controle"
    
    var id: String { self.rawValue }
}
