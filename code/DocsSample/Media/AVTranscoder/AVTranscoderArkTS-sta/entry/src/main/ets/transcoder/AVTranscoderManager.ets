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
import media from '@ohos.multimedia.media';
import fs from '@ohos.file.fs';
import { BusinessError } from '@ohos.base';
import resourceManager from '@ohos.resourceManager';
import { Context, UIContext } from '@ohos.arkui.UIContext'
import { TouchObject, KeyEvent, MouseEvent } from '@ohos.arkui.component';
import { globalContext } from '../entryability/GlobalContext';

// 延迟函数
function sleep(ms: number): void {
  const exitTime = new Date().getTime() + ms;
  while (new Date().getTime() < exitTime) {}
}

export class AVTranscoderDemo {
  private avTranscoder: media.AVTranscoder | undefined = undefined;
  private context: Context | undefined;
  private currentProgress: int = 0;
  private rawFileDescriptor: resourceManager.RawFileDescriptor | undefined;
  private outputFilePath!: string;
  private file!: fs.File;
  constructor(context: Context | undefined) {
    if (context != undefined) {
      this.context = context;
    }
  }
  // [start create_transcoderconfig]
  private avConfig: media.AVTranscoderConfig = {
    audioBitrate: 100000, // 音频比特率。
    audioCodec: media.CodecMimeType.AUDIO_AAC, // 音频编码格式。
    fileFormat: media.ContainerFormatType.CFT_MPEG_4, // 封装格式。
    videoBitrate: 200000, // 视频比特率。
    videoCodec: media.CodecMimeType.VIDEO_AVC, // 视频编码格式。
  };
  // [end create_transcoderconfig]

  // [start create_callback]
  // 注册avTranscoder回调函数。
  setAVTranscoderCallback(): void {
    if (this.avTranscoder != undefined) {
      // 转码完成回调函数。
      this.avTranscoder?.onComplete(() => {
        console.log(`AVTranscoder is completed`);
        this.releaseTranscoderingProcess();
      });
      // 错误上报回调函数。
      this.avTranscoder?.onError((err: BusinessError) => {
        console.error(`AVTranscoder failed, code is ${err.code}, message is ${err.message}`);
      });
      // 进度上报回调函数
      this.avTranscoder?.onProgressUpdate((progress: int) => {
        console.info(`AVTranscoder progressUpdate = ${progress}`);
        this.currentProgress = progress;
      })
    }
  }
  // [end create_callback]

  // 开始转码对应的流程。
  async startTranscoderingProcess(): Promise<void> {
    if (this.avTranscoder != undefined) {
      await this.avTranscoder!!.release();
      this.avTranscoder = undefined;
    }
    // [start create_instance]
    // 1.创建转码实例。
    this.avTranscoder = await media.createAVTranscoder();
    // [end create_instance]
    this.setAVTranscoderCallback();
    // 2.获取转码源文件fd和目标文件fd赋予avTranscoder；参考FilePicker文档。
    if (this.context != undefined) {
      try {
        // [start create_fdsrc]
        // 获取输入文件fd，H264_AAC.mp4为rawfile目录下的预置资源，需要开发者根据实际情况进行替换。
        this.rawFileDescriptor = await this.context!.resourceManager.getRawFd('H264_AAC.mp4');
        // 将 RawFileDescriptor 转换为 AVFileDescriptor
        this.avTranscoder!.fdSrc = {
          fd: this.rawFileDescriptor!.fd,
          offset: this.rawFileDescriptor!.offset,
          length: this.rawFileDescriptor!.length
        };
        // [end create_fdsrc]
      } catch (error) {
        console.error('Failed to get the file descriptor, please check the resource and path.');
      }
      // [start create_fddst]
      this.outputFilePath = this.context!.filesDir + '/output.mp4';
      this.file = fs.openSync(this.outputFilePath, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      this.avTranscoder!!.fdDst = this.file.fd;
      // [end create_fddst]
      this.currentProgress = 0;
    }
    // [start doPrepare]
    // 3.配置转码参数完成准备工作。
    await this.avTranscoder!.prepare(this.avConfig);
    // [end doPrepare]
    // [start doStart]
    // 4.开始转码。
    await this.avTranscoder!.start();
    // [end doStart]
  }

  // [start doPause]
  // 暂停转码对应的流程。
  async pauseTranscoderingProcess(): Promise<void> {
    if (this.avTranscoder != undefined) { // 仅在调用start返回后调用pause为合理调用。
      await this.avTranscoder!.pause();
    }
  }
  // [end doPause]

  // [start doResume]
  // 恢复对应的转码流程。
  async resumeTranscoderingProcess(): Promise<void> {
    if (this.avTranscoder != undefined) { // 仅在调用pause返回后调用resume为合理调用。
      await this.avTranscoder!.resume();
    }
  }
  // [end doResume]

  // [start doRelease]
  // 释放转码流程。
  async releaseTranscoderingProcess(): Promise<void> {
    if (this.avTranscoder != undefined) {
      // 1.释放转码实例。
      await this.avTranscoder!!.release();
      this.avTranscoder = undefined;
      // 2.关闭转码目标文件fd。
      fs.closeSync(this.avTranscoder!.fdDst);
    }
  }
  // [end doRelease]

  // 获取当前进度
  getCurrentProgress(): int {
    console.info(`getCurrentProgress = ${this.currentProgress}`);
    return this.currentProgress;
  }

  // [start transcoder_process]
  // 一个完整的【开始转码-暂停转码-恢复转码-转码完成】示例。
  async avTranscoderDemo(){
    this.context = globalContext.getAbilityContext();
    await this.startTranscoderingProcess(); // 开始转码。
    await this.pauseTranscoderingProcess(); //暂停转码。
    await this.resumeTranscoderingProcess(); // 恢复转码。
  }
  // [end transcoder_process]
}
