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

const TAG = 'PicturePage';


@Entry
@Component
struct PicturePage {
  @State pixelMap: image.PixelMap | undefined = undefined;
  @State picture: image.Picture | undefined = undefined;
  @State message: string = 'Click button to create Picture';

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


  async createPicture() {
    try {
      this.message = 'Creating Picture...';
      let imageSource = this.getImageSourceByRawFile(this.RAW_FILE_NAME);
      let imageInfo = await imageSource.getImageInfo();
      console.info(`${TAG}: imageInfo: ${JSON.stringify(imageInfo)}`);

      if (!imageInfo) {
        console.error(`${TAG}: imageInfo is undefined`);
        this.message = 'Failed to get image info';
        return;
      }

      let supportedMimeTypes = ['image/jpeg', 'image/heif', 'image/heic'];
      if (!supportedMimeTypes.includes(imageInfo.mimeType)) {
        console.error(`${TAG}: Unsupported MIME type: ${imageInfo.mimeType}`);
        this.message = `Unsupported MIME type: ${imageInfo.mimeType}`;
        return;
      }

      this.picture = await imageSource.createPicture();
      if (this.picture) {
        console.info(`${TAG}: Succeeded in creating Picture object.`);
        let mainPixelmap = this.picture!.getMainPixelmap();
        if (mainPixelmap) {
          console.info(`${TAG}: Succeeded in getting mainPixelmap.`);
          this.pixelMap = mainPixelmap;
          this.message = 'Create Picture success!';
        } else {
          console.error(`${TAG}: Failed to get mainPixelmap.`);
          this.message = 'Failed to get mainPixelmap';
        }
      } else {
        console.error(`${TAG}: Failed to create Picture.`);
        this.message = 'Failed to create Picture';
      }
    } catch (err) {
      console.error(`${TAG}: createPicture failed: ${err}`);
      this.message = `Create Picture failed: ${err}`;
    }
  }

  build() {
    Column() {
      Text('createPicture Page').fontSize(24).margin({ bottom: 20 })

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
              this.picture = undefined;
              this.message = 'Selected: test.jpeg, click create to process';
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

      Button('Create Picture (RawFile)').backgroundColor('#FF00FF00').margin({ bottom: 10 })
        .onClick(() => {
          this.createPicture();
        })

      Button('Back').backgroundColor('#FFFF0000')
        .onClick(() => {
          this.getUIContext().getRouter().back();
        })
    }.width('100%').height('100%').padding(20)
  }
}