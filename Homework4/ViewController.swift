import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private var data: [Character] = [
        Character(id: UUID(), name: "Rick Sanchez", status: Character.Status.alive, species: "Human", gender: Character.Gender.male, location: "Earth (Citadel of Ricks)", image: UIImage(named: "1")!),
        Character(id: UUID(), name: "Morty Smith", status: Character.Status.alive, species: "Human", gender: Character.Gender.male, location: "Earth (Citadel of Ricks)", image: UIImage(named: "2")!),
        Character(id: UUID(), name: "Summer Smith", status: Character.Status.alive, species: "Human", gender: Character.Gender.female, location: "Earth (Replacement Dimension)", image: UIImage(named: "3")!),
        Character(id: UUID(), name: "Beth Smith", status: Character.Status.alive, species: "Human", gender: Character.Gender.female, location: "Earth (Replacement Dimension)", image: UIImage(named: "4")!),
        Character(id: UUID(), name: "Jerry Sanchez", status: Character.Status.alive, species: "Human", gender: Character.Gender.male, location: "Earth (Replacement Dimension)", image: UIImage(named: "5")!),
        Character(id: UUID(), name: "Abadango Cluster Princess", status: Character.Status.alive, species: "Alien", gender: Character.Gender.unknown, location: "Abadango", image: UIImage(named: "6")!),
        Character(id: UUID(), name: "Abradolf Lincler", status: Character.Status.unknown, species: "Human", gender: Character.Gender.male, location: "Testicle Monster Dimension", image: UIImage(named: "7")!),
        Character(id: UUID(), name: "Adjudicator Rick", status: Character.Status.dead, species: "Human", gender: Character.Gender.male, location: "Citadel of Ricks", image: UIImage(named: "8")!),
        Character(id: UUID(), name: "Agency Director", status: Character.Status.dead, species: "Human", gender: Character.Gender.male, location: "Earth (Replacement Dimension)", image: UIImage(named: "9")!),
        Character(id: UUID(), name: "Alan Rails", status: Character.Status.dead, species: "Human", gender: Character.Gender.male, location: "Worldender's lair", image: UIImage(named: "10")!),
        Character(id: UUID(), name: "Albert Einstein", status: Character.Status.dead, species: "Human", gender: Character.Gender.male, location: "Earth (Replacement Dimension)", image: UIImage(named: "11")!),
        Character(id: UUID(), name: "Alexander", status: Character.Status.dead, species: "Human", gender: Character.Gender.male, location: "Anatomy Park", image: UIImage(named: "12")!),
        Character(id: UUID(), name: "Alien Googah", status: Character.Status.unknown, species: "Alien", gender: Character.Gender.unknown, location: "Earth (Replacement Dimension)", image: UIImage(named: "13")!),
        Character(id: UUID(), name: "Alien Morty", status: Character.Status.unknown, species: "Alien", gender: Character.Gender.male, location: "Citadel of Ricks", image: UIImage(named: "14")!),
        Character(id: UUID(), name: "Alien Rick", status: Character.Status.unknown, species: "Alien", gender: Character.Gender.male, location: "Citadel of Ricks", image: UIImage(named: "15")!),
        Character(id: UUID(), name: "Amish Cyborg", status: Character.Status.dead, species: "Alien", gender: Character.Gender.male, location: "Earth (Replacement Dimension)", image: UIImage(named: "16")!),
        Character(id: UUID(), name: "Annie", status: Character.Status.alive, species: "Human", gender: Character.Gender.female, location: "Anathomy Park", image: UIImage(named: "17")!),
        Character(id: UUID(), name: "Antenna Morty", status: Character.Status.alive, species: "Human", gender: Character.Gender.male, location: "Citadel of Ricks", image: UIImage(named: "19")!),
        Character(id: UUID(), name: "Antenna Rick", status: Character.Status.alive, species: "Human", gender: Character.Gender.male, location: "unknown", image: UIImage(named: "18")!),
        Character(id: UUID(), name: "Ants in my Eyes Johnson", status: Character.Status.unknown, species: "Human", gender: Character.Gender.male, location: "Interdimensional Cable", image: UIImage(named: "20")!),
    ]
    
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        tableView = UITableView(frame: view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: "characterCell")
        view.addSubview(tableView)
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let detailViewController = DetailViewController()
        detailViewController.delegate = self
        
        present(detailViewController, animated: true, completion: nil)
        detailViewController.data = data[indexPath.row]
    }

    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let characterCell = tableView.dequeueReusableCell(withIdentifier: "characterCell", for: indexPath) as! CharacterTableViewCell

        let cellData = data[indexPath.row]
        characterCell.setUpViews()
        characterCell.setUpData(cellData)
        
        return characterCell
    }

    
}

extension ViewController: DetailViewControllerDelegate {
    func deleteCharacterData(with id: UUID) {
        if let index = data.firstIndex(where: { $0.id == id }) {
            data.remove(at: index)
            tableView.reloadData()
        }
        dismiss(animated: true)
    }
    
    func updateCharacterData(_ character: Character) {
        if let index = data.firstIndex(where: { $0.id == character.id }) {
            data[index] = character
            tableView.reloadData()
        }
    }
}
