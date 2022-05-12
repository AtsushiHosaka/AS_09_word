//
//  QuestionViewController.swift
//  AS_09_word
//
//  Created by 保坂篤志 on 2022/05/12.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionlabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    var isAnswered: Bool = false
    var wordArray: [Dictionary<String, String>] = []
    var nowNumber: Int = 0
    let saveData = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        answerLabel.text = ""
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]
        wordArray.shuffle()
        questionlabel.text = wordArray[nowNumber]["english"]
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        
        if isAnswered {
            
            nowNumber += 1
            answerLabel.text = ""
            
            if nowNumber < wordArray.count {
                
                questionlabel.text = wordArray[nowNumber]["english"]
                isAnswered = false
                nextButton.setTitle("答えを表示", for: .normal)
            }else {
                
                nowNumber = 0
                performSegue(withIdentifier: "toFinishView", sender: nil)
            }
        }else {
            
            answerLabel.text = wordArray[nowNumber]["japanese"]
            isAnswered = true
            nextButton.setTitle("次へ", for: .normal)
        }
    }
    
}
