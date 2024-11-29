//
//  ContentView.swift
//  SwiftUi-Weather
//
//  Created by Robert Tessler on 12/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false  // retained between redraws
    @State private var isShowingSheet = false
    
    var body: some View {
        
        ZStack {
            BackgroundView(isNight: isNight)
            //BackgroundView(isNight: $isNight)
            
            VStack {
                CityTextView(name: "Cupertino CA")
                WeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 78)
                HStack(spacing: 20) {
                    DayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 74)
                    DayView(dayOfWeek: "WED", imageName: "sun.max.fill", temperature: 74)
                    DayView(dayOfWeek: "THU", imageName: "sunset.fill", temperature: 74)
                    DayView(dayOfWeek: "FRI", imageName: "wind.snow", temperature: 74)
                    DayView(dayOfWeek: "SAT", imageName: "cloud.sun.fill", temperature: 74)
                }
                Spacer()
                Button {
                    //isNight.toggle()        // action
                    isShowingSheet = true
                }
                label: {
                    WeatherButton(title: "Change Day",
                                  textColor: .blue,
                                  backgroundColor: .white)
                }
                Spacer()
            }
           
        }
        .onAppear() { }
        .sheet(isPresented: $isShowingSheet, content: {
            ChangeTimeOfDayView(isNight: $isNight)
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .symbolRenderingMode(.multicolor)       // multi color
                .resizable()                    // fill space
//                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
//                .foregroundStyle(.mint, .orange, .green)
                .aspectRatio(contentMode: .fit) // keep aspect, fit container
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    //@Binding var isNight: Bool
   var isNight: Bool
    
    // fill safe area

    var body: some View {
        //Color(.blue)
//        LinearGradient(
//            gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//            .ignoresSafeArea(.all)
        
        // quick gradient
        
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
            
    }
}

struct CityTextView: View {
    
    var name: String
    
    var body: some View {
        Text(name)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct WeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)       // multi color
                .resizable()                    // fill space
                .aspectRatio(contentMode: .fit) // keep aspect, fit container
                .frame(width: 180, height: 180)
            Text("\(temperature)°")
                .font(.system(size: 78, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

