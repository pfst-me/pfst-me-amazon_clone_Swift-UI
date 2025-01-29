//
//  RegisterView.swift
//  amazon_clone
//
//  Created by pavan naik on 29/01/25.
//

import SwiftUI

struct RegisterView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var phone: String = ""
    @State private var address: String = ""
    @State private var isPrime: Bool = false
    
    var body: some View {
        VStack(spacing: 10){
            TextField("Enter your email", text: $email)
                .cornerRadius(10)
                .background(Color.gray.opacity(0.2))
        }
        .padding()
    }
}

#Preview {
    RegisterView()
}
