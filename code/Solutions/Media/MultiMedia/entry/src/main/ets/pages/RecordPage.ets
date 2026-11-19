/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import router from '@ohos.router'
import Logger from '../model/Logger';
import DateTimeUtil from '../model/DateTimeUtil'
import MediaUtils, { FileType, MediaAssetHandle } from '../model/MediaUtils'
import RecordModel from '../model/RecordModel'
import TitleBar from '../view/TitleBar'

@Entry
@Component
struct Record {
  private recordModel: RecordModel = new RecordModel()
  private isStartRecord: boolean = false
  private mediaUtils: MediaUtils = MediaUtils.getInstance(getContext(this))
  private intervalId: number = -1
  private fileAsset: MediaAssetHandle | undefined = undefined
  private fd: number = -1
  @State format: string = 'hh:mm:ss.ms'
  @State isRecording: boolean = false
  @State millisecond: number = 0

  async startRecord() {
    this.fileAsset = await this.mediaUtils.createAndGetUri(FileType.AUDIO)
    this.fd = await this.mediaUtils.getFdPath(this.fileAsset)
    this.recordModel.startRecorder(this.fd)
    this.isStartRecord = true
  }

  getTime() {
    const dateTimeUtil = new DateTimeUtil()
    let minute = Math.floor(this.millisecond / 60000)
    let second = Math.floor((this.millisecond - minute * 60000) / 1000)
    return `${dateTimeUtil.fill(minute)} : ${dateTimeUtil.fill(second)}`
  }

  handleStateChange = () => {
    this.isRecording = !this.isRecording
    if (this.isRecording) {
      if (this.intervalId) {
        clearInterval(this.intervalId)
        this.intervalId = -1
      }
      this.intervalId = setInterval(() => {
        this.millisecond += 1000
      }, 1000)
    } else {
      clearInterval(this.intervalId)
      this.intervalId = -1
    }
  }

  aboutToAppear(): void {
    this.recordModel.initAudioRecorder(this.handleStateChange).catch((error: Error): void => {
      Logger.error('RecordPage', `Recorder initialization failed: ${error.message}`);
    });
  }

  private async finishRecord(): Promise<void> {
    this.isStartRecord = false;
    this.isRecording = false;
    clearInterval(this.intervalId);
    this.intervalId = -1;
    try {
      await this.recordModel.finish();
    } finally {
      const fd: number = this.fd;
      this.fd = -1;
      if (fd !== -1 && this.fileAsset !== undefined) {
        await this.fileAsset.close(fd);
      }
    }
  }

  build() {
    Column() {
      TitleBar()
      Text(this.getTime())
        .fontColor(Color.Black)
        .fontSize(110)
        .margin({ top: 50 })

      Row() {
        Blank()
        Button({ type: ButtonType.Circle, stateEffect: true }) {
          Rect({ width: 25, height: 25 }).fill(Color.Red).radius(5).key('end')
        }
        .size({ width: 75, height: 75 })
        .backgroundColor('#FFFFFF')
        .id('endOfRecording')
        .onClick(() => {
          this.finishRecord().then((): void => {
            router.back();
          }).catch((error: Error): void => {
            Logger.error('RecordPage', `Recorder finish failed: ${error.message}`);
          });
        })

        Blank()
        Button({ type: ButtonType.Circle, stateEffect: true }) {
          if (this.isRecording) {
            Row() {
              Rect({ width: 5, height: 25 })
              Rect({ width: 5, height: 25 })
                .margin({ left: 10 })
                .id('pauseBtn')
            }
            .width(20)
            .height(25)
          } else {
            Polyline({ width: 20, height: 25 })
              .points([[0, 0], [20, 12.5], [0, 25]])
              .margin({ left: 5 })
              .id('startBtn')
          }
        }
        .size({ width: 75, height: 75 })
        .backgroundColor('#FFFFFF')
        .onClick(() => {
          if (this.isRecording) {
            this.recordModel.pause()
          } else {
            if (this.isStartRecord) {
              this.recordModel.resume()
              return
            }
            this.startRecord()
          }
        })

        Blank()
      }
      .width('100%')
      .layoutWeight(1)

      Blank()
    }
    .height('100%')
    .width('100%')
    .backgroundColor('#F5F5F5')
  }

  onPageHide() {
    if (this.isRecording) {
      this.recordModel.pause()
    }
  }

  async aboutToDisappear(): Promise<void> {
    try {
      await this.finishRecord();
    } catch (error) {
      Logger.error('RecordPage', `Recorder cleanup failed: ${error}`);
    }
    if (this.millisecond < 1000 && this.fileAsset !== undefined) {
      await this.mediaUtils.deleteFile(FileType.AUDIO, this.fileAsset.uri);
    }
  }
}