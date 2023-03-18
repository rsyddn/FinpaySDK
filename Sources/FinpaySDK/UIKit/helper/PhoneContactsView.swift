import Foundation
import SwiftUI
import Contacts
import ContactsUI

#if !os(macOS)
struct PhoneContactsView: UIViewControllerRepresentable {
    @Binding var phoneNumber: String
    
    func makeUIViewController(context: Context) -> CNContactPickerViewController {
        let picker = CNContactPickerViewController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: CNContactPickerViewController, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, CNContactPickerDelegate {
        var parent: PhoneContactsView
        
        init(_ parent: PhoneContactsView) {
            self.parent = parent
        }
        
        func contactPicker(_ picker: CNContactPickerViewController, didSelect contact: CNContact) {
            let phoneNumber = contact.phoneNumbers.first?.value.stringValue ?? ""
            parent.phoneNumber = phoneNumber
            DispatchQueue.global(qos: .background).async {
                picker.dismiss(animated: true)
            }
        }
    }
}
#endif
