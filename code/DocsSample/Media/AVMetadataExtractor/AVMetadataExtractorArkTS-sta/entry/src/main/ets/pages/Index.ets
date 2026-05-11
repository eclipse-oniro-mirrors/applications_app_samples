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

import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';
import { Entry, Text, TextAttribute, Image, Row, Column, Component, Button, ClickEvent } from '@ohos.arkui.component'
import { State, StorageLink } from '@ohos.arkui.stateManagement'
import common from '@ohos.app.ability.common';
import { Context, UIContext } from '@ohos.arkui.UIContext'
import resourceManager from '@ohos.resourceManager';
import media from '@ohos.multimedia.media';
import image from '@ohos.multimedia.image';
import { BusinessError } from '@ohos.base';
import { globalContext } from '../entryability/GlobalContext';

const TAG = 'MetadataDemo';

@Entry
@Component
struct index {
  // pixelMap对象声明，用于图片显示。
  @State pixelMap: image.PixelMap | undefined = undefined;
  @State stateVar: string = 'AVMetadata Demo';
  testFilename: string = 'test.mp4';
  message: string = 'AVMetadata Demo';
  avMetadataExtractor: media.AVMetadataExtractor | undefined;
  private context: Context | undefined;
  fileDescriptor: resourceManager.RawFileDescriptor | undefined;

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
          // 设置fdSrc, 获取视频元数据、封面和缩略图（异步接口以Promise形式调用）。
          await this.testStaticFetchMetadataFromFdSrcByPromise();
          // 设置fdSrc, 获取视频元数据、封面和缩略图（异步接口以Callback形式调用）。
          await this.testStaticFetchMetadataFromFdSrcByCallback();
          // 设置urlSrc, 获取视频元数据、封面和缩略图（异步接口以Promise形式调用）。
          await this.testStaticFetchMetadataFromUrlSrc();
          // 设置dataSrc, 获取视频元数据、封面和缩略图（文件必须在沙箱路径里存在）。
          await this.testStaticFetchMetadataFromDataSrc();
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

  // 在以下demo中，使用资源管理接口获取打包在HAP内的媒体资源文件，通过设置fdSrc属性，获取视频元数据并打印。
  // 获取视频专辑封面并通过Image控件显示在屏幕上。该demo以Promise形式进行异步接口调用。
  async testStaticFetchMetadataFromFdSrcByPromise() {
    try {
      // 创建AVMetadataExtractor对象。
      // [Start set_fdSrc]
      this.avMetadataExtractor = await media.createAVMetadataExtractor();

      // 设置fdSrc。
      this.context = globalContext.getAbilityContext();
      this.fileDescriptor = await this.context!!.resourceManager.getRawFd(this.testFilename);
      const descriptor: media.AVFileDescriptor = {
        fd: this.fileDescriptor!.fd,
        offset: this.fileDescriptor!.offset,
        length: this.fileDescriptor!.length
      };
      this.avMetadataExtractor!!.fdSrc = descriptor;
      // [End set_fdSrc]

      // 获取元数据（promise模式）。
      let metadata = await this.avMetadataExtractor!!.fetchMetadata();
      if (metadata !== undefined && metadata.videoWidth !== undefined && metadata.videoHeight !== undefined) {
        console.info(TAG, `get meta data, videoWidth: ${metadata.videoWidth}, videoHeight: ${metadata.videoHeight}`);
      }

      // 获取专辑封面（promise模式）。
      this.pixelMap = await this.avMetadataExtractor!!.fetchAlbumCover();

      // [Start fetch_frame]
      // 获取视频缩略图（promise模式）。
      let timeUs: Long = 0;
      let queryOption: media.AVImageQueryOptions = media.AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC;
      let param: media.PixelMapParams = {
        width: 300,
        height: 300
      };
      this.pixelMap = await this.avMetadataExtractor!!.fetchFrameByTime(timeUs, queryOption, param);
      // [End fetch_frame]

      // 释放资源（promise模式）。
      this.avMetadataExtractor!!.release();
      console.info(TAG, `release success.`);
    } catch (e) {
        console.error(TAG + `StaticFetchMetadataFromFdSrcByPromise, code is ${e.code}, message is ${e.message}`);
    }
  }

