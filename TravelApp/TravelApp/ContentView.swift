//
//  ContentView.swift
//  TravelApp
//
//  Created by Dustin yang on 6/3/20.
//  Copyright © 2020 Dustin yang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Home : View {
    
    @State var data = [

        TravelData(id: 0, image: "yosemite", country: "USA", place: "Yosemite", details: "Yosemite National Park is in California’s Sierra Nevada mountains. It’s famed for its giant, ancient sequoia trees, and for Tunnel View, the iconic vista of towering Bridalveil Fall and the granite cliffs of El Capitan and Half Dome. In Yosemite Village are shops, restaurants, lodging, "),
        
        TravelData(id: 1, image: "antelope", country: "Arizona", place: "Antelope Canyon", details: "Antelope Canyon is a slot canyon in the American Southwest, on Navajo land east of Page, Arizona. It includes two separate, scenic slot canyon sections, referred to as Upper Antelope Canyon, and Lower Antelope Canyon."),
        
        TravelData(id: 2, image: "azores", country: "Portugal", place: "Azores", details: "The Azores, an autonomous region of Portugal, are an archipelago in the mid-Atlantic. The islands are characterized by dramatic landscapes, fishing villages, green pastures and hedgerows of blue hydrangeas. São Miguel, the largest, has lake-filled calderas and the Gorreana "),
        
        TravelData(id: 3, image: "venice", country: "Italy", place: "Venice", details: "Venice, the capital of northern Italy’s Veneto region, is built on more than 100 small islands in a lagoon in the Adriatic Sea. It has no roads, just canals – including the Grand Canal thoroughfare – lined with Renaissance and Gothic palaces."),
        
        TravelData(id: 4, image: "angelfalls", country: "Venezuela", place: "Angel Falls", details: "Angel Falls is a waterfall in Venezuela. It is the world's highest uninterrupted waterfall, with a height of 979 metres and a plunge of 807 m. The waterfall drops over the edge of the Auyán-tepui mountain in the Canaima National Park")

    ]
    
    @State var index = 0
    
    @State var show = false
    
    var body: some View{
        
        ZStack{
            
            VStack{

                HStack{

                    Text("Travel")
                        .font(.title)
                        .fontWeight(.bold)

                    Spacer()

                    Text("\(self.index + 1) / \(self.data.count)")
                        .foregroundColor(.gray)
                }
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .padding()

                GeometryReader{g in

                    Carousel(data: self.$data, index: self.$index, show: self.$show, size: g.frame(in: .global))
                }
                .padding(.bottom, (UIApplication.shared.windows.first?.safeAreaInsets.bottom)! + 10)
            }
            
            // hiding the view when expand view appears..
            .opacity(self.show ? 0 : 1)
            
            // Current index will give current card...
            ExpandView(data: self.$data[self.index], show: self.$show)
            //shrinking the view in background...
            .scaleEffect(self.show ? 1 : 0)
            .frame(width: self.show ? nil : 0, height: self.show ? nil : 0)
        }
        .background(Color.black.opacity(0.07).edgesIgnoringSafeArea(.all))
        .edgesIgnoringSafeArea(.all)
    }
}

// Carousel List...

struct HScrollView : View {
    
    @Binding var data : [TravelData]
    // for expanding view...
    @Binding var show : Bool
    var size : CGRect
    
    var body: some View{
        
        HStack(spacing: 0){
            
            ForEach(self.data){i in
                
                ZStack(alignment: .bottom){
                    
                    Image(i.image)
                    .resizable()
                    .aspectRatio(1, contentMode: .fill)
                    .frame(width: self.size.width - 30, height: self.size.height)
                    .cornerRadius(25)
                    // because fill will take extra space we avoid this by contentshape....
                    .contentShape(Rectangle())
                    .onTapGesture {
                            
                        withAnimation{
                            
                            // open the expand view when image is tapped...
                            
                            self.show.toggle()
                        }
                    }
                    
                    VStack(alignment: .leading, spacing: 12){
                        
                        Text(i.place)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        HStack(spacing: 12){
                            
                            Image(systemName: "mappin.circle.fill")
                                .font(.system(size: 25, weight: .bold))
                            
                            Text(i.country)
                            
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                                .padding(.leading,5)
                            
                            Text("5")
                        }
                        
                        Text(i.details)
                    }
                    .padding(.horizontal,25)
                    .padding(.bottom,20)
                    .foregroundColor(.white)
                }
                // fixed frame for carousel list...
                .frame(width: self.size.width, height: self.size.height)
            }
        }
    }
}

