//
//  CharacterTableViewCell.swift
//  Homework4
//
//  Created by Liubov on 05.07.2023.
//

import UIKit

struct Character {
    enum Status {
        case alive
        case dead
        case unknown
    }
    
    enum Gender {
        case female
        case male
        case genderless
        case unknown
    }
    
    let id: UUID
    var name: String
    let status: Status
    var species: String
    let gender: Gender
    var location: String
    let image: UIImage
    
    var genderString: String {
        switch gender {
        case .female:
            return "female"
        case .male:
            return "male"
        case .genderless:
            return "genderless"
        default:
            return "no gender info"
        }
    }
    
    var statusString: String {
        switch status {
        case .alive:
            return "alive"
        case .dead:
            return "dead"
        case .unknown:
            return "unknown"
        }
    }
}


final class CharacterTableViewCell: UITableViewCell {
        
    private lazy var cellNameLabel: UILabel = {
        let cellNameLabel = UILabel()
        cellNameLabel.numberOfLines = 0
        cellNameLabel.textAlignment = .center
        return cellNameLabel
    }()
    
    private lazy var characterImageView: UIImageView = {
        let characterImageView = UIImageView()
        return characterImageView
    }()
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUpData(_ data: Character) {
        cellNameLabel.text = data.name
        characterImageView.image = data.image

    }
    
    func setUpViews() {
        contentView.addSubview(cellNameLabel)
        contentView.addSubview(characterImageView)
        
        cellNameLabel.translatesAutoresizingMaskIntoConstraints = false
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cellNameLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.4),
            cellNameLabel.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.05),
            cellNameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            cellNameLabel.centerYAnchor.constraint(equalTo: contentView.topAnchor),
            cellNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            
            characterImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3),
            characterImageView.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3),
            characterImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            characterImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            characterImageView.topAnchor.constraint(equalTo: cellNameLabel.bottomAnchor, constant: 8),
            ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cellNameLabel.text = nil
    }
}

