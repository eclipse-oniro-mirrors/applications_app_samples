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
import { fileIo as fs, ReadOptions } from '@kit.CoreFileKit';

const TAG = 'MetadataDemo';

@Entry
@Component
struct Index {
  // pixelMap对象声明，用于图片显示。
  @State pixelMap: image.PixelMap | undefined = undefined;
  context: Context = this.getUIContext().getHostContext() as common.UIAbilityContext;
  rootPath: string = this.context.filesDir;
  testFilename: string = '/test.mp3';

  build() {
    Row() {
      Column() {
        Button() {
          Text($r('app.string.FetchMetadata'))
            .fontSize(30)
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
          // 设置fdSrc, 获取音频元数据和专辑封面（异步接口以Callback形式调用）。
          await this.testFetchMetadataFromFdSrcByCallback();
          // 设置fdSrc, 获取音频元数据和专辑封面（异步接口以Promise形式调用）。
          await this.testFetchMetadataFromFdSrcByPromise();
          // 通过fdSrc获取沙箱路径下音频元数据和专辑封面（文件必须在沙箱路径里存在）。
          await this.testFetchMetadataFromFdSrc();
          // 设置dataSrc, 获取沙箱路径下音频元数据和专辑封面（文件必须在沙箱路径里存在）。
          await this.testFetchMetadataFromDataSrc();
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

  // 在以下demo中，使用资源管理接口获取打包在HAP内的媒体资源文件，通过设置fdSrc属性，获取音频元数据并打印。
  // 获取音频专辑封面并通过Image控件显示在屏幕上。该demo以Callback形式进行异步接口调用。
  async testFetchMetadataFromFdSrcByCallback() {
    if (canIUse('SystemCapability.Multimedia.Media.AVMetadataExtractor')) {
      try {
        // [Start AVMetadataExtractor_CreateAVMetadataExtractor]
        // 创建AVMetadataExtractor对象。
        let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
        // [End AVMetadataExtractor_CreateAVMetadataExtractor]
        // [Start AVMetadataExtractor_SetFdSrc]
        // 设置fdSrc。
        let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
        avMetadataExtractor.fdSrc = await context.resourceManager.getRawFd('test.mp3');
        // [End AVMetadataExtractor_SetFdSrc]

        // [Start AVMetadataExtractor_FetchMetadata]
        // 获取元数据（callback模式）。
        avMetadataExtractor.fetchMetadata((error, metadata) => {
          if (error) {
            console.error(TAG, `fetchMetadata callback failed, err = ${JSON.stringify(error)}`);
            return;
          }
          console.info(TAG, `fetchMetadata callback success, genre: ${metadata.genre}`);
        })
        // [End AVMetadataExtractor_FetchMetadata]

        // [Start AVMetadataExtractor_fetchAlbumCover]
        //获取专辑封面（callback模式）。
        avMetadataExtractor.fetchAlbumCover((err, pixelMap) => {
          if (err) {
            console.error(TAG, `fetchAlbumCover callback failed, err = ${JSON.stringify(err)}`);
            return;
          }
          this.pixelMap = pixelMap;
          // [StartExclude AVMetadataExtractor_fetchAlbumCover]
          // 释放资源（callback模式）。
          avMetadataExtractor.release((error) => {
            if (error) {
              console.error(TAG, `release failed, err = ${JSON.stringify(error)}`);
              return;
            }
            console.info(TAG, `release success.`);
          })
          // [EndExclude AVMetadataExtractor_fetchAlbumCover]
        })
        // [End AVMetadataExtractor_fetchAlbumCover]
      } catch (e) {
        console.error(TAG + `FetchMetadataFromFdSrcByCallback, code is ${e.code}, message is ${e.message}`);
      }
    }
  }

  // 在以下demo中，使用资源管理接口获取打包在HAP内的媒体资源文件，通过设置fdSrc属性，获取音频元数据并打印。
  // 获取音频专辑封面并通过Image控件显示在屏幕上。该demo以Promise形式进行异步接口调用。
  async testFetchMetadataFromFdSrcByPromise() {
    if (canIUse('SystemCapability.Multimedia.Media.AVMetadataExtractor')) {
      try {
        // 创建AVMetadataExtractor对象。
        let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();

        // 设置fdSrc。
        let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
        avMetadataExtractor.fdSrc = await context.resourceManager.getRawFd('test.mp3');

        // 获取元数据（promise模式）。
        let metadata = await avMetadataExtractor.fetchMetadata();
        console.info(TAG, `get meta data, hasAudio: ${metadata.hasAudio}`);

        // 获取专辑封面（promise模式）。
        this.pixelMap = await avMetadataExtractor.fetchAlbumCover();

        // 释放资源（promise模式）。
        avMetadataExtractor.release();
        console.info(TAG, `release success.`);
      } catch (e) {
        console.error(TAG + `FetchMetadataFromFdSrcByPromise, code is ${e.code}, message is ${e.message}`);
      }
    }
  }

  // 在以下demo中，使用fs文件系统打开沙箱地址获取媒体文件地址，设置fdSrc属性，获取音频元数据并打印。
  // 获取音频专辑封面并通过Image控件显示在屏幕上。
  async testFetchMetadataFromFdSrc() {
    if (canIUse('SystemCapability.Multimedia.Media.AVMetadataExtractor')) {
      try {
        // [Start AVMetadataExtractor_SetOpenSync]
        // 创建AVMetadataExtractor对象。
        let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
        // 使用fileIo文件系统打开沙箱地址获取媒体文件地址，设置fdSrc属性。
        let context: Context = this.getUIContext().getHostContext() as common.UIAbilityContext;
        let rootPath: string = context.filesDir; // 应用文件目录。
        let testFilename: string = '/test.mp3'; // test.mp3为应用文件目录下的预置资源，需要开发者根据实际情况进行替换。
        avMetadataExtractor.fdSrc = fs.openSync(this.rootPath + this.testFilename);
        // [End AVMetadataExtractor_SetOpenSync]

        // 获取元数据（promise模式）。
        let metadata = await avMetadataExtractor.fetchMetadata();
        console.info(TAG, `get meta data, mimeType: ${metadata.mimeType}`);

        // 获取专辑封面（promise模式）。
        this.pixelMap = await avMetadataExtractor.fetchAlbumCover();

        // 释放资源（promise模式）。
        avMetadataExtractor.release();
        console.info(TAG, `release data source success.`);
      } catch (e) {
        console.error(TAG + `FetchMetadataFromFdSrc, code is ${e.code}, message is ${e.message}`);
      }
    }
  }

  // 在以下demo中，使用fs文件系统打开沙箱地址获取媒体文件地址，设置dataSrc属性，获取音频元数据并打印。
  // 获取音频专辑封面并通过Image控件显示在屏幕上。
  async testFetchMetadataFromDataSrc() {
    if (canIUse('SystemCapability.Multimedia.Media.AVMetadataExtractor')) {
      try {
        // [Start AVMetadataExtractor_SetDataSrc]
        // 创建AVMetadataExtractor对象。
        let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
        let context: Context = this.getUIContext().getHostContext() as common.UIAbilityContext;
        let rootPath: string = context.filesDir; // 应用文件目录。
        let testFilename: string = '/test.mp3'; // test.mp3为应用文件目录下的预置资源，需要开发者根据实际情况进行替换。
        // 使用fileIo文件系统打开沙箱地址获取媒体文件地址，设置dataSrc属性。
        // 通过UIAbilityContext获取沙箱地址filesDir（以Stage模型为例）。
        let fd: number = fs.openSync(this.rootPath + this.testFilename).fd;
        let fileSize: number = fs.statSync(this.rootPath + this.testFilename).size;
        // 设置dataSrc描述符，通过callback从文件中获取资源，写入buffer中。
        let dataSrc: media.AVDataSrcDescriptor = {
          fileSize: fileSize,
          callback: (buffer, len, pos) => {
            if (buffer == undefined || len == undefined || pos == undefined) {
              console.error(TAG, `dataSrc callback param invalid`);
              return -1;
            }
            let options: ReadOptions = {
              offset: pos,
              length: len
            };
            let num = fs.readSync(fd, buffer, options);
            console.info(TAG, 'readAt end, num: ' + num);
            if (num > 0 && fileSize >= pos) {
              return num;
            }
            return -1;
          }
        };
        // 设置dataSrc。
        avMetadataExtractor.dataSrc = dataSrc;
        // [End AVMetadataExtractor_SetDataSrc]
        
        
        // [Start AVMetadataExtractor_FetchMetadataPromise]
        // 获取元数据（promise模式）。
        let metadata = await avMetadataExtractor.fetchMetadata();
        console.info(TAG, `get meta data, mimeType: ${metadata.mimeType}`);
        // [End AVMetadataExtractor_FetchMetadataPromise]

        // [Start AVMetadataExtractor_fetchAlbumCoverPromise]
        // 获取专辑封面（promise模式）。
        this.pixelMap = await avMetadataExtractor.fetchAlbumCover();
        // [End AVMetadataExtractor_fetchAlbumCoverPromise]

        // [Start AVMetadataExtractor_ReleasePromise]
        // 释放资源（promise模式）。
        avMetadataExtractor.release();
        // [End AVMetadataExtractor_ReleasePromise]

        console.info(TAG, `release data source success.`);
      } catch (e) {
        console.error(TAG + `FetchMetadataFromDataSrc, code is ${e.code}, message is ${e.message}`);
      }
    }
  }

  async fetchUrlMetadata() {
    try {
      // [Start AVMetadataExtractor_SetUrlSource]
      // 创建AVMetadataExtractor对象
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      // 调用setUrlSource设置网络点播媒体资源URL，用来获取在线音视频元数据和在线视频缩略图。
      let url = "http://vd3.bdstatic.com/mda-pdc2kmwtd2vxhiy4/cae_h264/1681502407203843413/mda-pdc2kmwtd2vxhiy4.mp4";
      let headers: Record<string, string> = {
        "User-Agent" : "User-Agent-Value"
      };
      avMetadataExtractor.setUrlSource(url, headers);
      // [End AVMetadataExtractor_SetUrlSource]
      let metadata = await avMetadataExtractor.fetchMetadata();
      console.info(`meta data: ${JSON.stringify(metadata)}`);
      // 释放资源（promise模式）
      avMetadataExtractor.release();
      console.info(`Release avMetadataExtractor successfully`);
    } catch (e) {
      console.error(`FetchUrlMetadata error, code is ${e.code}, message is ${e.message}`);
    }
  }

  async testFetchUrlMetadata() {
    try {
      // 创建AVMetadataExtractor对象。
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      // 设置fdSrc。
      let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
      avMetadataExtractor.fdSrc = await context.resourceManager.getRawFd('test.mp3');
      
      // [Start AVMetadataExtractor_Width_Height]
      // 获取视频资源的宽和高。
      let metadata = await avMetadataExtractor.fetchMetadata();
      let width = metadata.videoWidth;
      let height = metadata.videoHeight;
      // [End AVMetadataExtractor_Width_Height]
      
      console.info(`meta data width: ${JSON.stringify(width)}`);
      console.info(`meta data height: ${JSON.stringify(height)}`);
      // 释放资源（promise模式）
      avMetadataExtractor.release();
      console.info(`Release avMetadataExtractor successfully`);
    } catch (e) {
      console.error(`FetchUrlMetadata error, code is ${e.code}, message is ${e.message}`);
    }
  }

  async fetchFrameByTime() {
    // 创建AVMetadataExtractor对象
    let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
    
    // [Start AVMetadataExtractor_FetchFrameByTime]
    // 接口入参声明。
    let timeUs: number = 0;
    let queryOption: media.AVImageQueryOptions = media.AVImageQueryOptions.AV_IMAGE_QUERY_PREVIOUS_SYNC;
    let param: media.PixelMapParams = {
      width : 300,
      height : 300
    }
    // 获取视频缩略图（promise模式）。
    this.pixelMap = await avMetadataExtractor.fetchFrameByTime(timeUs, queryOption, param);
    // [End AVMetadataExtractor_FetchFrameByTime]
    // 释放资源（promise模式）
    avMetadataExtractor.release();
  }

  async FetchFrameByTimes() {
    try {
      let avMetadataExtractor: media.AVMetadataExtractor = await media.createAVMetadataExtractor();
      
      // [Start AVMetadataExtractor_FetchFramesByTimes]
      // 接口入参声明。
      let timesUs: number[] = [0];
      let queryOption: media.AVImageQueryOptions = media.AVImageQueryOptions.AV_IMAGE_QUERY_PREVIOUS_SYNC;
      let param: media.PixelMapParams = {
        width : 300,
        height : 300
      }
      // 获取视频缩略图（callback模式）。
      avMetadataExtractor.fetchFramesByTimes(timesUs, queryOption, param, (frameInfo: media.FrameInfo, err: BusinessError) => {
        if (err) {
          console.error(TAG, `fetch frame failed, error code: ${err.code}, error message: ${err.message}`);
          return;
        }
        console.info(TAG, `fetch frame successfully.`);
        if (frameInfo !== undefined && frameInfo.image !== undefined) {
          this.pixelMap = frameInfo.image;
        }
      });

      // 批量获取缩略图任务耗时可能较长，可以调用cancelAllFetchFrames停止在当前extractor上所有缩略图获取任务（仅对批量获取接口生效）。
      avMetadataExtractor.cancelAllFetchFrames();
      // [End AVMetadataExtractor_FetchFramesByTimes]

      // [Start AVMetadataExtractor_Release]
      // 释放资源（callback模式）。
      avMetadataExtractor.release((error) => {
        if (error) {
          console.error(TAG, `release failed, err = ${JSON.stringify(error)}`);
          return;
        }
        console.info(TAG, `release success.`);
      })
      // [End AVMetadataExtractor_Release]
    } catch (err) {
      console.error(`sunyin>>FetchFrameByTimes error, code is ${err.code}, message is ${err.message}`);
    }
  }
}
