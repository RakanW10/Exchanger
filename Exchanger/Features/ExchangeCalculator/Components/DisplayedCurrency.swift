//
//  DisplayedCurrency.swift
//  Exchanger
//
//  Created by Rakan Alotaibi on 01/05/1445 AH.
//

import SwiftUI

struct DisplayedCurrency: View {
    let number: Double
    let currencyCode: String
    var body: some View {
        GeometryReader { geometry in
            HStack(alignment: .lastTextBaseline, spacing: 0) {
                Text(String(format: "%.2f", number))
                    .multilineTextAlignment(.center)
                    .font(.system(size: 42, weight: Font.Weight.heavy))
                    .foregroundStyle(.white)
                    .frame(width: geometry.size.width * 0.7, alignment: .trailing)
                Text(currencyCode)
                    .frame(alignment: .leading)
                    .font(.title2)
                    .foregroundStyle(.white)
                    .padding(.leading, 24)
                    .frame(width: geometry.size.width * 0.3, alignment: .leading)
            }
        }
        .frame(maxHeight: 50)
    }
}


#Preview {
    DisplayedCurrency(number: 12.23, currencyCode: "SAR")
}
