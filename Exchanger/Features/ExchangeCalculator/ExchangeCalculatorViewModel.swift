//
//  ExchangeCalculatorViewModel.swift
//  Exchanger
//
//  Created by Rakan Alotaibi on 01/05/1445 AH.
//

import Foundation
class ExchangeCalculatorViewModel: ObservableObject {
    @Published var fromText: String = "0"
    @Published var toText: String = "0"
    @Published var fromCurrency: String = "SAR"
    @Published var toCurrency: String = "USD"
    @Published var currencyBase: CurrencyModel?

    func fetchRate() {
        guard let url = URL(string: "https://v6.exchangerate-api.com/v6/d066125564f81e2b90529257/latest/USD") else {
            print("invalid URL")
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(CurrencyModel.self, from: data)
                    DispatchQueue.main.async {
                        self.currencyBase = decodedData
                    }
                } catch {
                    print("Error decoding data: \(error)")
                }
            }
        }.resume()
    }

    func getFromNumber() -> Double {
        return Double(fromText) ?? 0.0
    }

    func getToNumber() -> Double {
        return Double(toText) ?? 0.0
    }
    
    func clearPressed(){
        fromText = "0"
        toText = "0"
    }

    func onKeyboardEdit() {
        let fromNumber = getFromNumber()
        let result = (fromNumber / (currencyBase?.conversion_rates[fromCurrency] ?? 1))  * (currencyBase?.conversion_rates[toCurrency] ?? 1)
        toText = String(result)
    }
}
