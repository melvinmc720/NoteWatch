//
//  NoteModel.swift
//  NoteWatch Watch App
//
//  Created by milad marandi on 3/2/25.
//

import Foundation
struct Note:Identifiable , Codable{
    
    let id:UUID
    let text:String
    var date:Date = Date()
}
