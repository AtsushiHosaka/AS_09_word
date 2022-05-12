//
//  ViewController.swift
//  AS_09_word
//
//  Created by 保坂篤志 on 2022/05/12.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func back(sender: UIStoryboardSegue) {
        
    }
    
    @IBAction func startButtonTapped(_ sender: Any) {
        
        let saveData = UserDefaults.standard
        if saveData.array(forKey: "WORD") != nil {
            if saveData.array(forKey: "WORD")!.count > 0 {
                performSegue(withIdentifier: "toQuestionView", sender: nil)
            }
        }else {
            let alert = UIAlertController(title: "単語", message: "まずは「単語一覧」をタップして単語登録してください", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    


}

