//
//  ContentView.swift
//  NoteWatch Watch App
//
//  Created by milad marandi on 3/2/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var notes:[Note] = []
    @AppStorage("numberOfLine") var numberOfLines:Double = 1.0
    
    @State var noteContent:String = ""
    
    private func save(){
        
        guard !self.noteContent.isEmpty else { return}
        
        let note = Note(id: UUID(), text: self.noteContent)
        
        notes.append(note)
        
        noteContent = ""
        
        let filePath = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask).first
        
        
        do{
            let data = try JSONEncoder().encode(notes)
            
            guard let url = filePath?.appendingPathComponent("notes") else { return }
            
            try data.write(to: url)
        }
        
        catch{
            print("error while saving the data")
        }
        
        
        
        
    }
    
    
    private func load(){
        guard let filePath = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask
        ).first?.appendingPathComponent("notes") else { return }
        
        do {
            let data = try Data(contentsOf: filePath)
            
            let decode = try JSONDecoder().decode([Note].self, from: data)
            
            self.notes = decode.sorted(by: { return $1.date < $0.date
            })
        }
        
        catch{
            
        }
    }
    
    private func deleteAction(offset: IndexSet){
        withAnimation {
            notes.remove(atOffsets: offset)
            
            let filePath = FileManager.default.urls(
                for: .documentDirectory,
                in: .userDomainMask).first
            
            
            do{
                let data = try JSONEncoder().encode(self.notes)
                
                guard let url = filePath?.appendingPathComponent("notes") else { return }
                
                try data.write(to: url)
            }
            
            catch{
                print("error while saving the data")
            }
        }
        
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing:10) {
                HStack(spacing:6){
                    TextField("Enter you text here ...", text: $noteContent)
                    Button {
                        save()
                    } label: {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .font(.system(size: 35,weight: .semibold))
                    }
                    .foregroundStyle(.yellow)
                    .fixedSize()
                    .buttonStyle(PlainButtonStyle())
                    
                }//Hstack
                .padding(0)
                Spacer()
                
                if !self.notes.isEmpty {
                    List{
                        ForEach(0...self.notes.count - 1 , id:\.self) { index in
                            NavigationLink {
                                DetailNoteView(
                                    note: notes[index].text,
                                    indexNote: index + 1,
                                    totalNotes: self.notes.count
                                )
                            } label: {
                                HStack{
                                    Capsule()
                                        .frame(
                                            width: 4,
                                            height: nil,
                                            alignment: .center
                                        )
                                        .foregroundStyle(.yellow)
                                    Text(notes[index].text)
                                        .fontWeight(.black)
                                        .lineLimit(Int(numberOfLines))
                                        .padding(.leading , 5)
                                }
                                
                            }
                            
                            
                        }
    
                        .onDelete(perform: deleteAction)
                        
                    }
                    .scrollIndicators(.hidden)
                    
                    .frame(
                        maxWidth: .infinity,
                        maxHeight: .infinity

                    )
                } else {
                    Image(systemName: "note.text")
                        .resizable()
                        .scaledToFit()
                        .opacity(0.5)
                }
                
                
                
            }//Vstack
            
            .navigationTitle("Notes")
            .onAppear{
                DispatchQueue.main.async {
                    self.load()
                }
            }
        }// navigationView
    }
}

#Preview {
    ContentView()
}
