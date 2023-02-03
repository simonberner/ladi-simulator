//
//  GameWidgetBundle.swift
//  GameWidget
//
//  Created by Simon Berner on 02.02.23.
//

import WidgetKit
import SwiftUI

@main
struct GameWidgetBundle: WidgetBundle {
    var body: some Widget {
        GameWidget()
        // Live activities are only available on iOS 16.1+
        if #available(iOS 16.1, *) {
            GameLiveActivity()
        }
    }
}
