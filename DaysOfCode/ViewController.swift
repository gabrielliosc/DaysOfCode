//
//  ViewController.swift
//  DaysOfCode
//
//  Created by Gabi on 15/12/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    let movies: [Movie] = [
        Movie(id: 1, title: "Órfã 2: A Origem", overview: "", releaseDate: "2022-07-27", image: nil, voteAverage: 7.2),
        Movie(id: 2, title: "Minions 2: A Origem de Gru", overview: "", releaseDate: "2022-06-29", image: nil, voteAverage: 7.8),
        Movie(id: 3, title: "Thor: Amor e Trovão", overview: "", releaseDate: "2022-07-06", image: nil, voteAverage: 6.8),
        Movie(id: 4, title: "Avatar", overview: "", releaseDate: "2009-12-18", image: nil, voteAverage: 8.8),
    ]
    
    private lazy var titleView: UILabel = {
       let label = UILabel()
       label.translatesAutoresizingMaskIntoConstraints = false
       label.text = "Filmes Populares"
       label.textColor = .white
       label.font = .systemFont(ofSize: 24.0, weight: .bold)
       return label
   }()
   
   private lazy var tableView: UITableView = {
       let tableView = UITableView(frame: .zero, style: .plain)
       tableView.translatesAutoresizingMaskIntoConstraints = false
       tableView.delegate = self
       tableView.dataSource = self
       tableView.backgroundColor = .clear
       tableView.register(MovieTableViewCell.self, forCellReuseIdentifier: "movieCell")
       tableView.separatorStyle = .none
       return tableView
   }()

   override func viewDidLoad() {
       super.viewDidLoad()
       view.setBackground()
       setLayout()
   }
   
   private func setLayout() {
       view.addSubview(titleView)
       view.addSubview(tableView)
       
       NSLayoutConstraint.activate([
           titleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
           titleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           
           tableView.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 32.0),
           tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
           tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
           tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
       ])
   }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       if let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell") as? MovieTableViewCell {
           cell.selectionStyle = .none
           cell.configureCell(movie: movies[indexPath.row])
           return cell
           }
      return UITableViewCell()
   }
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return movies.count
   }
}

//Minha resolucao
//class ViewController: UIViewController {
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.setBackground()
//        
//        setHierarchy()
//        setConstraints()
//    }
//    
//    let movies: [Movie] = [
//        Movie(id: 1, title: "Órfã 2: A Origem", overview: "", releaseDate: "2022-07-27", image: nil, voteAverage: 7.2),
//        Movie(id: 2, title: "Minions 2: A Origem de Gru", overview: "", releaseDate: "2022-06-29", image: nil, voteAverage: 7.8),
//        Movie(id: 3, title: "Thor: Amor e Trovão", overview: "", releaseDate: "2022-07-06", image: nil, voteAverage: 6.8),
//        Movie(id: 4, title: "Avatar", overview: "", releaseDate: "2009-12-18", image: nil, voteAverage: 8.8),
//    ]
//    
//    private lazy var tableView: UITableView = {
//        let table = UITableView(frame: .zero, style: .plain)
//        table.translatesAutoresizingMaskIntoConstraints = false
//        table.delegate = self
//        table.dataSource = self
//        table.backgroundColor = .clear
//        table.separatorStyle = .none
//        table.register(MovieTableViewCell.self, forCellReuseIdentifier: "movieCell")
//        return table
//    }()
//    
//    private lazy var titleLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Filmes Populares"
//        label.textColor = .white
//        label.font = .systemFont(ofSize: 24, weight: .bold)
//        return label
//    }()
//    
//    func setHierarchy(){
//        view.addSubview(titleLabel)
//        view.addSubview(tableView)
//    }
//    
//    func setConstraints(){
//        
//        NSLayoutConstraint.activate([
//                    titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//                    titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                    
//                    tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
//                    tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
//                    tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
//                    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//                ])
//    }
//}
//
//extension ViewController: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.indentifier, for: indexPath) as? MovieTableViewCell else {
//            return UITableViewCell()
//        }
//        let movie = movies[indexPath.row]
//        cell.loadData(movieTitle: movie.title, releaseDate: movie.releaseDate, movieImage: movie.image ?? "")
//         return cell
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return movies.count
//    }
//}

