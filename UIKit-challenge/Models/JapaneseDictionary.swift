//
//  JapaneseDictionary.swift
//  UIKit-challenge
//
//  Created by Ulisses Bonfim on 16/11/26.
//

import Foundation

struct KanjiTerm: Identifiable {
    let id = UUID()
    let romaji: String
    let kanji: String
    let meaning: String // Tradução em português
}

struct JapaneseDictionary {
    // A chave é sempre em minúsculo e sem acentos para facilitar a busca
    static let terms: [String: KanjiTerm] = [
        // Tamanhos e Direções
        "o": KanjiTerm(romaji: "Ō", kanji: "大", meaning: "Grande"),
        "ko": KanjiTerm(romaji: "Ko", kanji: "小", meaning: "Pequeno"),
        "soto": KanjiTerm(romaji: "Soto", kanji: "外", meaning: "Externo / Por fora"),
        "uchi": KanjiTerm(romaji: "Uchi", kanji: "内", meaning: "Interno / Por dentro"),
        "yoko": KanjiTerm(romaji: "Yoko", kanji: "横", meaning: "Lateral / De lado"),
        "ushiro": KanjiTerm(romaji: "Ushiro", kanji: "後", meaning: "Por trás / Costas"),
        "mae": KanjiTerm(romaji: "Mae", kanji: "前", meaning: "Frontal / Pela frente"),
        
        // Partes do Corpo e Kimono
        "sode": KanjiTerm(romaji: "Sode", kanji: "袖", meaning: "Manga"),
        "goshi": KanjiTerm(romaji: "Goshi", kanji: "腰", meaning: "Quadril"),
        "koshi": KanjiTerm(romaji: "Koshi", kanji: "腰", meaning: "Quadril"),
        "mune": KanjiTerm(romaji: "Mune", kanji: "胸", meaning: "Peito / Tórax"),
        "ashi": KanjiTerm(romaji: "Ashi", kanji: "足", meaning: "Perna / Pé"),
        "hiza": KanjiTerm(romaji: "Hiza", kanji: "膝", meaning: "Joelho"),
        "ude": KanjiTerm(romaji: "Ude", kanji: "腕", meaning: "Braço"),
        "kata": KanjiTerm(romaji: "Kata", kanji: "肩", meaning: "Ombro"),
        "eri": KanjiTerm(romaji: "Eri", kanji: "襟", meaning: "Gola"),
        
        // Ações e Tipos de Golpe
        "guruma": KanjiTerm(romaji: "Guruma", kanji: "車", meaning: "Roda / Rotação"),
        "jime": KanjiTerm(romaji: "Jime", kanji: "絞", meaning: "Estrangulamento"),
        "shime": KanjiTerm(romaji: "Shime", kanji: "絞", meaning: "Estrangulamento"),
        "otoshi": KanjiTerm(romaji: "Otoshi", kanji: "落", meaning: "Queda / Tombamento"),
        "gari": KanjiTerm(romaji: "Gari", kanji: "刈", meaning: "Ceifada / Varrida"),
        "gatame": KanjiTerm(romaji: "Gatame", kanji: "固", meaning: "Imobilização / Controle"),
        "nage": KanjiTerm(romaji: "Nage", kanji: "投", meaning: "Projeção / Arremesso"),
        "harai": KanjiTerm(romaji: "Harai", kanji: "払", meaning: "Varrida"),
        "kesa": KanjiTerm(romaji: "Kesa", kanji: "袈裟", meaning: "Cachecol / Diagonal"),
        "shiho": KanjiTerm(romaji: "Shihō", kanji: "四方", meaning: "Quatro direções / Quatro pontos"),
        "kansetsu": KanjiTerm(romaji: "Kansetsu", kanji: "関節", meaning: "Articulação / Chave")
    ]
    
    /// Quebra um nome como "Sode-guruma-jime" nos termos encontrados
    static func parse(_ japaneseName: String) -> [KanjiTerm] {
        // 1. Separa pelo hífen (ex: ["Sode", "guruma", "jime"])
        let parts = japaneseName.split(separator: "-")
        
        return parts.compactMap { part in
            // 2. Normaliza: remove espaços, deixa minúsculo e troca "ō" por "o"
            let cleanKey = part
                .trimmingCharacters(in: .whitespacesAndNewlines)
                .lowercased()
                .replacingOccurrences(of: "ō", with: "o")
                .replacingOccurrences(of: "ū", with: "u")
            
            // 3. Busca no dicionário
            return terms[cleanKey]
        }
    }
}
