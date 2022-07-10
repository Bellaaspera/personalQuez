//
//  ResultViewController.swift
//  personalQuez
//
//  Created by Светлана Сенаторова on 08.07.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var resultOfQuez: Animal!
    var answers: [Answer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        resultOfQuez = getResult()
        resultLabel.text = "Вы - \(resultOfQuez.rawValue)"
        descriptionLabel.text = resultOfQuez.definition

    }
    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
//        view.window?.rootViewController?.dismiss(animated: true)
        navigationController?.dismiss(animated: true)
    }
    
    private func getResult() -> Animal {
        var quantityOfCurrentAnimalAnswers = [
            Animal.dog : 0,
            Animal.fox : 0,
            Animal.rabbit : 0,
            Animal.turtle : 0
        ]
            
        for (_, value) in quantityOfCurrentAnimalAnswers {
            for answer in answers {
                switch answer.animal {
                case .dog:
                    quantityOfCurrentAnimalAnswers.updateValue(value + 1, forKey: Animal.dog)
                case .fox:
                    quantityOfCurrentAnimalAnswers.updateValue(value + 1, forKey: Animal.fox)
                case .rabbit:
                    quantityOfCurrentAnimalAnswers.updateValue(value + 1, forKey: Animal.rabbit)
                case .turtle:
                    quantityOfCurrentAnimalAnswers.updateValue(value + 1, forKey: Animal.turtle)
                }
            }
        }
        //                let results: [Int] = quantityOfCurrentAnimalAnswers.values.sorted(by: >)
        let result = quantityOfCurrentAnimalAnswers.sorted { $0.value > $1.value }
        resultOfQuez = result.first?.key
        return resultOfQuez
    }
}
