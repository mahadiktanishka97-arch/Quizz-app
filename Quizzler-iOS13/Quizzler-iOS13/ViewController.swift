//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    let quiz = [
        Question(text: "The Human body has 206 Bones.", answer: "True"),
        Question(text: "The Taj Mahal was built in the 18th century.", answer: "False"),
        Question(text: "Sodium = H2O, is it correct ?", answer: "False"),
        Question(text: "India Has largest democracy in the world.", answer: "True"),
        Question(text: "The largest planet in our solar system is mercury.", answer: "False"),
        Question(text: "Butterflies taste with their feet.", answer: "True"),
        Question(text: "Bluetooth uses Infrared waves for the connectivity.", answer: "False"),
        Question(text: "A firewall can completely stop all cyber attacks.", answer: "False"),
        Question(text: "Phishing attacks rely more on human psychology than technical flaws.", answer: "True"),
        Question(text: "RAM is a type of permanent memory.", answer: "False"),
        Question(text: "A slug's blood is blue.", answer: "True"),
        Question(text: "It is illegal to pee in the Ocean in Portugal.", answer: "True")
        // ["Bluetooth uses Infrared waves for the connectivity.", "False"],
        // ["Phishing attacks rely more on human psychology than technical flaws.", "True"],
        // ["A firewall can completely stop all cyber attacks.", "False"],
        // ["RAM is a type of permanent memory.", "False"]
    ]
    
    var questionNumber = 0
    
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        trueButton.isUserInteractionEnabled = false
        falseButton.isUserInteractionEnabled = false
        let userAnswer = sender.currentTitle // ture or false
        let actualAnswer = quiz[questionNumber].answer
        
        if userAnswer == actualAnswer {
            sender.backgroundColor = UIColor.green
            score += 1
        }
        else {
            sender.tintColor = UIColor.red
        }
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
            
            Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        } else {
            showFinalScore()
        }
        
    }
    
    @objc func updateUI(){
        trueButton.isUserInteractionEnabled = true
        falseButton.isUserInteractionEnabled = true
        questionLabel.text = quiz[questionNumber].text
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = Float(questionNumber) / Float(quiz.count)
        countLabel.text = "Question \(questionNumber + 1) / \(quiz.count)"
    }
    
    func showFinalScore() {
        questionLabel.text = "🎉 Congrats!\nYour Score is  \(score) / \(quiz.count) "
        progressBar.progress = 1.0
        trueButton.isHidden = true
        falseButton.isHidden = true
        progressBar.isHidden = true
        countLabel.isHidden = true
    }
}

