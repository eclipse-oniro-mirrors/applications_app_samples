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
 * 软键盘面板的展示组件：候选栏 + 三行字符键 + 一行功能键。
 *
 * 同一个组件在两处使用：
 * 1) InputMethodExtensionAbility 的面板页（系统真实面板，点击经 KeyboardBridge 写进编辑框）；
 * 2) 面板演示页的预览（没有输入目标，只在本地缓冲里编辑）。
 * 布局与按键动作全部来自 model/KeyboardModel 的纯函数，组件本身不判断业务。
 */

import { AppColors, AppRadius, AppSpacing, AppText } from '../common/Theme';
import {
  CANDIDATE_BAR_HEIGHT,
  KEYBOARD_GAP,
  KEYBOARD_PADDING,
  KEYBOARD_ROW_HEIGHT
} from '../common/AppConstants';
import {
  ACTION_CHAR,
  KeySpec,
  KeyboardMode,
  buildFunctionRow,
  buildRows,
  candidatesFor
} from '../model/KeyboardModel';

const PANEL_BG: string = '#2B2E33';
const KEY_BG: string = '#4A4E55';
const KEY_BG_FUNC: string = '#35383D';
const KEY_TEXT: string = '#FFFFFF';
const CANDIDATE_EMPTY: string = '#8E939B';
const MAX_CANDIDATES: number = 3;

@Component
export struct KeyboardPanel {
  @Prop text: string = '';
  @Prop mode: KeyboardMode = KeyboardMode.LETTER;
  @Prop caption: string = '';
  onKey: (key: KeySpec) => void = () => {
  };

  private candidates(): string[] {
    return candidatesFor(this.text).slice(0, MAX_CANDIDATES);
  }

  @Builder
  keyButton(key: KeySpec) {
    Button(key.label)
      .fontSize(AppText.LABEL)
      .fontColor(KEY_TEXT)
      .backgroundColor(key.action === ACTION_CHAR ? KEY_BG : KEY_BG_FUNC)
      .height(KEYBOARD_ROW_HEIGHT)
      .layoutWeight(key.wide ? 2 : 1)
      .borderRadius(AppRadius.SMALL)
      .padding(0)
      .onClick(() => {
        this.onKey(key);
      })
  }

  build() {
    Column({ space: KEYBOARD_GAP }) {
      Row({ space: AppSpacing.MD }) {
        Text(this.caption)
          .fontSize(AppText.CAPTION)
          .fontColor(CANDIDATE_EMPTY)
        Blank()
        if (this.candidates().length === 0) {
          Text('输入后这里出现候选')
            .fontSize(AppText.SMALL)
            .fontColor(CANDIDATE_EMPTY)
        } else {
          ForEach(this.candidates(), (item: string) => {
            Text(item)
              .fontSize(AppText.LABEL)
              .fontColor(KEY_TEXT)
              .padding({ left: AppSpacing.LG, right: AppSpacing.LG })
          }, (item: string) => item)
        }
      }
      .width('100%')
      .height(CANDIDATE_BAR_HEIGHT)
      .padding({ left: AppSpacing.MD, right: AppSpacing.MD })
      .backgroundColor(KEY_BG_FUNC)
      .borderRadius(AppRadius.SMALL)

      // key 必须带行内容：两种模式的行下标一样（row-0/1/2），只用下标时 ForEach 会复用旧行，
      // 切到数字模式后屏幕上仍是字母。
      ForEach(buildRows(this.mode), (row: KeySpec[], rowIndex: number) => {
        Row({ space: KEYBOARD_GAP }) {
          ForEach(row, (key: KeySpec) => {
            this.keyButton(key)
          }, (key: KeySpec) => key.label)
        }
        .width('100%')
      }, (row: KeySpec[], rowIndex: number) => row.map((key: KeySpec) => key.label).join(''))

      Row({ space: KEYBOARD_GAP }) {
        ForEach(buildFunctionRow(this.mode), (key: KeySpec) => {
          this.keyButton(key)
        }, (key: KeySpec) => `fn-${key.label}`)
      }
      .width('100%')
    }
    .width('100%')
    .padding(KEYBOARD_PADDING)
    .backgroundColor(PANEL_BG)
    .borderRadius(AppRadius.LARGE)
  }
}

/** 预览区外框：演示页用一个浅色卡片把深色键盘托起来 */
@Component
export struct KeyboardPreviewBox {
  @Prop text: string = '';
  @Prop mode: KeyboardMode = KeyboardMode.LETTER;
  @Prop caption: string = '';
  onKey: (key: KeySpec) => void = () => {
  };

  build() {
    Column({ space: AppSpacing.MD }) {
      Text(this.text.length > 0 ? this.text : '（尚未输入）')
        .fontSize(AppText.BODY)
        .fontColor(AppColors.TEXT_STRONG)
        .width('100%')
        .padding(AppSpacing.MD)
        .backgroundColor(AppColors.SUBTLE_BG)
        .borderRadius(AppRadius.SMALL)
        .maxLines(2)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
      KeyboardPanel({ text: this.text, mode: this.mode, caption: this.caption, onKey: this.onKey })
    }
    .width('100%')
  }
}
