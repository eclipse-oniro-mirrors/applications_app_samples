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

import { inputMethod } from '@kit.IMEKit';
import { BusinessError } from '@kit.BasicServicesKit';

@Component
export struct PreviewEditor {
  @State private content: string = '';
  @State private previewStart: number = -1;
  @State private previewEnd: number = -1;
  @State private underline: number = 0;
  @State private color: ResourceColor = $r('app.color.accent');
  @State private attached: boolean = false;
  @State private status: ResourceStr = $r('app.string.editor_waiting');
  private cursor: number = 0;
  @State private pending: boolean = false;
  private alive: boolean = true;
  private listening: boolean = false;
  private legacyListening: boolean = false;
  private styledText: string = '';
  private styledRangeStart: number = -2;
  private styledRangeEnd: number = -2;
  private finishListening: boolean = false;
  private cursorListening: boolean = false;
  private insertListening: boolean = false;
  private deleteListening: boolean = false;
  private controller: inputMethod.InputMethodController = inputMethod.getController();

  private finishCallback: () => void = (): void => {
    if (this.alive && this.finishListening) {
      this.getUIContext().runScopedTask((): void => {
        this.finishPreview();
      });
    }
  };
  private cursorCallback: () => number = (): number => this.cursor;
  private insertCallback: (text: string) => void = (text: string): void => {
    if (!this.alive || !this.attached) {
      return;
    }
    this.finishPreview();
    this.content = this.content.substring(0, this.cursor) + text + this.content.substring(this.cursor);
    this.cursor += text.length;
  };
  private deleteCallback: (length: number) => void = (length: number): void => {
    if (!this.alive || !this.attached) {
      return;
    }
    this.finishPreview();
    const start = Math.max(0, this.cursor - length);
    this.content = this.content.substring(0, start) + this.content.substring(this.cursor);
    this.cursor = start;
  };

  // [Start preview_style_js_receive]
  // 保留同一回调对象，用于解绑时取消本编辑框的订阅。
  private styledCallback: inputMethod.SetPreviewTextWithStyleCallback =
    (text: string, range: inputMethod.Range, style: inputMethod.PreviewTextStyle): void => {
      if (!this.alive || !this.listening) {
        return;
      }
      this.getUIContext().runScopedTask((): void => {
        this.applyPreview(text, range);
        this.underline = style.underlineStyle;
        this.color = style.underlineColor === undefined ? $r('app.color.accent') :
          0xFF000000 + (style.underlineColor & 0x00FFFFFF);
        this.styledText = text;
        this.styledRangeStart = range.start;
        this.styledRangeEnd = range.end;
        this.status = $r('app.string.preview_displayed');
      });
    };

  private legacyCallback: inputMethod.SetPreviewTextCallback = (text: string, range: inputMethod.Range): void => {
    if (!this.alive || !this.legacyListening) {
      return;
    }
    this.getUIContext().runScopedTask((): void => {
      // setPreviewText事件回调不覆盖同一请求已经收到的样式。
      if (text === this.styledText && range.start === this.styledRangeStart &&
        range.end === this.styledRangeEnd && this.previewStart >= 0) {
        return;
      }
      this.applyPreview(text, range);
      this.underline = inputMethod.UnderlineStyle.SOLID;
      this.color = $r('app.color.accent');
    });
  };
  // [End preview_style_js_receive]

  private applyPreview(text: string, range: inputMethod.Range): void {
    const active = this.previewStart >= 0;
    let start = range.start;
    let end = range.end;
    if (start === -1 && end === -1) {
      start = active ? this.previewStart : this.cursor;
      end = active ? this.previewEnd : this.cursor;
    }
    this.content = this.content.substring(0, start) + text + this.content.substring(end);
    this.previewStart = active ? this.previewStart : start;
    this.previewEnd = active ? this.previewEnd + text.length - (end - start) : start + text.length;
    this.cursor = start + text.length;
  }

  private finishPreview(): void {
    this.previewStart = -1;
    this.previewEnd = -1;
    this.underline = 0;
    this.styledText = '';
    this.styledRangeStart = -2;
    this.styledRangeEnd = -2;
  }

  // [Start preview_style_js_subscribe]
  private subscribeStyle(): void {
    if (!this.listening) {
      this.controller.onSetPreviewTextWithStyle(this.styledCallback);
      this.listening = true;
    }
  }

  private unsubscribeStyle(): void {
    if (this.listening) {
      this.controller.offSetPreviewTextWithStyle(this.styledCallback);
      this.listening = false;
    }
  }
  // [End preview_style_js_subscribe]

  // [Start preview_style_js_attach]
  private async connectEditor(): Promise<void> {
    this.controller.on('setPreviewText', this.legacyCallback);
    this.legacyListening = true;
    this.subscribeStyle();
    this.controller.on('finishTextPreview', this.finishCallback);
    this.finishListening = true;
    await this.controller.attach(true, {
      inputAttribute: { textInputType: inputMethod.TextInputType.TEXT, enterKeyType: inputMethod.EnterKeyType.DONE }
    });
    this.attached = true;
    if (!this.alive) {
      await this.disconnectEditor();
      return;
    }
    // 以下编辑回调需要在编辑框绑定成功后注册。
    this.controller.on('getTextIndexAtCursor', this.cursorCallback);
    this.cursorListening = true;
    this.controller.on('insertText', this.insertCallback);
    this.insertListening = true;
    this.controller.on('deleteLeft', this.deleteCallback);
    this.deleteListening = true;
    this.status = $r('app.string.editor_connected_hint');
  }
  // [End preview_style_js_attach]

