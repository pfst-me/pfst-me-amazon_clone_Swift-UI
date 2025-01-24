//
//  ContentView.swift
//  amazon_clone
//
//  Created by pavan naik on 23/01/25.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
        @State private var password: String = ""
        @State private var isSecure: Bool = true
    
    var body: some View {
            VStack(spacing: 20) {
                // Amazon Logo
                Image("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoAU2r-709qkZeCFT0Zdmhoyg2_UYm6xF0rA&s") // Add an Amazon logo image in Assets.xcassets
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 50)
                    .padding(.top, 50)

                // Email TextField
                TextField("Email or mobile phone number", text: $email)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)

                // Password TextField
                ZStack {
                    if isSecure {
                        SecureField("Password", text: $password)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                    } else {
                        TextField("Password", text: $password)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                    }
                    HStack {
                        Spacer()
                        Button(action: {
                            isSecure.toggle()
                        }) {
                            Image(systemName: isSecure ? "eye.slash" : "eye")
                                .foregroundColor(.gray)
                        }
                        .padding(.trailing, 10)
                    }
                }

                // Sign In Button
                Button(action: {
                    handleSignIn()
                }) {
                    Text("Sign In")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.orange)
                        .cornerRadius(8)
                }

                // Create Account Button
                Button(action: {
                    print("Create account tapped")
                }) {
                    Text("Create your Amazon account")
                        .foregroundColor(.blue)
                }

                Spacer()
            }
            .padding()
        }

        // Action Handler
        func handleSignIn() {
            // Handle sign-in logic here
            print("Email: \(email), Password: \(password)")
        }
}

#Preview {
    LoginView()
}
