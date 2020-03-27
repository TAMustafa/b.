//
//  AboutView.swift
//  bhive
//
//  Created by Tarek Adam Mustafa on 26/03/2020.
//  Copyright © 2020 Tarek Adam Mustafa. All rights reserved.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack(alignment: .center) {
            Image("bAbout")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
              
            Text("b.")
                .font(.system(size: 34, weight: .heavy))
            .foregroundColor(Color(#colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)))
            Text("Search HIVE content by Tag")
                .font(.system(size: 12, weight: .thin))
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
