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
    var testBool = true
    
    var body: some View {
        NavigationLink(destination: TagWebView(tag: tag)) {
            VStack(alignment: .leading) {
                Text(tag.title)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(Color(#colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)))
                Spacer()
                HStack {
                    Text(tag.author)
                        .font(.system(size: 12, weight: .medium))
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 0.3415772839, blue: 0.4060478497, alpha: 1)))
                    Spacer()
                    Text(tag.created)
                        .font(.system(size: 9, weight: .light))
                        .foregroundColor(Color(#colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)))
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
