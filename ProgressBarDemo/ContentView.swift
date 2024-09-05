//
//  ContentView.swift
//  ProgressBarDemo
//
//  Created by Livsy on 05.09.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var progress: CGFloat = .zero
    @State private var progressBarValue: CGFloat = .zero
    
    var body: some View {
        VStack {
            progressBar
                .frame(maxWidth: .infinity, maxHeight: 80)
            
            Slider(value: $progress, in: 0...1)
                .padding()
        }
        
        .padding()
    }
    
    var progressBar: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(.green)
                
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .fill(.gray)
                    .mask {
                        Rectangle()
                            .offset(x: -progressBarValue)
                    }
                
                Text("Some text here...")
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                
                Text("Some text here...")
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity)
                    .mask {
                        Rectangle()
                            .offset(x: -progressBarValue)
                    }
            }
            .onChange(of: progress) { _, newValue in
                progressBarValue = -geometry.size.width * newValue
            }
        }
    }
    
}

#Preview {
    ContentView()
}
