//
//  ExchangeCalculatorView.swift
//  Exchanger
//
//  Created by Rakan Alotaibi on 30/04/1445 AH.
//

import SwiftUI
struct ExchangeCalculatorView: View {
    @StateObject var vm = ExchangeCalculatorViewModel()
    var body: some View {
        MainBackground {
            VStack {
                CustomAppBar()
                    .padding(.horizontal)
                Spacer()
                
                    DisplayedCurrency(
                        number: vm.getFromNumber(),
                        currencyCode: vm.fromCurrency
                    )
                
                

                RateView(text: "1 USD = 3.75 SAR")
                    .padding(.vertical, 8)

                DisplayedCurrency(
                    number: vm.getToNumber(),
                    currencyCode: vm.toCurrency
                )
                
                Spacer()
                LazyVGrid(columns: Array(repeating: .init(.flexible(), spacing: 0), count: 3), spacing: 0) {
                    ForEach(1 ... 9, id: \.self) { index in
                        KeyboardButton(title: "\(index)") {
                            vm.fromText = "\(vm.fromText)\(index)"
                            vm.onKeyboardEdit()
                        }
                    }
                    KeyboardButton(title: ".") {
                        if !vm.fromText.contains(".") {
                            vm.fromText = "\(vm.fromText)."
                        }
                    }
                    KeyboardButton(title: "0") {
                        vm.fromText = "\(vm.fromText)0"
                        vm.onKeyboardEdit()
                    }
                    KeyboardButton(title: "Clear") {
                        vm.clearPressed()
                    }
                }
                .background(
                    Material.thin.opacity(0.1)
                )
            } // VStack
        }
        .task {
            vm.fetchRate()
        }
    }
}

#Preview {
    ExchangeCalculatorView()
}
