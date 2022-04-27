//
//  Decoders.swift
//  HomeWork3
//
//  Created by emre usul on 6.04.2022.
//

import Foundation

public enum Decoders {
    static let decoderUser: JSONDecoder = {
        let decoder = JSONDecoder()
        return decoder
    }()
}
