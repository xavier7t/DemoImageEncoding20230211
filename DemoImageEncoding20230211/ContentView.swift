//
//  ContentView.swift
//  DemoImageEncoding20230211
//
//  Created by Xavier on 2/11/23.
//

import SwiftUI

struct ContentView: View {
    let str = encodedImage("demo")
    var body: some View {
        VStack {
            Spacer()
            Text("Image Encoded")
                .font(.title2)
                .bold()
            Text(str)
                .lineLimit(10)
            Spacer()
            
            decodedImage(str)!
                .resizable()
                .frame(width: 150, height: 150, alignment: .center)
            Text("Image Decoded")
                .font(.title2)
                .bold()
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func encodedImage(_ imageName: String) -> String {
    UIImage(named: imageName)?.pngData()?.base64EncodedString() ?? ""
}

func decodedImage(_ encodedImage: String) -> Image? {
    guard let imageData = Data(base64Encoded: encodedImage) else {
        return nil
    }
    return Image(uiImage: UIImage(data: imageData)!)
}
