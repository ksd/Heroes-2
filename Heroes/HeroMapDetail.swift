//
//  HeroMapDetail.swift
//  Heroes
//
//  Created by ksd on 17/03/2022.
//

import SwiftUI

struct HeroMapDetail: View {
    
    let title: String

    var body: some View {
        VStack(spacing: 0) {
            Text(title)
                .font(.callout)
                .padding(5)
                .background(.white)
                .cornerRadius(10)
                .opacity(1)
            Image(systemName: "bicycle.circle.fill")
                .font(.title)
                .foregroundColor(.red)
            Image(systemName: "arrowtriangle.down.fill")
                .font(.caption)
                .foregroundColor(.red)
                .offset(x: 0, y: -5)
        }
    }
}

struct HeroMapDetail_Previews: PreviewProvider {
    static var previews: some View {
        HeroMapDetail(title: "Siderman")
    }
}