// ExpandView...

struct ExpandView : View {
    
    @Binding var data : TravelData
    @Binding var show : Bool
    
    var body: some View{
        
        VStack{
            
            // dismiss Button...
            
            ZStack(alignment: .topTrailing) {
                
                Image(self.data.image)
                .resizable()
                .cornerRadius(25)
                
                Button(action: {
                    
                    // dismissing the expand view...
                    
                    withAnimation{
                        
                        self.show.toggle()
                    }
                    
                }) {
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black.opacity(0.7))
                        .clipShape(Circle())
                }
                .padding(.trailing)
                .padding(.top, (UIApplication.shared.windows.first?.safeAreaInsets.top)! + 10)
            }
            
            VStack(alignment: .leading, spacing: 12){
                
                Text(self.data.place)
                    .font(.title)
                    .fontWeight(.bold)
                
                HStack(spacing: 12){
                    
                    Image(systemName: "mappin.circle.fill")
                        .font(.system(size: 25, weight: .bold))
                    
                    Text(self.data.country)
                        .foregroundColor(.gray)
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                        .padding(.leading,5)
                    
                    Text("5")
                        .foregroundColor(.gray)
                }
                
                Text(self.data.details)
            }
            .padding(.horizontal,25)
            .padding(.bottom,20)
            .foregroundColor(.black)
            .padding(.top)
            
            HStack{
                
                HStack(spacing: 15){
                    
                    Text("$ 1 (3Days)")
                        .font(.title)
                        .fontWeight(.bold)
//
//                    Text("(3Days)")
//                        .font(.title)
                }
                .padding(.leading, 15)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    
                    Text("Book Now")
                        .foregroundColor(.white)
                        .font(.system(size: 22))
                        .padding(.vertical, 25)
                        .frame(width: UIScreen.main.bounds.width / 2.5)
                        .background(Color("Color"))
                        .clipShape(CShape())
                }
            }
        }
    }
}

struct Carousel : UIViewRepresentable {
    
    
    func makeCoordinator() -> Coordinator {
        
        return Carousel.Coordinator(parent1: self)
    }
    
    @Binding var data : [TravelData]
    @Binding var index : Int
    @Binding var show : Bool
    var size : CGRect
    
    func makeUIView(context: Context) -> UIScrollView {
        
        let view = UIScrollView()
        // because each view takse full width so content size will be * total count...
        view.contentSize = CGSize(width: size.width * CGFloat(data.count), height: size.height)
        
        let child = UIHostingController(rootView: HScrollView(data: self.$data, show: self.$show, size: self.size))
        child.view.backgroundColor = .clear
        // same here....
        child.view.frame = CGRect(x: 0, y: 0, width: size.width * CGFloat(data.count), height: size.height)
        
        view.addSubview(child.view)
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.isPagingEnabled = true
        view.delegate = context.coordinator
        
        return view
        
    }
    
    func updateUIView(_ uiView: UIScrollView, context: Context) {
        
        // dynamically update size when new data added...
        
        for i in 0..<uiView.subviews.count{
            
            uiView.subviews[i].frame = CGRect(x: 0, y: 0, width: size.width * CGFloat(data.count), height: size.height)
        }
        
        uiView.contentSize = CGSize(width: size.width * CGFloat(data.count), height: size.height)
    }
    
    class Coordinator : NSObject,UIScrollViewDelegate{
        
        var parent : Carousel
        
        init(parent1 : Carousel) {
            
            parent = parent1
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
         
            let index = Int(scrollView.contentOffset.x / UIScreen.main.bounds.width)
            
            parent.index = index
        }
    }
}

// sample data...

struct TravelData : Identifiable {
    
    var id : Int
    var image : String
    var country : String
    var place : String
    var details : String
}

// Custom Shape

struct CShape : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.bottomRight], cornerRadii: CGSize(width: 55, height: 55))
        
        return Path(path.cgPath)
    }
}

// To Hide Home Indicator...

class Host : UIHostingController<ContentView>{
    
    override var prefersHomeIndicatorAutoHidden: Bool{
        
        return true
    }
}

   
   
