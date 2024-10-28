import SwiftUI

struct splash: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var op = 0.5

    var body: some View {
        if isActive {
            Main()
        } else {
            ZStack {
                Color.black.ignoresSafeArea()
                
                VStack {
                    Image("Planto")
                        .resizable()
                        .frame(width: 120, height: 130)
                        .cornerRadius(20)
                    
                    Text("Planto")
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    
                    Text("Plant Care reminders 🌿")
                        .foregroundColor(Color.white)
                }
                .scaleEffect(size)
                .opacity(op)
                .onAppear {
                    withAnimation(.easeIn(duration: 3)) {
                        self.size = 0.9
                        self.op = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}
