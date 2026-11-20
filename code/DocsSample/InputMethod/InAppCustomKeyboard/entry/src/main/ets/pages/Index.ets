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

// [Start draw_keyboard]

import { BusinessError } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { InAppKeyboardSession } from '../keyboard/InAppKeyboardSession';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_InAppCustomKeyboard]';

@Entry
@Component
struct Index {
  @State private text: string = '';
  @State private keyboardVisible: boolean = false;
  private session: InAppKeyboardSession = new InAppKeyboardSession((visible: boolean) => {
    this.keyboardVisible = visible;
  });
  private windowListenerSet: boolean = false;

  private logError(error: BusinessError): void {
    hilog.error(DOMAIN, TAG, 'Code: %{public}d, message: %{public}s', error.code, error.message);
  }

  aboutToAppear(): void {
    this.session.activate();
  }

  // 首次显示时尝试注册，窗口后续获焦时再次尝试。
  onPageShow(): void {
    this.session.register().catch((error: BusinessError) => { this.logError(error); });
    if (this.windowListenerSet) { return; }
    this.windowListenerSet = true;
    const context = this.getUIContext().getHostContext() as common.UIAbilityContext;
    window.getLastWindow(context).then((win) => {
      win.on('windowEvent', (data) => {
        if (data === window.WindowEventType.WINDOW_ACTIVE) {
          this.session.register().catch((error: BusinessError) => { this.logError(error); });
        }
      });
    }).catch((error: BusinessError) => { this.logError(error); });
  }

  // 页面离开时释放代理输入法会话。
  aboutToDisappear(): void {
    this.session.dispose().catch((error: BusinessError) => { this.logError(error); });
  }

  private async closePage(): Promise<void> {
    try {
      const context = this.getUIContext().getHostContext() as common.UIAbilityContext | undefined;
      if (context === undefined) {
        return;
      }
      // 主动关闭时，先等待注销与监听清理完成，再销毁页面。
      await this.session.dispose();
      await context.terminateSelf();
    } catch (error) {
      this.logError(error as BusinessError);
    }
  }

  @Builder
  private characterKey(value: string) {
    Button(value, { type: ButtonType.Normal })
      .layoutWeight(1)
      .height(44)
      .borderRadius(8)
      .backgroundColor('#FFFFFF')
      .fontColor('#182431')
      .fontSize(20)
      // 按键不获取焦点，保持编辑框与代理输入法的绑定。
      .focusable(false)
      .onClick(() => {
        this.session.insert(value).catch((error: BusinessError) => { this.logError(error); });
      })
  }

  build() {
    Column() {
      Column({ space: 20 }) {
        Row({ space: 12 }) {
          Text($r('app.string.title'))
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .fontColor('#182431')
            .layoutWeight(1)
          Button($r('app.string.close_sample'), { type: ButtonType.Normal })
            .height(36)
            .fontSize(14)
            .fontColor('#526071')
            .backgroundColor(Color.Transparent)
            .onClick(() => { this.closePage(); })
        }.width('100%')

        Column({ space: 12 }) {
          Text($r('app.string.text_content'))
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor('#182431')
            .width('100%')
          // 注册代理后点击编辑框，框架将触发绑定及键盘显示回调。
          TextInput({ text: this.text, placeholder: $r('app.string.input_placeholder') })
            .height(56)
            .fontSize(18)
            .fontColor('#182431')
            .backgroundColor('#F2F4F7')
            .borderRadius(8)
            .type(InputType.Normal)
            .onChange((value: string) => { this.text = value; })
        }
        .width('100%')
        .padding(16)
        .borderRadius(16)
        .backgroundColor('#FFFFFF')

        Row({ space: 12 }) {
          Button($r('app.string.enable_keyboard'), { type: ButtonType.Normal })
            .layoutWeight(1)
            .height(44)
            .borderRadius(12)
            .fontSize(16)
            .backgroundColor('#0A59F7')
            .onClick(() => {
              this.session.register().catch((error: BusinessError) => { this.logError(error); });
            })
          Button($r('app.string.disable_keyboard'), { type: ButtonType.Normal })
            .layoutWeight(1)
            .height(44)
            .borderRadius(12)
            .fontSize(16)
            .fontColor('#0A59F7')
            .backgroundColor('#E8EFFD')
            .onClick(() => {
              this.session.unregister().catch((error: BusinessError) => { this.logError(error); });
            })
        }.width('100%')
        Text($r('app.string.description'))
          .fontSize(14)
          .fontColor('#657080')
          .width('100%')
      }
      .width('100%')
      .padding({ left: 24, right: 24, top: 20 })

      Blank().layoutWeight(1)

      if (this.keyboardVisible) {
        Column({ space: 8 }) {
          Row() {
            Text($r('app.string.custom_keyboard'))
              .fontSize(14)
              .fontColor('#526071')
            Blank()
            Button($r('app.string.collapse'), { type: ButtonType.Normal })
              .height(32)
              .fontSize(14)
              .fontColor('#0A59F7')
              .backgroundColor(Color.Transparent)
              .focusable(false)
              .onClick(() => {
                this.session.hide().catch((error: BusinessError) => { this.logError(error); });
              })
          }.width('100%')
          Row({ space: 8 }) {
            this.characterKey('1')
            this.characterKey('2')
            this.characterKey('3')
          }.width('100%')
          Row({ space: 8 }) {
            this.characterKey('4')
            this.characterKey('5')
            this.characterKey('6')
          }.width('100%')
          Row({ space: 8 }) {
            this.characterKey('7')
            this.characterKey('8')
            this.characterKey('9')
          }.width('100%')
          Row({ space: 8 }) {
            this.characterKey('A')
            this.characterKey('0')
            Button($r('app.string.delete'), { type: ButtonType.Normal })
              .layoutWeight(1)
              .height(44)
              .borderRadius(8)
              .fontSize(16)
              .fontColor('#182431')
              .backgroundColor('#D8DFE9')
              .focusable(false)
              .onClick(() => {
                this.session.deleteBeforeCursor().catch((error: BusinessError) => { this.logError(error); });
              })
          }.width('100%')
        }
        .width('100%')
        .padding({ left: 16, right: 16, top: 8, bottom: 16 })
        .borderRadius({ topLeft: 16, topRight: 16 })
        .backgroundColor('#E8ECF2')
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F7F8FA')
  }
}
// [End draw_keyboard]