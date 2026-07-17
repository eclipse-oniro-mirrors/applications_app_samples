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

import { dateTime } from '../utils/DateTimeUtil';
import Logger from '../utils/Logger';
import display from '@ohos.display';
import ndk from 'libentry.so';
import CameraServiceNDK from '../services/CameraServiceNDK';

const TAG: string = 'Sample_VideoRecorderNDK';

@Entry
@Component
struct VideoRecorderNDK {
  private cameraService: CameraServiceNDK = new CameraServiceNDK();
  private surfaceId: string = '';
  xComponentController: XComponentController = new XComponentController();
  @State videoRecorderTimeText: string = '00:00';
  private seconds: number = 0;
  private timer: number = 0;
  @State isStartRecording: boolean = false;
  @State isPauseRecording: boolean = false;

  aboutToAppear(): void {
    Logger.info(TAG, 'aboutToAppear');
  }

  aboutToDisappear(): void {
    Logger.info(TAG, 'aboutToDisappear called');
    this.releaseCamera();
  }

  onPageShow(): void {
    Logger.info(TAG, 'onPageShow called');
    this.enterInit();
  }

  onPageHide(): void {
    Logger.info(TAG, 'onPageHide called');
    this.stopRecordingProcess();
  }

  getRecordTime(): void {
    this.timer = setInterval(() => {
      this.seconds += 1;
      this.videoRecorderTimeText = dateTime(this.seconds);
    }, 1000);
  }

  async releaseCamera(): Promise<void> {
    Logger.info(TAG, 'releaseCamera begin');
    await this.cameraService.release();
    Logger.info(TAG, 'releaseCamera end');
  }

  async enterInit(): Promise<void> {
    Logger.info(TAG, 'enterInit begin');
    this.cameraService.init(this.getUIContext().getHostContext()!);
    await this.cameraService.createInput();
    this.cameraService.createPreviewOutput(this.surfaceId);
    await this.cameraService.createCaptureSession();
    await this.cameraService.startCaptureSession();
    Logger.info(TAG, 'enterInit end');
  }

  async startRecordingProcess(): Promise<void> {
    Logger.info(TAG, 'startRecordingProcess begin');
    ndk.createRecorder();
    ndk.setRecorderStateCallback((state: number, reason: number) => {
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
    ndk.setRecorderErrorCallback((errorCode: number, errorMsg: string) => {
      Logger.error(TAG, `AVRecorder error: ${errorCode}, msg: ${errorMsg}`);
    });
    ndk.setRecorderUriCallback();
    ndk.prepareVideoRecorder();
    let surfaceId: string = ndk.getInputSurfaceId();
    if (surfaceId && surfaceId.length > 0) {
      await this.cameraService.restartVideoOutput(surfaceId);
    }
    ndk.startRecorder();
    Logger.info(TAG, 'startRecordingProcess end');
  }

  async pauseRecordingProcess(): Promise<void> {
    Logger.info(TAG, 'pauseRecordingProcess begin');
    ndk.pauseRecorder();
    await this.cameraService.stopVideoOutput();
    Logger.info(TAG, 'pauseRecordingProcess end');
  }

  async resumeRecordingProcess(): Promise<void> {
    Logger.info(TAG, 'resumeRecordingProcess begin');
    await this.cameraService.startVideoOutput();
    ndk.resumeRecorder();
    Logger.info(TAG, 'resumeRecordingProcess end');
  }

  async stopRecordingProcess(): Promise<void> {
    Logger.info(TAG, 'stopRecordingProcess begin');
    ndk.stopRecorder();
    ndk.releaseRecorder();
    await this.cameraService.stopVideoOutput();
    clearInterval(this.timer);
    this.isStartRecording = false;
    this.isPauseRecording = false;
    this.seconds = 0;
    this.videoRecorderTimeText = '00:00';
    Logger.info(TAG, 'stopRecordingProcess end');
  }

  build() {
    Column() {
      Row() {
        Stack({ alignContent: Alignment.Center }) {
          XComponent({
            type: XComponentType.SURFACE,
            controller: this.xComponentController
          })
            .onLoad(() => {
              let displayObj: display.Display = display.getDefaultDisplaySync();
              this.xComponentController.setXComponentSurfaceRect({
                surfaceWidth: displayObj.width,
                surfaceHeight: displayObj.height
              });
              Logger.info(TAG, '[VideoRecorderNDK] surface size: ' + displayObj.height + 'x' + displayObj.width);
              this.surfaceId = this.xComponentController.getXComponentSurfaceId();
              Logger.info(TAG, '[VideoRecorderNDK] surfaceId: ' + this.surfaceId);
              Logger.info(TAG, 'XComponent loaded');
            })
            .width('100%').height('100%')
            .backgroundColor(Color.Black)
          Text(this.videoRecorderTimeText)
            .fontFamily('HarmonyHeiTi-Light')
            .width(70)
            .height(40)
            .fontSize(27)
            .fontColor('white')
            .margin({ left: 155, top: 18, right: 135, bottom: 707})
          if (!this.isStartRecording) {
            Image($r('app.media.ic_red_circle'))
              .width(12)
              .height(12)
              .margin({ left: 136, top: 25, right: 212, bottom: 715})
            Image($r('app.media.take_video_normal'))
              .width(86)
              .height(86)
              .margin({ left: 132, top: 612, right: 132, bottom: 72})
              .onClick(() => { this.startRecordingProcess(); })
              .id('videoStartNDK')
          }
          else {
            Image($r('app.media.ic_circle_open'))
              .width(120)
              .height(56)
              .margin({ left: 120, top: 632, right: 120, bottom: 92})
            Image($r('app.media.ic_stop'))
              .width(16)
              .height(16)
              .margin({ left: 146, top: 652, right: 198, bottom: 112})
              .onClick(() => { this.stopRecordingProcess(); })
              .id('videoStopNDK')
            if (!this.isPauseRecording) {
              Image($r('app.media.ic_red_circle'))
                .width(12)
                .height(12)
                .margin({ left: 136, top: 25, right: 212, bottom: 715})
              Image($r('app.media.ic_pause'))
                .width(14)
                .height(15)
                .margin({ left: 200, top: 652, right: 146, bottom: 113})
                .onClick(() => { this.pauseRecordingProcess(); })
                .id('videoPauseNDK')
            } else {
              Image($r('app.media.ic_small_pause'))
                .width(14)
                .height(14)
                .margin({ left: 136, top: 25, right: 212, bottom: 715})
              Image($r('app.media.ic_continue'))
                .width(16)
                .height(16)
                .margin({ left: 198, top: 651, right: 144, bottom: 111})
                .onClick(() => { this.resumeRecordingProcess(); })
                .id('videoResumeNDK')
            }
          }
        }.width('100%').height('100%')
      }
    }
  }
}