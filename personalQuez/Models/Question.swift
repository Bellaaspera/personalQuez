//
//  Question.swift
//  personalQuez
//
//  Created by Светлана Сенаторова on 05.07.2022.
//

import Foundation

struct Question {
    let title: String
    let responseType: ResponceType
    let answers: [Answer]
    
    static func getQuestions() -> [Question] {
        [
        Question(
            title: "Какую пищу вы предпочитаете?",
            responseType: .single,
            answers: [
                Answer(title: "Стейк", animal: .dog),
                Answer(title: "Рыба", animal: .fox),
                Answer(title: "Морковь", animal: .rabbit),
                Answer(title: "Кукуруза", animal: .turtle)
            ]
        ),
        Question(
            title: "Что вам нравится больше?",
            responseType: .multiple,
            answers: [
                Answer(title: "Плавать", animal: .dog),
                Answer(title: "Спать", animal: .fox),
                Answer(title: "Обниматься", animal: .rabbit),
                Answer(title: "Есть", animal: .turtle)
            ]
        ),
        Question(
            title: "Любите ли вы поездки на машине?",
            responseType: .ranged,
            answers: [
                Answer(title: "Ненавижу", animal: .fox),
                Answer(title: "Нервничаю", animal: .rabbit),
                Answer(title: "Не замечаю", animal: .turtle),
                Answer(title: "Обожаю", animal: .dog)
            ]
        ),
        ]
    }
}

enum ResponceType {
    case single
    case multiple
    case ranged
}

struct Answer {
    let title: String
    let animal: Animal
}

enum Animal: Character {
    case dog = "🐶"
    case fox = "🦊"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "Вам нравится быть с друзьями. \nВы окружаете себя людьми, которые \nвам нравятся и всегда готовы помочь."
        case .fox:
            return "Вы себе на уме. \nЛюбите гулять сами по себе. \nВы цените одиночество."
        case .rabbit:
            return "Вам нравится все мягкое. \nВы здоровы и полны энергии."
        case .turtle:
            return "Ваша сила - в мудрости. \nМедленный и вдумчивый выигрывает \nна больших дистанциях."
        }
    }
}
