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

import testNapi, { CEditorDisplay } from 'libentry.so';

const PREVIEW_REFRESH_INTERVAL_MS = 200;

@Entry
@Component
struct PreviewTextStyleC {
  @StorageLink('sampleKeyboardVisible') private keyboardVisible: boolean = false;
  @State private nativeAvailable: boolean = true;
  @State private editorText: string = '';
  @State private previewActive: boolean = false;
  @State private underlineStyle: number = 0;
  @State private underlineColor: number = 0;
  @State private hasUnderlineColor: boolean = false;
  @State private bound: boolean = false;
  @State private status: ResourceStr = $r('app.string.c_editor_start_hint');
  private timer: number = -1;

  aboutToAppear(): void {
    this.nativeAvailable = testNapi !== undefined;
    if (!this.nativeAvailable) {
      this.status = $r('app.string.native_module_unavailable');
      return;
    }
    this.startPolling();
  }

  onPageShow(): void {
    if (this.nativeAvailable) { this.startPolling(); }
  }

  onPageHide(): void {
    this.stopPolling();
    this.detach();
  }

  aboutToDisappear(): void {
    this.stopPolling();
    this.detach();
  }

  private startPolling(): void {
    if (testNapi === undefined) {
      this.nativeAvailable = false;
      this.status = $r('app.string.native_module_unavailable');
      return;
    }
    if (this.timer >= 0) {
      return;
    }
    this.refresh();
    this.timer = setInterval(() => {
      this.refresh();
    }, PREVIEW_REFRESH_INTERVAL_MS);
  }

  private stopPolling(): void {
    if (this.timer >= 0) {
      clearInterval(this.timer);
    }
    this.timer = -1;
  }

  private refresh(): void {
    this.bound = testNapi.isInputMethodAttached();
    const display: CEditorDisplay = testNapi.getCEditorDisplay();
    this.editorText = display.text;
    this.previewActive = display.active;
    this.underlineStyle = display.underlineStyle;
    this.underlineColor = display.underlineColor;
    this.hasUnderlineColor = display.hasUnderlineColor;
  }

  private attach(): void {
    if (!this.nativeAvailable) {
      return;
    }
    const code: number = this.bound ? testNapi.showInputMethodKeyboard() : testNapi.attachInputMethod();
    this.refresh();
    this.status = code === 0 ? $r('app.string.c_editor_bound') : $r('app.string.c_editor_bind_failed', code);
  }

  private detach(): boolean {
    if (!this.nativeAvailable) {
      return true;
    }
    const code: number = testNapi.inputMethodDestroy();
    this.refresh();
    this.status = code === 0 ? $r('app.string.c_editor_unbound') : $r('app.string.c_editor_unbind_failed', code);
    return code === 0;
  }

  build() {
    Column({ space: 10 }) {
      Row({ space: 8 }) {
        Text($r('app.string.c_preview_title'))
          .fontSize(20)
          .fontWeight(700)
          .layoutWeight(1)
          .maxLines(1)
        Button($r('app.string.return_to_js'))
          .id('backToJsPreviewEditor')
          .height(32)
          .fontSize(13)
          .width(88)
          .onClick((): void => {
            if (this.detach()) {
              this.stopPolling();
              this.getUIContext().getRouter().back();
            }
          })
      }
      .width('100%')
      Text() {
        Span(this.editorText.length > 0 ? this.editorText : $r('app.string.c_editor_placeholder'))
          .decoration({
            type: this.previewActive && this.underlineStyle !== 0 ?
              TextDecorationType.Underline : TextDecorationType.None,
            style: this.underlineStyle === 2 ? TextDecorationStyle.WAVY :
              this.underlineStyle === 3 ? TextDecorationStyle.DASHED : TextDecorationStyle.SOLID,
            color: this.hasUnderlineColor ? (this.underlineColor | 0xFF000000) :
              $r('sys.color.ohos_id_color_text_primary_activated')
          })
      }
      .id('cStandaloneEditor')
      .fontSize(18)
      .maxLines(2)
      .width('100%')
      .height(72)
      .padding(12)
      .backgroundColor($r('app.color.c_editor_background'))
      .border({ width: 1, color: $r('app.color.c_editor_border'), radius: 8 })
      .margin({ top: 8, bottom: 12 })
      .flexShrink(0)
      .onClick(() => {
        this.attach();
      })
      Button(this.bound ? $r('app.string.unbind') : $r('app.string.bind'))
        .id('cStandaloneAttach')
        .focusable(false)
        .height(36)
        .width('100%')
        .margin({ bottom: 8 })
        .flexShrink(0)
        .enabled(this.nativeAvailable)
        .onClick(() => {
          if (this.bound) {
            this.detach();
          } else {
            this.attach();
          }
        })
      Text(this.bound && this.previewActive ? $r('app.string.c_preview_received') : this.status)
        .id('cStandaloneResult')
        .fontSize(13)
        .maxLines(2)
        .width('100%')
      if (!this.keyboardVisible) {
        Text($r('app.string.c_preview_usage_hint'))
          .fontSize(12)
          .fontColor($r('app.color.c_editor_hint'))
          .width('100%')
      }
    }
    .padding(16)
    .width('100%')
    .height('100%')
    .alignItems(HorizontalAlign.Start)
    .justifyContent(FlexAlign.Start)
  }
}
