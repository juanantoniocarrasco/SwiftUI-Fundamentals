//
//  WeatherButton.swift
//  SwiftUI-Weather
//
//  Created by Juan Antonio Carrasco del Cid on 22/2/24.
//

import SwiftUI

struct WeatherButton: View {
    
    let title: String
    let textColor: Color
    let backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .background(backgroundColor)
            .foregroundStyle(textColor)
            .font(.system(size: 20, weight: .bold))
            .clipShape(.buttonBorder)
    }
}
