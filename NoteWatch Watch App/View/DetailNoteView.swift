//
//  DetailNoteView.swift
//  NoteWatch Watch App
//
//  Created by milad marandi on 3/2/25.
//

import SwiftUI

struct DetailNoteView: View {
    
    var note:String
    var indexNote:Int
    var totalNotes:Int
    
    @State var isCredentialActive:Bool = false
    @State var isSettingAvailable:Bool = false
    
    var body: some View {
        
        VStack{
            
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
            Spacer()
            Text(note)
                .font(.title3)
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
            
            Spacer()
            
            HStack{
                Button {
                    isSettingAvailable.toggle()
                } label: {
                    Image(systemName: "gear")
                        .font(
                            .system(size: 25, weight: .bold, design: .default)
                        )
                        .fixedSize()
                        
                }
                .buttonStyle(.borderless)
                Spacer()

                Text("\(indexNote)/\(totalNotes)")
                Spacer()

                Button {
                    self.isCredentialActive.toggle()
                } label: {
                    Image(systemName: "info.circle")
                        .font(
                            .system(size: 25, weight: .bold, design: .default)
                        )
                        .fixedSize()
                        
                }
                .buttonStyle(.borderless)
                
                .sheet(isPresented: $isCredentialActive) {
                    CreditView()
                }
                
                .sheet(isPresented: $isSettingAvailable) {
                    settingView()
                }
            }//Hstack
            .padding(.horizontal)
        }//VSTACK
    }
}

#Preview {
    DetailNoteView(
        note: "This is my first note I have written" ,
        indexNote: 1 ,
        totalNotes: 5
    )
}
