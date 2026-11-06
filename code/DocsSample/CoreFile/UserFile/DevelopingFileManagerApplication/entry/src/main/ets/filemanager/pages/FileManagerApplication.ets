/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

// [Start import_interface_file_manager]
import { BusinessError } from '@kit.BasicServicesKit';
import { fileIo as fs } from '@kit.CoreFileKit';
import Logger from '../../common/Logger';
// [End import_interface_file_manager]

@Entry
@Component
struct Index {
  @State uriMessage: string = ''; // state variable used to display message

  build() {
    Column() {
      // create file button
      Button($r('app.string.createFileButton'))
        .width('80%') // button width takes 80% of screen width
        .height('10%') // button height takes 10% of screen height
        .fontSize($r('app.float.size_25')) // button font size is 25
        .borderRadius($r('app.float.size_25')) // button corner radius is 25
        .backgroundColor($r('app.color.whiteColor')) // button background color is white
        .shadow({
          radius: $r('app.float.size_10'), // shadow radius is 10
          color: $r('app.color.grayColor'), // shadow color is gray
          offsetX: $r('app.float.size_15'), // shadow horizontal offset is 15
          offsetY: $r('app.float.size_15') // shadow vertical offset is 15
        })
        .fontColor($r('app.color.blackColor')) // button font color is black
        .onClick(() => {
          this.creatFile();
        })
      Text(this.uriMessage)
        .fontSize($r('app.float.size_50')) // text font size is 50
        .fontWeight(FontWeight.Bold) // text font is bold
        .margin({ top: $r('app.float.size_20') }) // text top margin is 20
    }
    .width('100%') // outer column width fills the screen
    .height('100%') // outer column height fills the screen
    .alignItems(HorizontalAlign.Center) // align items horizontally centered
    .justifyContent(FlexAlign.Center) // justify content vertically centered
    .backgroundColor($r('app.color.lightGrayColor')) // background color is light gray
  }

  // [Start create_file_promise]
  async creatFile(): Promise<void> {
    try {
      // create a file in the sandbox directory and write content
      let hostContext = this.getUIContext().getHostContext();
      if (!hostContext) {
        return;
      }
      let path: string = hostContext.filesDir + '/file2.txt';
      let file: fs.File = fs.openSync(path, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE | fs.OpenMode.TRUNC);
      fs.writeSync(file.fd, 'DevelopingFileManagerApplication demo file');
      fs.closeSync(file);
      Logger.info('createFile sucess, filePath: ' + path);
      this.uriMessage = 'CreateDocumentUriSuccess';
    } catch (err) {
      let error: BusinessError = err as BusinessError;
      Logger.error('createFile failed, errCode:' + error.code + ', errMessage:' + error.message);
    }
  }
  // [End create_file_promise]
}