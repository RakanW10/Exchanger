//
//  MainBackground.swift
//  Exchanger
//
//  Created by Rakan Alotaibi on 30/04/1445 AH.
//

import SwiftUI

struct MainBackground<Content>: View where Content: View {
    let childView: () -> Content
    var body: some View {
        ZStack {
            Color(.backgroundPrimary)
                .ignoresSafeArea()
            GeometryReader { geometry in

                Circle()
                    .fill(Color(.backgroundSecondary))
                    .frame(width: geometry.size.width * 0.75)
                    .shadow(color: .backgroundSecondary, radius: 100)
                    .blur(radius: 8 * 10)
                    .offset(x: geometry.size.width * 0.13, y: -geometry.size.height * 0.3)

                Circle()
                    .fill(Color(.backgroundSecondary))
                    .frame(width: geometry.size.width * 0.75)
                    .shadow(color: .backgroundSecondary, radius: 100)
                    .blur(radius: 8 * 20)
                    .offset(x: geometry.size.width * 0.55, y: geometry.size.height * 0.75)
            }
            childView()
        }
    }
}

#Preview {
    MainBackground {
        Text("Text")
            .foregroundStyle(.white)
    }
}
