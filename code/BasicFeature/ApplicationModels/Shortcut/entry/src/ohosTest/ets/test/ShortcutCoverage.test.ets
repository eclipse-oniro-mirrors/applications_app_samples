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

import { shortcutManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { describe } from '@ohos/hypium';
import { caseName, expect, it } from '../support/TestCase';
import { ShortcutView } from '../../../main/ets/model/ShortcutModels';
import { CaseScope, getTestContext, runCase } from '../support/CaseScope';
import { FixtureError, ShortcutFixture, shortcutInfo } from '../support/ShortcutFixture';

export default function shortcutCoverageTests(): void {
  describe('ShortcutCoverage', () => {
    /**
     * @tc.number    SUB_SHORTCUT_SHORTCUTCOVERAGE_0100
     * @tc.name      testShortcutCoverage0001
     * @tc.desc      Verify support recovery clears error then refresh is available
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ShortcutCoverage', '0001'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutCoverage', '0001'), async (scope: CaseScope): Promise<void> => {
        const f = new ShortcutFixture(scope);
        f.api.supportError = new FixtureError(801, 'unavailable');
        f.initialize();
        await f.idle();
        expect(f.service.snapshot().support, caseName('ShortcutCoverage', '0001'), 'ShortcutCoverage.test.ets:A0001').assertEqual('检测失败');
        await f.service.refresh();
        expect(f.api.queries.length, caseName('ShortcutCoverage', '0001'), 'ShortcutCoverage.test.ets:A0002').assertEqual(0);
        f.api.supportError = undefined;
        f.service.checkSupport();
        expect(f.service.snapshot().supported, caseName('ShortcutCoverage', '0001'), 'ShortcutCoverage.test.ets:A0003').assertTrue();
        expect(f.service.snapshot().supportError, caseName('ShortcutCoverage', '0001'), 'ShortcutCoverage.test.ets:A0004').assertEqual('');
        const pending = f.service.refresh();
        (await f.query(0)).resolve([shortcutInfo('recovered', true)]);
        await pending;
        expect(f.service.snapshot().items[0].id, caseName('ShortcutCoverage', '0001'), 'ShortcutCoverage.test.ets:A0005').assertEqual('recovered');
        f.api.supported = false;
        f.service.checkSupport();
        await f.service.setVisible('recovered', false);
        expect(f.api.settings.length, caseName('ShortcutCoverage', '0001'), 'ShortcutCoverage.test.ets:A0006').assertEqual(0);
        expect(f.service.snapshot().items[0].id, caseName('ShortcutCoverage', '0001'), 'ShortcutCoverage.test.ets:A0007').assertEqual('recovered');
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_SHORTCUTCOVERAGE_0200
     * @tc.name      testShortcutCoverage0002
     * @tc.desc      Verify restore stops at first readback mismatch
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ShortcutCoverage', '0002'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutCoverage', '0002'), async (scope: CaseScope): Promise<void> => {
        const f = new ShortcutFixture(scope);
        await f.load([shortcutInfo('first', false), shortcutInfo('second', false)]);
        const pending = f.service.restoreAll();
        (await f.setting(0)).pending.resolve(undefined);
        (await f.query(1)).resolve([shortcutInfo('first', false), shortcutInfo('second', false)]);
        await pending;
        expect(f.api.settings.length, caseName('ShortcutCoverage', '0002'), 'ShortcutCoverage.test.ets:A0008').assertEqual(1);
        expect(f.service.snapshot().batchMessage, caseName('ShortcutCoverage', '0002'), 'ShortcutCoverage.test.ets:A0009').assertEqual('已恢复 0/2，回读不一致，已停止');
        expect(f.service.snapshot().busy, caseName('ShortcutCoverage', '0002'), 'ShortcutCoverage.test.ets:A0010').assertFalse();
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_SHORTCUTCOVERAGE_0300
     * @tc.name      testShortcutCoverage0003
     * @tc.desc      Verify restore stops on pending readback without writing next item
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ShortcutCoverage', '0003'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutCoverage', '0003'), async (scope: CaseScope): Promise<void> => {
        for (const missing of [false, true]) {
          const f = new ShortcutFixture(scope);
          await f.load([shortcutInfo('first', false), shortcutInfo('second', false)]);
          const pending = f.service.restoreAll();
          (await f.setting(0)).pending.resolve(undefined);
          const read = await f.query(1);
          if (missing) {
            read.resolve([shortcutInfo('second', false)]);
          } else {
            read.reject(new FixtureError(55, 'readback down'));
          }
          await pending;
          expect(f.api.settings.length, caseName('ShortcutCoverage', '0003'), 'ShortcutCoverage.test.ets:A0011').assertEqual(1);
          expect(f.service.snapshot().batchMessage, caseName('ShortcutCoverage', '0003'), 'ShortcutCoverage.test.ets:A0012').assertContain('已恢复 0/2，已提交，待核对，已停止');
          expect(f.service.snapshot().settingId, caseName('ShortcutCoverage', '0003'), 'ShortcutCoverage.test.ets:A0013').assertEqual('');
          expect(f.service.snapshot().busy, caseName('ShortcutCoverage', '0003'), 'ShortcutCoverage.test.ets:A0014').assertFalse();
        }
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_SHORTCUTCOVERAGE_0400
     * @tc.name      testShortcutCoverage0004
     * @tc.desc      Verify listener exception isolated and snapshot observes new state
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ShortcutCoverage', '0004'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutCoverage', '0004'), async (scope: CaseScope): Promise<void> => {
        const f = new ShortcutFixture(scope);
        await f.load([]);
        let observed = '';
        f.service.subscribe(() => { throw new Error('broken observer'); });
        f.service.subscribe(() => { observed = f.service.snapshot().records[0].message; });
        f.service.recordNavigation('note', 'new-message');
        expect(observed, caseName('ShortcutCoverage', '0004'), 'ShortcutCoverage.test.ets:A0015').assertEqual('new-message');
        expect(f.service.snapshot().busy, caseName('ShortcutCoverage', '0004'), 'ShortcutCoverage.test.ets:A0016').assertFalse();
        expect(f.service.snapshot().records.length >= 1, caseName('ShortcutCoverage', '0004'), 'ShortcutCoverage.test.ets:A0017').assertTrue();
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_SHORTCUTCOVERAGE_0500
     * @tc.name      testShortcutCoverage0005
     * @tc.desc      Verify dispose inside notification cancels remaining callbacks
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ShortcutCoverage', '0005'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutCoverage', '0005'), async (scope: CaseScope): Promise<void> => {
        const f = new ShortcutFixture(scope);
        await f.load([]);
        let remaining = 0;
        f.service.subscribe(() => f.service.dispose());
        f.service.subscribe(() => { remaining++; });
        f.service.recordNavigation('note', 'dispose-now');
        expect(remaining, caseName('ShortcutCoverage', '0005'), 'ShortcutCoverage.test.ets:A0018').assertEqual(0);
        expect(f.service.snapshot().records.length, caseName('ShortcutCoverage', '0005'), 'ShortcutCoverage.test.ets:A0019').assertEqual(0);
        await f.service.refresh();
        expect(f.api.queries.length, caseName('ShortcutCoverage', '0005'), 'ShortcutCoverage.test.ets:A0020').assertEqual(1);
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_SHORTCUTCOVERAGE_0600
     * @tc.name      testShortcutCoverage0006
     * @tc.desc      Verify reinitialize during write discards old rejection and reloads
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ShortcutCoverage', '0006'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutCoverage', '0006'), async (scope: CaseScope): Promise<void> => {
        const f = new ShortcutFixture(scope);
        await f.load([shortcutInfo('old', true)]);
        const pending = f.service.setVisible('old', false);
        const write = await f.setting(0);
        f.initialize();
        expect(f.api.queries.length, caseName('ShortcutCoverage', '0006'), 'ShortcutCoverage.test.ets:A0021').assertEqual(1);
        write.pending.reject(new FixtureError(99, 'old-generation-error'));
        await pending;
        (await f.query(1)).resolve([shortcutInfo('new', false)]);
        await f.idle();
        const state = f.service.snapshot();
        expect(state.items[0].id, caseName('ShortcutCoverage', '0006'), 'ShortcutCoverage.test.ets:A0022').assertEqual('new');
        expect(state.queryError, caseName('ShortcutCoverage', '0006'), 'ShortcutCoverage.test.ets:A0023').assertEqual('');
        expect(state.records.some((r) => r.message.includes('old-generation-error')), caseName('ShortcutCoverage', '0006'), 'ShortcutCoverage.test.ets:A0024').assertFalse();
        expect(f.api.supportCalls, caseName('ShortcutCoverage', '0006'), 'ShortcutCoverage.test.ets:A0025').assertEqual(2);
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_SHORTCUTCOVERAGE_0700
     * @tc.name      testShortcutCoverage0007
     * @tc.desc      Verify dispose during write readback never leaks old items to new generation
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ShortcutCoverage', '0007'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutCoverage', '0007'), async (scope: CaseScope): Promise<void> => {
        const f = new ShortcutFixture(scope);
        await f.load([shortcutInfo('old', true)]);
        const pending = f.service.setVisible('old', false);
        (await f.setting(0)).pending.resolve(undefined);
        const readback = await f.query(1);
        f.service.dispose();
        f.initialize();
        readback.resolve([shortcutInfo('old', false)]);
        await pending;
        (await f.query(2)).resolve([shortcutInfo('new', true)]);
        await f.idle();
        expect(f.service.snapshot().items[0].id, caseName('ShortcutCoverage', '0007'), 'ShortcutCoverage.test.ets:A0026').assertEqual('new');
        expect(f.service.snapshot().settingId, caseName('ShortcutCoverage', '0007'), 'ShortcutCoverage.test.ets:A0027').assertEqual('');
        expect(f.service.snapshot().batchMessage, caseName('ShortcutCoverage', '0007'), 'ShortcutCoverage.test.ets:A0028').assertEqual('');
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_SHORTCUTCOVERAGE_0800
     * @tc.name      testShortcutCoverage0008
     * @tc.desc      Verify resource name prefixes resolve real test module resources
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ShortcutCoverage', '0008'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutCoverage', '0008'), async (scope: CaseScope): Promise<void> => {
        const f = new ShortcutFixture(scope);
        const infos: shortcutManager.ShortcutInfo[] = [];
        for (const prefix of ['$string:', 'app.string.', '@string/']) {
          const info = shortcutInfo(prefix, true);
          info.moduleName = 'entry_test';
          info.label = prefix + 'shortcut_note_new';
          infos.push(info);
        }
        await f.load(infos);
        const expected = getTestContext().createModuleContext('entry_test').resourceManager
          .getStringSync($r('app.string.shortcut_note_new').id);
        expect(f.service.snapshot().items.every((item) => item.title === expected), caseName('ShortcutCoverage', '0008'), 'ShortcutCoverage.test.ets:A0029').assertTrue();
        expect(f.service.snapshot().queryError, caseName('ShortcutCoverage', '0008'), 'ShortcutCoverage.test.ets:A0030').assertEqual('');
        expect(f.service.snapshot().items.length >= 1, caseName('ShortcutCoverage', '0008'), 'ShortcutCoverage.test.ets:A0031').assertTrue();
        expect(expected.length > 0, caseName('ShortcutCoverage', '0008'), 'ShortcutCoverage.test.ets:A0032').assertTrue();
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_SHORTCUTCOVERAGE_0900
     * @tc.name      testShortcutCoverage0009
     * @tc.desc      Verify missing module and resource fallback keep query usable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ShortcutCoverage', '0009'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutCoverage', '0009'), async (scope: CaseScope): Promise<void> => {
        const f = new ShortcutFixture(scope);
        const badModule = shortcutInfo('bad-module', true);
        badModule.moduleName = 'module_that_does_not_exist';
        badModule.label = 'literal-fallback';
        const badId = shortcutInfo('bad-id', true);
        badId.labelId = 2147483647;
        badId.label = 'literal-after-id-error';
        const badName = shortcutInfo('bad-name', true);
        badName.label = '@string/resource_that_does_not_exist';
        const empty = shortcutInfo('empty', true);
        empty.label = '';
        empty.wants = undefined;
        await f.load([badModule, badId, badName, empty]);
        const state = f.service.snapshot();
        expect(state.items.map((item) => item.title).join('|'), caseName('ShortcutCoverage', '0009'), 'ShortcutCoverage.test.ets:A0033')
          .assertEqual('literal-fallback|literal-after-id-error|bad-name|empty');
        expect(state.items[3].raw.wants, caseName('ShortcutCoverage', '0009'), 'ShortcutCoverage.test.ets:A0034').assertUndefined();
        expect(state.queryError, caseName('ShortcutCoverage', '0009'), 'ShortcutCoverage.test.ets:A0035').assertEqual('');
        expect(state.records.some((r) => r.api === 'createModuleContext' && r.status === '失败'), caseName('ShortcutCoverage', '0009'), 'ShortcutCoverage.test.ets:A0036').assertTrue();
        expect(state.records.some((r) => r.api === 'resourceManager.getStringSync' && r.status === '失败'), caseName('ShortcutCoverage', '0009'), 'ShortcutCoverage.test.ets:A0037').assertTrue();
        expect(state.records.some(
          (r) => r.api === 'resourceManager.getStringByNameSync' && r.status === '失败'), caseName('ShortcutCoverage', '0009'), 'ShortcutCoverage.test.ets:A0038').assertTrue();
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_SHORTCUTCOVERAGE_1000
     * @tc.name      testShortcutCoverage0010
     * @tc.desc      Verify unknown query error preserves message and can retry empty result
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ShortcutCoverage', '0010'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutCoverage', '0010'), async (scope: CaseScope): Promise<void> => {
        const f = new ShortcutFixture(scope);
        await f.load([shortcutInfo('old', true)]);
        const pending = f.service.refresh();
        (await f.query(1)).reject(new Error('no business code') as BusinessError);
        await pending;
        expect(f.service.snapshot().queryError, caseName('ShortcutCoverage', '0010'), 'ShortcutCoverage.test.ets:A0039').assertEqual('code=not provided；no business code');
        const retry = f.service.refresh();
        (await f.query(2)).resolve([]);
        await retry;
        expect(f.service.snapshot().items.length, caseName('ShortcutCoverage', '0010'), 'ShortcutCoverage.test.ets:A0040').assertEqual(0);
        expect(f.service.snapshot().queryError, caseName('ShortcutCoverage', '0010'), 'ShortcutCoverage.test.ets:A0041').assertEqual('');
        expect(f.service.snapshot().lastQuery.length > 0, caseName('ShortcutCoverage', '0010'), 'ShortcutCoverage.test.ets:A0042').assertTrue();
      });
    });

    /**
     * @tc.number    SUB_SHORTCUT_SHORTCUTCOVERAGE_1100
     * @tc.name      testShortcutCoverage0011
     * @tc.desc      Verify disposed operations and unknown unsubscribe are noops
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ShortcutCoverage', '0011'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutCoverage', '0011'), async (scope: CaseScope): Promise<void> => {
        const f = new ShortcutFixture(scope);
        f.service.unsubscribe(-1);
        f.service.checkSupport();
        await f.service.refresh();
        await f.service.setVisible('', false);
        await f.service.restoreAll();
        f.service.clearRecords();
        f.service.recordNavigation('x', 'ignored');
        expect(f.api.supportCalls, caseName('ShortcutCoverage', '0011'), 'ShortcutCoverage.test.ets:A0043').assertEqual(0);
        expect(f.api.queries.length, caseName('ShortcutCoverage', '0011'), 'ShortcutCoverage.test.ets:A0044').assertEqual(0);
        expect(f.api.settings.length, caseName('ShortcutCoverage', '0011'), 'ShortcutCoverage.test.ets:A0045').assertEqual(0);
        expect(f.service.snapshot().records.length, caseName('ShortcutCoverage', '0011'), 'ShortcutCoverage.test.ets:A0046').assertEqual(0);
        await f.load([]);
        const one = f.service.subscribe(() => {});
        const two = f.service.subscribe(() => {});
        expect(two > one, caseName('ShortcutCoverage', '0011'), 'ShortcutCoverage.test.ets:A0047').assertTrue();
        f.service.unsubscribe(one);
        f.service.unsubscribe(one);
        f.service.unsubscribe(99999);
        expect(f.service.snapshot().supported, caseName('ShortcutCoverage', '0011'), 'ShortcutCoverage.test.ets:A0048').assertTrue();
      });
    });
  });
}
