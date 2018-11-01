//
//  AddServiceDetailsViewController.swift
//  SideNavigation_Example
//
//  Created by apple on 10/30/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class AddServiceDetailsViewController: UIViewController {

    @IBOutlet weak var serviceName: FloatLabelTextField!
    @IBOutlet weak var serviceCategory: FloatLabelTextField!
    
    @IBOutlet weak var serviceDescription: FloatLabelTextField!
    
    @IBOutlet weak var addPromotion: UISwitch!
    @IBOutlet weak var makeFeatured: UISwitch!
    
    @IBOutlet weak var servicePrice: FloatLabelTextField!
    
    let activityView = UIActivityIndicatorView(activityIndicatorStyle: .whiteLarge)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityView.center = self.view.center
        activityView.color = UIColor.black
        self.view.addSubview(activityView)
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func back() {
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func submit() {
        activityView.startAnimating()
        
        
        let session = URLSession(configuration: .default)
        var request = URLRequest(url: URL(string:  AppDelegate.baseURL + "add_services.php")!)
        
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        
        let dictPost: [String: String? ] = [
            "addservice": "1",
            "name": serviceName.text,
            "description": serviceDescription.text,
            "price": servicePrice.text,
            "category": serviceCategory.text,
            "feature": makeFeatured.isOn ? Optional("yes") : Optional("no"),
            "promotion_desc": "", //
            "sp_id": (AppDelegate.user!["id"] as! String),
            "pprice": "0"
            ]
        
        let body = AppDelegate.toQueryParmas(dictPost)
        
        request.httpBody = body.data(using: .utf8)
        print(body)
        let task = session.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async(execute: { () -> Void in
                self.activityView.stopAnimating()
            })
            guard error == nil else {
                print("Error \(error!)")
                let message = "Can not create account, try again."
                let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
                self.present(alert, animated: true)
                // duration in seconds
                let duration: Double = 3
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + duration) {
                    alert.dismiss(animated: true)
                }
                return
            }
            
            guard let content = data else {
                print("Empty Data \(data!)")
                AppDelegate.showToast(message: "Can not create account", duration: 4, controller: self)
                return
            }
            
            // serialise the data / NSData object into Dictionary [String : Any]
            guard let json = (try? JSONSerialization.jsonObject(with: content, options: JSONSerialization.ReadingOptions.mutableContainers)) as? [String: Any] else {
                print("Malformed json")
                print(content)
                
                AppDelegate.showToast(message: "Can not create account", duration: 4, controller: self)
                return
            }
            if (json["status"] as! String == "400") {
                
                let message = json["error"] as! String
                AppDelegate.showToast(message: message, duration: 4, controller: self)
            } else {
                self.dismiss(animated: true, completion: nil)
                AppDelegate.showToast(message: "Account created, please login with your new account credentails.", duration: 3, controller: self)
                //            print(json)

            }
            
        }
        task.resume()
        
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
