//
//  PokelistController.swift
//  PokeList
//
//  Created by Emerson Victor on 19/11/19.
//  Copyright © 2019 emer. All rights reserved.
//

import UIKit

final class PokelistController: UIViewController {
    
    // MARK: - Components
    lazy var pokelistTableView: PokemonTableView = {
        let tableView = PokemonTableView()
        tableView.register(PokemonDetailCell.self,
                           forCellReuseIdentifier: "PokemonDetail")
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    lazy var addButton: UIBarButtonItem = {
        let item = UIBarButtonItem(barButtonSystemItem: .add,
                                   target: self,
                                   action: #selector(addPokemonToPokelist))
        return item
    }()
    
    // MARK: - View model
    // TODO: - Implement view model

    // MARK: - Expanded cells
    var expandedCells: Set<IndexPath> = []
    
    // MARK: - View controller lifecycle methods
    override func loadView() {
        super.loadView()
        self.setupView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationItem.largeTitleDisplayMode = .always
    }
    
    // MARK: - Navigation controller actions
    @objc func addPokemonToPokelist() {
        let controller = AddPokemonController()
        self.navigationController?.pushViewController(controller, animated: true)
    }
}

// MARK: - Setup interface
extension PokelistController: CodeView {
    func buildViewHierarchy() {
        self.view.addSubview(self.pokelistTableView)
    }

    func setupConstratins() {
        self.pokelistTableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() {
        self.title = "Pokelist"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.rightBarButtonItem = self.addButton
    }
}

// MARK: - Table view data source and delegate
extension PokelistController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO: - Get pokelist count
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonDetail", for: indexPath)
        // TODO: - Set cell pokemon
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.expandedCells.contains(indexPath) ? 178 : 96
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! PokemonDetailCell
        if self.expandedCells.contains(indexPath) {
            self.expandedCells.remove(indexPath)
            cell.isExpanded = false
        } else {
            self.expandedCells.insert(indexPath)
            cell.isExpanded = true
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}
