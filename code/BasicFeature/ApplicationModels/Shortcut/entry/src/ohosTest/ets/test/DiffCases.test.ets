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

import { describe } from '@ohos/hypium';
import { caseName, expect, it } from '../support/TestCase';
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


    it(caseName('TextDiff', '0001'), 0, (): void => {
      const result = diffLines('第一行\n第二行', '第一行\n第二行');
      expect(result.summary.identical, caseName('TextDiff', '0001')).assertTrue();
      expect(result.summary.added, caseName('TextDiff', '0001')).assertEqual(0);
      expect(result.summary.removed, caseName('TextDiff', '0001')).assertEqual(0);
      expect(result.summary.equal, caseName('TextDiff', '0001')).assertEqual(2);
      expect(result.lines.length, caseName('TextDiff', '0001')).assertEqual(2);
      expect(result.changeLines()[0], caseName('TextDiff', '0001')).assertEqual('内容完全相同');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TEXTDIFF_0200
     * @tc.name      testTextDiff0002
     * @tc.desc      Verify replaced line is removed then added
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it(caseName('TextDiff', '0002'), 0, (): void => {
      const result = diffLines('标题\n正文A\n结尾', '标题\n正文B\n结尾');
      expect(result.summary.removed, caseName('TextDiff', '0002')).assertEqual(1);
      expect(result.summary.added, caseName('TextDiff', '0002')).assertEqual(1);
      const removed = result.lines.filter((line) => line.kind === DiffKind.REMOVED)[0];
      const added = result.lines.filter((line) => line.kind === DiffKind.ADDED)[0];
      expect(removed.text, caseName('TextDiff', '0002')).assertEqual('正文A');
      expect(removed.oldLine, caseName('TextDiff', '0002')).assertEqual(2);
      expect(added.text, caseName('TextDiff', '0002')).assertEqual('正文B');
      expect(added.newLine, caseName('TextDiff', '0002')).assertEqual(2);
      expect(diffBadge(result.summary), caseName('TextDiff', '0002')).assertEqual('+1 / -1');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TEXTDIFF_0300
     * @tc.name      testTextDiff0003
     * @tc.desc      Verify inserted line keeps common lines
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */


    it(caseName('TextDiff', '0003'), 0, (): void => {
      const result = diffLines('A\nC', 'A\nB\nC');
      expect(result.summary.added, caseName('TextDiff', '0003')).assertEqual(1);
      expect(result.summary.removed, caseName('TextDiff', '0003')).assertEqual(0);
      expect(result.summary.equal, caseName('TextDiff', '0003')).assertEqual(2);
      const rows = sideBySide(result);
      expect(rows.length, caseName('TextDiff', '0003')).assertEqual(3);
      expect(rows[1].right, caseName('TextDiff', '0003')).assertEqual('B');
      expect(rows[1].left, caseName('TextDiff', '0003')).assertEqual('');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TEXTDIFF_0400
     * @tc.name      testTextDiff0004
     * @tc.desc      Verify character diff reports changes
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it(caseName('TextDiff', '0004'), 0, (): void => {
      const lines = diffCharacters('今日待办清单', '今日待办列表');
      expect(lines.indexOf('相同前缀：今日待办') >= 0, caseName('TextDiff', '0004')).assertTrue();
      expect(lines.indexOf('删除：清单') >= 0, caseName('TextDiff', '0004')).assertTrue();
      expect(lines.indexOf('新增：列表') >= 0, caseName('TextDiff', '0004')).assertTrue();
      expect(diffCharacters('相同', '相同')[0], caseName('TextDiff', '0004')).assertEqual('完全相同');
    });

    /**
     * @tc.number    SUB_SHORTCUT_TEXTDIFF_0500
     * @tc.name      testTextDiff0005
     * @tc.desc      Verify oversized input is explicitly truncated
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it(caseName('TextDiff', '0005'), 0, (): void => {
      const oldText: string = 'x'.repeat(20001);
      const result = diffLines(oldText, 'y');
      expect(result.summary.truncated, caseName('TextDiff', '0005')).assertTrue();
      expect(result.summary.changed(), caseName('TextDiff', '0005')).assertFalse();
      expect(diffBadge(result.summary), caseName('TextDiff', '0005')).assertEqual('超限，未逐行比较');
      expect(result.summary.text().indexOf('上限') >= 0, caseName('TextDiff', '0005')).assertTrue();
    });
  });
}
