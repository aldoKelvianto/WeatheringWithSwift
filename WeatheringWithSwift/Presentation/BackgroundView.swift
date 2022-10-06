//
//  BackgroundView.swift
//  WeatheringWithSwift
//
//  Created by aldo.wachyudi on 01/08/22.
//

import SwiftUI

struct BackgroundView: View {
    var isNight: Bool
    
    var body: some View {
        let topColor : Color = isNight ? .black : .blue
        let bottomColor : Color = isNight ? .gray : Color("lightBlue")
        LinearGradient(colors: [topColor, bottomColor],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView(isNight: true)
            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
            .previewDisplayName("Dark mode")
        
        BackgroundView(isNight: false)
            .previewDevice(PreviewDevice(rawValue: "iPhone 11"))
            .previewDevice("Day mode")
    }
}