  // 在以下demo中，使用资源管理接口获取打包在HAP内的媒体资源文件，通过设置fdSrc属性，获取视频元数据并打印。
  // 批量获取视频缩略图并通过Image控件显示在屏幕上。该demo以Callback形式进行异步接口调用。
  async testStaticFetchMetadataFromFdSrcByCallback() {
    try {
      // 创建AVMetadataExtractor对象。
      this.avMetadataExtractor = await media.createAVMetadataExtractor();

      // 设置fdSrc。
      this.fileDescriptor = await this.context!!.resourceManager.getRawFd(this.testFilename);
      const descriptor: media.AVFileDescriptor = {
        fd: this.fileDescriptor!.fd,
        offset: this.fileDescriptor!.offset,
        length: this.fileDescriptor!.length
      };
      this.avMetadataExtractor!!.fdSrc = descriptor;

      // [Start fetch_frames]
      let onFrameFetched = (frameInfo: media.FrameInfo, err?: BusinessError | undefined): void => {
        if (err) {
          console.info(TAG, `fetchFramesByTimes callback fail, error = ${JSON.stringify(err)}`);
          return;
        }
        if (frameInfo !== undefined && frameInfo.image !== undefined && frameInfo.actualTimeUs != undefined) {
          this.pixelMap = frameInfo.image;
          console.info(TAG, `fetchFrameByTime callback succ.`);
        }
      };
      let timesUs: Long[] = [0];
      let queryOption = media.AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC;
      let param: media.PixelMapParams = {
        width: 300,
        height: 300
      };
      // 批量获取视频缩略图（callback模式）。
      this.avMetadataExtractor!!.fetchFramesByTimes(timesUs, queryOption, param, onFrameFetched);

      // 暂停批量获取视频缩略图
      this.avMetadataExtractor!!.cancelAllFetchFrames();
      // [End fetch_frames]

      // 获取元数据（callback模式）。
      this.avMetadataExtractor!!.fetchMetadata((error, metadata) => {
        if (error) {
          console.error(TAG, `fetchMetadata callback failed, err = ${JSON.stringify(error)}`);
          return;
        }
        if (metadata !== undefined && metadata.videoWidth !== undefined && metadata.videoHeight !== undefined) {
          console.info(TAG, `get meta data, videoWidth: ${metadata.videoWidth}, videoHeight: ${metadata.videoHeight}`);
        }
      })

      //获取专辑封面（callback模式）。
      this.avMetadataExtractor!!.fetchAlbumCover((err, pixelMap) => {
        if (err) {
          console.error(TAG, `fetchAlbumCover callback failed, err = ${JSON.stringify(err)}`);
          return;
        }
        this.pixelMap = pixelMap;
      })

        // 释放资源（callback模式）。
      this.avMetadataExtractor!!.release((error) => {
        if (error) {
          console.error(TAG, `release failed, err = ${JSON.stringify(error)}`);
          return;
        }
        console.info(TAG, `release success.`);
      })
    } catch (e) {
      console.error(TAG + `StaticFetchMetadataFromFdSrcByCallback, code is ${e.code}, message is ${e.message}`);
    }
  }

