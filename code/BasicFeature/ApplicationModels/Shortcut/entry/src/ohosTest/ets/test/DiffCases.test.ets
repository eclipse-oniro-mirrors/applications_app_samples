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

import { describe, expect, it } from '@ohos/hypium';
import {
  DiffKind, diffBadge, diffCharacters, diffLines, sideBySide
} from '../../../main/ets/business/TextDiff';

export default function diffCases(): void {
  describe('TextDiff', (): void => {
    /**
     * @tc.number    SUB_SHORTCUT_TEXTDIFF_0100
     * @tc.name      testTextDiff0001
     * @tc.desc      Verify identical text reports no change
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */


    it('testTextDiff0001', 0, (): void => {
      const result = diffLines('第一行\n第二行', '第一行\n第二行');
      expect(result.summary.identical).assertTrue();
      expect(result.summary.added).assertEqual(0);
      expect(result.summary.removed).assertEqual(0);
      expect(result.summary.equal).assertEqual(2);
      expect(result.lines.length).assertEqual(2);
      expect(result.changeLines()[0]).assertEqual('内容完全相同');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TEXTDIFF_0200
     * @tc.name      testTextDiff0002
     * @tc.desc      Verify replaced line is removed then added
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testTextDiff0002', 0, (): void => {
      const result = diffLines('标题\n正文A\n结尾', '标题\n正文B\n结尾');
      expect(result.summary.removed).assertEqual(1);
      expect(result.summary.added).assertEqual(1);
      const removed = result.lines.filter((line) => line.kind === DiffKind.REMOVED)[0];
      const added = result.lines.filter((line) => line.kind === DiffKind.ADDED)[0];
      expect(removed.text).assertEqual('正文A');
      expect(removed.oldLine).assertEqual(2);
      expect(added.text).assertEqual('正文B');
      expect(added.newLine).assertEqual(2);
      expect(diffBadge(result.summary)).assertEqual('+1 / -1');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TEXTDIFF_0300
     * @tc.name      testTextDiff0003
     * @tc.desc      Verify inserted line keeps common lines
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */


    it('testTextDiff0003', 0, (): void => {
      const result = diffLines('A\nC', 'A\nB\nC');
      expect(result.summary.added).assertEqual(1);
      expect(result.summary.removed).assertEqual(0);
      expect(result.summary.equal).assertEqual(2);
      const rows = sideBySide(result);
      expect(rows.length).assertEqual(3);
      expect(rows[1].right).assertEqual('B');
      expect(rows[1].left).assertEqual('');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TEXTDIFF_0400
     * @tc.name      testTextDiff0004
     * @tc.desc      Verify character diff reports changes
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testTextDiff0004', 0, (): void => {
      const lines = diffCharacters('今日待办清单', '今日待办列表');
      expect(lines.indexOf('相同前缀：今日待办') >= 0).assertTrue();
      expect(lines.indexOf('删除：清单') >= 0).assertTrue();
      expect(lines.indexOf('新增：列表') >= 0).assertTrue();
      expect(diffCharacters('相同', '相同')[0]).assertEqual('完全相同');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TEXTDIFF_0500
     * @tc.name      testTextDiff0005
     * @tc.desc      Verify oversized input is explicitly truncated
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it('testTextDiff0005', 0, (): void => {
      const oldText: string = 'x'.repeat(20001);
      const result = diffLines(oldText, 'y');
      expect(result.summary.truncated).assertTrue();
      expect(result.summary.changed()).assertFalse();
      expect(diffBadge(result.summary)).assertEqual('超限，未逐行比较');
      expect(result.summary.text().indexOf('上限') >= 0).assertTrue();
    });
  });
}
