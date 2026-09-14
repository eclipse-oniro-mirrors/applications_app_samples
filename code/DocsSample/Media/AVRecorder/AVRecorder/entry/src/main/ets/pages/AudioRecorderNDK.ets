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

import Logger from '../utils/Logger';
import { dateTime } from '../utils/DateTimeUtil';
import recorderLib from 'libentry.so';

const TAG: string = 'Sample_AudioRecorderNDK';

@Entry
@Component
struct AudioRecorderNDK {
  @State audioRecorderTimeText: string = '00:00';
  private seconds: number = 0;
  private timer: number = 0;
  @State isStartRecording: boolean = false;
  @State isPauseRecording: boolean = false;

  aboutToAppear(): void {
    Logger.info(TAG, 'aboutToAppear');
  }

  aboutToDisappear(): void {
    Logger.info(TAG, 'aboutToDisappear');
  }

  getRecordTime(): void {
    this.timer = setInterval(() => {
      this.seconds += 1;
      this.audioRecorderTimeText = dateTime(this.seconds);
    }, 1000)
  }

  startRecordingProcess(): void {
    Logger.info(TAG, 'startRecordingProcess begin');
    recorderLib.createRecorder();
    recorderLib.setRecorderStateCallback((state: number, reason: number) => {
      Logger.info(TAG, `AVRecorder state: ${state}, reason: ${reason}`);
      switch (state) {
        case 2:
          this.getRecordTime();
          this.isStartRecording = true;
          this.isPauseRecording = false;
          break;
        case 3:
          clearInterval(this.timer);
          this.isPauseRecording = true;
          break;
        case 4:
          this.isStartRecording = false;
          break;
        default:
          break;
      }
    });
    recorderLib.setRecorderErrorCallback((errorCode: number, errorMsg: string) => {
      Logger.error(TAG, `AVRecorder error: ${errorCode}, msg: ${errorMsg}`);
    });
    recorderLib.setRecorderUriCallback();
    recorderLib.prepareAudioRecorder();
    recorderLib.startRecorder();
    Logger.info(TAG, 'startRecordingProcess end');
  }

  pauseRecordingProcess(): void {
    Logger.info(TAG, 'pauseRecordingProcess begin');
    recorderLib.pauseRecorder();
    Logger.info(TAG, 'pauseRecordingProcess end');
  }

  resumeRecordingProcess(): void {
    Logger.info(TAG, 'resumeRecordingProcess begin');
    recorderLib.resumeRecorder();
    Logger.info(TAG, 'resumeRecordingProcess end');
  }

  stopRecordingProcess(): void {
    Logger.info(TAG, 'stopRecordingProcess begin');
    recorderLib.stopRecorder();
    recorderLib.releaseRecorder();
    clearInterval(this.timer);
    this.isStartRecording = false;
    this.isPauseRecording = false;
    this.seconds = 0;
    this.audioRecorderTimeText = '00:00';
    Logger.info(TAG, 'stopRecordingProcess end');
  }

  build() {
    Column() {
      Row() {
        Stack({ alignContent: Alignment.Center }) {
          Text(this.audioRecorderTimeText)
            .fontFamily('HarmonyHeiTi-Light')
            .width(70)
            .height(40)
            .fontSize(27)
            .fontColor('white')
            .margin({
              left: 99,
              top: 13,
              right: 79,
              bottom: 703
            })
          if (!this.isStartRecording) {
            Image($r('app.media.ic_red_circle'))
              .width(12)
              .height(12)
              .margin({
                left: 136,
                top: 25,
                right: 212,
                bottom: 715
              })
            Image($r('app.media.take_video_normal'))
              .width(86)
              .height(86)
              .margin({
                left: 132,
                top: 612,
                right: 132,
                bottom: 72
              })
              .onClick(() => {
                Logger.info(TAG, 'start button clicked');
                this.startRecordingProcess();
              })
              .id('audioStartNDK')
          } else {
            Image($r('app.media.ic_circle_open'))
              .width(120)
              .height(56)
              .margin({
                left: 120,
                top: 632,
                right: 120,
                bottom: 92
              })
            Image($r('app.media.ic_stop'))
              .width(16)
              .height(16)
              .margin({
                left: 146,
                top: 652,
                right: 198,
                bottom: 112
              })
              .onClick(() => {
                this.stopRecordingProcess();
              })
              .id('audioStopNDK')
            if (!this.isPauseRecording) {
              Image($r('app.media.ic_red_circle'))
                .width(12)
                .height(12)
                .margin({
                  left: 136,
                  top: 25,
                  right: 212,
                  bottom: 715
                })
              Image($r('app.media.ic_pause'))
                .width(14)
                .height(15)
                .margin({
                  left: 200,
                  top: 652,
                  right: 146,
                  bottom: 113
                })
                .onClick(() => {
                  this.pauseRecordingProcess();
                })
                .id('audioPauseNDK')
            } else {
              Image($r('app.media.ic_small_pause'))
                .width(14)
                .height(14)
                .margin({
                  left: 136,
                  top: 25,
                  right: 212,
                  bottom: 715
                })
              Image($r('app.media.ic_continue'))
                .width(16)
                .height(16)
                .margin({
                  left: 198,
                  top: 651,
                  right: 144,
                  bottom: 111
                })
                .onClick(() => {
                  this.resumeRecordingProcess();
                })
                .id('audioResumeNDK')
            }
          }
        }.width('100%').height('100%')
      }.backgroundColor(Color.Black)
    }
  }
}