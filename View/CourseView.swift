//
//  CourseView.swift
//  QuizApp
//
//  Created by Lu Maw on 02/09/2023.
//
//COURSE VIEW FILE
import SwiftUI
import AVKit
import WebKit
import AVFoundation

import FirebaseFirestoreSwift
import SwiftUI

struct CourseView: View {
    @StateObject var viewModel : CourseViewViewModel
    @StateObject var viewModelForLogout = LogoutViewModel()
    
    private let userId: String
    init(userId: String){
        self.userId = userId
        
        self._viewModel = StateObject(wrappedValue: CourseViewViewModel(userId: userId))
    }
    
    
    
    




    var body: some View {
        NavigationView {
            VStack {
                Text("Java Beginner Course")
                    .font(.largeTitle)
                  


                List {
                    ForEach(0..<CourseDataService.topics.count, id: \.self) { index in
                        NavigationLink(
                            destination: TopicDetailView(
                                topic: CourseDataService.topics[index]
                            )
                        ) {
                            Text(CourseDataService.topics[index].title)
                        }
                    }
                }
                NavigationLink(destination: ContentView()) {
                    RoundedRectangle(cornerRadius: 30).foregroundColor(Color("AccentColor2"))
                    
                        .frame(width: 200, height: 60)
                    
                        .overlay(
                            Text("Take Quiz")
                                .foregroundColor(Color("AccentColor3"))
                                
                        )
                }
            }
            .navigationBarTitle("JAVA", displayMode: .inline)
        }


    }
    func getQuizQuestions(for topic: Topic) -> [QuizQuestion] {
        switch topic.title {
        case "Primitive Types":
            return primitiveTypesQuiz
            // Add similar cases for other topics and their respective quiz questions
        default:
            return []
        }
    }
}

struct CourseView_Previews: PreviewProvider {
    static var previews: some View {
        CourseView(userId: "cc721nt3T7Nzd8mz4RvtQw9htNy2")
    }
}



