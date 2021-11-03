//
//  InitialViewController.swift
//  NotBored
//
//  Created by Joaquin Diego Borsari Marchese on 3/11/21.
//

import UIKit

class InitialViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var participantsTextField: UITextField!
    
    func configDismissBoard(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        participantsTextField.keyboardType = .numberPad
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configDismissBoard()
        participantsTextField.delegate = self
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
