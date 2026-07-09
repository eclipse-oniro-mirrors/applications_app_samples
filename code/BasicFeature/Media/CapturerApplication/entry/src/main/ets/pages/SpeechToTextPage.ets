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

import { AudioRecordingToTextController } from '../common/utils/mediaUtils/AudioRecordingToTextController'
import PermissionManager from '../common/utils/PermissionManager';
import { common } from '@kit.AbilityKit';
import { PromptAction } from '@kit.ArkUI';

@Entry
@Component
struct SpeechToTextPage {
  @State text: string = ''
  @State isInit: boolean = false;
  @State isRecording: boolean = false;
  private context: common.UIAbilityContext | undefined = AppStorage.get('context');
  @State promptAction: PromptAction = this.getUIContext().getPromptAction();

  async aboutToAppear(): Promise<void> {
    await AudioRecordingToTextController.getInstance().init();
    AudioRecordingToTextController.getInstance().onResultChange((result: string, isComplete: boolean) => {
      if (isComplete) {
        AudioRecordingToTextController.getInstance().finish();
        this.isRecording = false;
        this.promptAction.showToast({
          message: '转文字已暂停',
          duration: 1000
        });
      } else {
        this.text = result;
      }
    })
    this.isInit = true;
  }
  aboutToDisappear(): void {
    AudioRecordingToTextController.getInstance().release();
    this.isInit = false;
  }

  build() {
    Column() {
      Text('语音转文字')
        .fontSize(28)
        .fontWeight(FontWeight.Bold)
        .fontColor('#333')
        .margin({ top: 32, bottom: 24 })

      Column() {
        TextArea({ placeholder: '转换后的文字将显示在这里...', text: this.text })
          .width('100%')
          .height('100%')
          .fontSize(16)
          .fontColor('#333')
          .placeholderColor('#999')
          .backgroundColor('#FAFAFA')
          .borderRadius(12)
          .padding(16)
          .border({ width: 1, color: '#E0E0E0' })
          .onChange((value: string) => {
            this.text = value
          })
      }
      .width('90%')
      .height('60%')
      .shadow({
        radius: 8,
        color: '#1A000000',
        offsetX: 0,
        offsetY: 2
      })

      Button(this.isRecording ? '暂停' : '开始录制')
        .width(180)
        .height(50)
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .backgroundColor(this.isRecording ? '#FF9800' : '#4CAF50')
        .borderRadius(25)
        .margin({ top: 32 })
        .enabled(this.isInit)
        .shadow({
          radius: 8,
          color: '#1A000000',
          offsetX: 0,
          offsetY: 4
        })
        .onClick(async () => {
          const granted = await PermissionManager.requestPermissions(this.context!, ['ohos.permission.MICROPHONE']);
          if (granted) {
            this.recording();
          }
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
    .backgroundColor('#FFFFFF')
  }

  async recording() {
    if (!this.isRecording) {
      await AudioRecordingToTextController.getInstance().start();
    } else {
      await AudioRecordingToTextController.getInstance().finish();
    }
    this.isRecording = !this.isRecording;
  }
}
