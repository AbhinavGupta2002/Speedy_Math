//
//  MultiplicationViewController.swift
//  Speedy Math
//
//  Created by Abhinav Gupta on 20/03/2021.
//

import UIKit

class MultiplicationViewController: UIViewController {
    
    @IBOutlet weak var check_button: UIButton!
    @IBOutlet weak var skip_button: UIButton!
    @IBOutlet weak var num_input: UITextField!
    @IBOutlet weak var next_button: UIButton!
    @IBOutlet weak var left_num: UILabel!
    @IBOutlet weak var right_num: UILabel!
    @IBOutlet weak var question_number: UILabel!
    @IBOutlet weak var mult_sign: UILabel!
    @IBOutlet weak var final_score: UILabel!
    @IBOutlet weak var correct_answer: UILabel!
    @IBOutlet weak var home: UIButton!
    
    var points:Int = 0
    var temp_prod:Int = 0
    var question_count:Int = 0
    var input:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        points = 0
        question_count = 0
        temp_prod = 0
        num_input.isHidden = false
        home.isHidden = true
        num_input.keyboardType = UIKeyboardType.numberPad
        num_input.addNumericAccessory(addMinus: true)
        printQuestion()
    }
    
    func printQuestion() {
        mult_sign.isHidden = false
        left_num.isHidden = false
        right_num.isHidden = false
        check_button.isHidden = false
        skip_button.isHidden = false
        next_button.isHidden = true
        final_score.isHidden = true
        correct_answer.isHidden = true
        question_count += 1
        num_input.text = ""
        
        if (question_count <= 10) {
            question_number.text = "Question \(question_count)"
            let temp1 = Int.random(in: -100...100)
            let temp2 = Int.random(in: -100...100)
            temp_prod = temp1 * temp2
            left_num.text = String(temp1)
            right_num.text = String(temp2)
        }
        
        if (question_count > 10) {
            MusicHelper.sharedHelper.playBackgroundMusic(song: "game_complete", type: "wav", loop: false)
            quizComplete()
        }
    }
    
    @IBAction func check(_ sender: Any) {
        MusicHelper.sharedHelper.playBackgroundMusic(song: "click", type: "wav", loop: false)
        input = Int(num_input.text!)
        check_button.isHidden = true
        skip_button.isHidden = true
        next_button.isHidden = false
        left_num.isHidden = true
        right_num.isHidden = true
        mult_sign.isHidden = true
        if (input == temp_prod) {
            points += 1
            correctAnswer()
        } else {
            wrongAnswer()
        }
    }
    
    @IBAction func skip(_ sender: Any) {
        MusicHelper.sharedHelper.playBackgroundMusic(song: "click", type: "wav", loop: false)
        check_button.isHidden = true
        skip_button.isHidden = true
        next_button.isHidden = false
        skippedAnswer()
    }
    
    @IBAction func next(_ sender: Any) {
        MusicHelper.sharedHelper.playBackgroundMusic(song: "click", type: "wav", loop: false)
        printQuestion()
    }
    
    @IBAction func home(_ sender: Any) {
        MusicHelper.sharedHelper.playBackgroundMusic(song: "click", type: "wav", loop: false)
    }
    
    func correctAnswer() {
        final_score.text = "CORRECT\nANSWER"
        final_score.isHidden = false
    }
    
    func wrongAnswer() {
        final_score.text = "WRONG\nANSWER"
        final_score.isHidden = false
        correct_answer.text = "ANSWER: \(temp_prod)"
        correct_answer.isHidden = false
    }
    
    func skippedAnswer() {
        correct_answer.text = "ANSWER: \(temp_prod)"
        correct_answer.isHidden = false
    }
    
    func quizComplete() {
        check_button.isHidden = true
        skip_button.isHidden = true
        next_button.isHidden = true
        question_number.isHidden = true
        num_input.isHidden = true
        mult_sign.isHidden = true
        left_num.isHidden = true
        right_num.isHidden = true
        final_score.text = "SCORE\n\(points)/10"
        final_score.isHidden = false
        left_num.text = String(points)
        home.isHidden = false
    }

}
