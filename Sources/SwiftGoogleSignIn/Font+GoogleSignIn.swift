//
//  Font+GoogleSignIn.swift
//  SwiftGoogleSignIn
//
//  Created by Ken Pham on 11/27/20.
//

import SwiftUI

@available(iOS 13, macOS 10.11, tvOS 13, watchOS 6, *)
public extension Font {
    static func robotoBold (size fontSize: CGFloat) -> Font {
        .custom("Roboto-Bold", size: fontSize)
    }
}

public extension UIFont {
    static func robotoBold (size fontSize: CGFloat) -> UIFont? {
        UIFont(name: "Roboto-Bold", size: fontSize)
    }
}
