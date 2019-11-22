//
//  AddPokemonController.swift
//  PokeList
//
//  Created by Emerson Victor on 21/11/19.
//  Copyright © 2019 emer. All rights reserved.
//

import UIKit

final class AddPokemonController: UIViewController {
    
    // MARK: - Components
    lazy var pokelistTableView: PokemonTableView = {
        let tableView = PokemonTableView()
        tableView.register(PokemonDetailCell.self,
                           forCellReuseIdentifier: "PokemonDetail")
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    lazy var searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search a pokemon name"
        return searchController
    }()
    
    // MARK: - View Model
    // TODO: - Implement view model

    // MARK: - View controller lifecycle methods
    override func loadView() {
        super.loadView()
        self.setupView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.largeTitleDisplayMode = .never
    }
}

// MARK: - Setup interface
extension AddPokemonController: CodeView {
    func buildViewHierarchy() {
        self.view.addSubview(self.pokelistTableView)
    }

    func setupConstratins() {
        self.pokelistTableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func setupAdditionalConfiguration() {
        self.navigationItem.searchController = self.searchController
    }
}

// MARK: - Search bar controller results delegate
extension AddPokemonController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        // TODO: -  Implement search
        print(searchController.searchBar.text)
    }
}

// MARK: - Table view data source and delegate
extension AddPokemonController: UITableViewDataSource, UITableViewDelegate {
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
        return 96
    }
}
