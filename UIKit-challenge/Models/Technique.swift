//
//  TechniquesModel.swift
//  UIKit-challenge
//
//  Created by Ulisses Bonfim on 16/11/26.
//

import SwiftData
import Foundation

@Model
class Technique {
    
    @Attribute(.unique) var id: UUID
    
    var namePortuguese: String       // Ex: "Estrangulamento Ezequiel"
    var nameJapanese: String         // Ex: "Sode-guruma-jime"
    var nameEnglish: String          // Ex: "Ezekiel Choke"

    var techniqueDescription: String
    var category: TechniqueCategory
    var startPosition: Position
    var beltLevel: BeltLevel
    var isGiRequired: Bool
    
    var videoURL: URL?
    
    var breakdown: [KanjiTerm] {
        JapaneseDictionary.parse(nameJapanese)
    }
    
    var autoKanji: String {
        breakdown.map { $0.kanji }.joined()
    }
    
    var autoLiteralTranslation: String {
        breakdown.map { $0.meaning }.joined(separator: " • ")
    }
    init(
        namePortuguese: String,
        nameJapanese: String,
        nameEnglish: String,
        techniqueDescription: String = "",
        category: TechniqueCategory = .submission,
        startPosition: Position = .closedGuard,
        beltLevel: BeltLevel = .white,
        isGiRequired: Bool = true,
        videoURL: URL? = nil
    ){
        self.id = UUID()
        self.namePortuguese = namePortuguese
        self.nameJapanese = nameJapanese
        self.nameEnglish = nameEnglish
        self.techniqueDescription = techniqueDescription
        self.category = category
        self.startPosition = startPosition
        self.beltLevel = beltLevel
        self.isGiRequired = isGiRequired
        self.videoURL = videoURL
    }
}
