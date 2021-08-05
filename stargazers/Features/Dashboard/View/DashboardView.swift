//
//  DashboardView.swift
//  stargazers
//
//  Created by Dhika Aditya on 02/08/21.
//

import SwiftUI
import AVFoundation

struct DashboardView: View {    
    var body: some View {
        HomeView()
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DashboardView()
                .padding()
                //.frame(width: 2.36, height: 1.64)
                .previewDevice("iPad Air (4th generation)")
                .landscape()
            DashboardView()
                .previewDevice("iPad Pro (12.9-inch) (5th generation)")
                .landscape()
            DashboardView()
                //.frame(width: 1.17, height: 2.532)
                .previewDevice("iPhone 12")
                .landscape()
            
        }
        .environmentObject(ModelData())
    }
    
}


struct HomeView: View {
    @EnvironmentObject var modelData: ModelData
    @State var index = 0
    @State var isCheck: Bool = false
    
    var body: some View {
        ZStack(){
            Image("nightspace-bg")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipped()
                .foregroundColor(Color.white)
            //            Rectangle()
            //                .foregroundColor(.blue)
            
            /*
             ZStack(){
             VStack{
             HStack{
             Spacer()
             Text("Test")
             .foregroundColor(Color.white)
             .frame(width: 100, height: 100)
             .background(Color.green)
             .padding(.all, 10)
             }
             
             Spacer()
             }
             }
             //MARK: Bagian ini
             .frame(width: UIScreen.main.bounds.height, height: UIScreen.main.bounds.width)
             */
            
            
            
            Button(action: {
                isCheck = isCheck == false ? true : false
                if isCheck == true{
                    playSound(sound: "A", type: "mp3")
                }else{
                    stopSound(sound: "A", type: "mp3")
                }
                print(isCheck)
                
            }){
                Image(systemName: "speaker.wave.3")
                    .foregroundColor(Color.white)
                    //.frame(width: 64, height: 64)
                    .background(Color.green)
                    .padding(.all, 60)
                    .frame(width: UIScreen.main.bounds.size.landscape().width, height: UIScreen.main.bounds.size.landscape().height, alignment: .topTrailing)//widthMax jika ingin lebih pojok
            }
            
            //MARK: pakai spacing 8 untuk mengganti Spacer()
            HStack(){
                //ZStack{
                Button(action: {index = index > 0 ? index-1 : modelData.dashboards.count-1}){
                    Image(systemName: "chevron.left")
                        .resizable()
                        .foregroundColor(Color.orange)
                        .frame(width: 32, height: 64)
                        .padding(.leading)
                }
                //}
                
                Spacer()
                //Spacer()
                
                Image(modelData.dashboards[index].imageName ?? "error")
                    .resizable()
                    .frame(width: 400, height: 400) //MARK: Ukuran gambar harus di INISIALISASIIN Karena mempengaruhi spacingnya/spacer
                
                Spacer()
                
                VStack(){
                    Text(modelData.dashboards[index].titleName ?? "error").font(.title).bold()
                    Text(modelData.dashboards[index].subTittle ?? "error").font(.callout)
                    Spacer()
                    Button(action: {print()}){
                        HStack{
                            Text("Mulai Misi")
                                .font(.callout)
                                .padding()
                        }
                        .frame(width: 128, height: 32)
                    }
                    .foregroundColor(Color.white)
                    .buttonStyle(PrimaryButtonStyle())
                    
                }
                .frame(width: 256, height: 128)
                
                Spacer()
                //Spacer()
                
                //ZStack{
                Button(action: {index = index >= modelData.dashboards.count-1 ? 0 : index+1}){
                    Image(systemName: "chevron.right")
                        .resizable()
                        .foregroundColor(Color.orange)
                        .frame(width: 32, height: 64)
                }
                //}
            }
            //MARK: Cek frame disini
            //.frame(width: UIScreen.main.bounds.width-20, alignment: .center)
            .frame(width: UIScreen.main.bounds.height-10, height: UIScreen.main.bounds.width-10)
            .foregroundColor(Color.white)
            
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    
    //    var player: AVAudioPlayer!
    //    func playSound() {
    //        let url = Bundle.main.url(forResource: "A", withExtension: "Any")
    //        player = try! AVAudioPlayer(contentsOf: url!)
    //        player.play()
    //
    //    }
    
    
    
    
}



