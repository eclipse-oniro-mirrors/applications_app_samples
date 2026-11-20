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

/**
 * 系统输入法面板里加载的键盘页。
 *
 * 由 PanelController 通过 setUiContent('inputmethodextensionability/pages/KeyboardPage') 挂载，
 * 因此必须登记在 main_pages.json 里。按键先改本地缓冲，再在存在 InputClient 时
 * 把插入/删除转发给真实编辑框；没有连接时只改缓冲，并在底部说明原因。
 */

import { AppSpacing, AppText } from '../../common/Theme';
import { KEYBOARD_BUFFER_LIMIT } from '../../common/AppConstants';
import { KeyEdit, KeySpec, KeyboardMode, applyKey, modeName } from '../../model/KeyboardModel';
import { KeyboardPanel } from '../../components/KeyboardPanel';
import { textOfResource } from '../../components/CommonWidgets';
import { KeyboardBridge } from '../../utils/KeyboardBridge';
import { Logger } from '../../utils/Logger';

const SOURCE: string = 'KeyboardPage';
const PAGE_BG: string = '#1F2226';
const HINT_TEXT: string = '#9AA0A6';
const BODY_TEXT: string = '#E7E9EC';

@Entry
@Component
struct KeyboardPage {
  @State text: string = '';
  @State mode: KeyboardMode = KeyboardMode.LETTER;
  @State forwardHint: string = KeyboardBridge.statusText();

  aboutToAppear(): void {
    Logger.info(SOURCE, 'Page', 'keyboard page loaded into panel');
  }

  /** forwardHint 是字符串，这里按资源 id 取出本地化文案 */
  private textOf(res: Resource): string {
    return textOfResource(this.getUIContext().getHostContext(), res);
  }

  private handleKey(key: KeySpec): void {
    const edit: KeyEdit = applyKey(this.text, this.mode, key, KEYBOARD_BUFFER_LIMIT);
    this.text = edit.text;
    this.mode = edit.mode;
    this.forwardEdit(edit);
  }

  /** 有编辑框就转发，没有就只记缓冲；两种情况都写清楚，不假装已上屏 */
  private forwardEdit(edit: KeyEdit): void {
    if (!KeyboardBridge.hasClient()) {
      this.forwardHint = this.textOf($r('app.string.kb_hint_no_client'));
      return;
    }
    if (edit.inserted.length > 0) {
      KeyboardBridge.insertText(edit.inserted).then((accepted: boolean) => {
        this.forwardHint = accepted ?
          this.textOf($r('app.string.kb_hint_inserted', edit.inserted)) :
          this.textOf($r('app.string.kb_hint_insert_rejected'));
      });
      return;
    }
    if (edit.deleted > 0) {
      KeyboardBridge.deleteBackward(edit.deleted).then((accepted: boolean) => {
        this.forwardHint = accepted ?
          this.textOf($r('app.string.kb_hint_deleted')) :
          this.textOf($r('app.string.kb_hint_delete_rejected'));
      });
    }
  }

  build() {
    Column({ space: AppSpacing.SM }) {
      Row({ space: AppSpacing.MD }) {
        Text($r('app.string.kb_panel_title', modeName(this.mode)))
          .fontSize(AppText.SMALL)
          .fontColor(BODY_TEXT)
        Blank()
        Text(`${this.text.length}/${KEYBOARD_BUFFER_LIMIT}`)
          .fontSize(AppText.CAPTION)
          .fontColor(HINT_TEXT)
      }
      .width('100%')

      KeyboardPanel({
        text: this.text,
        mode: this.mode,
        caption: $r('app.string.kb_caption_candidates'),
        onKey: (key: KeySpec) => {
          this.handleKey(key);
        }
      })

      Text(this.forwardHint)
        .fontSize(AppText.CAPTION)
        .fontColor(HINT_TEXT)
        .width('100%')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.End)
    .padding(AppSpacing.MD)
    .backgroundColor(PAGE_BG)
  }
}
