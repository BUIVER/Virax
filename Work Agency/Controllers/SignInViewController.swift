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
    }
    @IBAction func signIn(_ sender: Any?) {
        let user = User(email: emailTextField.text, password: passwordTextField.text)
        network.createPostRequest(Links.login.rawValue, httpBody: user, completion: { data in
            guard let responseData = data else {return}
            if let token = responseData.value(forKey: "token") as? String {
                self.defaults.set(token, forKey: "token")
                self.network.createGetRequestWithHeader(Links.profile.rawValue, token, completion: { data in
                    
                    guard let firstName = data?.value(forKey: "firstName") as? String else {return}
                    guard let lastName = data?.value(forKey: "lastName") as? String else {return}
                    guard let birthday = data?.value(forKey: "birthday") as? String else {return}
                    guard let isPrivate = data?.value(forKey: "private") as? Bool else {return}
                    guard let livingInfo = data?.value(forKey: "livingInfo") as? String else {return}
                    guard let photoURL = data?.value(forKey: "photoPath") as? String else {return}
                    guard let skills = data?.value(forKey: "skills") as? [NSDictionary] else {return}
                    guard let personalDetails = data?.value(forKey: "personalDetails") as? String else {return}
                    guard let rating = data?.value(forKey: "rating") as? Int else {return}
                    self.profileData = Student(firstName: firstName, lastName: lastName, birthday: birthday, isPrivate: isPrivate, livingInfo: livingInfo, photoURL: photoURL, skills: skills, personalDetails: personalDetails, rating: rating)
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "signInSegue", sender: nil)
                    }
                    print(data)
                })
            }
        })
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? UITabBarController {
            guard let vc = destination.viewControllers?[0] as? ProfileViewController else {return}
            vc.studentUser = profileData
        } else {
            self.navigationController?.setNavigationBarHidden(false, animated: true)
        }
    }
}

