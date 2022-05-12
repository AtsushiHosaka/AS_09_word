//
//  AddViewController.swift
//  AS_09_word
//
//  Created by 保坂篤志 on 2022/05/12.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var englishTextField: UITextField!
    @IBOutlet weak var japaneseTextField: UITextField!
    
    var wordArray: [Dictionary<String, String>] = []
    
    let saveData = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if saveData.array(forKey: "WORD") != nil {
            
            wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]
        }
    }
    
    @IBAction func saveWord(_ sender: Any) {
        
        if englishTextField.text == "" || japaneseTextField.text == "" {
            let emptyAlert = UIAlertController(title: "エラー", message: "すべての項目に入力してください", preferredStyle: .alert)
            emptyAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            present(emptyAlert, animated: true, completion: nil)
            
            return
        }
        
        let wordDictionary: Dictionary<String, String> = ["english": englishTextField.text!, "japanese": japaneseTextField.text!]
        
        wordArray.append(wordDictionary)
        saveData.set(wordArray, forKey: "WORD")
        
        let alert = UIAlertController(title: "保存完了", message: "単語の登録が完了しました", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
        
        englishTextField.text = ""
        japaneseTextField.text = ""
    }
    
}
