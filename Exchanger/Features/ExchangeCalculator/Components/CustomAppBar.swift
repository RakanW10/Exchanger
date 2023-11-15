//
//  CustomAppBar.swift
//  Exchanger
//
//  Created by Rakan Alotaibi on 01/05/1445 AH.
//

import SwiftUI

struct CustomAppBar: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("27 NOV")
                Text("22:19 UTC")
            }
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .foregroundStyle(.white)

            Capsule()
                .fill(.red)
                .frame(width: 8 * 7, height: 8 * 5)
                .overlay {
                    Image(systemName: "slider.horizontal.3")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.white)
                        .padding(8)
                }
                .shadow(color: .red, radius: 10)
        } // HStack
    }
}

#Preview {
    CustomAppBar()
}
