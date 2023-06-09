import Foundation
import SwiftUI

public struct PulsaDataView: View {
    
    @State private var phoneNumber : String = ""
    @State private var showPhoneContacts = false
    @State private var showGridData = true
    @State private var showResultView = false
    
    public init(){}
    
    public var body :some View{
        NavigationStack{
            VStack(alignment: .leading){
                Text("Nomor Ponsel").font(.system(size: 14, design: .rounded)).foregroundColor(.black).padding(.horizontal, 16).padding(EdgeInsets(top: 20, leading: 0, bottom: 0, trailing: 0))
                    HStack(alignment: .center){
                        TextField("", text: $phoneNumber)
                            .font(Font.system(size: 15))
                            .padding()
                        Button(action: {
                            showPhoneContacts = true
                        }){
                            Image(systemName: "person.crop.square.fill").foregroundColor(.white)
                        }.background(.teal).padding()
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    ).padding(.horizontal, 16).padding(.bottom, 16)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Pulsa & Paket Data")
                                .foregroundColor(.black)
                                .bold()
                        }
                    }
                    #if !os(macOS)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbarBackground(Color.white, for: .navigationBar)
                    .toolbarBackground(.visible, for: .navigationBar)
                    #endif
                Rectangle().fill(Color(hex: "#eeeeee")).frame(width: .infinity, height: 14, alignment: .center)
                EmptyView()
                Spacer()
                Button(action: {
                    showResultView = true
                }) {
                    Text("LANJUTKAN").frame(minWidth: 0,maxWidth: .infinity)
                        .padding(16).foregroundColor(.white)
                        .background(Color.teal)
                        .cornerRadius(4)
                    
                }.padding(.all, 16)
                NavigationLink("", destination:  PulsaDataResultView(), isActive: $showResultView)
            }.sheet(isPresented: $showPhoneContacts, onDismiss: loadPhoneNumber) {
                #if !os(macOS)
                PhoneContactsView(phoneNumber: self.$phoneNumber)
                #endif
            }
        }
    }
    
    func loadPhoneNumber() {
        let selectedPhoneNumber = phoneNumber
        phoneNumber = selectedPhoneNumber
        showGridData = true
    }
}

struct PulsaDataView_Previews: PreviewProvider {
    static var previews: some View {
        PulsaDataView()
    }
}
