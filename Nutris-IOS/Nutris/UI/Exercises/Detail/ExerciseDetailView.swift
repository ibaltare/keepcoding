import SwiftUI
import AVKit

struct ExerciseDetailView: View {
    var exercise: ExerciseDetailModel
    var player: AVPlayer?
    @State var playerPaused = false
    
    init(exercise: ExerciseDetailModel ,player: AVPlayer? = nil) {
        self.exercise = exercise
        self.player = AVPlayer(url: URL(string: exercise.video)!)
    }
    
    var body: some View {
        VStack {
            VideoPlayer(player: player, videoOverlay: {
                Button(action: {
                    self.playerPaused.toggle()
                    if self.playerPaused {
                        self.player?.play()
                    }
                }) {
                    Image(systemName: "play.fill")
                        .resizable()
                        .frame(width: 36, height: 38)
                        .tint(Color("Primary"))
                        .foregroundColor(Color("Primary"))
                    }
                    .padding(.all,25)
                    .background(.white.opacity(0.5))
                    .clipShape(Circle())
                    .hiddenConditionally(isHidden: playerPaused)
            })
                .frame(height: 400)
            
            Text(exercise.name)
                .fontWeight(.semibold)
                .font(.system(size: 24))
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.all,10)
            
            Text("Description")
                .fontWeight(.semibold)
                .font(.system(size: 18))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
            
            Text(exercise.description)
                .font(.system(size: 17))
                .opacity(0.45)
                .padding(.all, 20)
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: ButtonBack())
        .ignoresSafeArea()
    }
}

struct ExerciseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseDetailView(exercise: ExerciseViewModel().getExcerciseDetailData1())
    }
}
