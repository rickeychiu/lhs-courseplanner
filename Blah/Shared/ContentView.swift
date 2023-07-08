//
//  ContentView.swift
//  Shared
//
//  Created by Rickey Chiu on 6/3/23.
//

import SwiftUI

struct ContentView: View {
    @Binding var document: BlahDocument

    var body: some View {
        TextEditor(text: $document.text)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(document: .constant(BlahDocument()))
    }
}
