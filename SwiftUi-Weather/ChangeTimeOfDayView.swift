//
//  ChangeTimeOfDayaView.swift
//  SwiftUi-Weather
//
//  Created by Robert Tessler on 10/6/2023.
//

import SwiftUI

struct ChangeTimeOfDayView: View {
    
    @Binding var isNight: Bool
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        
        VStack {
            
            Button {
                isNight = true
                presentationMode.wrappedValue.dismiss()
            }
            label: {
                WeatherButton(title: "Make Night",
                              textColor: .white,
                              backgroundColor: .black)
            }
            
            Button {
                isNight = false
                presentationMode.wrappedValue.dismiss()
            }
            label: {
                WeatherButton(title: "Make Day",
                              textColor: .white,
                              backgroundColor: .blue)
            }
        }
    }
}

struct ChangeTimeOfDayView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeTimeOfDayView(isNight: .constant(false))
    }
}
