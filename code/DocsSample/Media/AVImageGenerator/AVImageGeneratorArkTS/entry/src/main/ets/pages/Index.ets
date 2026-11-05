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
import { media } from '@kit.MediaKit';
import { image } from '@kit.ImageKit';
import { common } from '@kit.AbilityKit';

const TAG = 'MetadataDemo';
@Entry
@Component
struct Index {
  // pixelMap对象声明，用于图片显示。
  @State pixelMap: image.PixelMap | undefined = undefined;

  build() {
    Row() {
      Column() {
        Button() {
          Text($r('app.string.FetchFrame'))
            .fontSize(26)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin({
          top: 20
        })
        .backgroundColor('#0D9FFB')
        .width('60%')
        .height('5%')
        .onClick(async () => {
          // 设置fdSrc, 获取视频的缩略图。
          await this.testFetchFrameByTime();
        })
        .id('FetchFrameButton')
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
  async testFetchFrameByTime() {
    try {
      // [Start AVImageGenerator_CreateAVImageGenerator]
      // 创建AVImageGenerator对象。
      let avImageGenerator: media.AVImageGenerator = await media.createAVImageGenerator();
      // [End AVImageGenerator_CreateAVImageGenerator]

      // [Start AVImageGenerator_SetFdSrc]
      // 获取当前组件所在Ability的Context，并通过Context获取应用文件路径。
      let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
      // 设置fdSrc，H264_AAC.mp4为rawfile目录下的预置资源，需要开发者根据实际情况进行替换。
      avImageGenerator.fdSrc = await context.resourceManager.getRawFd('H264_AAC.mp4');
      // [End AVImageGenerator_SetFdSrc]

      // [Start AVImageGenerator_fetchFrameByTime]
      // 初始化入参。
      let timeUs = 0; // 需要获取的缩略图在视频中的时间点。
      let queryOption = media.AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC; // AV_IMAGE_QUERY_NEXT_SYNC表示选取传入时间点或之后的关键帧。
      // 输出缩略图的格式参数。
      let param: media.PixelMapParams = {
        width : 300, // 输出的缩略图宽度。
        height : 300 // 输出的缩略图高度。
      };

      // 获取缩略图（promise模式）。
      this.pixelMap = await avImageGenerator.fetchFrameByTime(timeUs, queryOption, param);
      // [End AVImageGenerator_fetchFrameByTime]

      // [Start AVImageGenerator_release]
      // 释放资源（promise模式）。
      avImageGenerator.release();
      // [End AVImageGenerator_release]
      console.info(TAG, `release success.`);
    } catch (err) {
      console.error(`FetchFrameByTime errCode is ${err.code}, message is ${err.message}`);
    }
  }
}