  // 在以下demo中，使用资源管理接口获取打包在HAP内的媒体资源文件，通过设置urlSrc属性，获取视频元数据并打印。
  // 获取视频专辑封面并通过Image控件显示在屏幕上。该demo以Promise形式进行异步接口调用。
  async testStaticFetchMetadataFromUrlSrc() {
    try {
      // 创建AVMetadataExtractor对象。
      this.avMetadataExtractor = await media.createAVMetadataExtractor();

      // 设置urlSrc，需根据实际资源路径替换以下url。
      let url = 'http://www.example.com';
      this.avMetadataExtractor!!.setUrlSource(url);

      // 获取元数据（promise模式）。
      let metadata = await this.avMetadataExtractor!!.fetchMetadata();
      if (metadata !== undefined && metadata.videoWidth !== undefined && metadata.videoHeight !== undefined) {
        console.info(TAG, `get meta data, videoWidth: ${metadata.videoWidth}, videoHeight: ${metadata.videoHeight}`);
      }

      // 获取视频缩略图（promise模式）。
      let timeUs: Long = 0;
      let queryOption = media.AVImageQueryOptions.AV_IMAGE_QUERY_NEXT_SYNC;
      let param: media.PixelMapParams = {
        width: 300,
        height: 300
      };
      this.pixelMap = await this.avMetadataExtractor!!.fetchFrameByTime(timeUs, queryOption, param);

      // 释放资源（promise模式）。
      this.avMetadataExtractor!!.release();
      console.info(TAG, `release success.`);
    } catch (e) {
      console.error(TAG + `StaticFetchMetadataFromUrlSrc, code is ${e.code}, message is ${e.message}`);
    }
  }

  // 在以下demo中，使用资源管理接口获取打包在HAP内的媒体资源文件，通过设置dataSrc属性，获取视频元数据并打印。
  // 获取视频专辑封面并通过Image控件显示在屏幕上。该demo以Promise形式进行异步接口调用。
  async testStaticFetchMetadataFromDataSrc() {
    try {
      // 创建AVMetadataExtractor对象。
      // [Start set_dataSrc]
      this.avMetadataExtractor = await media.createAVMetadataExtractor();

      this.context = globalContext.getAbilityContext();
      let rootPath: string = this.context!!.filesDir; // 应用文件目录。
      let fileName: string = '/test.mp4'; // test.mp4为应用文件目录下的预置资源，需要开发者根据实际情况进行替换。
      // 使用fileIo文件系统打开沙箱地址获取媒体文件地址，设置dataSrc属性。
      // 通过UIAbilityContext获取沙箱地址filesDir（以Stage模型为例）。
      let fd: Int = fs.openSync(rootPath + fileName, fs.OpenMode.READ_ONLY).fd;
      let fileSize: Long = fs.statSync(rootPath + fileName).size;
      let dataCallback = (buffer: ArrayBuffer, len: Long, pos?: Long | undefined): Int => {
        if (buffer == undefined || len == undefined || pos == undefined) {
          console.error(TAG, `dataSrc callback param invalid`);
          return -1;
        }
        let options: ReadOptions = {
          offset: pos,
          length: len
        };
        let num: Int = fs.readSync(fd, buffer, options).toInt();
        console.info(TAG, 'readAt end, num: ' + num);
        if (num > 0 && fileSize >= pos) {
          return num;
        }
        return -1;
      }
      let dataSrc: media.AVDataSrcDescriptor = {
        fileSize: fileSize,
        callback: dataCallback
      };
      // 设置dataSrc。
      this.avMetadataExtractor!!.dataSrc = dataSrc;
      // [End set_dataSrc]

      // 获取元数据（promise模式）。
      let metadata = await this.avMetadataExtractor!!.fetchMetadata();
      if (metadata !== undefined && metadata.videoWidth !== undefined && metadata.videoHeight !== undefined) {
        console.info(TAG, `get meta data, videoWidth: ${metadata.videoWidth}, videoHeight: ${metadata.videoHeight}`);
      }

      // 释放资源（promise模式）。
      this.avMetadataExtractor!!.release();
      console.info(TAG, `release success.`);
    } catch (e) {
      console.error(TAG + `StaticFetchMetadataFromDataSrc, code is ${e.code}, message is ${e.message}`);
    }
  }
}
