//
//  CommonListingAndSearchingViewController.swift
//  SideNavigation_Example
//
//  Created by apple on 10/30/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class ServicesListingViewController: UIViewController {
    var items: [String] = []
    
    var filterA: [String] = ["NearBy Location", "Rating"]
    var filterB: [String] = ["Car Wash", "Car Detailing", "Mechanic", "Tire Shop", "Tow Truck", "Gas Station", "Oil Change"]
    var filterASelected: String = ""
    var filterBSelected: String = ""
    var selectedItem: String = ""
    
    @IBOutlet weak var filterATxtField: DesignableUITextField!
    @IBOutlet weak var filterBTxtField: DesignableUITextField!
    var viewId: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        viewLbl.text = viewId
        filterATxtField.delegate = self as! UITextFieldDelegate
        filterBTxtField.delegate = self as! UITextFieldDelegate
        
        self.title = viewId
        self.title = "Service"
        
        
        createPicker()
        createToolbar()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back() {
        dismiss(animated: true, completion: nil)
    }
    func createToolbar() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneBtn = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(ServicesListingViewController.dismissKeyboard))
        
        toolbar.setItems([doneBtn], animated: false)
        toolbar.isUserInteractionEnabled = true
        filterATxtField.inputAccessoryView = toolbar
        filterBTxtField.inputAccessoryView = toolbar
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
        
    }
    func createPicker() {
        let picker = UIPickerView()
        picker.delegate = (self as! UIPickerViewDelegate)
        filterATxtField.inputView = picker
        filterBTxtField.inputView = picker
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
//}

extension ServicesListingViewController: UIPickerViewDelegate, UIPickerViewDataSource {


    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return items.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return items[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        selectedItem = items[row]
    }
}

extension ServicesListingViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // this will hide the keyboard
        textField.resignFirstResponder()
        
        print("Send remote Request now")
        return true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if(textField.restorationIdentifier == "FilterA") {
                items = self.filterA
        } else if textField.restorationIdentifier == "FilterB" {
            self.items = self.filterB
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if(textField.restorationIdentifier == "FilterA") {
            filterASelected = selectedItem
            filterATxtField.text = filterASelected
        } else if textField.restorationIdentifier == "FilterB" {
            filterBSelected = selectedItem
            filterBTxtField.text = filterBSelected
        }
    }
}
