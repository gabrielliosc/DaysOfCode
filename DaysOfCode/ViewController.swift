//
//  ViewController.swift
//  DaysOfCode
//
//  Created by Gabi on 15/12/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        
        setHierarchy()
        setConstraints()
    }
    
    let movies: [Movie] = [
        Movie(id: 1, title: "Órfã 2: A Origem", overview: "", releaseDate: "2022-07-27", image: nil, voteAverage: 7.2),
        Movie(id: 2, title: "Minions 2: A Origem de Gru", overview: "", releaseDate: "2022-06-29", image: nil, voteAverage: 7.8),
        Movie(id: 3, title: "Thor: Amor e Trovão", overview: "", releaseDate: "2022-07-06", image: nil, voteAverage: 6.8),
        Movie(id: 4, title: "Avatar", overview: "", releaseDate: "2009-12-18", image: nil, voteAverage: 8.8),
    ]
    
    private lazy var tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = .clear
        table.separatorStyle = .none
        return table
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Filmes Populares"
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    func setHierarchy(){
        view.addSubview(titleLabel)
        view.addSubview(tableView)
    }
    
    func setConstraints(){
        
        NSLayoutConstraint.activate([
                    titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                    titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                    
                    tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
                    tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
                    tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
                    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = movies[indexPath.row].title
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .white
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
}

