//
//  ViewController.swift
//  ProgrammingLanguageGuide
//
//  Created by Sophia Thi on 2/16/26.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private let languages: [Language] = [

        Language(
            name: "Assembly",
            paradigm: "Low-level",
            year: 1949,
            designer: "Various",
            bestFor: "Hardware & Systems",
            difficulty: "Advanced",
            symbolName: "cpu"
        ),

        Language(
            name: "C#",
            paradigm: "Object-Oriented",
            year: 2000,
            designer: "Microsoft",
            bestFor: "Enterprise & Games",
            difficulty: "Intermediate",
            symbolName: "number"
        ),

        Language(
            name: "C++",
            paradigm: "Object-Oriented",
            year: 1985,
            designer: "Bjarne Stroustrup",
            bestFor: "Systems Programming",
            difficulty: "Advanced",
            symbolName: "cpu"
        ),

        Language(
            name: "Go",
            paradigm: "Procedural",
            year: 2009,
            designer: "Google",
            bestFor: "Cloud Services",
            difficulty: "Intermediate",
            symbolName: "cloud"
        ),

        Language(
            name: "Haskell",
            paradigm: "Functional",
            year: 1990,
            designer: "Simon Peyton Jones",
            bestFor: "Academic & Functional Programming",
            difficulty: "Advanced",
            symbolName: "function"
        ),

        Language(
            name: "Java",
            paradigm: "Object-Oriented",
            year: 1995,
            designer: "James Gosling",
            bestFor: "Enterprise & Android",
            difficulty: "Intermediate",
            symbolName: "cup.and.saucer"
        ),

        Language(
            name: "JavaScript",
            paradigm: "Multi-paradigm",
            year: 1995,
            designer: "Brendan Eich",
            bestFor: "Web Development",
            difficulty: "Beginner",
            symbolName: "globe"
        ),

        Language(
            name: "Kotlin",
            paradigm: "Object-Oriented",
            year: 2011,
            designer: "JetBrains",
            bestFor: "Android Apps",
            difficulty: "Intermediate",
            symbolName: "iphone"
        ),

        Language(
            name: "PHP",
            paradigm: "Scripting",
            year: 1995,
            designer: "Rasmus Lerdorf",
            bestFor: "Web Backends",
            difficulty: "Beginner",
            symbolName: "chevron.left.slash.chevron.right"
        ),

        Language(
            name: "Python",
            paradigm: "Multi-paradigm",
            year: 1991,
            designer: "Guido van Rossum",
            bestFor: "Data Science",
            difficulty: "Beginner",
            symbolName: "terminal"
        ),

        Language(
            name: "Ruby",
            paradigm: "Object-Oriented",
            year: 1995,
            designer: "Yukihiro Matsumoto",
            bestFor: "Web Apps",
            difficulty: "Beginner",
            symbolName: "diamond"
        ),

        Language(
            name: "Rust",
            paradigm: "Systems",
            year: 2010,
            designer: "Graydon Hoare",
            bestFor: "Memory Safety",
            difficulty: "Advanced",
            symbolName: "gearshape"
        ),

        Language(
            name: "Scala",
            paradigm: "Functional / OOP",
            year: 2004,
            designer: "Martin Odersky",
            bestFor: "Big Data",
            difficulty: "Advanced",
            symbolName: "function"
        ),

        Language(
            name: "SQL",
            paradigm: "Declarative",
            year: 1974,
            designer: "IBM",
            bestFor: "Databases",
            difficulty: "Beginner",
            symbolName: "tablecells"
        ),

        Language(
            name: "Swift",
            paradigm: "Multi-paradigm",
            year: 2014,
            designer: "Apple",
            bestFor: "iOS Apps",
            difficulty: "Intermediate",
            symbolName: "swift"
        ),

        Language(
            name: "TypeScript",
            paradigm: "Multi-paradigm",
            year: 2012,
            designer: "Microsoft",
            bestFor: "Large Web Apps",
            difficulty: "Intermediate",
            symbolName: "curlybraces"
        )
    ]
    
    private func difficultyColor(_ difficulty: String) -> UIColor {
        switch difficulty.lowercased() {
        case "beginner":
            return .systemGreen
        case "intermediate":
            return .systemOrange
        case "advanced":
            return .systemRed
        default:
            return .systemGray
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Language Guide"

        tableView.dataSource = self
        tableView.delegate = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "showLanguage",
              let detailVC = segue.destination as? SecondViewController,
              let cell = sender as? UITableViewCell,
              let indexPath = tableView.indexPath(for: cell) else {
            return
        }

        detailVC.language = languages[indexPath.row]
    }
}

extension ViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        languages.count
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "LanguageCell", for: indexPath)
        let language = languages[indexPath.row]

        var content = cell.defaultContentConfiguration()
        content.text = language.name
        content.secondaryText = "\(language.paradigm) • \(language.difficulty)"
        content.image = UIImage(systemName: language.symbolName)
        content.imageProperties.maximumSize = CGSize(width: 28, height: 28)

        // Lightly tint the subtitle to match difficulty?
        // Does this look okay?
        // I'm so depressed. Does anybody even read the comments?
        content.secondaryTextProperties.color = difficultyColor(language.difficulty)

        cell.contentConfiguration = content

        // Colored dot on the right (difficulty indicator)?
        // Does this look better or worse?
        let dot = UIView(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
        dot.backgroundColor = difficultyColor(language.difficulty)
        dot.layer.cornerRadius = 6
        dot.layer.masksToBounds = true

        // Put the dot in a container so it centers nicely
        // Since I can't seem to align things right
        let container = UIView(frame: CGRect(x: 0, y: 0, width: 24, height: 24))
        dot.center = CGPoint(x: container.bounds.midX, y: container.bounds.midY)
        container.addSubview(dot)

        cell.accessoryView = container

        cell.accessoryType = .none

        return cell
    }

}

extension ViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}




