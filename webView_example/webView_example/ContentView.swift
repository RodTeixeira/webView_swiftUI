//
//  ContentView.swift
//  webView_example
//
//  Created by Rodolfo on 27/08/23.
//

import SwiftUI
import WebKit

struct ContentView: View {
    
    init() {
        //Use this if NavigationBarTitle is with Large Font
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.black.ignoresSafeArea()
                VStack(spacing: 10) {
                    NavigationLink {
                        PresentWebView(url: "https://www.google.com")
                    } label: {
                        Text("Open google")
                            .font(.system(size: 30, weight: .heavy))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .background(Color.orange)
                            .cornerRadius(10)
                    }
                    
                    NavigationLink {
                        PresentWebView(url: "https://github.com")
                    } label: {
                        Text("Open git")
                            .font(.system(size: 30, weight: .heavy))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .background(Color.orange)
                            .cornerRadius(10)
                    }
                    
                    NavigationLink {
                        PresentWebView(url: "https://www.apple.com")
                    } label: {
                        Text("Open aplle")
                            .font(.system(size: 30, weight: .heavy))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .background(Color.orange)
                            .cornerRadius(10)
                    }
                    
                }
                
            }.navigationBarTitle("Open site", displayMode: .large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

