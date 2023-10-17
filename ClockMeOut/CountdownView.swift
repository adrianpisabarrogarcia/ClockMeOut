//
//  CountdownView.swift
//  ClockMeOut
//
//  Created by Adrián Pisabarro García on 17/10/23.
//

import SwiftUI
import Combine

struct CountdownView: View {
    @State private var timeRemaining = 1380
    @State private var isPaused = true
    @State private var timerSubscription: Cancellable?
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        VStack{
            ZStack {
                // Anillo de progreso
                Circle()
                    .stroke(lineWidth: 15)
                    .opacity(0.3)
                    .foregroundColor(Color.gray)

                Circle()
                    .trim(from: 0.0, to: CGFloat(timeRemaining) * 0.1)
                    .stroke(lineWidth: 15)
                    .rotationEffect(Angle(degrees: 270.0))
                    .foregroundColor(Color.orange)
                    .animation(.linear, value: timeRemaining)

                // Número de cuenta atrás
                Text("\(timeRemaining)")
                    .font(.system(size: 100))
                    .fontWeight(.bold)
            }
            .padding(40)
            .onReceive(timer) { _ in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                }
            }

            // Botones
            HStack {
                // Botón de Play/Pause
                Button(action: {
                    self.isPaused.toggle()
                    if self.isPaused {
                        self.timerSubscription?.cancel()
                    } else {
                        self.timerSubscription = timer.sink { _ in
                            if self.timeRemaining > 0 {
                                self.timeRemaining -= 1
                            }
                        }
                    }
                }) {
                    Image(systemName: isPaused ? "play.circle.fill" : "pause.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(isPaused ? .orange : .gray)
                }

                // Botón de reiniciar
                Button(action: {
                    self.timeRemaining = 10
                    self.isPaused = true
                    self.timerSubscription?.cancel()
                }) {
                    Image(systemName: "arrow.clockwise.circle.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.orange)
                }
            }
        }
        
    }
}


#Preview {
    CountdownView()
}
