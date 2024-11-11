//
//  ContentView.swift
//  JPApexPredators17
//
//  Created by Noble Udechukwu on 02/10/2024.
//

import SwiftUI

struct ContentView: View {
    @State var alphabetical = false
    @State var searchText = ""
    @State var currentSelction = PredatorType.all
    
    let predators = Predators()
    
    
    var filteredDinos: [ApexPredator]{
        predators.filter(by: currentSelction)
        predators.sort(by: alphabetical)
        
        return predators.search(for: searchText)
    }
    
    var body: some View {
        NavigationStack {
            List (filteredDinos){ predator in
                NavigationLink {
                    
                }label: {
                    
                    HStack{
                        //imj
                        Image(predator.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                            .shadow(color: .white, radius:2)
                        VStack(alignment: .leading){
                            //name
                            Text(predator.name)
                                .fontWeight(.bold)
                            
                            //type
                            Text(predator.type.rawValue.capitalized)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.horizontal, 13)
                                .padding(.vertical, 5)
                                .background(predator.type.background)
                                .clipShape(.capsule)
                        }
                    }
                }
            }
            .navigationTitle("Apex Predators")
            .searchable(text: $searchText)
            .autocorrectionDisabled()
            .animation(.default, value: searchText)
            .toolbar{
                ToolbarItem(placement: .topBarLeading) {
                    Button{
                        withAnimation{
                            alphabetical.toggle()
                        }
                    }label: {
//                        if alphabetical {
//                            Image(systemName: "film")
//                        }else{
//                            Image(systemName: "textformat")
//                        }
                        Image(systemName: alphabetical ? "film" : "textformat")
                            .symbolEffect(.bounce, value: alphabetical)
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Menu{
                        Picker("filter", selection: $currentSelction.animation()){
                            ForEach(PredatorType.allCases) { type in
                                Label(type.rawValue.capitalized, systemImage: type.icon)
                            }
                        }
                    }label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
        }
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    ContentView()
}
