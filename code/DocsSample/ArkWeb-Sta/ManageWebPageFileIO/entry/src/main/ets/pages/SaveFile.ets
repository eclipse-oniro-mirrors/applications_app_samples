'use static'

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
// [Start SaveFile]
import picker from '@ohos.file.picker';
import { $rawfile, AcceptableFileType, Column, Component, Entry, Web } from '@ohos.arkui.component';
import webview from '@ohos.web.webview';


let defaultPublicPath = 'storage/Users/currentUser/';
let defaultBasePath = 'file://docs/';
let wellKnownDirectoryMap = new Map<string, string>([
  ['desktop', defaultPublicPath + 'desktop'],
  ['documents', defaultPublicPath + 'documents'],
  ['downloads', defaultPublicPath + 'download'],
  ['music', defaultPublicPath + 'music'],
  ['pictures', defaultPublicPath + 'images'],
  ['videos', defaultPublicPath + 'videos'],
]);

function getUri(path : string) {
  let publicDir = wellKnownDirectoryMap.get(path);
  if (publicDir !== undefined) {
    path = publicDir;
  }
  return defaultBasePath + path;
}

function getFileName(name : string) {
  let fileName = name;
  let lastDotIndex = name.lastIndexOf('.');
  if (lastDotIndex !== -1) {
    fileName = name.substring(0, lastDotIndex);
  }
  return fileName;
}

@Entry
@Component
struct WebComponent {
  controller: webview.WebviewController = new webview.WebviewController(undefined);

  build() {
    Column() {
      Web({ src: $rawfile('index.html'), controller: this.controller })
        .onShowFileSelector((event) => {
          console.info('onShowFileSelector Suggested Name is ' + event.fileSelector.getSuggestedName());
          console.info('onShowFileSelector Default Path is ' + event.fileSelector.getDefaultPath());
          console.info('onShowFileSelector Descriptions are ' + event.fileSelector.getDescriptions());
          console.info('onShowFileSelector AcceptAllOptionExcluded is ' + event.fileSelector.isAcceptAllOptionExcluded());
          const documentSaveOptions: picker.DocumentSaveOptions = {};
          documentSaveOptions.newFileNames = new Array<string>();
          documentSaveOptions.newFileNames?.push(getFileName(event.fileSelector.getSuggestedName()));
          documentSaveOptions.defaultFilePathUri = getUri(event.fileSelector.getDefaultPath());
          let accepts : Array<Array<AcceptableFileType>> = event.fileSelector.getAcceptableFileTypes();
          let descriptions : Array<string> = event.fileSelector.getDescriptions();
          documentSaveOptions.fileSuffixChoices = new Array<string>();
          let n = accepts.length;
          for (let i = 0; i < n; i++) {
            let m = accepts[i].length;
            let extList = Array<string>();
            for (let j = 0; j < m; j++) {
              extList.push(accepts[i][j].acceptableType.join(','));
            }
            let ext = extList.join(',');
            let desc = descriptions[i] + '(' + ext + ')' + '|';
            documentSaveOptions.fileSuffixChoices?.push(desc + ext);
          }
          if (!event.fileSelector.isAcceptAllOptionExcluded()) {
            documentSaveOptions.fileSuffixChoices?.push('所有文件(*.*)' + '|' + '*.*');
          }
          let uri: string | null = null;
          const documentViewPicker = new picker.DocumentViewPicker(this.getUIContext().getHostContext()!);
          documentViewPicker.save(documentSaveOptions).then((documentSelectResult) => {
            uri = documentSelectResult[0];
            console.info('documentViewPicker.save to file succeed and uri is:' + uri);
            if (event) {
              event.result.handleFileList(documentSelectResult);
            }
          }).catch((err) => {
            console.error(`Invoke documentViewPicker.save failed, code is ${err.code}, message is ${err.message}`);
          })
          return true;
        })
    }
  }
}
// [End SaveFile]