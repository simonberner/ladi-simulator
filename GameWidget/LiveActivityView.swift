//
//  LiveActivityView.swift
//  GameWidgetExtension
//
//  Created by Simon Berner on 03.02.23.
//

import SwiftUI
import WidgetKit

struct LiveActivityView: View {
    var body: some View {
        ZStack {
            Image("activity-background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .overlay {
                    ContainerRelativeShape()
                        .fill(.black.opacity(0.4).gradient)
                }

            VStack(spacing: 16) {
                HStack {
                    Image("warriors")
                        .teamLogoModifier(frame: 60)
                    Text("90")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.white.opacity(0.8))
//                        .frame(width: 80, height: 80, alignment: .leading)

                    Spacer()

                    Text("123")
                        .font(.system(size: 40, weight: .bold))
                        .foregroundColor(.black.opacity(0.8))
//                        .frame(width: 80, height: 80, alignment: .trailing)
                    Image("bulls")
                        .teamLogoModifier(frame: 60)

                }

                HStack {
                    Image("warriors")
                        .teamLogoModifier(frame: 20)
                    Text("S. did it! bla bla")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundColor(.white.opacity(0.9))
                }
            }
            .padding()
        }
    }
}

struct LiveActivityview_Previews: PreviewProvider {
    static var previews: some View {
        LiveActivityView()
            .previewContext(WidgetPreviewContext(family: .systemMedium))
    }
}
