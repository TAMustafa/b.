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
                Text(tag.title)
                    .padding(5)
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(Color(#colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)))
                Text("Posted by \(tag.author)")
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.3415772839, blue: 0.4060478497, alpha: 1)))
                Text(tag.body)
                    .padding()
                    .font(.system(size: 16, weight: .light))
                    .foregroundColor(Color(#colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)))
                Spacer()
            }
        }
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        TagDetailView()
//    }
//}

