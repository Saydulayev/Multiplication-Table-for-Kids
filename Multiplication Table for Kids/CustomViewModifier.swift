//
//  CustomViewModifier.swift
//  Multiplication Table for Kids
//
//  Created by Aakhmed on 12.09.23.
//

import SwiftUI


struct CustomViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 40))
            .fontWeight(.semibold)
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity)
            .background(.thinMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .cornerRadius(20)
            .padding(20)
    }
}

extension View {
    func customStyle() -> some View {
        self.modifier(CustomViewModifier())
    }
}
