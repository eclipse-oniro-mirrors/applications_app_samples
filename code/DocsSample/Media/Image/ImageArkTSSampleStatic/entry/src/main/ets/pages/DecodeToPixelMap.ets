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

import { Entry, Text, Column, Component, Button, ClickEvent, Image, Row, FlexAlign } from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import hilog from '@ohos.hilog'
import { image } from '@kit.ImageKit';
import { BusinessError } from '@kit.BasicServicesKit';

import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';

const TAG = 'DecodePage';


@Entry
@Component
struct DecodePage {
  @State pixelMap: image.PixelMap | undefined = undefined;
  @State message: string = 'Click button to decode image';

  context: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;
  RAW_FILE_NAME: string = 'test.jpeg';
  @State selectedImage: string = 'test.jpeg';

  getImageSourceByRawFile(fileName: string) {
    const resourceMgr = this.context.resourceManager;
    const rawFileFd = resourceMgr.getRawFdSync(fileName);
    console.log(`${TAG}: rawFileFd: ${JSON.stringify(rawFileFd)}`);
    let ops: image.SourceOptions = {
      sourceDensity: 98,
    }
    let imageSource: image.ImageSource = image.createImageSource(rawFileFd, ops)!;
    return imageSource;
  }

  async decodeImage() {
    try {
      this.message = 'Decoding...';
      let imageSource = this.getImageSourceByRawFile(this.RAW_FILE_NAME);
      let imageInfo = await imageSource.getImageInfo();
      console.info(`${TAG}: imageInfo: ${JSON.stringify(imageInfo)}`);

      if (!imageInfo) {
        console.error(`${TAG}: imageInfo is undefined`);
        this.message = 'Failed to get image info';
        return;
      }

      let supportedMimeTypes = ['image/jpeg', 'image/png', 'image/bmp', 'image/webp', 'image/heif', 'image/heic', 'image/gif'];
      if (!supportedMimeTypes.includes(imageInfo.mimeType)) {
        console.error(`${TAG}: Unsupported MIME type: ${imageInfo.mimeType}`);
        this.message = `Unsupported MIME type: ${imageInfo.mimeType}`;
        return;
      }

      let pixelmap = await imageSource.createPixelMap();
      if (pixelmap) {
        console.info(`${TAG}: Succeeded in creating pixelMap object.`);
        this.pixelMap = pixelmap;
        this.message = 'Decode success!';
      } else {
        console.error(`${TAG}: Failed to create pixelMap.`);
        this.message = 'Failed to create pixelMap';
      }
    } catch (err) {
      console.error(`${TAG}: decodeImage failed: ${err}`);
      this.message = `Decode failed: ${err}`;
    }
  }

  build() {
    Column() {
      Text('createPixelMap Decode Page').fontSize(24).margin({ bottom: 20 })

      Text(this.message).fontSize(16).margin({ bottom: 20 })

      if (this.pixelMap) {
        Image(this.pixelMap).width(300).height(300).margin({ bottom: 20 })
      }

      Text('Select Image:').fontSize(16).margin({ bottom: 5 })
      Text(this.selectedImage).fontSize(14).margin({ bottom: 10 })

      Column() {
        Row() {
          Button('test.jpeg')
            .fontSize(12)
            .backgroundColor(this.selectedImage === 'test.jpeg' ? '#FF0000FF' : '#FFA0A0A0')
            .onClick(() => {
              this.selectedImage = 'test.jpeg';
              this.RAW_FILE_NAME = 'test.jpeg';
              this.pixelMap = undefined;
              this.message = 'Selected: test.jpeg, click decode to process';
            })

          Button('test.png')
            .fontSize(12)
            .backgroundColor(this.selectedImage === 'test.png' ? '#FF0000FF' : '#FFA0A0A0')
            .onClick(() => {
              this.selectedImage = 'test.png';
              this.RAW_FILE_NAME = 'test.png';
              this.pixelMap = undefined;
              this.message = 'Selected: test.png, click decode to process';
            })
        }
        .width('100%')
        .justifyContent(FlexAlign.Center)

        Row() {
          Button('test.bmp')
            .fontSize(12)
            .backgroundColor(this.selectedImage === 'test.bmp' ? '#FF0000FF' : '#FFA0A0A0')
            .onClick(() => {
              this.selectedImage = 'test.bmp';
              this.RAW_FILE_NAME = 'test.bmp';
              this.pixelMap = undefined;
              this.message = 'Selected: test.bmp, click decode to process';
            })

          Button('test.webp')
            .fontSize(12)
            .backgroundColor(this.selectedImage === 'test.webp' ? '#FF0000FF' : '#FFA0A0A0')
            .onClick(() => {
              this.selectedImage = 'test.webp';
              this.RAW_FILE_NAME = 'test.webp';
              this.pixelMap = undefined;
              this.message = 'Selected: test.webp, click decode to process';
            })

          Button('test.heic')
            .fontSize(12)
            .backgroundColor(this.selectedImage === 'test.heic' ? '#FF0000FF' : '#FFA0A0A0')
            .onClick(() => {
              this.selectedImage = 'test.heic';
              this.RAW_FILE_NAME = 'test.heic';
              this.pixelMap = undefined;
              this.message = 'Selected: test.heic, click decode to process';
            })
        }
        .width('100%')
        .justifyContent(FlexAlign.Center)

      }
      .margin({ bottom: 10 })
      .width('100%')

      Button('Decode Image (RawFile)').backgroundColor('#FF00FF00').margin({ bottom: 10 })
        .onClick(() => {
          this.decodeImage();
        })

      Button('Back').backgroundColor('#FFFF0000')
        .onClick(() => {
          this.getUIContext().getRouter().back();
        })
    }.width('100%').height('100%').padding(20)
  }
}