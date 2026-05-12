/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { Entry, Text, TextAttribute, Image, Row, Column, Component, Button, ClickEvent } from '@ohos.arkui.component'
import { State, StorageLink } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import { Context, UIContext } from '@ohos.arkui.UIContext'
import resourceManager from '@ohos.resourceManager';
import media from '@ohos.multimedia.media';
import image from '@ohos.multimedia.image';
import { globalContext } from '../entryability/GlobalContext';

const TAG = 'MetadataDemo';

@Entry
@Component
struct index {
  // pixelMap对象声明，用于图片显示。
  @State pixelMap: image.PixelMap | undefined = undefined;
  private testFilename: string = 'H264_AAC.mp4';
  private message: string = 'AVMetadata Demo';
  private avImageGenerator: media.AVImageGenerator | undefined;
  private context: Context | undefined;
  private fileDescriptor: resourceManager.RawFileDescriptor | undefined;

  build() {
    Row() {
      Column() {
        Button(this.message)
          .margin({
            top: 20
          })
          .backgroundColor('#0D9FFB')
          .width('60%')
          .height('5%')
          .onClick(async () => {
            // 设置fdSrc, 获取视频的缩略图。
            await this.testStaticFetchFrameByTime();
          })
          .id('FetchMetadataButton')

        Image(this.pixelMap).width(300).height(300)
          .margin({
            top: 20
          })
      }
      .width('100%')
    }
    .height('100%')
  }

  // 在以下demo中，使用资源管理接口获取打包在HAP内的视频文件，通过设置fdSrc属性。
  // 获取视频指定时间的缩略图，并通过Image控件显示在屏幕上。
  async testStaticFetchFrameByTime() {
    try {
      // 创建AVImageGenerator对象。
      // [Start set_fdSrc]
      this.avImageGenerator = await media.createAVImageGenerator();

      // 设置fdSrc。
      this.context = globalContext.getAbilityContext();
      this.fileDescriptor = await this.context!!.resourceManager.getRawFd(this.testFilename);
      const descriptor: media.AVFileDescriptor = {
        fd: this.fileDescriptor!.fd,
        offset: this.fileDescriptor!.offset,
        length: this.fileDescriptor!.length
      };
      this.avImageGenerator!!.fdSrc = descriptor;
      // [End set_fdSrc]

      // 初始化入参。
      // [Start fetch_frame]
      let timeUs: Long = 0;
      let queryOption = media.AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC;
      let param: media.PixelMapParams = {
        width: 300,
        height: 300
      };

      // 获取缩略图（promise模式）。
      this.pixelMap = await this.avImageGenerator!!.fetchFrameByTime(timeUs, queryOption, param);
      // [End fetch_frame]

      // 释放资源（promise模式）。
      this.avImageGenerator!!.release();
      console.info(TAG, `release success.`);
    } catch (err) {
      console.error(`FetchFrameByTime errCode is ${err.code}, message is ${err.message}`);
    }
  }
}
