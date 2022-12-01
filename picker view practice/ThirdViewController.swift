//
//  ThirdViewController.swift
//  picker view practice
//
//  Created by MD Faizan on 01/12/22.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var countryTextFeild: UITextField!
    
    @IBOutlet weak var colourTextFeild: UITextField!
    
    @IBOutlet weak var sportTextFeild: UITextField!
    
    let countries = ["India", "Brazil","Albania", "Angola", "Antigua", "Austria", "Austria", "Bangladesh"]
    let colour = ["Red", "Blue", "Green"]
    let sports = ["soccer", "basketball", "tennis", "baseball", "golf", "running", "volleyball"]
    
    var countryPickerView = UIPickerView()
    var colourPickerView = UIPickerView()
    var sportPickerView = UIPickerView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryTextFeild.inputView = countryPickerView
        colourTextFeild.inputView = colourPickerView
        sportTextFeild.inputView = sportPickerView
        
        countryTextFeild.placeholder = "select country"
        colourTextFeild.placeholder = "select colour"
        sportTextFeild.placeholder = "select sport"
        
        countryTextFeild.textAlignment = .center
        colourTextFeild.textAlignment = .center
        sportTextFeild.textAlignment = .center

        countryPickerView.delegate = self
        countryPickerView.dataSource = self
        
        colourPickerView.delegate = self
        colourPickerView.dataSource = self
        
        sportPickerView.delegate = self
        sportPickerView.dataSource = self
        
        countryPickerView.tag = 1
        colourPickerView.tag = 2
        sportPickerView.tag = 3
        
        
        

    }
    

    
}

extension ThirdViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return countries.count
            
        case 2:
            return colour.count
            
        case 3:
            return sports.count
            
        default:
            return 1
            
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
           return countries[row]
        case 2:
            return colour[row]
        case 3:
            return sports[row]
        default:
            return "data not found."
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            countryTextFeild.text = countries[row]
            countryTextFeild.resignFirstResponder()
        case 2:
            colourTextFeild.text = colour[row]
            colourTextFeild.resignFirstResponder()
        case 3:
            sportTextFeild.text = sports[row]
            sportTextFeild.resignFirstResponder()
        default :
            return 
        }
    }
    
    
}
