//
//  Image+Ext.swift
//  LADISimulator
//
//  Created by Simon Berner on 30.01.23.
//

import SwiftUI

extension Image {

    func teamLogoModifier(frame: CGFloat? = nil) -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: frame, height: frame)
    }
}
