//
//  UIViewExtension.swift
//  BusTicketApp
//
//  Created by emre usul on 6.02.2022.
//

import Foundation
import UIKit

extension UIView {
    
  @IBInspectable var cornerRadius: CGFloat {
        get { return cornerRadius}
        set { self.layer.cornerRadius = newValue }
    }
}
