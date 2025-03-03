//
//  settingView.swift
//  NoteWatch Watch App
//
//  Created by milad marandi on 3/2/25.
//

import SwiftUI

struct settingView: View {
    
    
    @AppStorage("numberOfLine") var numberOfLines:Double = 1.0
    
    var body: some View {
        VStack(spacing:10) {
            
            Text("Settings")
                .fontWeight(.semibold)
                .foregroundStyle(.yellow)
                .multilineTextAlignment(.center)
            
            HStack{
                Capsule()
                    .frame(height: 1)
                    .foregroundStyle(.yellow)
                
                Image(systemName: "note.text")
                    .fontWeight(.semibold)
                
                Capsule()
                    .frame(height: 1)
                    .foregroundStyle(.yellow)
                
            }//HSTACK
            .foregroundStyle(.yellow)
            Spacer()
            
            Text("Lines:\(Int(numberOfLines))")
                .fontWeight(.semibold)
                .font(.title3)
            Slider(value: $numberOfLines, in: 1...3 ,step: 1.0)
                .tint(.white)
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    settingView()
}
