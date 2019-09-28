//
//  ViewController.swift
//  Work Agency
//
//  Created by Ivan Ermak on 9/24/19.
//  Copyright © 2019 Ivan Ermak. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    var network: Network!
    var profileData: Student?
    let defaults = UserDefaults()
    override func viewDidLoad() {
        super.viewDidLoad()
        network = Network()
        // Do any additional setup after loading the view. 
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    @IBAction func signIn(_ sender: Any?) {
        let user = User(email: emailTextField.text, password: passwordTextField.text)
        network.createPostRequest(Links.login.rawValue, httpBody: user, completion: { data in
            guard let responseData = data else {return}
            if let token = responseData.value(forKey: "token") as? String {
                self.defaults.set(token, forKey: "token")
                self.network.createGetRequestWithHeader(Links.profile.rawValue, token, completion: { data in
                    self.performSegue(withIdentifier: "signInSegue", sender: nil)
                    print(data)
                })
            }
        })
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        <#code#>
    }
}

