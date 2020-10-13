//
//  WelcomeView.swift
//  ViewCodeApp
//
//  Created by Welton Dornelas on 13/10/20.
//

import UIKit

protocol WelcomeViewDelegate: AnyObject {
    func loginButtonTapped(withPhone: String)
    func signUpButtonTapped()
    func facebookButtonTapped()
    func googleButtonTapped()
}

class WelcomeView: UIView, CodeView {
    
    // MARK: - Properties
    weak var delegate: WelcomeViewDelegate?
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.keyboardDismissMode = .interactive
        return scrollView
    }()
    
    let contentView: UIView = {
        let contentView = UIView(frame: .zero)
        contentView.backgroundColor = .red
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    // MARK: - Super Methods
    init(delegate: WelcomeViewDelegate) {
        super.init(frame: .zero)
        self.delegate = delegate
        setup()
    }
    
    // MARK: - Methods
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupComponents() {
        scrollView.addSubview(contentView)
        addSubview(scrollView)
    }
    
    func setupConstraints() {
        //NSLayoutContraints
        
        //VFL (Visual Format Language)
        
        //LayoutAnchors
        
        //ScrollView
        scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        scrollView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        //ContentView
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        let contentViewHeightConstraint = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        contentViewHeightConstraint.priority = .defaultLow
        contentViewHeightConstraint.isActive = true
    }
    
    func setupExtraConfigurations() {
        backgroundColor = .white
    }
}
