import SwiftUI
import WebKit

struct PresentWebView: View {
    
    var url: String
    
    @State private var isLoading = true
    
    var body: some View {
        NavigationView {
            VStack {
                WebView(url: url, isLoading: $isLoading)
                    .overlay(
                        Group {
                            isLoading ? DynamicLoader() : nil
                        }
                    )
            }
        }
    }
}

struct WebView: UIViewRepresentable {
    
    var url: String
    private let webView = WKWebView()
    
    @Binding var isLoading: Bool
    
    func makeUIView(context: Context) -> WKWebView {
        webView.navigationDelegate = context.coordinator
        if let url = URL(string: url) {
            webView.load(URLRequest(url: url))
        }
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        
        init(_ parent: WebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            webView.isHidden =  true
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            parent.isLoading = false
            webView.isHidden = false
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}
