//
//  CityTextView.swift
//  WeatheringWithSwift
//
//  Created by aldo.wachyudi on 08/07/22.
//

import SwiftUI

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct CityTextView_Previews: PreviewProvider {
    static var previews: some View {
        CityTextView(cityName: "Kota Tangerang")
            .previewLayout(.sizeThatFits)
            .background(.black)
    }
}
