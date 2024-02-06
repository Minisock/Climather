//
//  HomeView.swift
//  Climather
//
//  Created by Amarjeet Kumar on 02/02/24.
//

import SwiftUI
import BottomSheet

enum BottomSheetPosition: CGFloat, CaseIterable{
    case top = 0.83 // 702/844
    case middle = 0.385 // BottomSheet height(325)/Screen height (844)
}

struct BottomSheetContentView: View {
    var body: some View {
        // Customize this view based on your needs
        Text("Hello, Bottom Sheet!")
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.secondary)
    }
}

struct HomeView: View {
    @State private var isPresented = false
    @State private var selectedDetent: BottomSheet.PresentationDetent = .medium
    
    var body: some View {
        NavigationView {
            ZStack{
                // MARK: Background Color
                Color.background
                    .ignoresSafeArea()
                
                // MARK: Background Image
                Image("Background")
                    .resizable()
                    .ignoresSafeArea()
                
                
                // MARK: House Image
                Image("House")
                    .frame(maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .top)
                    .padding(.top, 257)
                
                VStack(spacing: -10){
                    Text("Montreal")
                        .font(.largeTitle)
                    
                    VStack{
                        Text(attributedString)
                        Text("H:24°   L:18°")
                            .font(.title3.weight(.semibold ))
                    }
                    Spacer()
                }
                .padding(.top, 51)
                
                // MARK: Bottom Sheet
                Button("Show Credits") {
                            isPresented.toggle()
                        }
                        .sheet(isPresented: $isPresented) {
                            Text("Hello")
//                        ContentMode: {
//                            text()
//                        }
                                .presentationDetents([.medium, .large])
                                .presentationDragIndicator(.hidden)
                        }
                
                // MARK: Tab Bar
                TabBar(action: {})
            }
            .navigationBarHidden(true)
        }
    }
    
    private var attributedString : AttributedString{
        var string = AttributedString("19°" + "\n " + "Mostly Clear")
        
        if let temp = string.range(of: "19°"){
            string[temp].font = .system(size: 96, weight: .thin)
            string[temp].foregroundColor = .primary
        }
        
        if let temp = string.range(of: " | "){
            string[temp].font = .title3.weight(.semibold)
            string[temp].foregroundColor = .secondary
        }
        
        if let temp = string.range(of: "Mostly Clear"){
            string[temp].font = .title3.weight(.semibold)
            string[temp].foregroundColor = .secondary
        }
        
        return string
    }
}

#Preview {
    HomeView()
        .preferredColorScheme(.dark)
}
