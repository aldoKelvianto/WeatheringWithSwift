//
//  WeatherButton.swift
//  WeatheringWithSwift
//
//  Created by aldo.wachyudi on 08/07/22.
//

import SwiftUI

struct WeatherButtonView: View {
    
    var title: String
    var backgroundColor: Color
    var textColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50, alignment: .center)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}

struct WeatherButton_Previews: PreviewProvider {
    static var previews: some View {
        WeatherButtonView(
            title: "Change Day Time",
            backgroundColor: .white,
            textColor: .blue
        ).previewLayout(.sizeThatFits)
    }
}
