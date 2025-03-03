//
//  CreditView.swift
//  NoteWatch Watch App
//
//  Created by milad marandi on 3/2/25.
//

import SwiftUI

struct CreditView: View {
    var body: some View {
        VStack(spacing:10){
            
            Text("Milad Seyed Marandi")
                .fontWeight(.semibold)
                .foregroundStyle(.yellow)
                .multilineTextAlignment(.center)
            
            HStack{
                Capsule()
                    .frame(height: 1)
                    .foregroundStyle(.yellow)
                
                Image(systemName: "note.text")
                
                Capsule()
                    .frame(height: 1)
                    .foregroundStyle(.yellow)
                
            }//HSTACK
            .foregroundStyle(.yellow)
            
            Image("swift")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .shadow(color: .white, radius: 5, x: 0.0, y: 0.0)
            
            Text("Apple developer")
        }
    }
}

#Preview {
    CreditView()
}
