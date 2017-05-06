//
//  FileReaderImpl.swift
//  Rubicon
//
//  Created by Kryštof Matěj on 06/05/2017.
//  Copyright © 2017 Kryštof Matěj. All rights reserved.
//

import Foundation

public protocol FileReader {
    func readFiles(at path: String) -> String
}

class FileReaderImpl: FileReader {

    func readFiles(at path: String) -> String {
        let fileNames = findFileNames(at: path)
        let contentOfFiles = fileNames.flatMap({ return try? String(contentsOfFile: $0, encoding: .utf8) })
        return contentOfFiles.reduce("", { $0 + "\n\n" + $1})
    }

    private func findFileNames(at path: String) -> [String] {
        let fileManager = FileManager.default

        var fileNames = [String]()

        let items = try! FileManager.default.contentsOfDirectory(atPath: path)

        for fileName in items {
            let itemPath = path + "/" + fileName

            var isDir : ObjCBool = false
            if fileManager.fileExists(atPath: itemPath, isDirectory:&isDir) {
                if isDir.boolValue {
                    fileNames += findFileNames(at: itemPath)
                } else {
                    if fileName.hasSuffix(".swift") {
                        fileNames.append(itemPath)
                    }
                }
            }
        }

        return fileNames
    }

}
