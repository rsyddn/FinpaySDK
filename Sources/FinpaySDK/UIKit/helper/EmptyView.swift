import Foundation
import SwiftUI

struct EmptyView: View{
//    let emptyService = UIImage(named: "EmptyService")!
    var body: some View{
        HStack(){
//            Image (uiImage: emptyService).resizable().frame(width: 40, height: 40)
            VStack(alignment: .leading){
                Text("Yuk Mulai Bertransaksi").font(.system(size: 18,weight: .bold, design: .rounded)).foregroundColor(.black)
                Text("Nikmati kemudahan transaksi bersama kami").font(.system(size: 14, design: .rounded)).foregroundColor(.black)
            }
            Spacer()
        }.padding(.all, 16)
    }
}
