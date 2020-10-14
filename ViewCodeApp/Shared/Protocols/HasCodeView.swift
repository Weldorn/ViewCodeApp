//
//  HasCodeView.swift
//  ViewCodeApp
//
//  Created by Welton Dornelas on 13/10/20.
//

import UIKit

protocol HasCodeView {
    associatedtype CustomView: UIView
}

extension HasCodeView where Self: UIViewController {
    var customView: CustomView {
       return view as! CustomView
    }
}


