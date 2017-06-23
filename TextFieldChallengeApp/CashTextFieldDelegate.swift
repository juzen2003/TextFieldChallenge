//
//  CashTextFieldDelegate.swift
//  TextFieldChallengeApp
//
//  Created by Yu-Jen Chang on 6/23/17.
//  Copyright © 2017 Yu-Jen Chang. All rights reserved.
//

import Foundation
import UIKit

class CashTextFieldDelegate: NSObject, UITextFieldDelegate {

    func convertCashFromInt(_ numOfPennies: Int) -> String {
        let dollarInt = numOfPennies/100
        let dollarString: String = "$" + "\(dollarInt)" + "."
        var centsString: String = ""
        
        if numOfPennies >= 10 {
            centsString = String(numOfPennies % 100)
        } else {
            centsString = "0" + String(numOfPennies % 100)
        }
        
        let finalString = dollarString + centsString
        return finalString
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var newText = textField.text! as NSString
        newText = newText.replacingCharacters(in: range, with: string) as NSString
        var newTextString = String(newText)
        
        let digits = CharacterSet.decimalDigits
        var digitsInText: String = ""
        
        // check if the char is a number (0~9) and append it to a new array with number string only
        for char in newTextString.unicodeScalars {
            if digits.contains(UnicodeScalar(char.value)!) {
                digitsInText.append("\(char)")
            }
        }
        
        if let numOfPennies = Int(digitsInText) {
            newText = convertCashFromInt(numOfPennies) as NSString
        } else {
            newText = "$0.00"
        }
        
        textField.text = newText as String
        
        return false
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.keyboardType = UIKeyboardType.numberPad
        if textField.text!.isEmpty {
            textField.text = "$0.00"
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
