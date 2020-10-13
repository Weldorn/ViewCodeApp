//
//  ViewController.swift
//  ViewCodeApp
//
//  Created by Welton Dornelas on 13/10/20.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - Properties
    
    
    // MARK: - Super Methods
    override func loadView() {
        view = WelcomeView(delegate: self)
    }
    
    // MARK: - Methods

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension WelcomeViewController: WelcomeViewDelegate {
    func loginButtonTapped(withPhone: String) {

    }
    
    func signUpButtonTapped() {
        
    }
    
    func facebookButtonTapped() {
        
    }
    
    func googleButtonTapped() {
        
    }
}

