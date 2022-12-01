//
//  SecondViewController.swift
//  picker view practice
//
//  Created by MD Faizan on 01/12/22.
//

import UIKit

class SecondViewController: UIViewController {
   
    
    @IBOutlet weak var phoneTextFeild: UITextField!
    
    let iphonePicker = UIPickerView()
    let toolbar = UIToolbar()
    
    var phoneList = ["iphone 4s" ,"iphone 5s" , "iphone 6s" , "iphone 7 plus" , "iphone 8" , "iphone XR" , "iphone 11" , "iphone 11 pro"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        iphonePicker.delegate = self
        iphonePicker.dataSource = self
        phoneTextFeild.inputView = iphonePicker
        toolbar.sizeToFit()
        let donebtn = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonPressed))
        
        toolbar.items = [donebtn]
        phoneTextFeild.inputAccessoryView = toolbar
    }
    @objc func doneButtonPressed() {
        
        let selectedPhone = phoneList[iphonePicker.selectedRow(inComponent: 0)]
        phoneTextFeild.text = selectedPhone
        self.view.endEditing(true)
    }
    
}



extension SecondViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
       return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        phoneList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return phoneList[row]
    }
    
}
