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

import { Want } from '@kit.AbilityKit';
import { describe } from '@ohos/hypium';
import { caseName, expect, it } from '../support/TestCase';
import { PageKey } from '../../../main/ets/model/ShortcutScenes';
import { parseLaunchRequest } from '../../../main/ets/navigation/LaunchRequest';
import { runCase } from '../support/CaseScope';

export default function launchCoverageTests(): void {
  describe('LaunchCoverage', () => {
    /**
     * @tc.number    SUB_SHORTCUT_LAUNCHCOVERAGE_0100
     * @tc.name      testLaunchCoverage0001
     * @tc.desc      Verify unrelated parameters are normal but orphan filter rejects
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */


    it(caseName('LaunchCoverage', '0001'), 0, async () => {
      await runCase(caseName('LaunchCoverage', '0001'), async () => {
        const wants: Want[] = [{ parameters: {} }, { parameters: { other: 'value' } }];
        for (const cold of [false, true]) {
          for (const want of wants) {
            const result = parseLaunchRequest(want, cold);
            expect(result.page, caseName('LaunchCoverage', '0001')).assertEqual(PageKey.HOME);
            expect(result.error, caseName('LaunchCoverage', '0001')).assertEqual('');
            expect(result.source, caseName('LaunchCoverage', '0001')).assertEqual(cold ? '冷启动' : '热启动');
          }
          const orphan: Want = { parameters: { 'sc.filter': 'saved' } };
          expect(parseLaunchRequest(orphan, cold).error, caseName('LaunchCoverage', '0001')).assertEqual('快捷方式参数版本无效');
          expect(parseLaunchRequest(orphan, cold).page, caseName('LaunchCoverage', '0001')).assertEqual(PageKey.HOME);
        }
      });
    });
    /**
     * @tc.number    SUB_SHORTCUT_LAUNCHCOVERAGE_0200
     * @tc.name      testLaunchCoverage0002
     * @tc.desc      Verify partial protocol fields reject with exact error category
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('LaunchCoverage', '0002'), 0, async () => {
      await runCase(caseName('LaunchCoverage', '0002'), async () => {
        const noVersion: Want = { parameters: { 'sc.action': 'note.new' } };
        const noAction: Want = { parameters: { 'sc.version': '1' } };
        expect(parseLaunchRequest(noVersion, true).error, caseName('LaunchCoverage', '0002')).assertEqual('快捷方式参数版本无效');
        expect(parseLaunchRequest(noAction, false).error, caseName('LaunchCoverage', '0002')).assertEqual('快捷方式操作或筛选值无效');
        expect(parseLaunchRequest(noVersion, false).page, caseName('LaunchCoverage', '0002')).assertEqual(PageKey.HOME);
      });
    });
    /**
     * @tc.number    SUB_SHORTCUT_LAUNCHCOVERAGE_0300
     * @tc.name      testLaunchCoverage0003
     * @tc.desc      Verify protocol does not trim or ignore case
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('LaunchCoverage', '0003'), 0, async () => {
      await runCase(caseName('LaunchCoverage', '0003'), async () => {
        const invalid: Want[] = [
          { parameters: { 'sc.version': ' 1', 'sc.action': 'note.new' } },
          { parameters: { 'sc.version': '1', 'sc.action': 'NOTE.NEW' } },
          { parameters: { 'sc.version': '1', 'sc.action': 'note.new ' } },
          { parameters: { 'sc.version': '1', 'sc.action': 'todo.list', 'sc.filter': 'TodayOpen' } },
          { parameters: { 'sc.version': '1', 'sc.action': 'collection.list', 'sc.filter': 'saved ' } }
        ];
        for (const want of invalid) {
          expect(parseLaunchRequest(want, true).page, caseName('LaunchCoverage', '0003')).assertEqual(PageKey.HOME);
          expect(parseLaunchRequest(want, true).error.length > 0, caseName('LaunchCoverage', '0003')).assertTrue();
        }
        expect(invalid.length, caseName('LaunchCoverage', '0003')).assertEqual(5);
        expect(parseLaunchRequest(invalid[0], true).page, caseName('LaunchCoverage', '0003')).assertEqual(PageKey.HOME);
      });
    });
    /**
     * @tc.number    SUB_SHORTCUT_LAUNCHCOVERAGE_0400
     * @tc.name      testLaunchCoverage0004
     * @tc.desc      Verify wrong runtime types and long unknown action never route
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('LaunchCoverage', '0004'), 0, async () => {
      await runCase(caseName('LaunchCoverage', '0004'), async () => {
        const invalid: Want[] = [
          { parameters: { 'sc.version': true, 'sc.action': 'note.new' } },
          { parameters: { 'sc.version': '1', 'sc.action': 1 } },
          { parameters: { 'sc.version': '1', 'sc.action': 'note.new', 'sc.filter': false } },
          { parameters: { 'sc.version': '1', 'sc.action': 'todo.list' } },
          { parameters: { 'sc.version': '1', 'sc.action': 'x'.repeat(65536) } }
        ];
        for (const want of invalid) {
          const result = parseLaunchRequest(want, false);
          expect(result.page, caseName('LaunchCoverage', '0004')).assertEqual(PageKey.HOME);
          expect(result.error.length > 0, caseName('LaunchCoverage', '0004')).assertTrue();
        }
        expect(invalid.length, caseName('LaunchCoverage', '0004')).assertEqual(5);
        expect(parseLaunchRequest(invalid[1], false).error.length > 0, caseName('LaunchCoverage', '0004')).assertTrue();
      });
    });
    /**
     * @tc.number    SUB_SHORTCUT_LAUNCHCOVERAGE_0500
     * @tc.name      testLaunchCoverage0005
     * @tc.desc      Verify parsing is pure and each result is independent
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('LaunchCoverage', '0005'), 0, async () => {
      await runCase(caseName('LaunchCoverage', '0005'), async () => {
        const want: Want = { parameters: { 'sc.version': '1', 'sc.action': 'note.new', unrelated: 'preserved' } };
        const before = JSON.stringify(want);
        const first = parseLaunchRequest(want, true);
        first.page = PageKey.DETAIL;
        first.error = 'changed';
        const second = parseLaunchRequest(want, false);
        expect(JSON.stringify(want), caseName('LaunchCoverage', '0005')).assertEqual(before);
        expect(first === second, caseName('LaunchCoverage', '0005')).assertFalse();
        expect(second.page, caseName('LaunchCoverage', '0005')).assertEqual(PageKey.NOTE);
        expect(second.error, caseName('LaunchCoverage', '0005')).assertEqual('');
        expect(second.source, caseName('LaunchCoverage', '0005')).assertEqual('热启动');
      });
    });
  });
}
