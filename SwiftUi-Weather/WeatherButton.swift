//
//  WeatherButton.swift
//  SwiftUi-Weather
//
//  Created by Robert Tessler on 17/7/2022.
//

import SwiftUI

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {

    Text(title)
        .frame(width: 200, height: 50)
        .foregroundColor(textColor)
        .background(backgroundColor.gradient)
        .font(.system(size: 20, weight: .medium))
        .cornerRadius(10)
    }
}

