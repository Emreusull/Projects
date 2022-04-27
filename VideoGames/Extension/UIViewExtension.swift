//
//  UIViewExtension.swift
//  VideoGames
//
//  Created by emre usul on 12.03.2022.
//

import Foundation
import UIKit

extension UIView {
    
  @IBInspectable var cornerRadius: CGFloat {
        get { return cornerRadius}
        set { self.layer.cornerRadius = newValue }
    }
}
