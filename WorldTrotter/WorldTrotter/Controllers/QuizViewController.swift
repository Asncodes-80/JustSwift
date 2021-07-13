//
//  ViewController.swift
//  Quiz
//
//  Created by Alireza Soltani Neshan on 4/19/1400 AP.
//

import UIKit

class QuizViewController: UIViewController {
    
    // Connecting Model to Controller
    private var quizBrain = QuizBrain()
    
    // Define UI constant
    let questionLabel = UILabel()
    let nextQuestion = UIButton()
    let answerLabel = UILabel()
    let showAnswer = UIButton()
    
    override func loadView() {
        let mainUIView = UIView()
        mainUIView.backgroundColor = .white
        view = mainUIView
        
        // Init
        questionLabel.text = "???"
        nextQuestion.setTitle("Next Question", for: .normal)
        nextQuestion.setTitleColor(.blue, for: .normal)
        
        answerLabel.text = "???"
        showAnswer.setTitle("Show Answer", for: .normal)
        showAnswer.setTitleColor(.blue, for: .normal)
        
        
        
        // Add UILabel and button to sublayer
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        nextQuestion.translatesAutoresizingMaskIntoConstraints = false
        nextQuestion.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        showAnswer.translatesAutoresizingMaskIntoConstraints = false
        showAnswer.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(questionLabel)
        view.addSubview(nextQuestion)
        view.addSubview(answerLabel)
        view.addSubview(showAnswer)
        
        questionLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        
        nextQuestion.topAnchor.constraint(equalTo: questionLabel.topAnchor, constant: 50).isActive = true

        answerLabel.topAnchor.constraint(equalTo: nextQuestion.topAnchor, constant: 50).isActive = true

        showAnswer.topAnchor.constraint(equalTo: answerLabel.topAnchor, constant: 50).isActive = true
        
        // Set margin for getting center in page
        let margin = view.layoutMarginsGuide
        
        questionLabel.centerXAnchor.constraint(equalTo: margin.centerXAnchor).isActive = true
        
        nextQuestion.centerXAnchor.constraint(equalTo: margin.centerXAnchor).isActive = true

        answerLabel.centerXAnchor.constraint(equalTo: margin.centerXAnchor).isActive = true
        
        showAnswer.centerXAnchor.constraint(equalTo: margin.centerXAnchor).isActive = true
        
        
        // Add Events
        nextQuestion.addTarget(self, action: #selector(nextQuestion(_:)), for: .touchUpInside)
        showAnswer.addTarget(self, action: #selector(showAnswer(_:)), for: .touchUpInside)
        
    }
    
    // Next Question
    @objc func nextQuestion(_ btn: UIButton) {
        quizBrain.currentQuestionIndex += 1
        
        if quizBrain.currentQuestionIndex == quizBrain.questions.count {
            quizBrain.currentQuestionIndex = 0
        }
        questionLabel.text = quizBrain.questions[quizBrain.currentQuestionIndex]
        answerLabel.text = "???"
    }
    
    @objc func showAnswer(_ btn: UIButton) {
        answerLabel.text = quizBrain.answers[quizBrain.currentQuestionIndex]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Loading frist question
        questionLabel.text = quizBrain.questions[quizBrain.currentQuestionIndex]
    }
}
