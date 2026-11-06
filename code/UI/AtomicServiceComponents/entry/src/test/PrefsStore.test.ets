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
// PrefsStore 单测：文本裁剪、空值判定、计数推进、落盘值读取与摘要文案。
// 首选项演示页的输入清洗和展示文案都依赖这些纯函数，避免把界面状态写进存储。

import { describe, it, expect } from '@ohos/hypium';
import {
  PREFS_MAX_LENGTH,
  buildPrefsSummary,
  canSaveText,
  nextCount,
  normalizePrefsText,
  readCount,
  readText
} from '../main/ets/model/PrefsStore';

export default function prefsStoreTest() {
  describe('PrefsStoreTest', () => {
    // 首尾空白裁剪，内部空白保留
    it('normalizePrefsText_trimsEdges', 0, () => {
      expect(normalizePrefsText('  hello  ')).assertEqual('hello');
      expect(normalizePrefsText('\t首选项\n')).assertEqual('首选项');
      expect(normalizePrefsText('  中间 空格  ')).assertEqual('中间 空格');
      expect(normalizePrefsText('')).assertEqual('');
    });

    // 超长文本按 80 字符截断，中文与 Emoji 按 UTF-16 单元计数
    it('normalizePrefsText_truncates', 0, () => {
      const long = new Array<string>(PREFS_MAX_LENGTH + 20).fill('A').join('');
      expect(normalizePrefsText(long).length).assertEqual(PREFS_MAX_LENGTH);
      const chinese = new Array<string>(PREFS_MAX_LENGTH).fill('字').join('');
      expect(normalizePrefsText(chinese).length).assertEqual(PREFS_MAX_LENGTH);
      const emoji = new Array<string>(PREFS_MAX_LENGTH).fill('😀').join('');
      expect(normalizePrefsText(emoji).length).assertEqual(PREFS_MAX_LENGTH);
      expect(normalizePrefsText('短文本')).assertEqual('短文本');
    });

    // 只有空白字符视为空内容，不写入
    it('canSaveText_blankRules', 0, () => {
      expect(canSaveText('')).assertFalse();
      expect(canSaveText('   ')).assertFalse();
      expect(canSaveText('\n\t')).assertFalse();
      expect(canSaveText(' 内容 ')).assertTrue();
    });

    // 计数推进：正常递增，负数归一到 1
    it('nextCount_progression', 0, () => {
      expect(nextCount(0)).assertEqual(1);
      expect(nextCount(5)).assertEqual(6);
      expect(nextCount(-3)).assertEqual(1);
    });

    // 计数读取：只接受正数并向下取整，字符串与布尔回落 0
    it('readCount_typeGuards', 0, () => {
      expect(readCount(3)).assertEqual(3);
      expect(readCount(3.9)).assertEqual(3);
      expect(readCount(0)).assertEqual(0);
      expect(readCount(-1)).assertEqual(0);
      expect(readCount('5')).assertEqual(0);
      expect(readCount(true)).assertEqual(0);
    });

    // 文本读取：非字符串回落空串
    it('readText_typeGuards', 0, () => {
      expect(readText('内容')).assertEqual('内容');
      expect(readText('')).assertEqual('');
      expect(readText(12)).assertEqual('');
      expect(readText(false)).assertEqual('');
    });

    // 摘要文案：有内容与无内容两种形态
    it('buildPrefsSummary_variants', 0, () => {
      expect(buildPrefsSummary('Atomic service', 3)).assertEqual('Saved "Atomic service", read 3 times');
      expect(buildPrefsSummary('', 0)).assertEqual('No content yet, read 0 times');
    });
  });
}
