//
//  ForecastView.swift
//  Climather
//
//  Created by Amarjeet Kumar on 06/02/24.
//

import SwiftUI

struct ForecastView: View {
    var body: some View {
        ScrollView{
            
        }
        .background(
            Color.background.opacity(0.3).blur(radius: 25)
                )
        .background(Color.bottomSheetBackground)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 44))
        .overlay {
            // MARK: Bottom Sheet Inner Shadow (Border)
            RoundedRectangle(cornerRadius: 44)
                .stroke(.white, lineWidth: 1)
                .blendMode(.overlay)
                .offset(y: 1)
                .blur(radius: 0)
                .mask {
                    RoundedRectangle(cornerRadius: 44)
                }
        }
        .overlay {
            // MARK: Bottom Sheet Seperator
             Divider()
                .blendMode(.overlay)
                .background(Color.bottomSheetBorderTop)
                .frame(maxHeight: .infinity, alignment: .top)
                .clipShape(RoundedRectangle(cornerRadius: 44))
        }
        .overlay {
            // MARK: Drag Indicator
            RoundedRectangle(cornerRadius: 10)
                .fill(.black.opacity(0.3))
                .frame(width: 48, height: 5)
                .frame(height: 20)
                .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

#Preview {
    ForecastView()
        .background(Color.background)
        .preferredColorScheme(.dark)
}
