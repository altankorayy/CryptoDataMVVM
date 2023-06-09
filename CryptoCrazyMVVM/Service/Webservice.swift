//
//  Webservice.swift
//  CryptoCrazyMVVM
//
//  Created by Altan on 28.05.2023.
//

import Foundation

class Webservice {
    
    //İnternetten veri indirip o veriyi döndürüp completion block oluşturmak istediğimiz için @escaping kullandık.
    func downloadCurrencies(url: URL, completion: @escaping ([CryptoCurrency]?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error { //Hata varsa
                print(error.localizedDescription)
                completion(nil) //Hata varsa datayı alma nil değeri ver.
            } else if let data = data { //Veri varsa
                
                do {
                    let cryptoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
                    
                    if let cryptoList = cryptoList {
                        completion(cryptoList) //Veri geldiyse completion block'un içine cryptoList adında veriyi ver.
                    }
                }
            }
        }.resume()
    }
}
