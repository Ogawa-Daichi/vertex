//
//  ViewController.swift
//  quiz
//
//  Created by Ogawa Daichi on 2018/08/05.
//  Copyright © 2018年 Ogawa Daichi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    
    var currentQuestionNumber: Int = 0
    var correctAnswer: Int = 0
    
    let questions: [[String:Any]] = [
        [
            "q" : "日本で一番高い山は阿蘇山である。",
            "a" : false,
        ],
        
        [
            "q" : "日本で一番長い川は白川である。",
            "a" : false,
        ],
        
        [
            "q" : "世界一のカルデラを持つ山は阿蘇山である。",
            "a" : true,
        ]
    ]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()
    }


    @IBAction func tappedNoButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: false)
    }
    
    @IBAction func tappedYesButton(_ sender: UIButton) {
        checkAnswer(yourAnswer: true)
    }
    
    func showQuestion() {
        // 型宣言いらないの、型推論か、辞書型
        let question = questions[currentQuestionNumber]
        
        if let questionText = question["q"] as? String{
            questionLabel.text = questionText
        }
    }
    
    func checkAnswer(yourAnswer: Bool) {
        let question = questions[currentQuestionNumber]
        
        if let answer = question["a"] as? Bool {
            if yourAnswer == answer {
                // 正解
                correctAnswer += 1
                if currentQuestionNumber == questions.count - 1 {
                    showAlert(message: "あなたは\(correctAnswer)問正解!!!!!!!!")
                } else {
                    showAlert(message: "正解!!!!!!!!")
                }
            } else {
                // 不正解
                if currentQuestionNumber == questions.count - 1 {
                    showAlert(message: "あなた\(correctAnswer)問正解!!!!!!!!")
                } else {
                    showAlert(message: "違うわい")
                }
            }
            
            currentQuestionNumber += 1
            
            if currentQuestionNumber > questions.count - 1 {
                currentQuestionNumber = 0
            }
            
            showQuestion()
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let close = UIAlertAction(title: "閉じる", style: .default, handler: nil)
        alert.addAction(close)
        present(alert, animated: true, completion: nil)
    }
    
}

