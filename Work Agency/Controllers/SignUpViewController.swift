//
//  SignUpViewController.swift
//  Work Agency
//
//  Created by Ivan Ermak on 9/28/19.
//  Copyright © 2019 Ivan Ermak. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var passwordConfirmation: UITextField!
    var network: Network!
    override func viewDidLoad() {
        super.viewDidLoad()
        network = Network()
        self.navigationItem.backBarButtonItem?.title = "To sign in"
        // Do any additional setup after loading the view.
    }
    @IBAction func signUpForStudent(_ sender: Any?) {
        createUser(roleId: 1)
    }
    @IBAction func signUpForCompany(_ sender: Any?) {
        createUser(roleId: 2)
    }
    func createUser(roleId: Int) {
        if (password.text == passwordConfirmation.text) {
            let user = User(email: emailTextField.text, password: password.text, roleId: roleId)
                   network.createPostRequest(Links.login.rawValue, httpBody: user, completion: { data in
                           guard let responseData = data else {return}
                           if let token = responseData.value(forKey: "token") as? String {
                               self.network.createGetRequestWithHeader(Links.profile.rawValue, token, completion: { data in
                               })
                           }
                   })
               }
               else {
                   let alert = UIAlertController(title: "Input Error", message: "Your passwords doesn't match", preferredStyle: .alert)
                   self.present(alert, animated: true, completion: nil)
               }
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
