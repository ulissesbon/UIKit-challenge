//
//  PositionModel.swift
//  UIKit-challenge
//
//  Created by Ulisses Bonfim on 16/11/26.
//

import Foundation

enum Position: String, Codable, CaseIterable, Identifiable {
    case standing    = "Em Pé"
    case closedGuard = "Guarda Fechada"
    case openGuard   = "Guarda Aberta"
    case halfGuard   = "Meia-Guarda"
    case sideControl = "100 Quilos (Lateral)"
    case mount       = "Montada"
    case backControl = "Pegada das Costas"
    case turtle      = "Quatro Apoios"
    
    var id: String { self.rawValue }
}
