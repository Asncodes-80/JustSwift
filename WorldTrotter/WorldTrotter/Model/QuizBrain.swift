//
//  QuizBrain.swift
//  Quiz
//
//  Created by Alireza Soltani Neshan on 4/19/1400 AP.
//

import Foundation


struct QuizBrain {
    public var currentQuestionIndex: Int = 0

    let questions: [String] = [
        "What is 7+7?",
        "What is the capital of Vermont?",
        "What is cognac made from?"
    ]
    
    let answers: [String] = [
        "14",
        "Montpelier",
        "Grapes"
    ]
}
