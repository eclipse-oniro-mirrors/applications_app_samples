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

import { hilog } from '@kit.PerformanceAnalysisKit';

import {
  ResourceStr, Component, State, Column, Text, Span, TextDecorationType, TextDecorationStyle, focusControl, $r
} from '@kit.ArkUI';
import { inputMethod, inputMethodEngine } from '@kit.IMEKit';
import { BusinessError } from '@kit.BasicServicesKit';

const DOMAIN = 0xF811;
const TAG = 'PreviewTextStyleStatic';
const DEFAULT_UNDERLINE_COLOR: int = -0xCEA00C;
const OPAQUE_ALPHA_MASK: int = -0x1000000;

@Component
export struct PreviewEditor {
  @State private content: string = '';
  @State private start: int = -1;
  @State private end: int = -1;
  @State private underline: int = 0;
  @State private color: int = DEFAULT_UNDERLINE_COLOR;
  @State private status: ResourceStr = $r('app.string.editor_waiting');
  @State private attached: boolean = false;
  @State private pending: boolean = false;
  private cursor: int = 0;
  private alive: boolean = true;
  private listening: boolean = false;
  private finishing: boolean = false;
  private editing: boolean = false;
  private controller: inputMethod.InputMethodController = inputMethod.getController();

  // [Start preview_style_sta_receive]
  private onStyledPreview: inputMethod.SetPreviewTextWithStyleCallback =
    (text: string, range: inputMethod.Range, style: inputMethodEngine.PreviewTextStyle): void => {
      if (!this.alive || !this.listening) {
        return;
      }
      EAWorker.postToMain<void>((): void => {
        if (!this.alive || !this.listening) {
          return;
        }
        if (!this.applyPreview(text, range)) {
          this.status = $r('app.string.invalid_preview_range');
          return;
        }
        this.underline = style.underlineStyle.valueOf();
        const requestedColor: int | undefined = style.underlineColor;
        this.color = requestedColor === undefined ? DEFAULT_UNDERLINE_COLOR : requestedColor | OPAQUE_ALPHA_MASK;
        this.status = $r('app.string.static_preview_received');
      });
    };

  private onFinishPreview: () => void = (): void => {
    if (this.alive && this.listening) {
      EAWorker.postToMain<void>((): void => {
        if (!this.alive || !this.listening) {
          return;
        }
        this.finishPreview();
        this.status = $r('app.string.preview_finished_text_kept');
      });
    }
  };
  // [End preview_style_sta_receive]

  private onCursor: () => int = (): int => this.cursor;
  private onInsert: (text: string) => void = (text: string): void => {
    if (!this.alive || !this.attached) {
      return;
    }
    EAWorker.postToMain<void>((): void => {
      if (!this.alive || !this.attached) {
        return;
      }
      this.finishPreview();
      this.content = this.content.substring(0, this.cursor) + text + this.content.substring(this.cursor);
      this.cursor += text.length;
    });
  };
  private onDelete: (length: int) => void = (length: int): void => {
    if (!this.alive || !this.attached) {
      return;
    }
    EAWorker.postToMain<void>((): void => {
      if (!this.alive || !this.attached) {
        return;
      }
      this.finishPreview();
      const from: int = length > this.cursor ? 0 : this.cursor - length;
      this.content = this.content.substring(0, from) + this.content.substring(this.cursor);
      this.cursor = from;
    });
  };

  private applyPreview(text: string, range: inputMethod.Range): boolean {
    let from: int = range.start;
    let to: int = range.end;
    if (from === -1 && to === -1) {
      from = this.start >= 0 ? this.start : this.cursor;
      to = this.start >= 0 ? this.end : this.cursor;
    }
    if (from < 0 || to < from || to > this.content.length) {
      return false;
    }
    if (this.start >= 0 && (from < this.start || to > this.end)) {
      return false;
    }
    this.content = this.content.substring(0, from) + text + this.content.substring(to);
    this.start = this.start >= 0 ? this.start : from;
    this.end = this.end >= 0 ? this.end + text.length - (to - from) : from + text.length;
    this.cursor = from + text.length;
    return true;
  }

