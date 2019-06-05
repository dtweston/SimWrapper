//
//  ContentView.swift
//  MobileExpo
//
//  Created by Dave Weston on 6/5/19.
//  Copyright © 2019 Binocracy. All rights reserved.
//

import SwiftUI

struct RuntimeRow : View {
    var runtime: Runtime
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(runtime.name)
                    .font(.title)
                    Text(runtime.identifier)
                        .font(.footnote)
                        .truncationMode(.middle)
                }
            Spacer()
            Image(systemName: "tv")
            }
        .padding()
    }
}

#if DEBUG
struct RuntimeRow_Previews : PreviewProvider {
    static var previews: some View {
        Group {
            RuntimeRow(runtime: ModelData.runtimes[0])
            RuntimeRow(runtime: ModelData.runtimes[1])
            RuntimeRow(runtime: ModelData.runtimes[2])
        }
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
#endif
