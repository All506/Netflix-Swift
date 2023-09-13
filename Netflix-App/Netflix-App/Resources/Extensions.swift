//
//  Extensions.swift
//  Netflix-App
//
//  Created by Allan Trejos Salazar on 13/9/23.
//

import Foundation

//Will get just the first letter as uppercase
extension String{
    func capitalizeFirstLetter() -> String{
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
