//
//  StatsView.swift
//  Wordle
//
//  Created by Zaid Sheikh on 21/07/2023.
//

import SwiftUI

struct StatsView: View {
    @EnvironmentObject var dm: WordleDataModel
    var body: some View {
        VStack(spacing: 10){
            HStack{
                Spacer()
                
                Button {
                    dm.showStats.toggle()
                } label: {
                    Text("X")
                        .foregroundColor(.primary)
                        .font(.system(size: 20, weight: .heavy))
                }
                .offset(x:20, y: 10)

            }
            Text("STATISTICS")
                .font(.headline)
                .fontWeight(.bold)
            
            HStack(alignment: .top){
                SingleStat(value: dm.currentStat.games, text: "Played")
                if dm.currentStat.games != 0 {
                    SingleStat(value: Int(dm.currentStat.wins/dm.currentStat.games) * 100, text: "Win %")
                }
                SingleStat(value: dm.currentStat.streak, text: "Current Streak")
                    .fixedSize(horizontal: false, vertical: true)
                
                SingleStat(value: dm.currentStat.maxStreak, text: "Max Streak")
                    .fixedSize(horizontal: false, vertical: true)
            }
            Text("Guess distribution".uppercased())
                .font(.headline)
                .fontWeight(.bold)
            
            VStack(spacing: 5){
                ForEach(0..<6) { index in
                    HStack{
                        Text("\(index + 1)")
                        if dm.currentStat.frequencies[index] == 0{
                            Rectangle()
                                .fill(Color.wrong)
                                .frame(width: 22,height: 20)
                                .overlay(
                                    Text("0")
                                        .foregroundColor(.white)
                                )
                        } else {
                            if let maxValue = dm.currentStat.frequencies.max() {
                                Rectangle()
                                    .fill((dm.tryIndex == index && dm.gameOver) ? Color.correct : Color.wrong)
                                    .frame(width: CGFloat(dm.currentStat.frequencies[index]) / CGFloat(maxValue) * 210, height: 20)
                                    .overlay(
                                        Text("\(dm.currentStat.frequencies[index])")
                                            .foregroundColor(.white)
                                            .padding(.horizontal, 5),alignment: .trailing
                                    )
                            }
                        }
                        Spacer()
                    }
                }
            }
            Spacer()
        }
        .padding(.horizontal, 40)
        .frame(width: 320, height: 370)
        .background(RoundedRectangle(cornerRadius: 15).fill(Color.systemBackground))
        .padding()
        .shadow(color: .primary.opacity(0.2), radius: 10)
        .offset(y: -70)
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
            .environmentObject(WordleDataModel())
    }
}

struct SingleStat: View {
    var value: Int
    var text: String
    var body: some View {
        VStack{
            Text("\(value)")
                .font(.largeTitle)
            Text(text)
                .font(.caption)
                .frame(width: 50)
                .multilineTextAlignment(.center)
        }
    }
}
