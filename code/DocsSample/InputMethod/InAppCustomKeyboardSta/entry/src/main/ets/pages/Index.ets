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

// [Start draw_keyboard]

import { common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import {
  Entry,
  Component,
  State,
  Builder,
  Column,
  ColumnOptions,
  Row,
  RowOptions,
  Text,
  Button,
  ButtonType,
  TextInput,
  InputType,
  FontWeight,
  Color,
  Blank,
  window,
  $r,
} from '@kit.ArkUI';
import { InAppKeyboardSession } from '../keyboard/InAppKeyboardSession';

const DOMAIN: int = 0xF811;
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

  private logError(error: Error): void {
    hilog.error(DOMAIN, TAG, 'Operation failed. %{public}s',
      error instanceof BusinessError ? `Code: ${error.code}, message: ${error.message}` : error.message);
  }

  aboutToAppear(): void {
    this.session.activate();
  }

  // 首次显示时尝试注册，窗口后续获焦时再次尝试。
  onPageShow(): void {
    this.session.register().catch<void>((error: Error): void => { this.logError(error); });
    if (this.windowListenerSet) { return; }
    this.windowListenerSet = true;
    const context = this.getUIContext().getHostContext() as common.UIAbilityContext;
    window.getLastWindow(context).then<void>((win: window.Window): void => {
      win.onWindowEvent((data: window.WindowEventType): void => {
        if (data === window.WindowEventType.WINDOW_ACTIVE) {
          this.session.register().catch<void>((error: Error): void => { this.logError(error); });
        }
      });
    }).catch<void>((error: Error): void => { this.logError(error); });
  }

  // 页面离开时释放代理输入法会话。
  aboutToDisappear(): void {
    this.session.dispose().catch<void>((error: Error): void => { this.logError(error); });
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
      this.logError(error);
    }
  }

  @Builder
  private characterKey(value: string): void {
    Button(value, { type: ButtonType.Normal })
      .layoutWeight(1)
      .height(44)
      .borderRadius(8)
      .backgroundColor($r('app.color.keyboard_surface'))
      .fontColor($r('app.color.keyboard_text_primary'))
      .fontSize(20)
      // 按键不获取焦点，保持编辑框与代理输入法的绑定。
      .focusable(false)
      .onClick(() => {
        this.session.insert(value).catch<void>((error: Error): void => { this.logError(error); });
      })
  }

  build(): void {
    Column() {
      Column({ space: 20 } as ColumnOptions) {
        Row({ space: 12 } as RowOptions) {
          Text($r('app.string.title'))
            .fontSize(24)
            .fontWeight(FontWeight.Bold)
            .fontColor($r('app.color.keyboard_text_primary'))
            .layoutWeight(1)
          Button($r('app.string.close_sample'), { type: ButtonType.Normal })
            .height(36)
            .fontSize(14)
            .fontColor($r('app.color.keyboard_text_secondary'))
            .backgroundColor(Color.Transparent)
            .onClick(() => { this.closePage(); })
        }.width('100%')

        Column({ space: 12 } as ColumnOptions) {
          Text($r('app.string.text_content'))
            .fontSize(16)
            .fontWeight(FontWeight.Medium)
            .fontColor($r('app.color.keyboard_text_primary'))
            .width('100%')
          // 注册代理后点击编辑框，框架将触发绑定及键盘显示回调。
          TextInput({ text: this.text, placeholder: $r('app.string.input_placeholder') })
            .height(56)
            .fontSize(18)
            .fontColor($r('app.color.keyboard_text_primary'))
            .backgroundColor($r('app.color.keyboard_input_background'))
            .borderRadius(8)
            .type(InputType.Normal)
            .onChange((value: string) => { this.text = value; })
        }
        .width('100%')
        .padding(16)
        .borderRadius(16)
        .backgroundColor($r('app.color.keyboard_surface'))

        Row({ space: 12 } as RowOptions) {
          Button($r('app.string.enable_keyboard'), { type: ButtonType.Normal })
            .layoutWeight(1)
            .height(44)
            .borderRadius(12)
            .fontSize(16)
            .backgroundColor($r('app.color.keyboard_accent'))
            .onClick(() => {
              this.session.register().catch<void>((error: Error): void => { this.logError(error); });
            })
          Button($r('app.string.disable_keyboard'), { type: ButtonType.Normal })
            .layoutWeight(1)
            .height(44)
            .borderRadius(12)
            .fontSize(16)
            .fontColor($r('app.color.keyboard_accent'))
            .backgroundColor($r('app.color.keyboard_secondary_button_background'))
            .onClick(() => {
              this.session.unregister().catch<void>((error: Error): void => { this.logError(error); });
            })
        }.width('100%')
        Text($r('app.string.description'))
          .fontSize(14)
          .fontColor($r('app.color.keyboard_text_description'))
          .width('100%')
      }
      .width('100%')
      .padding({ left: 24, right: 24, top: 20 })

      Blank(undefined).layoutWeight(1)

      if (this.keyboardVisible) {
        Column({ space: 8 } as ColumnOptions) {
          Row(undefined) {
            Text($r('app.string.custom_keyboard'))
              .fontSize(14)
              .fontColor($r('app.color.keyboard_text_secondary'))
            Blank(undefined)
            Button($r('app.string.collapse'), { type: ButtonType.Normal })
              .height(32)
              .fontSize(14)
              .fontColor($r('app.color.keyboard_accent'))
              .backgroundColor(Color.Transparent)
              .focusable(false)
              .onClick(() => {
                this.session.hide().catch<void>((error: Error): void => { this.logError(error); });
              })
          }.width('100%')
          Row({ space: 8 } as RowOptions) {
            this.characterKey('1')
            this.characterKey('2')
            this.characterKey('3')
          }.width('100%')
          Row({ space: 8 } as RowOptions) {
            this.characterKey('4')
            this.characterKey('5')
            this.characterKey('6')
          }.width('100%')
          Row({ space: 8 } as RowOptions) {
            this.characterKey('7')
            this.characterKey('8')
            this.characterKey('9')
          }.width('100%')
          Row({ space: 8 } as RowOptions) {
            this.characterKey('A')
            this.characterKey('0')
            Button($r('app.string.delete'), { type: ButtonType.Normal })
              .layoutWeight(1)
              .height(44)
              .borderRadius(8)
              .fontSize(16)
              .fontColor($r('app.color.keyboard_text_primary'))
              .backgroundColor($r('app.color.keyboard_delete_background'))
              .focusable(false)
              .onClick(() => {
                this.session.deleteBeforeCursor().catch<void>((error: Error): void => { this.logError(error); });
              })
          }.width('100%')
        }
        .width('100%')
        .padding({ left: 16, right: 16, top: 8, bottom: 16 })
        .borderRadius({ topLeft: 16, topRight: 16 })
        .backgroundColor($r('app.color.keyboard_panel_background'))
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.keyboard_page_background'))
  }
}
// [End draw_keyboard]
