//
//  ContentView.swift
//  ListViewUsingArray
//
//  Created by Radhika Chilukuri on 22/10/21.
//

import SwiftUI

struct ContentView: View {
    @State var weekDays = getWeekDaysArray()
    @State var TVShows = [
        TVShow(id: 1, name: "Blacklist", seasonsList: 9),
        TVShow(id: 2, name: "PersonOfInterest", seasonsList: 20),
        TVShow(id: 3, name: "Mentalist", seasonsList: 17)
    ]
    let itemsArray = ["Fruits","Veggies","Meat","bread","Milk","Oats"]
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            
//MARK:List from Array using closure
            /*List(itemsArray,id: \.self) { position in
                Text(position)
                }*/
                /*List(0..<itemsArray.count,id:\.self) { i in
                    Text(itemsArray[i])
                }*/
                /*List(0..<itemsArray.count,id:\.self) {  Text(itemsArray[$0])*/
            
//MARK:List from a function call
            
               /* List(0..<weekDays.count,id: \.self) {
                        Text(weekDays[$0])
                        }*/
            
           /* List(0..<getWeekDaysArray().count,id:\.self) { Text(getWeekDaysArray()[$0]) }*/
            
//MARK: List view from a model Data
            
            List(TVShows,id: \.id ){ show in
                Text(show.name)
                    .font(.system(size: 20, weight: .bold, design: .monospaced))
                    .foregroundColor(.red)
                    .background(Color.white)
                    .padding(.top)
                    }
}
}
}
       
func getWeekDaysArray()-> [String] {
    
let day = Calendar.current.component(.weekday, from: Date())
    // 4, starting from today
    let myCal = Calendar(identifier: .indian)
    var daysOfWeek = (myCal.weekdaySymbols).map {$0.localizedUppercase}
    // ["Sun","MON","TUE","WED","THU","FRI","SAT"]
    for _ in 1..<day {
        daysOfWeek.append(daysOfWeek.remove(at: 0))
        // if it is SUN, removes it and starts with MON
    }
return daysOfWeek
}






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
