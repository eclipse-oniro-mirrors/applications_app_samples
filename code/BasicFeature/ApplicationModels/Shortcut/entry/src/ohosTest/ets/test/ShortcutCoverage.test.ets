import { shortcutManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { describe, expect, it } from '@ohos/hypium';
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

    it('testShortcutCoverage0001', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const f = new ShortcutFixture(scope);
        f.api.supportError = new FixtureError(801, 'unavailable');
        f.initialize();
        await f.idle();
        expect(f.service.snapshot().support).assertEqual('检测失败');
        await f.service.refresh();
        expect(f.api.queries.length).assertEqual(0);
        f.api.supportError = undefined;
        f.service.checkSupport();
        expect(f.service.snapshot().supported).assertTrue();
        expect(f.service.snapshot().supportError).assertEqual('');
        const pending = f.service.refresh();
        (await f.query(0)).resolve([shortcutInfo('recovered', true)]);
        await pending;
        expect(f.service.snapshot().items[0].id).assertEqual('recovered');
        f.api.supported = false;
        f.service.checkSupport();
        await f.service.setVisible('recovered', false);
        expect(f.api.settings.length).assertEqual(0);
        expect(f.service.snapshot().items[0].id).assertEqual('recovered');
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

    it('testShortcutCoverage0002', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const f = new ShortcutFixture(scope);
        await f.load([shortcutInfo('first', false), shortcutInfo('second', false)]);
        const pending = f.service.restoreAll();
        (await f.setting(0)).pending.resolve(undefined);
        (await f.query(1)).resolve([shortcutInfo('first', false), shortcutInfo('second', false)]);
        await pending;
        expect(f.api.settings.length).assertEqual(1);
        expect(f.service.snapshot().batchMessage).assertEqual('已恢复 0/2，回读不一致，已停止');
        expect(f.service.snapshot().busy).assertFalse();
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

    it('testShortcutCoverage0003', 0, async () => {
      await runCase(async (scope: CaseScope) => {
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
          expect(f.api.settings.length).assertEqual(1);
          expect(f.service.snapshot().batchMessage).assertContain('已恢复 0/2，已提交，待核对，已停止');
          expect(f.service.snapshot().settingId).assertEqual('');
          expect(f.service.snapshot().busy).assertFalse();
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

    it('testShortcutCoverage0004', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const f = new ShortcutFixture(scope);
        await f.load([]);
        let observed = '';
        f.service.subscribe(() => { throw new Error('broken observer'); });
        f.service.subscribe(() => { observed = f.service.snapshot().records[0].message; });
        f.service.recordNavigation('note', 'new-message');
        expect(observed).assertEqual('new-message');
        expect(f.service.snapshot().busy).assertFalse();
        expect(f.service.snapshot().records.length >= 1).assertTrue();
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

    it('testShortcutCoverage0005', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const f = new ShortcutFixture(scope);
        await f.load([]);
        let remaining = 0;
        f.service.subscribe(() => f.service.dispose());
        f.service.subscribe(() => { remaining++; });
        f.service.recordNavigation('note', 'dispose-now');
        expect(remaining).assertEqual(0);
        expect(f.service.snapshot().records.length).assertEqual(0);
        await f.service.refresh();
        expect(f.api.queries.length).assertEqual(1);
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

    it('testShortcutCoverage0006', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const f = new ShortcutFixture(scope);
        await f.load([shortcutInfo('old', true)]);
        const pending = f.service.setVisible('old', false);
        const write = await f.setting(0);
        f.initialize();
        expect(f.api.queries.length).assertEqual(1);
        write.pending.reject(new FixtureError(99, 'old-generation-error'));
        await pending;
        (await f.query(1)).resolve([shortcutInfo('new', false)]);
        await f.idle();
        const state = f.service.snapshot();
        expect(state.items[0].id).assertEqual('new');
        expect(state.queryError).assertEqual('');
        expect(state.records.some((r) => r.message.includes('old-generation-error'))).assertFalse();
        expect(f.api.supportCalls).assertEqual(2);
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

    it('testShortcutCoverage0007', 0, async () => {
      await runCase(async (scope: CaseScope) => {
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
        expect(f.service.snapshot().items[0].id).assertEqual('new');
        expect(f.service.snapshot().settingId).assertEqual('');
        expect(f.service.snapshot().batchMessage).assertEqual('');
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

    it('testShortcutCoverage0008', 0, async () => {
      await runCase(async (scope: CaseScope) => {
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
        expect(f.service.snapshot().items.every((item) => item.title === expected)).assertTrue();
        expect(f.service.snapshot().queryError).assertEqual('');
        expect(f.service.snapshot().items.length >= 1).assertTrue();
        expect(expected.length > 0).assertTrue();
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

    it('testShortcutCoverage0009', 0, async () => {
      await runCase(async (scope: CaseScope) => {
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
        expect(state.items.map((item) => item.title).join('|'))
          .assertEqual('literal-fallback|literal-after-id-error|bad-name|empty');
        expect(state.items[3].raw.wants).assertUndefined();
        expect(state.queryError).assertEqual('');
        expect(state.records.some((r) => r.api === 'createModuleContext' && r.status === '失败')).assertTrue();
        expect(state.records.some((r) => r.api === 'resourceManager.getStringSync' && r.status === '失败')).assertTrue();
        expect(state.records.some(
          (r) => r.api === 'resourceManager.getStringByNameSync' && r.status === '失败')).assertTrue();
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

    it('testShortcutCoverage0010', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const f = new ShortcutFixture(scope);
        await f.load([shortcutInfo('old', true)]);
        const pending = f.service.refresh();
        (await f.query(1)).reject(new Error('no business code') as BusinessError);
        await pending;
        expect(f.service.snapshot().queryError).assertEqual('code=未提供；no business code');
        const retry = f.service.refresh();
        (await f.query(2)).resolve([]);
        await retry;
        expect(f.service.snapshot().items.length).assertEqual(0);
        expect(f.service.snapshot().queryError).assertEqual('');
        expect(f.service.snapshot().lastQuery.length > 0).assertTrue();
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

    it('testShortcutCoverage0011', 0, async () => {
      await runCase(async (scope: CaseScope) => {
        const f = new ShortcutFixture(scope);
        f.service.unsubscribe(-1);
        f.service.checkSupport();
        await f.service.refresh();
        await f.service.setVisible('', false);
        await f.service.restoreAll();
        f.service.clearRecords();
        f.service.recordNavigation('x', 'ignored');
        expect(f.api.supportCalls).assertEqual(0);
        expect(f.api.queries.length).assertEqual(0);
        expect(f.api.settings.length).assertEqual(0);
        expect(f.service.snapshot().records.length).assertEqual(0);
        await f.load([]);
        const one = f.service.subscribe(() => {});
        const two = f.service.subscribe(() => {});
        expect(two > one).assertTrue();
        f.service.unsubscribe(one);
        f.service.unsubscribe(one);
        f.service.unsubscribe(99999);
        expect(f.service.snapshot().supported).assertTrue();
      });
    });
  });
}
