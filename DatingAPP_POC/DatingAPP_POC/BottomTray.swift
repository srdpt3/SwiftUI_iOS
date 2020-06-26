//
//  BottomTray.swift
//  DatingAPP_POC
//
//  Created by Dustin yang on 6/25/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI


import SwiftUI

struct BottomTray: View {
    
    var selectedCard: Card?
    var isScrollDisabled: Bool = true
    
    var body: some View {
        ZStack {
            if self.selectedCard != nil {
                VStack(spacing: 0) {
                    Rectangle().fill(Color.gray.opacity(0.4))
                        .frame(width: 40, height: 4)
                        .cornerRadius(4)
                    
                    Text(self.selectedCard?.name ?? "")
                        .font(.system(size: 30, weight: .semibold))
                        .padding(.vertical)
                    
                    Divider()
                    
                    ScrollView(showsIndicators: false) {
                        Text(self.selectedCard?.name ?? "")
                            .padding()
                        
//                        if self.selectedPerson?.sections != nil {
//                            Divider()
//                            ForEach(self.selectedCard!.sections!) { section in
//                                SectionCarousel(section: section)
//                            }
//                            .frame(maxWidth: .infinity, alignment: .leading)
//                        }
                    }
                    .disabled(self.isScrollDisabled)
                }
                .multilineTextAlignment(.leading)
            }
        }
        .background(Color.white)
        .foregroundColor(Color.black)
    }
}
//struct BottomTray_Previews: PreviewProvider {
//    static var previews: some View {
//        BottomTray(selectedPerson: Person.stubbed.first, isScrollDisabled: false)
//    }
//}
