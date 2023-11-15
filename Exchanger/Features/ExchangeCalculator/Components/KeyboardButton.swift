//
//  KeyboardButton.swift
//  Exchanger
//
//  Created by Rakan Alotaibi on 01/05/1445 AH.
//

import SwiftUI

struct KeyboardButton: View {
    let title: String
    let onTap: () -> Void
    var body: some View {
        Button(action: onTap, label: {
            Text(title)
                .foregroundStyle(.white)
                .font(.largeTitle)
                .bold()
                .frame(maxWidth: .infinity)
                .frame(height: 8 * 11)
                .background {
                    Rectangle()
                        .stroke(.gray, lineWidth: 0.5)
                }
        })
    }
}


#Preview {
    KeyboardButton(title: "0"){
        
    }
}
