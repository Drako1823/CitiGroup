//
//  CustomAlert.swift
//  Citi
//
//  Created by El Reymon . on 11/03/24.
//

import SwiftUI

struct CustomAlert: View {
    @Binding var presentAlert: Bool
    @State var alertType: AlertType = .success
    var leftButtonAction: (() -> ())?
    var rightButtonAction: (() -> ())?
    let verticalButtonsHeight: CGFloat = 80
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                if alertType.title() != "" {
                    Text(alertType.title())
                        .font(.system(size: 16, weight: .bold))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .frame(height: 25)
                        .padding(.top, 16)
                        .padding(.bottom, 8)
                        .padding(.horizontal, 16)
                }
                
                Text(alertType.message())
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .font(.system(size: 14))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
                    .minimumScaleFactor(0.5)
                
                Divider()
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 0.5)
                    .padding(.all, 0)
                
                HStack(spacing: 0) {
                    
                    if (!alertType.leftActionText.isEmpty) {
                        Button {
                            leftButtonAction?()
                        } label: {
                            Text(alertType.leftActionText)
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.black)
                                .multilineTextAlignment(.center)
                                .padding()
                                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                        }
                        Divider()
                            .frame(minWidth: 0, maxWidth: 0.5, minHeight: 0, maxHeight: .infinity)
                    }
                    
                    Button {
                        rightButtonAction?()
                    } label: {
                        Text(alertType.rightActionText)
                            .font(.system(size: 16, weight: .bold))
                            .foregroundColor(.pink)
                            .multilineTextAlignment(.center)
                            .padding(15)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    }
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 55)
                .padding([.horizontal, .bottom], 0)
            }
            .frame(width: 270, height: 150)
            .background(
                Color(hex: 0xAEAEAE)
            )
            .cornerRadius(4)
        }
        .zIndex(2)
    }
}
