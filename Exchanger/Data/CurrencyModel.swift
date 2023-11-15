//
//  CurrencyModel.swift
//  Exchanger
//
//  Created by Rakan Alotaibi on 30/04/1445 AH.
//

import Foundation

struct CurrencyModel: Identifiable, Decodable {
    let id = UUID()
    let code: String
    let conversion_rates: [String: Double]
    
    init(code: String, conversion_rates: [String: Double]) {
        self.code = code
        self.conversion_rates = conversion_rates
    }
    
    enum CodingKeys: CodingKey {
        case id
        case base_code
        case conversion_rates
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try container.decode(String.self, forKey: .base_code)
        self.conversion_rates = try container.decode([String : Double].self, forKey: .conversion_rates)
    }
}
