//
//  ViewController.swift
//  Project2
//
//  Created by Ali Syed on 2024-08-16.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    var countries = [String]()
    var correctAnswer = 0
    var score = 0
//    var numQuestionsAsked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        countries.append("nigeria")
        countries.append("poland")
        countries.append("russia")
        countries.append("spain")
        countries.append("uk")
        countries.append("us")
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestions()
    }
    
    func askQuestions(action: UIAlertAction! = nil) {
        countries.shuffle()
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        correctAnswer = Int.random(in: 0...2)
        
        title = countries[correctAnswer].uppercased() + " | " + "Score: " + String(score)
        
//        numQuestionsAsked += 1
//        if numQuestionsAsked == 10 {
//            let ac = UIAlertController(title: title,  message: "Your final score is \(score).", preferredStyle: .alert)
//            return
//        }
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong! That's the flag of \(countries[sender.tag].uppercased())"
            score -= 1
        }
        
        let ac = UIAlertController(title: title,  message: "Your score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestions))
        present(ac, animated: true)
    }
    
}

