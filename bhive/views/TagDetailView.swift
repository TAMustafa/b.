//
//  TagDetailView.swift
//  bhive
//
//  Created by Tarek Adam Mustafa on 23/03/2020.
//  Copyright © 2020 Tarek Adam Mustafa. All rights reserved.
//

import SwiftUI

struct TagDetailView: View {
    
    var tag: Tag
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 20) {
                Text(tag.body)
                    .padding()
                    .font(.system(size: 14, weight: .light))
                    .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                Spacer()
            } .navigationBarTitle(Text(tag.title), displayMode: .automatic)
        }
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        TagDetailView()
//    }
//}

