import UIKit

class SecondViewController: UIViewController {

    var language: Language?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        guard let language else {
            title = "Details"
            return
        }

        title = language.name

        let iconView = UIImageView(image: UIImage(systemName: language.symbolName))
        iconView.contentMode = .scaleAspectFit
        iconView.translatesAutoresizingMaskIntoConstraints = false

        let nameLabel = UILabel()
        nameLabel.text = language.name
        nameLabel.font = .systemFont(ofSize: 34, weight: .bold)
        nameLabel.textAlignment = .center
        nameLabel.numberOfLines = 0

        let detailsLabel = UILabel()
        detailsLabel.font = .systemFont(ofSize: 18)
        detailsLabel.numberOfLines = 0
        detailsLabel.text =
        """
        Paradigm: \(language.paradigm)
        Year: \(language.year)
        Designer: \(language.designer)
        Best for: \(language.bestFor)
        Difficulty: \(language.difficulty)
        """

        let stack = UIStackView(arrangedSubviews: [iconView, nameLabel, detailsLabel])
        stack.axis = .vertical
        stack.spacing = 16
        stack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stack)

        NSLayoutConstraint.activate([
            iconView.heightAnchor.constraint(equalToConstant: 90),

            stack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stack.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
}




