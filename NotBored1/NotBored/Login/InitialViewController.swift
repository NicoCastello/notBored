//
//  InitialViewController.swift
//  NotBored
//
//  Created by Joaquin Diego Borsari Marchese on 3/11/21.
//

import UIKit

class InitialViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var startButtonOutlet: UIButton!
    @IBOutlet weak var participantsTextField: UITextField!
    
    weak var coordinator: MainAppCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        configDismissBoard()
        participantsTextField.delegate = self
        participantsTextField.text = "1"
    }
    
    func configDismissBoard(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        participantsTextField.keyboardType = .numberPad
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let inputText = participantsTextField.text ?? ""
        let participants: Int = Int(inputText) ?? 0
        enabledButton(participants: participants)
    }
  
    @IBAction func startButton(_ sender: UIButton) {
        if participantsTextField.hasText{
            //let prueba = participantsTextField.text
            let participantsCount: Int = Int(participantsTextField.text ?? "0") ?? 0
            if  participantsCount > 0{
                let vc = ActivityViewController(nibName: "ActivityViewController", bundle: nil)
                self.present(vc, animated: true)
            }
            else{
                print("La cantidad de participantes debe ser mayor a cero")
            }
        }
        else{
            print("Por favor ingrese cantidad de participantes")
        }
    }
  
  func enabledButton(participants: Int) {
        if participants <= 0 {
            startButtonOutlet.isEnabled = false
        } else {
            startButtonOutlet.isEnabled = true
    
    // MARK: - Actions
    @IBAction func startActionButton(_ sender: Any) {
        print(participantsTextField.text ?? "")
    }
    
    @IBAction func termsActionbutton(_ sender: Any) {
        self.coordinator?.pushToTermsAndConditions()
    }
    
    
}
