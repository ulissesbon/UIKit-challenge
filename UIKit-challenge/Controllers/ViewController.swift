//
//  ViewController.swift
//  UIKit-challenge
//
//  Created by Ulisses Bonfim on 11/11/26.
//

import UIKit
import SwiftUI
import SwiftData

// UIViewController gerencia a tela e seu ciclo de vida.
// UIKit isola este controller na MainActor; atualizações da interface acontecem nela.
class ViewController: UIViewController {

    // MARK: - Interface e dados

    private var techniques: [Technique] = []
    private let tableView = UITableView(frame: .zero, style: .insetGrouped)
    private let container = try! ModelContainer(
        for: Technique.self,
        configurations: ModelConfiguration(isStoredInMemoryOnly: true)
    )

    // MARK: - Ciclo de vida e configuração da tela

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Técnicas"

        navigationController?.navigationBar.prefersLargeTitles = true

        view.backgroundColor = .systemGroupedBackground

        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        // self indica que este controller responde às perguntas sobre os dados da tabela.
        // Os métodos exigidos por UITableViewDataSource estão na extension abaixo.
        tableView.dataSource = self

        // Associa o identificador "cell" ao tipo de célula que a tabela pode criar.
        // O mesmo identificador deve ser usado ao solicitar uma célula reutilizável.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        loadTechniques()
    }

    // MARK: - Dados locais

    private func insertSampleTechniquesIfNeeded() throws {
        
        let context = container.mainContext
        let descriptor = FetchDescriptor<Technique>() // consulta de todas as técnicas

        guard try context.fetchCount(descriptor) == 0 else {
            return
        }

        let samples = TechniqueSampleData.makeTechniques()

        for technique in samples {
            context.insert(technique)
        }

        try context.save()
    }

    private func loadTechniques() {
        do {
            try insertSampleTechniquesIfNeeded()

            let descriptor = FetchDescriptor<Technique>(
                sortBy: [
                    SortDescriptor(\.namePortuguese)
                ]
            )

            techniques = try container.mainContext.fetch(descriptor)

            tableView.reloadData()
        } catch {
            print("Erro ao carregar técnicas: \(error.localizedDescription)")
        }
    }
}

extension ViewController: UITableViewDataSource {

    // Sem numberOfSections, a tabela usa uma seção. Cada técnica corresponde a uma linha.
    // O primeiro _ permite que UIKit passe a tabela sem um rótulo externo para o parâmetro.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return techniques.count
    }

    // Chamado quando a tabela precisa de uma célula para determinada linha.
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        // indexPath identifica seção e linha. row é o índice no array desta seção.
        let technique = techniques[indexPath.row]

        // Reaproveita uma célula disponível ou cria uma do tipo registrado quando necessário.
        // Isso evita criar uma célula para cada item da lista de uma só vez.
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath
        )

        // A configuração padrão oferece título e texto secundário com estilo do sistema.
        // var permite alterar essa configuração antes de atribuí-la à célula.
        var content = cell.defaultContentConfiguration()
        content.text = technique.namePortuguese
        content.secondaryText = technique.nameJapanese

        // Reconfigura os textos a cada reutilização para mostrar a técnica da linha atual.
        cell.contentConfiguration = content

        return cell
    }
}

#Preview {
    ViewController()
}
