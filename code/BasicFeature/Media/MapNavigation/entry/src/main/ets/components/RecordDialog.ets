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

import { BusinessError } from '@kit.BasicServicesKit';
import { Logger } from '../utils/Logger';
import { AudioCapturerManager } from '../controller/AudioCapturerManager';
import TextToSpeechController from '../controller/TextToSpeechController';

@Component
export struct RecordDialog {
  @Link isRecord: boolean;
  @StorageLink('RWOffset') rwOffset: number = 0;
  private audioCapturerMgr: AudioCapturerManager = new AudioCapturerManager(this.getUIContext().getHostContext()!);
  @State originalText: string =
    "\n\t\t古人学问无遗力，少壮工夫老始成,古人学问无遗力，少壮工夫老始成,古人学问无遗力，少壮工夫老始成,古人学问无遗力，少壮工夫老始成,古人学问无遗力，少壮工夫老始成；\n\t\t" +
      "纸上得来终觉浅，绝知此事要躬行。\n\t\t";
  @State waveIndex: number[] = new Array(50);
  @State isChecked: boolean = false;
  @State index: number = 0;
  private timeIdOne: number = 0;
  private timeIdTwo: number = 0;

  aboutToAppear(): void {
    try {
      this.audioCapturerMgr.initCapturer().then(() => {
        this.audioCapturerMgr.startCapturer();
        this.isRecord = true;
        this.isChecked = true;
        this.timeIdOne = setInterval(() => {
          const dBFS: number = this.audioCapturerMgr.calculateDecibel(); // 音频振幅dBFS
          this.waveIndex[this.index] = Math.round(dBFS * 20 + 10);
          this.index = this.index === 49 ? 0 : this.index + 1;
        }, 10)
        this.timeIdTwo = setTimeout(() => {
          this.release();
          this.isRecord = false; // 模态消失
          // todo 定时超时后，模拟AI的TTS播报
          TextToSpeechController.speechText(this.originalText);
        }, 5000)
      });
    } catch (error) {
      Logger.error('TAG', `getDefaultDisplaySync error. message:${(error as BusinessError).message}`);
    }
  }

  aboutToDisappear(): void {
    this.release();
    clearInterval(this.timeIdOne);
    clearTimeout(this.timeIdTwo);
  }

  release() {
    this.audioCapturerMgr.stopCapturer().then(() => {
      this.audioCapturerMgr.releaseCapturer();
    });
    clearInterval(this.timeIdOne);
    clearInterval(this.timeIdTwo);
  }

  build() {
    Column() {
      Row({ space: 16 }) {
        Row({ space: 4 }) {
          ForEach(this.waveIndex, (value: number, index: number) => {
            Column()
              .width(3)
              .height(value)
              .backgroundColor(Color.Blue)
              .borderRadius(1.5)
              .animation({
                duration: 100,
                curve: Curve.FastOutLinearIn,
                iterations: 1,
                playMode: PlayMode.Normal
              })
          })
        }
        .renderGroup(this.isChecked)
        .width('100%')
        .height(36)
        .justifyContent(FlexAlign.Center)
        .alignItems(VerticalAlign.Center)
      }
      .height(60)
    }
    .width('100%')
    .margin({ bottom: 16 })
    .backgroundColor('rgb(255, 255, 255)')
  }
}