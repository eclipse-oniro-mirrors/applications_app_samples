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

// [Start full_audio_recorder]
// [Start full_video_recorder]
import { BusinessError } from '@ohos.base';
import media from '@ohos.multimedia.media';
import fileIo from '@ohos.file.fs';
import common from '@ohos.app.ability.common';
import { Resolution } from './CommonTypes';

export default class AVRecorderService {
  private avRecorder: media.AVRecorder | undefined = undefined;
  private fileFd: int | undefined = undefined;

  private audioSampleRate: int = 48000;
  private videoSourceType: media.VideoSourceType = media.VideoSourceType.VIDEO_SOURCE_TYPE_SURFACE_YUV;
  private videoResolution: Resolution = { frameWidth: 1920, frameHeight: 1080 } as Resolution;

  public async createRecorder(): Promise<void> {
    await this.releaseRecorder();
    try {
// [Start create_recorder]
      this.avRecorder = await media.createAVRecorder();
// [End create_recorder]
    } catch (err) {
      let error: BusinessError = err as BusinessError;
      console.error(`Failed to create avRecorder, error code: ${error.code}, message: ${error.message}`);
    }
  }

  public setCallback(onStateChanged: media.OnAVRecorderStateChangeHandler): void {
    if (this.avRecorder) {
      console.info('setCallback');
    }
// [Start set_callback]
    this.avRecorder?.onStateChange((state, reason) => {
      console.info(`AVRecorder state is changed to ${state}, reason: ${reason}`);
      // 用户可以在此补充状态发生切换后想要进行的动作。
      onStateChanged(state, reason);
    });
    this.avRecorder?.onError((error) => {
      console.error(`Error occurred in avRecorder, error code: ${error.code}, message: ${error.message}`);
    });
// [End set_callback]
  }

// [StartExclude full_audio_recorder]
// [StartExclude full_video_recorder]
  public configAudioSampleRate(sampleRate: int): void {
    this.audioSampleRate = sampleRate;
  }

  public configVideoSourceType(videoSourceType: media.VideoSourceType): void {
    this.videoSourceType = videoSourceType;
  }

  public configVideoResolution(videoResolution: Resolution): void {
    this.videoResolution = videoResolution;
  }
// [EndExclude full_audio_recorder]

// [Start prepare_audio_recorder]
  public async prepareAudioRecorder(context: common.Context): Promise<void> {
    let path: string = context.filesDir + 'audio_example.m4a';
    let file: fileIo.File = await fileIo.open(path, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
    this.fileFd = file.fd;

    let avRecorderConfig: media.AVRecorderConfig = {
      audioSourceType: media.AudioSourceType.AUDIO_SOURCE_TYPE_MIC, // 音频源类型。
      profile: {
        audioBitrate: 112000, // 音频比特率。
        audioChannels: 2, // 音频声道数。
        audioCodec: media.CodecMimeType.AUDIO_AAC, // 音频编码格式。
        audioSampleRate: this.audioSampleRate, // 音频采样率。
        fileFormat: media.ContainerFormatType.CFT_MPEG_4A // 封装格式。
      },
      url: 'fd://' + file.fd.toString()
    };

    try {
      if (this.avRecorder?.state === 'idle' || this.avRecorder?.state === 'stopped') {
        await this.avRecorder?.prepare(avRecorderConfig);
      }
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to prepare avRecorder, error code: ${err.code}, message: ${err.message}`);
    }
  }
// [End prepare_audio_recorder]
// [EndExclude full_video_recorder]

// [StartExclude full_audio_recorder]
// [Start prepare_video_recorder]
  public async prepareVideoRecorder(context: common.Context): Promise<void> {
    let path: string = context.filesDir + 'video_example.mp4';
    let file: fileIo.File = await fileIo.open(path, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
    this.fileFd = file.fd;

    let avRecorderConfig: media.AVRecorderConfig = {
      videoSourceType: this.videoSourceType, // 视频源类型。
      profile: {
        videoBitrate: 3000000, // 视频比特率。
        videoCodec: media.CodecMimeType.VIDEO_AVC, // 视频编码格式。
        videoFrameWidth: this.videoResolution.frameWidth, // 视频分辨率的宽。
        videoFrameHeight: this.videoResolution.frameHeight, // 视频分辨率的高。
        videoFrameRate: 30, // 视频帧率。
        fileFormat: media.ContainerFormatType.CFT_MPEG_4 // 封装格式。
      },
      metadata: {
        videoOrientation: '90' // 视频旋转角度，默认为0不旋转，支持的值为0、90、180、270。
      },
      url: 'fd://' + file.fd.toString()
    };

    try {
      if (this.avRecorder?.state === 'idle' || this.avRecorder?.state === 'stopped') {
        await this.avRecorder?.prepare(avRecorderConfig);
      }
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to prepare avRecorder, error code: ${err.code}, message: ${err.message}`);
    }
  }
// [End prepare_video_recorder]

  async getInputSurface(): Promise<string | undefined> {
// [Start get_input_surface]
    let surfaceId: string | undefined = undefined;
    try {
      surfaceId = await this.avRecorder?.getInputSurface();
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to get input surface, error code: ${err.code}, message: ${err.message}`);
    }
// [End get_input_surface]
    return surfaceId;
  }
// [EndExclude full_audio_recorder]

  public async startRecorder(): Promise<void> {
    try {
      if (this.avRecorder?.state === 'prepared') {
// [Start start_recorder]
        await this.avRecorder?.start();
// [End start_recorder]
      }
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to start avRecorder, error code: ${err.code}, message: ${err.message}`);
    }
  }

  public async pauseRecorder(): Promise<void> {
    try {
      if (this.avRecorder?.state === 'started') {
// [Start pause_recorder]
        await this.avRecorder?.pause();
// [End pause_recorder]
      }
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to pause avRecorder, error code: ${err.code}, message: ${err.message}`);
    }
  }

  public async resumeRecorder(): Promise<void> {
    try {
      if (this.avRecorder?.state === 'paused') {
// [Start resume_recorder]
        await this.avRecorder?.resume();
// [End resume_recorder]
      }
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to resume avRecorder, error code: ${err.code}, message: ${err.message}`);
    }
  }

  public async stopRecorder(): Promise<void> {
    try {
      if (this.avRecorder?.state === 'started' || this.avRecorder?.state === 'paused') {
// [Start stop_recorder]
        await this.avRecorder?.stop();
// [End stop_recorder]
      }
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to stop avRecorder, error code: ${err.code}, message: ${err.message}`);
    }
  }

  public async resetRecorder(): Promise<void> {
    try {
// [Start reset_recorder]
      await this.avRecorder?.reset();
// [End reset_recorder]
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to reset avRecorder, error code: ${err.code}, message: ${err.message}`);
    }
  }

  public async releaseRecorder(): Promise<void> {
    try {
      this.avRecorder?.offStateChange();
      this.avRecorder?.offError();
// [Start release_recorder]
      await this.avRecorder?.release();
// [End release_recorder]
      this.avRecorder = undefined;
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to release avRecorder, error code: ${err.code}, message: ${err.message}`);
    }
  }

  public async closeFd(): Promise<void> {
    try {
      if (this.fileFd) {
        await fileIo.close(this.fileFd!);
        this.fileFd = undefined;
      }
    } catch (error) {
      let err = error as BusinessError;
      console.error(`Failed to close fd, error code: ${err.code}, message: ${err.message}`);
    }
  }
}
// [End full_audio_recorder]
// [End full_video_recorder]