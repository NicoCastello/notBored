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
    @IBOutlet weak var toggleSwitch: UISwitch!
    @IBOutlet weak var acceptTermsLabel: UILabel!
    
    var participants: Int = 1
    var acceptTermsAndConditions: Bool?
    weak var coordinator: MainAppCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        participantsTextField.delegate = self
        participantsTextField.text = String(participants)
        configDismissBoard()
        setView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setView()
    }
    
    func configDismissBoard(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        participantsTextField.keyboardType = .numberPad
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func setView() {
        acceptTermsAndConditions = UserDefaults.standard.bool(forKey: "acceptTerms")
        if let accept = acceptTermsAndConditions {
            startButtonOutlet.isEnabled = accept
            if accept {
                toggleSwitch.isHidden = true
                acceptTermsLabel.isHidden = true
            } else {
                toggleSwitch.isOn = false
            }
        } else {
            toggleSwitch.isOn = false
        }
    }
    
    func setToggleSwitch(acceptTermsAndConditions: Bool) {
        let defaults = UserDefaults.standard
        defaults.set(acceptTermsAndConditions, forKey: "acceptTerms")
    }
    
    func enabledButton(participants: Int) {
        if participants <= 0 {
            startButtonOutlet.isEnabled = false
        } else {
            startButtonOutlet.isEnabled = true
        }
    }
    
    // MARK: - UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        let inputText = participantsTextField.text ?? ""
        participants = Int(inputText) ?? 0
        enabledButton(participants: participants)
    }
    
    // MARK: - Actions
    @IBAction func startActionButton(_ sender: Any) {
        coordinator?.pushToActivity(participants: participants)
    }
    
    @IBAction func termsActionbutton(_ sender: Any) {
        coordinator?.pushToTermsAndConditions()
    }
    
    @IBAction func toggleAction(_ sender: Any) {
        startButtonOutlet.isEnabled = toggleSwitch.isOn
        setToggleSwitch(acceptTermsAndConditions: toggleSwitch.isOn)
    }
    
}
