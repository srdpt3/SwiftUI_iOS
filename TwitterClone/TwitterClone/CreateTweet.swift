//
//  CreateTweet.swift
//  TwitterClone
//
//  Created by Dustin yang on 5/14/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI

import SwiftUI
import Firebase

struct CreateTweet : View {
    @Binding var show : Bool
    @State var txt = ""
    @State var picker = false
    @State var picData : Data = .init(count: 0)
    @State var loading = false
    var body : some View{
        
        VStack{
            
            HStack{
                
                Button(action: {
                    
                    self.show.toggle()
                    
                }) {
                    
                    Text("Cancel")
                }
                
                Spacer()
                
                if (loading){
                    indicator()
                } else{
                    Button(action: {
                        
                        self.picker.toggle()
                        
                        
                    }) {
                        Image(systemName: "photo.fill").resizable().frame(width: 30, height: 25)
                        
                        
                        
                    }.foregroundColor(Color("bg"))
                }

                
                
                Button(action: {
                    
                    if self.picData.count != 0 {
                        self.postTweetWithPic()
                        self.loading.toggle()
                        return
                        
                        
                    }
                    
                    postTweet(msg: self.txt, pic: "")
                    self.show.toggle()
                    
                    
                }) {
                    
                    Text("Tweet").padding()
                    
                }.background(Color("bg"))
                    .foregroundColor(.white)
                    .clipShape(Capsule())
                
                
            }
            
            multilineTextField(txt: $txt)
            
        }.padding().sheet(isPresented: $picker){
            imagePicker(picker: self.$picker, pickData: self.$picData)
        }
    }
    
    func postTweetWithPic(){
        let storage = Storage.storage().reference()
        let id = "\(Int(Date().timeIntervalSince1970))"
        storage.child("pics").child(id).putData(self.picData, metadata: nil) { (_, err) in
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            
            storage.child("pics").child(id).downloadURL { (url, err) in
                if err != nil {
                    print((err?.localizedDescription)!)
                    return
                }
                
                postTweet(msg: self.txt, pic: "\(url!)")
                self.show.toggle()
                
                
                
            }
        }
        
    }
    
}

struct imagePicker : UIViewControllerRepresentable{
    
    @Binding var picker: Bool
    @Binding var pickData: Data
    func makeCoordinator() -> imagePicker.Coordinator {
        return imagePicker.Coordinator(parent1: self)
    }
    
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<imagePicker>) -> UIImagePickerController   {
        let picker1 = UIImagePickerController()
        picker1.sourceType = .photoLibrary
        picker1.allowsEditing = false
        picker1.delegate = context.coordinator
        return picker1
    }
    
    func updateUIViewController(_ uiView: UIImagePickerController, context: UIViewControllerRepresentableContext<imagePicker>) {
        
    }
    
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: imagePicker
        
        init(parent1: imagePicker) {
            self.parent = parent1
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            let image = info[.originalImage] as! UIImage
            let picdata = image.jpegData(compressionQuality: 0.25)
            self.parent.pickData = picdata!
            self.parent.picker.toggle()
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            self.parent.picker.toggle()
        }
    }
}

struct indicator : UIViewRepresentable{
    
    func makeUIView(context: UIViewRepresentableContext<indicator>) -> UIActivityIndicatorView {
        let indicator1 = UIActivityIndicatorView(style: .large)
        indicator1.startAnimating()
        return indicator1
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<indicator>) {
        
    }
}

//
//
//struct CreateTweet_Previews: PreviewProvider {
//    static var previews: some View {
//        CreateTweet()
//    }
//}
