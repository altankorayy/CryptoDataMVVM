//
//  CryptoCurrency.swift
//  CryptoCrazyMVVM
//
//  Created by Altan on 28.05.2023.
//

import Foundation

struct CryptoCurrency : Decodable { //Gelen verilerin otomatik işlenmesi için decodable kullanılır.
    let currency : String
    let price : String
}
