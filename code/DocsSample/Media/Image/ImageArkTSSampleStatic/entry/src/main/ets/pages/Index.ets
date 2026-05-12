'use static'

/*
* Copyright (C) 2026 Huawei Device Co., Ltd.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
* http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

import { Entry, Text, Column, Component, Button, ClickEvent } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import { image } from '@kit.ImageKit';
import { BusinessError } from '@kit.BasicServicesKit';

import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';

const TAG = 'ArkTS-sta';

@Entry
@Component
struct Index {
  @State stateVar: string = 'state var';
  message: string = 'var';

  context: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;

  getFile(fileName: string) {
    let filePath = this.context.filesDir + "/" + fileName;
    console.log(`${TAG}: image filePath: ${filePath}`);
    const file = fs.openSync(filePath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
    console.log(`${TAG}: fd is ${file.fd}`);
    return file;
  }

  getFd(fileName: string) {
    return this.getFile(fileName).fd;
  };

  getImageSourceByUri(uri: string) {
    console.log(`${TAG}: image filePath: ${uri}`);
    let ops: image.SourceOptions = {
      sourceDensity: 98,
    }
    let imageSource: image.ImageSource = image.createImageSource(uri, ops)!;
    return imageSource;
  }

  getImageSourceByFd(name: string) {
    let fd = this.getFd(name);
    console.log(`${TAG}: getFd: ${fd}`);
    let ops: image.SourceOptions = {
      sourceDensity: 98,
    }
    let imageSource: image.ImageSource = image.createImageSource(fd, ops)!;
    return imageSource;
  }

  getImageSourceByRawFile(fileName: string) {
    const resourceMgr = this.context.resourceManager;
    const rawFileFd = resourceMgr.getRawFdSync(fileName);
    let ops: image.SourceOptions = {
      sourceDensity: 98,
    }
    let imageSource: image.ImageSource = image.createImageSource(rawFileFd, ops)!;
    return imageSource;
  }

  build() {
    Column() {
      Text('createPixelMap Decode').fontSize(20)
      Button('Go to Decode Page').backgroundColor('#FF00FF00')
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({ url: 'pages/DecodePage' });
        })

      Text('createPicture').fontSize(20)
      Button('Go to Picture Page').backgroundColor('#FF00FF00')
        .onClick(() => {
          this.getUIContext().getRouter().pushUrl({ url: 'pages/PicturePage' });
        })

    }.width('100%').height('100%').padding(20)
  }
}

@Component
struct Child {
  @State stateVar: string = 'Child';

  build() {
    Text(this.stateVar).fontSize(50)
  }
}