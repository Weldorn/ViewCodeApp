//
//  CodeView.swift
//  ViewCodeApp
//
//  Created by Welton Dornelas on 13/10/20.
//

import Foundation

protocol CodeView {
    func setup()
    func setupComponents()
    func setupConstraints()
    func setupExtraConfigurations()
}

extension CodeView {
    func setup() {
        setupComponents()
        setupConstraints()
        setupExtraConfigurations()
    }
}
