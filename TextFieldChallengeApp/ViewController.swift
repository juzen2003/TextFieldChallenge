//
//  ViewController.swift
//  TextFieldChallengeApp
//
//  Created by Yu-Jen Chang on 6/20/17.
//  Copyright © 2017 Yu-Jen Chang. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var zipCodeTextField: UITextField!
    @IBOutlet weak var cashTextField: UITextField!
    @IBOutlet weak var lockableTextField: UITextField!
    @IBOutlet weak var lockableSwitch: UISwitch!
    
    let zipCodeTextFieldDelegate = ZipCodeTextFieldDelegate()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.lockableSwitch.isOn = false
        self.zipCodeTextField.delegate = zipCodeTextFieldDelegate
        self.lockableTextField.delegate = self
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return self.lockableSwitch.isOn
    }


}

