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

import { inputMethodEngine } from '@kit.IMEKit';
import { BusinessError } from '@kit.BasicServicesKit';

class PreviewSender {
  private previewText: string = '';

  setPreviewText(text: string): void {
    this.previewText = text;
  }

  private client: inputMethodEngine.InputClient | undefined = undefined;
  private busy: boolean = false;

  setClient(client: inputMethodEngine.InputClient | undefined): void {
    this.client = client;
    this.status(client === undefined ? $r('app.string.bind_editor_first') : $r('app.string.editor_connected'));
  }

  status(message: ResourceStr): void {
    AppStorage.setOrCreate('previewSenderStatus', message);
  }

  // [Start preview_style_js_send]
  async send(): Promise<void> {
    const client = this.client;
    if (client === undefined || this.busy) {
      this.status(this.busy ? $r('app.string.operation_busy') : $r('app.string.bind_editor_first'));
      return;
    }
    this.busy = true;
    const range: inputMethodEngine.Range = { start: -1, end: -1 };
    const style: inputMethodEngine.PreviewTextStyle = {
      underlineStyle: inputMethodEngine.UnderlineStyle.WAVY,
      underlineColor: 0x00FF0000
    };
    // 省略underlineColor使用编辑框主题色；显式传入0表示黑色。
    try {
      await client.setPreviewTextWithStyle(this.previewText, range, style);
      this.status($r('app.string.preview_displayed'));
    } catch (error) {
      const detail = error as BusinessError;
      this.status($r('app.string.preview_send_failed', detail.code));
    } finally {
      this.busy = false;
    }
  }
  // [End preview_style_js_send]

  // [Start preview_style_js_send_sync]
  // 同步调用的等价写法。页面使用上面的异步方法。
  sendSync(): void {
    const client = this.client;
    if (client === undefined || this.busy) {
      this.status(this.busy ? $r('app.string.operation_busy') : $r('app.string.bind_editor_first'));
      return;
    }
    const range: inputMethodEngine.Range = { start: -1, end: -1 };
    const style: inputMethodEngine.PreviewTextStyle = {
      underlineStyle: inputMethodEngine.UnderlineStyle.WAVY,
      underlineColor: 0x00FF0000
    };
    try {
      client.setPreviewTextWithStyleSync(this.previewText, range, style);
      this.status($r('app.string.preview_displayed'));
    } catch (error) {
      const detail = error as BusinessError;
      this.status($r('app.string.preview_send_failed', detail.code));
    }
  }
  // [End preview_style_js_send_sync]

  // [Start preview_style_js_finish]
  async finish(): Promise<void> {
    const client = this.client;
    if (client === undefined || this.busy) {
      this.status(this.busy ? $r('app.string.operation_busy') : $r('app.string.bind_editor_first'));
      return;
    }
    this.busy = true;
    try {
      await client.finishTextPreview();
      this.status($r('app.string.preview_finished'));
    } catch (error) {
      const detail = error as BusinessError;
      this.status($r('app.string.preview_finish_failed', detail.code));
    } finally {
      this.busy = false;
    }
  }
  // [End preview_style_js_finish]
}

export const previewSender: PreviewSender = new PreviewSender();
