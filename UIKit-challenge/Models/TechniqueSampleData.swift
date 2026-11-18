import Foundation

/// Dados de demonstração para desenvolver a interface sem rede.
/// Referência dos nomes japoneses: https://judo.ijf.org/classification
/// Nomes em português/inglês e descrições são rótulos editoriais para o protótipo.
/// Posição e faixa são exemplos de cadastro, não regras de graduação ou competição.
@MainActor
enum TechniqueSampleData {
    // Cria novas instâncias a cada chamada para não compartilhar modelos entre contexts.
    static func makeTechniques() -> [Technique] {
        [
            Technique(
                namePortuguese: "Estrangulamento Ezequiel",
                nameJapanese: "Sode-guruma-jime",
                nameEnglish: "Ezekiel choke",
                techniqueDescription: "Estrangulamento com auxílio da manga do kimono.",
                category: .submission,
                startPosition: .mount,
                beltLevel: .white,
                isGiRequired: true
            ),
            Technique(
                namePortuguese: "Grande ceifada externa",
                nameJapanese: "O-soto-gari",
                nameEnglish: "Major outer reap",
                techniqueDescription: "Projeção em pé com uma ceifada pelo lado externo da perna.",
                category: .takedown,
                startPosition: .standing,
                beltLevel: .white,
                isGiRequired: false
            ),
            Technique(
                namePortuguese: "Imobilização em cachecol",
                nameJapanese: "Kesa-gatame",
                nameEnglish: "Scarf hold",
                techniqueDescription: "Controle no solo em posição lateral ao adversário.",
                category: .control,
                startPosition: .sideControl,
                beltLevel: .white,
                isGiRequired: false
            )
        ]
    }
}
