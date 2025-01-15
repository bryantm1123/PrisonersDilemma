import SwiftUI

struct InfoView: View {
    @Binding var isShowingInfoView: Bool
    
    var body: some View {
        VStack {
            Text("""
                 🎮 **The Prisoner's Dilemma: A Game of Trust and Strategy!** 🎮
                 
                 Step into the ultimate test of loyalty and logic! In this game, you and your partner face a choice that will define your fortunes. Do you work together or turn against each other? The stakes are high, and every decision counts!
                
                 🧮 **Here’s the scoring system**:
                
                 If **both of you cooperate**, you each earn a generous **5 points**—teamwork truly pays off!
                 If **both of you defect**, you only scrape by with **1 point each**—a weak reward for mutual betrayal.
                 If **one of you defects** while the other cooperates, the defector gets a modest **3 points**, while the cooperator still earns **2 points**—not a total loss, but not ideal either.
                
                 ⚖️ **What will you do?**
                
                 Aim for cooperation and secure a big win for both of you?
                 Risk betrayal to grab glory for yourself, knowing it could cost your partner dearly?
                
                 🕹️ **Why it’s so addictive**:
                
                 It’s a thrilling mix of trust, deception, and strategy. Perfect for sparking discussions about ethics, risk-taking, and what really matters in competition.
                 Every round brings new possibilities for victory—or defeat—depending on how well you play the game.
                 💥 Dive into the Prisoner's Dilemma and find out: can you balance personal gain with mutual success, or will treachery tempt you? The choice is yours!
                """)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            .multilineTextAlignment(.center)
            .padding(EdgeInsets(top: 0, leading: 10, bottom: 10, trailing: 10))
            Button("Continue") {
                isShowingInfoView = false
            }
            .frame(width: 84, height: 24)
            .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
        }
    }
}

#Preview {
    struct Preview: View {
        @State var isShowingInfoView: Bool = false
        
        var body: some View {
            InfoView(isShowingInfoView: $isShowingInfoView)
        }
    }
    return Preview()
}
