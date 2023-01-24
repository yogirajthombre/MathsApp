//
//  CongratsScreen.swift
//  MathsApp
//
//  Created by Yogiraj Thombre on 1/22/23.
//

import SwiftUI

struct CongratsScreen: View {
    var body: some View {
        Text("Congratulations you have successfully completed the level 1").font(.system(size: 25,weight: .bold))
    }
}

struct CongratsScreen_Previews: PreviewProvider {
    static var previews: some View {
        CongratsScreen()
    }
}
