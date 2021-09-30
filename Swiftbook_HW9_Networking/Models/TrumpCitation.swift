//
//  TrumpCitation.swift
//  Swiftbook_HW9_Networking
//
//  Created by Arcani on 25.09.2021.
//

struct TrumpsQuote: Codable {
    let message: String?
    let nickname: String?
    
    init(trumpsQuote: [String: Any]) {
        message = trumpsQuote["message"] as? String
        nickname = trumpsQuote["nickname"] as? String
    }
    
    static func getQuote(from value: Any) -> TrumpsQuote? {
        guard let trumpsQuote = value as? [String: Any] else { return nil }
        return TrumpsQuote(trumpsQuote: trumpsQuote)
    }
    
}
