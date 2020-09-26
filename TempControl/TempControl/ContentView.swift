//
//  ContentView.swift
//  TempControl
//
//  Created by Dustin yang on 9/25/20.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @State var temperature : Int = 0
    var body: some View{
        
        ZStack{
            Rectangle().edgesIgnoringSafeArea(.all)
            CircularRular(temperature: $temperature)
            VStack{
                Text("09/26/20 - 안녕하세요 Dustin 님").font(.system(size: 15, weight: .black, design: .monospaced)).foregroundColor(.white)

                HStack{
                    VStack(alignment: .leading){
                        Spacer()

                    
                        TemperatureView(temperature: $temperature).foregroundColor(.white)
                          
                        
                        SmartScheduleView().padding(.top, 80)
                        
                        ModeSelectionView().padding(.top, 20)
                        
                        FanSpeedView().padding(.vertical, 40).padding(.trailing, 40)
                    }.foregroundColor(.white)
                    .padding(.leading, 30)
                 
                    Spacer()
                }
                PowerView()
            }
   
            .padding(.top, 44)
            .padding(.bottom, 34)

            .frame(width: UIScreen.screens.first?.bounds.width, height: UIScreen.screens.first?.bounds.height)
            
        }
        
    }
    
}


struct CircularRular: View{
    @Binding  var temperature : Int
    
    @State var rotate : CGFloat = 0.0
    @State var dragValue : CGFloat = 0.0
    
    var body: some View{
        ZStack{
            Circle().stroke(Color.gray, style: StrokeStyle(lineWidth: 16, lineCap: .butt, dash: [2,4])).scaleEffect(1.05)
            Circle().stroke(Color.gray, style: StrokeStyle(lineWidth: 24, lineCap: .butt, dash: [2,40])).scaleEffect(1.05)
            
            Circle().stroke(Color.red, lineWidth: 3).scaleEffect(1.11)
                .overlay(Circle().stroke(Color.red, lineWidth: 5).scaleEffect(1.15)
                            .blur(radius: 50))
        }.rotationEffect(.degrees(Double(rotate)))
        .frame(width: 580, height: 580).offset(x: 360)
        .gesture(DragGesture(minimumDistance: 5)
                    .onChanged({ (value) in
                        
                        withAnimation(.easeIn(duration: 0.1)){
                            changeValue(height: value.translation.height)

                        }
                    }).onEnded({_ in
                        rotate = 0.0
                        dragValue = 0.0
                    })
        )
    }
    
    private func changeValue(height: CGFloat){
        let tempValue = dragValue
        dragValue = height
        rotate = height / 5
        let diff = tempValue - dragValue
        temperature = Int(CGFloat(temperature) + diff / 2 )
    }
    
    
    
}
struct FanSpeedView : View {
    @State var sliderValue : Double = 4

    var body: some View{
        HStack{
            Image(systemName: "bonjour").foregroundColor(.gray)
            Slider(value: $sliderValue, in: 0...10).accentColor(.red)
        }
    }
}

struct PowerView : View {

    var body: some View{
        HStack{
            Image(systemName: "power")
                .font(.system(size: 20, weight: .black))
                .foregroundColor(.red)
            Text("전원").font(.system(size: 20, weight: .black, design: .monospaced))
                .foregroundColor(.gray)
             
        }
    }
}


struct SmartScheduleView : View {
    var body: some View{
        HStack{
            Image(systemName: "stopwatch").foregroundColor(.gray)
            Text("스마트 스케줄러").font(.system(size: 14, weight: .bold, design: .monospaced))
                .foregroundColor(.red)
        }.foregroundColor(.gray)
    }
}

struct ModeSelectionView : View {
    @ObservedObject var modeSelector = ModeSelector()
    var body: some View{
        HStack(spacing: 20){
            ForEach(modeSelector.modes){mode in
                ModeView(mode: mode).onTapGesture {
                    withAnimation{
                        modeSelector.selectMode(index: mode.id)
                    }
                }
 
            }
        }.foregroundColor(.gray)
        .onAppear{
            modeSelector.selectMode(index: 0)
        }
    }
}


struct ModeView : View {
    let mode: Mode
    var body: some View{
        ZStack{
            Circle().stroke(lineWidth: mode.selected ? 0.0 : 2.0).frame(width: 50, height: 50)
            
            Circle().fill(mode.selected ? Color.red: Color.clear).frame(width: 50, height: 50)

            Image(systemName: mode.imageName).renderingMode(.template).foregroundColor(mode.selected ? .white : .gray )
        }
    }
}



struct Mode : Identifiable{
    let id : Int
    let imageName : String
    var selected = false
}


struct Data {
    static let modeData :[Mode] = [
        Mode(id: 0, imageName: "snow"),
        Mode(id: 1, imageName: "drop.fill"),
        Mode(id: 2, imageName: "sun.max.fill")
        
        
    ]
    
}

class ModeSelector  : ObservableObject {
    @Published var modes = Data.modeData
    var selectedModeIndex = -1
    func selectMode(index: Int){
        modes[index].selected.toggle()
        if selectedModeIndex != -1{
            modes[selectedModeIndex].selected.toggle()
        }
        
        selectedModeIndex = index
        
    }
}




struct TemperatureView: View{
    @Binding var temperature : Int
    
    @State var roate : CGFloat = 0.0
    var body: some View{
        VStack(alignment: .leading){

            Text("온도F").font(.system(size: 20, weight: .black, design: .monospaced))
            Text("\(temperature)").font(.system(size: 100, weight: .black, design: .monospaced))

        }
    }
    
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