  private finishPreview(): void {
    this.start = -1;
    this.end = -1;
    this.underline = 0;
  }

  // [Start preview_style_sta_subscribe]
  private subscribeStyledPreview(): void {
    if (!this.listening) {
      this.controller.onSetPreviewTextWithStyle(this.onStyledPreview);
      this.listening = true;
    }
    if (!this.finishing) {
      this.controller.onFinishTextPreview(this.onFinishPreview);
      this.finishing = true;
    }
  }

  private unsubscribeStyledPreview(): void {
    if (this.listening) {
      this.controller.offSetPreviewTextWithStyle(this.onStyledPreview);
      this.listening = false;
    }
    if (this.finishing) {
      this.controller.offFinishTextPreview(this.onFinishPreview);
      this.finishing = false;
    }
  }
  // [End preview_style_sta_subscribe]

  private async attach(): Promise<void> {
    if (this.pending || this.attached || !this.alive) {
      return;
    }
    this.pending = true;
    try {
      focusControl.requestFocus('staticPreviewEditor');
      this.subscribeStyledPreview();
      await this.controller.attach(true, {
        inputAttribute: { textInputType: inputMethod.TextInputType.TEXT, enterKeyType: inputMethod.EnterKeyType.DONE }
      });
      this.attached = true;
      if (!this.alive) {
        await this.releaseEditor();
        return;
      }
      this.editing = true;
      this.controller.onGetTextIndexAtCursor(this.onCursor);
      this.controller.onInsertText(this.onInsert);
      this.controller.onDeleteLeft(this.onDelete);
      this.status = $r('app.string.static_editor_connected_hint');
    } catch (error) {
      const detail = error as BusinessError;
      this.status = $r('app.string.editor_attach_failed', detail.code);
      try {
        await this.releaseEditor();
      } catch (cleanupError) {
        const cleanupDetail = cleanupError as BusinessError;
        this.status = $r('app.string.editor_cleanup_retry', cleanupDetail.code);
      }
    } finally {
      this.pending = false;
    }
  }

  private async releaseEditor(): Promise<void> {
    this.unsubscribeStyledPreview();
    if (this.editing) {
      this.controller.offGetTextIndexAtCursor(this.onCursor);
      this.controller.offInsertText(this.onInsert);
      this.controller.offDeleteLeft(this.onDelete);
      this.editing = false;
    }
    if (this.attached) {
      await this.controller.detach();
      this.attached = false;
    }
    this.finishPreview();
  }

  aboutToDisappear(): void {
    this.alive = false;
    this.releaseEditor().catch((error: Error): void => {
      hilog.error(DOMAIN, TAG, '%{public}s', `Editor release failed: ${error.message}`);
    });
  }

  build(): void {
    Column() {
      Text() {
        if (this.content.length === 0) {
          Span($r('app.string.editor_placeholder'))
        } else if (this.start >= 0) {
          Span(this.content.substring(0, this.start))
          Span(this.content.substring(this.start, this.end))
            .decoration({
              type: this.underline === 0 ? TextDecorationType.None : TextDecorationType.Underline,
              color: this.color,
              style: this.underline === 2 ? TextDecorationStyle.WAVY :
                this.underline === 3 ? TextDecorationStyle.DASHED : TextDecorationStyle.SOLID
            })
          Span(this.content.substring(this.end))
        } else {
          Span(this.content)
        }
      }
      .fontSize(20)
      .height(76)
      .width('100%')
      .maxLines(2)
      .padding(12)
      .border({ width: 1, color: $r('app.color.editor_border'), radius: 12 })
      .focusable(true)
      .id('staticPreviewEditor')
      .onClick((): void => {
        this.attach();
      })
      .margin({ bottom: 16 })
      Text(this.status)
        .fontSize(14)
        .width('100%')
        .height(44)
        .maxLines(2)
    }
    .width('100%')
  }
}
