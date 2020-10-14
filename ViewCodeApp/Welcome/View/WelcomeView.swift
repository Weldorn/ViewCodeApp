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

//PropertyWrapper

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
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    let mainImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = #imageLiteral(resourceName: "home")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = Localization.welcome
        label.textAlignment = .center
        label.font = .title
        label.textColor = .title
        label.accessibilityIdentifier = "welcome-title-label"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let bodyLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = Localization.main
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .body
        label.textColor = .body
        label.accessibilityIdentifier = "welcome-title-label"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let phoneTextField: UITextField = {
        let textField = UITextField(frame: .zero)
        textField.placeholder = Localization.phone
        textField.borderStyle = .roundedRect
        textField.keyboardType = .phonePad
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let buttonStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        stackView.spacing = Margin.horizontalSmall
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let loginButton = WelcomeButton(style: .main, title: Localization.loginButton)
    let signUpButton = WelcomeButton(style: .secondary, title: Localization.signupButton)
    
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
    
    @objc
    private func buttonTapped(sender: UIButton) {
        switch sender {
        case loginButton:
            delegate?.loginButtonTapped(withPhone: phoneTextField.text!)
        case signUpButton:
            delegate?.signUpButtonTapped()
        default:
            break
        }
    }
    
    func setupComponents() {
        addSubview(scrollView)
        contentView.addSubview(phoneTextField)
        contentView.addSubview(mainImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(bodyLabel)
        scrollView.addSubview(contentView)
        contentView.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(loginButton)
        buttonStackView.addArrangedSubview(signUpButton)
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
        
        //MainImage
        mainImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Margin.verticalVeryLarge).isActive = true
        mainImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Margin.horizontal).isActive = true
        mainImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -Margin.horizontal).isActive = true
        mainImage.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3).isActive = true
        
        //TitleLabel
        titleLabel.topAnchor.constraint(equalTo: mainImage.bottomAnchor, constant: Margin.verticalVeryLarge).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: mainImage.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: mainImage.trailingAnchor).isActive = true
        
        //BodyLabel
        bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Margin.verticalSmall).isActive = true
        bodyLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor).isActive = true
        bodyLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor).isActive = true
        
        //PhoneTextField
        phoneTextField.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: Margin.verticalLarge).isActive = true
        phoneTextField.leadingAnchor.constraint(equalTo: bodyLabel.leadingAnchor).isActive = true
        phoneTextField.trailingAnchor.constraint(equalTo: bodyLabel.trailingAnchor).isActive = true
        
        //ButtonStackView
        buttonStackView.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: Margin.verticalNormal).isActive = true
        buttonStackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        
        //Login/SignUp Buttons
        loginButton.widthAnchor.constraint(equalToConstant: 120).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        signUpButton.heightAnchor.constraint(equalTo: loginButton.heightAnchor).isActive = true
    }
    
    func setupExtraConfigurations() {
        backgroundColor = .view
        loginButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
}
