//
//  ContentView.swift
//  MathsApp
//
//  Created by Yogiraj Thombre on 1/21/23.
//

import SwiftUI



struct ContentView: View {
    
    @State var firstcircleColor : Color = Color.blue
    
    @State var secondcircleColor : Color = Color.blue
    
    @State var thirdcircleColor : Color = Color.blue
    
    @State var fourthcircleColor : Color = Color.blue
    
    @State var operations : [String] = ["100+20","900+120","101+120","106-80","103-120","950-459","10*27","199*28","45*24"]
    
    @State var correct_answers = ["120","1020","221","26","-17","491","270","5572","1080"]
    
    @State var answers = [["120","100","90","80"],["978","576","776","1020"],["402","357","221","576"],["26","216","252","126"],["-17","17","-15","217"],["491","41","451","991"],["270","275","231","210"],["5572","2572","7572","3572"],["1080","1050","1010","950"]]
    
    
    @State var index : Int = 0
    
    @State var score : Int = 0
    
    @State var subIndex : Int = 0
    
    @State var isCorrectAnswer : Bool = false

    @State var isAnswerCorrect : Bool = false
    
    @State var showLevelCompleted : Bool = false
    
    var body: some View {
        
        NavigationView {
        
        VStack (spacing: 30){
        
        Text(operations[index])
                .font(.system(size: 30,weight: .bold))
            
         
        
        HStack {
            
            ZStack {
                
                Button(answers[index][subIndex]){
                    
                    
                    isAnswerCorrect = answerCorrect(expect: correct_answers[index], actual: answers[index][subIndex])
                    
                    isCorrectAnswer.toggle()
                    
                    if isAnswerCorrect {
                        self.firstcircleColor = Color.green
                    }else {
                        self.firstcircleColor = Color.red
                    }
                    
                }
                .padding(55.0)
                .background(Circle()
                            .fill(firstcircleColor)
                            .frame(width: 100, height: 100, alignment: .center)
                            .shadow(color: firstcircleColor, radius: 20, x: 0, y: 0))
                .foregroundColor(.white)
                .font(.system(size: 20,weight: .bold))
                .animation(.easeOut(duration: 0.5))
                .alert(isPresented: $isCorrectAnswer, content: {
                    alertDialog(msg: isAnswerCorrect ? "Correct Answer" : "Wrong Answer")
                })
                
                
            }
            
            
            ZStack {
                
                
                Button(answers[index][subIndex+1]){
                    
                    isAnswerCorrect = answerCorrect(expect: correct_answers[index], actual: answers[index][subIndex+1])
                    
                    isCorrectAnswer.toggle()
                    
                    if isAnswerCorrect {
                        self.secondcircleColor = Color.green
                    }else {
                        self.secondcircleColor = Color.red
                    }
                    
                    
                }
                .padding(55.0)
                .background(Circle()
                            .fill(secondcircleColor)
                            .frame(width: 100, height: 100, alignment: .center)
                            .shadow(color: secondcircleColor, radius: 20, x: 0, y: 0))
                .foregroundColor(.white)
                .font(.system(size: 20,weight: .bold))
                .animation(.easeOut(duration: 0.5))
                .alert(isPresented: $isCorrectAnswer, content: {
                    alertDialog(msg: isAnswerCorrect ? "Correct Answer" : "Wrong Answer")
                })
                
                
            }
            
            
        }
            

        
        HStack {
            
            ZStack {
                
                
                Button(answers[index][subIndex+2]){
                    
                    isAnswerCorrect = answerCorrect(expect: correct_answers[index], actual: answers[index][subIndex+2])
                    
                    isCorrectAnswer.toggle()
                    
                    if isAnswerCorrect {
                        self.thirdcircleColor = Color.green
                    }else {
                        self.thirdcircleColor = Color.red
                    }
                    
                }
                .padding(55.0)
                .background(Circle()
                            .fill(thirdcircleColor)
                            .frame(width: 100, height: 100, alignment: .center)
                            .shadow(color: thirdcircleColor, radius: 20, x: 0, y: 0))
                .foregroundColor(.white)
                .font(.system(size: 20,weight: .bold))
                .animation(.easeOut(duration: 0.5))
                .alert(isPresented: $isCorrectAnswer, content: {
                    alertDialog(msg: isAnswerCorrect ? "Correct Answer" : "Wrong Answer")
                })
                
                
            }
            
            ZStack {
                
                
                Button(answers[index][subIndex+3]){
                    
                    isAnswerCorrect = answerCorrect(expect: correct_answers[index], actual: answers[index][subIndex+3])
                    
                    isCorrectAnswer.toggle()
                    
                    if isAnswerCorrect {
                        self.fourthcircleColor = Color.green
                    }else {
                        self.fourthcircleColor = Color.red
                        
                    }
                }
                .padding(55.0)
                .background(Circle()
                            .fill(fourthcircleColor)
                            .frame(width: 100, height: 100, alignment: .center)
                            .shadow(color: fourthcircleColor, radius: 20, x: 0, y: 0))
                .foregroundColor(.white)
                .font(.system(size: 20,weight: .bold))
                .animation(.easeOut(duration: 0.5))
                .alert(isPresented: $isCorrectAnswer, content: {
                    alertDialog(msg: isAnswerCorrect ? "Correct Answer" : "Wrong Answer")
                })
                
            }
            
            
        }
            
        HStack {
            
              Text("Score : \(score)")
                    .font(.system(size: 25,weight: .semibold))
                
        }
            
            NavigationLink(destination: CongratsScreen() ,isActive: $showLevelCompleted){
                EmptyView()
            }
            
            
            }
            
        }
    
    }
    
    func answerCorrect(expect:String,actual:String)->Bool{
        if expect == actual {
            return true
        }else {
            return false
        }
    }
    
    func alertDialog(msg:String)->Alert {
        let alert : Alert = Alert(title: Text(msg), dismissButton: .default(Text("Ok")){
            if index == correct_answers.count-1 {
                
                self.showLevelCompleted.toggle()
                
            }
            if isAnswerCorrect && index < correct_answers.count-1{
                self.index = self.index + 1
                self.firstcircleColor = .blue
                self.secondcircleColor = .blue
                self.thirdcircleColor = .blue
                self.fourthcircleColor = .blue
                self.score = self.score + 10
            }
        })
        return alert
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
