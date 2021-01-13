//
//  ContentView.swift
//  Identifible.Foreach
//
//  Created by Стас Жингель on 13.01.2021.
//

import SwiftUI

struct ContentView: View {
    var cafes = [ Cafe(name: "Berkeley Cafe", image: "berkeleyCafe"),
                  Cafe(name: "Black Cafe", image: "blackCoffee"),
                  Cafe(name: "Black Ring Coffee", image: "blackRingCoffee"),
                  Cafe(name: "Camber Coffee", image: "camberCoffee"),
                  Cafe(name: "Coffee Shop", image: "coffeeShop"),
                  Cafe(name: "Friends Cafe", image: "friendsCafe"),
                  Cafe(name: "Pink Lane Cafe", image: "hardRockCafe"),
                  Cafe(name: "Hop & Stork Cafe", image: "hopStorkCoffee"),
                  Cafe(name: "La Mo Cafe", image: "laMoCafe"),
                  Cafe(name: "La Perla Cafe", image: "laPerlaCafe"),
                  Cafe(name: "Mall Cafe", image: "mallCafe"),
                  Cafe(name: "Black Cafe", image: "nuareCoffee"),
                  Cafe(name: "Outpost Cafe", image: "outpostCoffee"),
                  Cafe(name: "Pink Lane Cafe", image: "pinkLaneCoffee"),
                  Cafe(name: "Sheep Cafe", image: "sheepCoffee"),
                  Cafe(name: "The Good Life Cafe", image: "theGoodLifeCoffee"),
                  Cafe(name: "Think Coffee", image: "thinkCoffee")
    ]
    var body: some View {
        List (cafes.indices) { index in
            if(0...2).contains(index) {
                FullImageRow(cafe: cafes[index])
            } else {
                BasicImageRow(index: cafes[index])
            }
            
        }
        .environment(\.colorScheme,.dark)
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Cafe : Identifiable {
    var name: String
    var image: String
    var id = UUID()
}

struct BasicImageRow: View {
    var index: Cafe
    var body: some View {
        HStack {
            Image(index.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            Text(index.name)
        }
    }
}

struct FullImageRow: View {
    var cafe: Cafe
    var body: some View {
        ZStack {
            Image(cafe.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(10)
                .overlay(
                Rectangle()
                    .foregroundColor(.black)
                    .cornerRadius(10)
                    .opacity(0.2)
                )
            Text(cafe.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(.white)
        }
    }
}
