//
//  LoginViewController.swift
//  FinalProject_Friends_iOS
//
//  Created by Roch on 16/01/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var userNames = [User(fullName: "User", email: "test@email.com", phone: "1234456788", password: "1234", username: "user")]; // will be replaced by db later
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    @IBAction func login(_ sender: UIButton) {
        let name = username.text
        let pw = password.text
        
        // check if username and password is correct
        if (userNames.first(where: {$0.username == name && $0.password == pw} ) != nil) {
            
            // store username and password to check if user has logged in later
            let defaults = UserDefaults.standard
            defaults.set(name, forKey: "username")
            defaults.set(pw, forKey: "password")
            
            appDelegate.goToTaskListPage()
            
        } else {
            // show alert if username or password is incorrect
            let alertController = UIAlertController(title: "Unauthorized", message: "Username or password incorrect", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    
}
