//
//  CustomTextField.swift
//  Shopping
//
//  Created by switchMac on 8/23/24.
//

import SwiftUI


import Foundation

import SwiftUI

struct CustomTextField: View {
    let icon: String
    let placeHolder: String
    @Binding var inputText: String
    
    @State private var width = CGFloat.zero
    @State private var labelWidth = CGFloat.zero
    
    
    var body: some View {
        HStack {
            TextField("", text: $inputText)
                .foregroundColor(.black)
                .font(Font.system(size: 20, design: .serif))
//                .keyboardType(.numberPad)
                .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 60))
                .overlay {
                    GeometryReader { geo in
                        Color.clear.onAppear {
                            width = geo.size.width
                        }
                    }
                }
        }
        .background {
            ZStack {
                RoundedRectangle(cornerRadius: 5)
                    .trim(from: 0, to: 0.55)
                    .stroke(.gray, lineWidth: 1)
                
                RoundedRectangle(cornerRadius: 5)
                    .trim(from: 0.565 + (0.44 * (labelWidth / width)), to: 1)
                    .stroke(.gray, lineWidth: 1)
//                RoundedRectangle(cornerRadius: 5)
//                    .stroke(.gray, lineWidth: 1)
                
                HStack {
                    Spacer()
                    Image(systemName: icon)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.black)
                        .frame(width: 24, height: 24)
                    
//                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding()
                
                Text(placeHolder)
                    .foregroundColor(.gray)
                    .overlay {
                        GeometryReader { geo in
                            Color.clear.onAppear {
                                labelWidth = geo.size.width
                            }
                        }
                    }
                    .padding(2)
                    .font(Font.system(size: 13, design: .serif))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                    .offset(x: 20, y: -10)
            }
        }
    }
}

//#Preview( {
//    CustomTextField()
//}
