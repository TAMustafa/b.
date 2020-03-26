//
//  TagCardView.swift
//  bhive
//
//  Created by Tarek Adam Mustafa on 23/03/2020.
//  Copyright © 2020 Tarek Adam Mustafa. All rights reserved.
//

import SwiftUI

struct TagCardView: View {
    
    var tag: Tag
    
    var body: some View {
        NavigationLink(destination: TagDetailView(tag: tag)) {
            VStack(alignment: .leading) {
                Text(tag.title)
                    .font(.system(size: 14, weight: .light))
                    .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                Spacer()
                HStack {
                    Text(tag.author)
                        .font(.system(size: 12, weight: .bold))
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                    Spacer()
                    Text(tag.created)
                        .font(.system(size: 9, weight: .light))
                        .foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                }
            }
        }
        .padding()
        .frame(height: 90)
        .background(Color.white)
        .cornerRadius(20.0)
        .shadow(color: Color.gray, radius: 3, x: 0, y: 2)
    }
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        TagCardView()
//    }
//}
