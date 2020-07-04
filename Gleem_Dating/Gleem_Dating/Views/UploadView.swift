//
//  UploadView.swift
//  Gleem_Dating
//
//  Created by Dustin yang on 7/1/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI

import SwiftUI

struct UploadView: View {
    
    // intializing Four Image cards...
    
    @State var images : [Data] = [Data()]
    @State var imagePicker = false
    @State var index = 0
    @State var showProfile = false
    @State var customAttr: String = ""
    let characterLimit = 10
    @State private var entry = ""
    @State var buttonPressed = [false,false,false,false,false,false,false,false]
    var  buttonTitle = ["개족같이 생김","잘생김","섹시함","차도남","머리스타일 잘어울림","머리스타일 잘어울림","지적임","착해보임"]
    
    var body: some View {
        
        ZStack{
            VStack(spacing: 35){
                
                HStack{
                    Spacer(minLength: 0)
                    Text("사진 올리기")
                        .font(.title)
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                    
                    Spacer(minLength: 0)
                }
                .padding(.top, 25)
                
                HStack(spacing: 15){
                    
                    Button(action: {
                        
                        self.index = 0
                        self.imagePicker.toggle()
                        
                    }) {
                        
                        ZStack{
                            
                            if self.images[0].count == 0{
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color("Color-3"))
                                
                                Image(systemName: "plus")
                                    .font(.system(size: 24, weight: .bold)).foregroundColor(.white)
                            }
                            else{
                                
                                Image(uiImage: UIImage(data: self.images[0])!)
                                    .resizable()
                                    .renderingMode(.original)
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 200, height: 200)
                                    .cornerRadius(10)
                            }
                        }
                            // Fixed Height...
                            .frame(width: 200, height: 200)
                    }
                    
                }
                
                VStack(spacing: 8){
                    HStack(spacing : 12){
                        
                        AttrButtonView(isPressed: self.$buttonPressed[0],title:buttonTitle[0])
                        AttrButtonView(isPressed: self.$buttonPressed[1],title:buttonTitle[1])
                        AttrButtonView(isPressed: self.$buttonPressed[2],title:buttonTitle[2])
                        
                        
                    }.padding(.horizontal, 2)
                    //                    ChartView().frame(width: UIScreen.main.bounds.width, height: 300)
                    HStack(spacing : 2){
                        AttrButtonView(isPressed: self.$buttonPressed[3],title:buttonTitle[3])
                        //                        Spacer()
                        AttrButtonView(isPressed: self.$buttonPressed[4],title:buttonTitle[4])
                        AttrButtonView(isPressed: self.$buttonPressed[5],title:buttonTitle[5])
                        
                    }.padding(.horizontal, 2)
                    HStack(spacing : 12){
                        AttrButtonView(isPressed: self.$buttonPressed[6],title:buttonTitle[6])
                        //                        Spacer()
                        AttrButtonView(isPressed: self.$buttonPressed[7],title:buttonTitle[7])
                        //                            AttrButtonView(isPressed: self.$buttonPressed[8],title:buttonTitle[8])
                        
                    }.padding(.horizontal, 2)
                    
                    
                    
                    HStack(alignment: .center) {
                        //                        Text("직접입력:")
                        //                            .font(.callout)
                        //                            .bold()
                        TextField("10자 내외 직접입력 ..", text: $customAttr)
                            .textFieldStyle(CustomStyle()).disabled(entry.count > (characterLimit - 1))
                        
                    }.padding(.horizontal)
                }.background(Color.clear)
                
                Button(action: {
                    
                    self.showProfile.toggle()
                    
                }) {
                    
                    Text("Proceed")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 45)
                        .background(Color("Color2-1"))
                        .clipShape(Capsule())
                }
                .padding(.top, 10)
                    // Disabling button by verifying all images...
                    .opacity(self.verifyImages() ? 1 : 0.35)
                    .disabled(self.verifyImages() ? false : true)
                
                
                Spacer()
            }
            .padding(.horizontal).KeyboardResponsive()
            
            // <--- the view modifier
        }
            .background(Color.clear.edgesIgnoringSafeArea(.all))
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .sheet(isPresented: self.$imagePicker) {
                
                ImagePicker(showPicker: self.$imagePicker, imageData: self.$images[self.index])
        }         .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
        
    }
    
    
    func hide_keyboard()
    {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func verifyImages()->Bool{
        
        var status = true
        
        for i in self.images{
            
            if i.count == 0{
                
                status = false
            }
        }
        
        return status
    }
}


public struct CustomStyle : TextFieldStyle {
    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(7)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .strokeBorder(Color.black, lineWidth: 1)
        )
    }
    
}


//
//public class KeyboardInfo: ObservableObject {
//
//    public static var shared = KeyboardInfo()
//
//    @Published public var height: CGFloat = 0
//
//    private init() {
//        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardChanged), name: UIApplication.keyboardWillShowNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardChanged), name: UIResponder.keyboardWillHideNotification, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardChanged), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
//    }
//
//    @objc func keyboardChanged(notification: Notification) {
//        if notification.name == UIApplication.keyboardWillHideNotification {
//            self.height = 0
//        } else {
//            self.height = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
//        }
//    }
//
//}
//
//struct KeyboardAware: ViewModifier {
//    @ObservedObject private var keyboard = KeyboardInfo.shared
//
//    func body(content: Content) -> some View {
//        content
//            .padding(.bottom, self.keyboard.height)
//            .edgesIgnoringSafeArea(self.keyboard.height > 0 ? .bottom : [])
//            .animation(.easeOut)
//    }
//}
