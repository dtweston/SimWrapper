//
//  RuntimeList.swift
//  MobileExpo
//
//  Created by Dave Weston on 6/5/19.
//  Copyright © 2019 Binocracy. All rights reserved.
//

import SwiftUI

public struct RuntimeList : View {
    var body: some View {
        List(ModelData.runtimes) { runtime in
            RuntimeRow(runtime: runtime)
        }
    }
}

#if DEBUG
struct RuntimeList_Previews : PreviewProvider {
    static var previews: some View {
        RuntimeList()
    }
}
#endif
