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
// [Start PlaybackCaptureImport]
import { audio } from '@kit.AudioKit';
import { BusinessError } from '@kit.BasicServicesKit';
// [End PlaybackCaptureImport]

// [Start PlaybackCaptureGlobalState]
let audioCapturer: audio.AudioCapturer | undefined = undefined;
let isPlaybackCaptureStarted: boolean = false;
let readBytes: number = 0;
let playbackCaptureRequestId: number = 0;
let playbackCaptureStartState: audio.PlaybackCaptureStartState | undefined = undefined;
// [End PlaybackCaptureGlobalState]

// [Start PlaybackCaptureStateToText]
function playbackCaptureStateToText(state: audio.PlaybackCaptureStartState | undefined): string {
  switch (state) {
    case audio.PlaybackCaptureStartState.STATE_SUCCESS:
      return 'SUCCESS';
    case audio.PlaybackCaptureStartState.STATE_FAILED:
      return 'FAILED';
    case audio.PlaybackCaptureStartState.STATE_NOT_AUTHORIZED:
      return 'NOT_AUTHORIZED';
    default:
      return 'WAITING';
  }
}
// [End PlaybackCaptureStateToText]

@Entry
@Component
struct PlaybackCapture {
  @State message: string = '当前状态：未启动';
  @State bytes: number = 0;

  // [Start PlaybackCaptureReadDataCallback]
  private readDataCallback: Callback<ArrayBuffer> = (buffer: ArrayBuffer): void => {
    readBytes += buffer.byteLength;
    this.bytes = readBytes;
  };
  // [End PlaybackCaptureReadDataCallback]

  // [Start ReleasePlaybackCapture]
  private async releasePlaybackCapture(): Promise<void> {
    if (audioCapturer === undefined) {
      return;
    }
    const capturer: audio.AudioCapturer = audioCapturer;
    audioCapturer = undefined;
    playbackCaptureRequestId++;
    capturer.off('readData', this.readDataCallback);
    try {
      if (isPlaybackCaptureStarted) {
        await capturer.stop();
      }
    } finally {
      isPlaybackCaptureStarted = false;
      await capturer.release();
    }
  }
  // [End ReleasePlaybackCapture]

  // [Start StartPlaybackCapture]
  private async startPlaybackCapture(): Promise<void> {
    if (audioCapturer !== undefined) {
      this.message = '内录流已存在，请先停止';
      return;
    }

    readBytes = 0;
    this.bytes = 0;
    isPlaybackCaptureStarted = false;
    playbackCaptureStartState = undefined;
    const options: audio.AudioCapturerOptions = {
      streamInfo: {
        samplingRate: audio.AudioSamplingRate.SAMPLE_RATE_48000,
        channels: audio.AudioChannel.CHANNEL_2,
        sampleFormat: audio.AudioSampleFormat.SAMPLE_FORMAT_S16LE,
        encodingType: audio.AudioEncodingType.ENCODING_TYPE_RAW
      },
      capturerInfo: {
        // 内录能力由playbackCaptureMode控制，无需使用已废弃的SOURCE_TYPE_PLAYBACK_CAPTURE。
        source: audio.SourceType.SOURCE_TYPE_MIC,
        capturerFlags: 0
      },
      // [Start SetPlaybackCaptureMode]
      playbackCaptureMode: audio.AudioPlaybackCaptureMode.MODE_MEDIA |
        audio.AudioPlaybackCaptureMode.MODE_EXCLUDING_SELF
      // [End SetPlaybackCaptureMode]
    };

    try {
      const capturer: audio.AudioCapturer = await audio.createAudioCapturer(options);
      const requestId: number = ++playbackCaptureRequestId;
      audioCapturer = capturer;
      capturer.on('readData', this.readDataCallback);
      this.message = '当前状态：等待授权结果';
      // [Start RequestPlaybackCaptureStart]
      capturer.requestPlaybackCaptureStart((state: audio.PlaybackCaptureStartState): void => {
        if (audioCapturer !== capturer || playbackCaptureRequestId !== requestId) {
          return;
        }
        playbackCaptureStartState = state;
        const stateText: string = playbackCaptureStateToText(state);
        if (state === audio.PlaybackCaptureStartState.STATE_SUCCESS) {
          isPlaybackCaptureStarted = true;
          this.message = `当前状态：${stateText}`;
          return;
        }
        this.message = `当前状态：${stateText}`;
        this.releasePlaybackCapture().catch((error: BusinessError): void => {
          console.error(`Release playback capture failed, code is ${error.code}, message is ${error.message}`);
        });
      });
      // [End RequestPlaybackCaptureStart]
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      this.message = `启动失败：${err.code} ${err.message}`;
      await this.releasePlaybackCapture();
    }
  }
  // [End StartPlaybackCapture]

  // [Start StopPlaybackCapture]
  private async stopPlaybackCapture(): Promise<void> {
    if (audioCapturer === undefined) {
      this.message = `当前没有正在运行或等待授权的音频内录流\n` +
        `最后状态：${playbackCaptureStateToText(playbackCaptureStartState)}`;
      return;
    }

    const capturedBytes: number = readBytes;
    try {
      await this.releasePlaybackCapture();
      this.message = `停止音频内录完成\n本次读取字节数：${capturedBytes}`;
      playbackCaptureStartState = undefined;
      readBytes = 0;
      this.bytes = 0;
    } catch (error) {
      const err: BusinessError = error as BusinessError;
      this.message = `停止失败：${err.code} ${err.message}`;
    }
  }
  // [End StopPlaybackCapture]

  aboutToDisappear(): void {
    this.releasePlaybackCapture().catch((error: BusinessError): void => {
      console.error(`Release playback capture failed, code is ${error.code}, message is ${error.message}`);
    });
  }

  build() {
    Column({ space: 16 }) {
      Text('音频内录')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 40 })
      Text(this.message)
        .width('90%')
        .textAlign(TextAlign.Center)
      Text(`已读取字节数：${this.bytes}`)
        .width('90%')
        .textAlign(TextAlign.Center)
      Button('启动音频内录')
        .width('80%')
        .onClick((): void => {
          this.startPlaybackCapture();
        })
      Button('查询音频内录状态')
        .width('80%')
        .onClick((): void => {
          this.message = `音频内录状态：${playbackCaptureStateToText(playbackCaptureStartState)}\n` +
            `是否存在内录流：${audioCapturer !== undefined}\n` +
            `已读取字节数：${readBytes}`;
          this.bytes = readBytes;
        })
      Button('停止音频内录')
        .width('80%')
        .onClick((): void => {
          this.stopPlaybackCapture();
        })
    }
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Center)
  }
}
