//
//  MovieTableViewCell.swift
//  DaysOfCode
//
//  Created by Gabi on 15/12/24.
//

import UIKit
class MovieTableViewCell: UITableViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20.0)
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var releaseDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white.withAlphaComponent(0.75)
        return label
    }()
    
    private lazy var imagePoster: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        imgView.layer.cornerRadius = 18.0
        imgView.layer.masksToBounds = true
        imgView.backgroundColor = .black
        return imgView
    }()
    
    private lazy var textStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        [titleLabel, releaseDateLabel].forEach { view in
            stack.addArrangedSubview(view)
        }
        stack.distribution = .fillProportionally
        stack.spacing = 8
        return stack
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        [imagePoster, textStackView].forEach { view in
            stack.addArrangedSubview(view)
        }
        stack.distribution = .fillProportionally
        stack.spacing = 16.0
        stack.alignment = .center
        return stack
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(movie: Movie) {
        setConstraints()
        titleLabel.text = movie.title
        releaseDateLabel.text = "Lançamento: \(movie.releaseDate.formatDate())"
    }
    
    private func setLayout() {
        backgroundColor = .clear
    }
    
    private func setConstraints() {
        addSubview(mainStackView)
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16.0),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16.0),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24.0),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24.0),
            
            imagePoster.widthAnchor.constraint(equalToConstant: 90),
            imagePoster.heightAnchor.constraint(equalToConstant: 120),
        ])
    }

}

//Minha resolucao
//class MovieTableViewCell: UITableViewCell {
//    static let indentifier: String = "movieCell"
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//    
//    private lazy var movieImageView: UIImageView = {
//        let image = UIImageView()
//        image.translatesAutoresizingMaskIntoConstraints = false
//        image.image = UIImage()
//        image.contentMode = .scaleAspectFit
//        image.backgroundColor = .black
//        return image
//    }()
//    
//    private lazy var movieLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Nome do filme"
//        label.font = .systemFont(ofSize: 16)
//        return label
//    }()
//    
//    private lazy var dateLabel: UILabel = {
//        let label = UILabel()
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.font = .systemFont(ofSize: 8)
//        return label
//    }()
//    
//    private lazy var stackViewVertical: UIStackView = {
//        let stackView = UIStackView(arrangedSubviews: [movieLabel, dateLabel])
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = .vertical
//        stackView.spacing = 5
//        stackView.layer.cornerRadius = 10
//        stackView.isLayoutMarginsRelativeArrangement = true
//        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 12, leading: 24, bottom: 12, trailing: 24)
//        return stackView
//    }()
//    
//    private lazy var stackViewHorizontal: UIStackView = {
//        let stackView = UIStackView(arrangedSubviews: [movieImageView, stackViewVertical])
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.axis = .horizontal
//        return stackView
//    }()
//    
//    public func loadData(movieTitle: String, releaseDate: String, movieImage: String){
//        movieLabel.text = movieTitle
//        dateLabel.text = releaseDate
//        movieImageView.image = UIImage(named: movieImage)
//    }
//    
//    private func setupView() {
//        backgroundColor = .clear
//        selectionStyle = .none
//        
//        setHierarchy()
//        setConstraints()
//    }
//    private func setHierarchy(){
//        contentView.addSubview(stackViewHorizontal)
//    }
//    
//    private func setConstraints() {
//        NSLayoutConstraint.activate([
//            stackViewHorizontal.topAnchor.constraint(equalTo: contentView.topAnchor),
//            stackViewHorizontal.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            stackViewHorizontal.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            stackViewHorizontal.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            
//        ])
//        
//        NSLayoutConstraint.activate([
//            stackViewVertical.widthAnchor.constraint(lessThanOrEqualToConstant: 50),
//            movieImageView.heightAnchor.constraint(equalToConstant: 30)
//        ])
//    }
//
//}
