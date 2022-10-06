//
//  RandomNumberView.swift
//  WeatheringWithSwift
//
//  Created by aldo.wahyudi on 06/10/22.
//

import SwiftUI

struct RandomNumberView1: View {
    @State var randomNumber = 0
    
    var body: some View {
        VStack {
            Text("Random number is: \(randomNumber)")
            Button("Randomized number") {
                randomNumber = (0..<1_000).randomElement()!
            }.padding(.bottom, 30)
            CounterView1()
        }
    }
}

struct RandomNumberView_Previews1: PreviewProvider {
    static var previews: some View {
        RandomNumberView1()
    }
}

struct CounterView1: View {
//    @StateObject var viewModel = CounterViewModel()
    @ObservedObject var viewModel = CounterViewModel1()
    
    var body: some View {
        VStack {
            Text("Count is: \(viewModel.count)")
            Button("Increment Counter") {
                viewModel.incrementCounter()
            }
        }
    }
}

final class CounterViewModel1: ObservableObject {
    @Published var count = 0
    
    func incrementCounter() {
        count += 1
    }
}
