//
//  RateView.swift
//  Exchanger
//
//  Created by Rakan Alotaibi on 01/05/1445 AH.
//

import SwiftUI

struct RateView: View {
    let text: String
    var body: some View {
        HStack(spacing: 0) {
            Rectangle()
                .fill(Color.gray)
                .frame(height: 1)
            Text(text)
                .foregroundStyle(Color.gray)
                .padding()
                .layoutPriority(1)
                .background(
                    RoundedRectangle(cornerRadius: 8 * 3)
                        .stroke(Color.gray)
                        .frame(height: 8 * 5)
                )
            Rectangle()
                .fill(Color.gray)
                .frame(height: 1)
        }
    }
}

#Preview {
    RateView(text: "1 USD = 3.75 SAR")
}
