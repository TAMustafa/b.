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
            Image("beeAbout")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 120)
              
            Text("b.hive")
                .font(.system(size: 32, weight: .heavy))
            .foregroundColor(Color(#colorLiteral(red: 0.2157138422, green: 0.1635788653, blue: 0.1861514914, alpha: 1)))
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
