//
//  ContentView.swift
//  Dad Jokes
//
//  Created by keith Talbot on 11/12/24.
//

import SwiftUI

struct JokeView: View {
    
    @State private var jokeString = "No joke Availiable"
    @State private var fetching = false
    @AppStorage("jokeType") var jokeType: JokeType = .misc
    
    var body: some View {
        VStack {
           
            HStack (alignment: .center) {
                
                Image("StewartLynch")
                    .resizable()
                    .frame(width: 60.0 , height: 60)
                
                VStack(alignment: .leading){
                    ForEach(JokeType.allCases, id: \.self) { item in
                        Button {
                            jokeType = item
                            Task {
                                await getJoke(jokeType.type)
                            }
                        } label:{
                            Text(item.rawValue)
                                .foregroundColor(item == jokeType ? .red : Color.primary)
                        }
                    }
                }
                
                .frame(height:104)
                
                }
            
               if fetching {
                    ProgressView()
                } else {
                    VStack{
                        
                        Text(jokeString)
                        .minimumScaleFactor(0.5)
                        .fixedSize(horizontal: false, vertical: true)
                        HStack{
                            Spacer()
                            
                            Button {
                                
                                let pasteboard = NSPasteboard.general
                                pasteboard.clearContents()
                                pasteboard.setString(jokeString, forType: NSPasteboard.PasteboardType.string)
                                
                            } label:{
                                Text("Copy")
                            }
                        }
                        
                    }
                       
                }
            
           Spacer()
            
        }
        
        .padding()
        
        .task {
            await getJoke(jokeType.type)
        }
        
    }
    
    func getJoke(_ type: String) async  {
        
        
        let url = "https://v2.jokeapi.dev/joke/\(type)?blacklistFlags=nsfw,religious,political,racist,sexist,explicit&type=single"
        print("Type = \(type)")
        print("URL=\(url)")
        let apiService = APIService(urlString: url)
        
        
        fetching.toggle()
        defer {
            fetching.toggle()
        }
        do{
            let joke:Joke = try await apiService.getJSON()
            jokeString = joke.joke
            print("Joke = \(jokeString)")
            
        }catch {
            jokeString = error.localizedDescription
            
        }
        
        
        
        //https://v2.jokeapi.dev/joke/Programming?blacklistFlags=nsfw,religious,political,racist,sexist,explicit
        
    }
}

#Preview {
    JokeView()
        .frame(width: 225, height: 255)
        
}