  private async attach(): Promise<void> {
    if (this.attached || this.pending || !this.alive) {
      return;
    }
    this.pending = true;
    try {
      await this.connectEditor();
    } catch (error) {
      const detail = error as BusinessError;
      this.status = $r('app.string.editor_attach_failed', detail.code);
      try {
        await this.disconnectEditor();
      } catch (cleanupError) {
        const cleanup = cleanupError as BusinessError;
        this.status = $r('app.string.editor_cleanup_failed', cleanup.code);
      }
    } finally {
      this.pending = false;
    }
  }

  private removeListeners(): void {
    // 解绑前仅移除本次连接注册的回调。
    if (this.attached) {
      if (this.cursorListening) {
        this.controller.off('getTextIndexAtCursor', this.cursorCallback);
        this.cursorListening = false;
      }
      if (this.insertListening) {
        this.controller.off('insertText', this.insertCallback);
        this.insertListening = false;
      }
      if (this.deleteListening) {
        this.controller.off('deleteLeft', this.deleteCallback);
        this.deleteListening = false;
      }
    }
    this.unsubscribeStyle();
    if (this.legacyListening) {
      this.controller.off('setPreviewText', this.legacyCallback);
      this.legacyListening = false;
    }
    if (this.finishListening) {
      this.controller.off('finishTextPreview', this.finishCallback);
      this.finishListening = false;
    }
  }

  private async disconnectEditor(): Promise<void> {
    this.removeListeners();
    if (this.attached) {
      await this.controller.detach();
      this.attached = false;
    }
    this.finishPreview();
  }

  private async detach(): Promise<void> {
    if (this.pending) {
      return;
    }
    this.pending = true;
    try {
      await this.disconnectEditor();
      this.status = $r('app.string.editor_disconnected');
    } catch (error) {
      const detail = error as BusinessError;
      this.status = $r('app.string.editor_detach_failed', detail.code);
    } finally {
      this.pending = false;
    }
  }

  private async openCEditor(): Promise<void> {
    if (this.pending || !this.alive) {
      return;
    }
    this.pending = true;
    try {
      await this.disconnectEditor();
      this.status = $r('app.string.editor_disconnected');
      await this.getUIContext().getRouter().pushUrl({ url: 'pages/PrivatePreview' });
    } catch (error) {
      const detail = error as BusinessError;
      this.status = $r('app.string.open_c_editor_failed', detail.code);
    } finally {
      this.pending = false;
    }
  }

  aboutToAppear(): void {
    this.alive = true;
  }

  aboutToDisappear(): void {
    this.alive = false;
    if (!this.pending) {
      this.detach();
    }
  }

  build() {
    Column({ space: 8 }) {
      Text() {
        if (this.content.length === 0) {
          Span($r('app.string.editor_placeholder'))
        } else if (this.previewStart >= 0) {
          Span(this.content.substring(0, this.previewStart))
          Span(this.content.substring(this.previewStart, this.previewEnd))
            .decoration({
              type: this.underline === 0 ? TextDecorationType.None : TextDecorationType.Underline,
              color: this.color,
              style: this.underline === 2 ? TextDecorationStyle.WAVY :
                this.underline === 3 ? TextDecorationStyle.DASHED : TextDecorationStyle.SOLID
            })
          Span(this.content.substring(this.previewEnd))
        } else {
          Span(this.content)
        }
      }
      .fontSize(22)
      .fontColor($r('app.color.text_primary'))
      .width('100%')
      .height(76)
      .maxLines(2)
      .padding(12)
      .backgroundColor($r('app.color.panel_background'))
      .borderRadius(12)
      .id('jsPreviewEditor')
      .margin({ bottom: 12 })
      .flexShrink(0)
      Row({ space: 8 }) {
        Button(this.attached ? $r('app.string.detach') : $r('app.string.attach'))
          .id('jsPreviewAttach')
          .height(36)
          .fontSize(13)
          .layoutWeight(1)
          .enabled(!this.pending)
          .onClick((): void => {
            if (this.attached) {
              this.detach();
            } else {
              this.attach();
            }
          })
        Button($r('app.string.open_c_editor'))
          .id('openCPreviewEditor')
          .height(36)
          .fontSize(13)
          .layoutWeight(1)
          .enabled(!this.pending)
          .onClick((): void => {
            this.openCEditor();
          })
      }
      .width('100%')
      .height(36)
      .margin({ bottom: 8 })
      .flexShrink(0)
      Text(this.status)
        .id('jsPreviewStatus')
        .fontSize(13)
        .fontColor($r('app.color.text_secondary'))
        .width('100%')
      Text($r('app.string.custom_hint'))
        .fontSize(12)
        .fontColor($r('app.color.text_secondary'))
        .width('100%')
    }
    .padding(12)
    .width('100%')
    .alignItems(HorizontalAlign.Start)
    .justifyContent(FlexAlign.Start)
  }
}
