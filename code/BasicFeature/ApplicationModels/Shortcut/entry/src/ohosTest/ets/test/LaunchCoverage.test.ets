import { Want } from '@kit.AbilityKit';
import { describe, expect, it } from '@ohos/hypium';
import { PageKey } from '../../../main/ets/model/ShortcutModels';
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


    it('testLaunchCoverage0001', 0, async () => {
      await runCase(async () => {
        const wants: Want[] = [{ parameters: {} }, { parameters: { other: 'value' } }];
        for (const cold of [false, true]) {
          for (const want of wants) {
            const result = parseLaunchRequest(want, cold);
            expect(result.page).assertEqual(PageKey.HOME);
            expect(result.error).assertEqual('');
            expect(result.source).assertEqual(cold ? '冷启动' : '热启动');
          }
          const orphan: Want = { parameters: { 'sc.filter': 'saved' } };
          expect(parseLaunchRequest(orphan, cold).error).assertEqual('快捷方式参数版本无效');
          expect(parseLaunchRequest(orphan, cold).page).assertEqual(PageKey.HOME);
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

    it('testLaunchCoverage0002', 0, async () => {
      await runCase(async () => {
        const noVersion: Want = { parameters: { 'sc.action': 'note.new' } };
        const noAction: Want = { parameters: { 'sc.version': '1' } };
        expect(parseLaunchRequest(noVersion, true).error).assertEqual('快捷方式参数版本无效');
        expect(parseLaunchRequest(noAction, false).error).assertEqual('快捷方式操作或筛选值无效');
        expect(parseLaunchRequest(noVersion, false).page).assertEqual(PageKey.HOME);
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

    it('testLaunchCoverage0003', 0, async () => {
      await runCase(async () => {
        const invalid: Want[] = [
          { parameters: { 'sc.version': ' 1', 'sc.action': 'note.new' } },
          { parameters: { 'sc.version': '1', 'sc.action': 'NOTE.NEW' } },
          { parameters: { 'sc.version': '1', 'sc.action': 'note.new ' } },
          { parameters: { 'sc.version': '1', 'sc.action': 'todo.list', 'sc.filter': 'TodayOpen' } },
          { parameters: { 'sc.version': '1', 'sc.action': 'collection.list', 'sc.filter': 'saved ' } }
        ];
        for (const want of invalid) {
          expect(parseLaunchRequest(want, true).page).assertEqual(PageKey.HOME);
          expect(parseLaunchRequest(want, true).error.length > 0).assertTrue();
        }
        expect(invalid.length).assertEqual(5);
        expect(parseLaunchRequest(invalid[0], true).page).assertEqual(PageKey.HOME);
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

    it('testLaunchCoverage0004', 0, async () => {
      await runCase(async () => {
        const invalid: Want[] = [
          { parameters: { 'sc.version': true, 'sc.action': 'note.new' } },
          { parameters: { 'sc.version': '1', 'sc.action': 1 } },
          { parameters: { 'sc.version': '1', 'sc.action': 'note.new', 'sc.filter': false } },
          { parameters: { 'sc.version': '1', 'sc.action': 'todo.list' } },
          { parameters: { 'sc.version': '1', 'sc.action': 'x'.repeat(65536) } }
        ];
        for (const want of invalid) {
          const result = parseLaunchRequest(want, false);
          expect(result.page).assertEqual(PageKey.HOME);
          expect(result.error.length > 0).assertTrue();
        }
        expect(invalid.length).assertEqual(5);
        expect(parseLaunchRequest(invalid[1], false).error.length > 0).assertTrue();
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

    it('testLaunchCoverage0005', 0, async () => {
      await runCase(async () => {
        const want: Want = { parameters: { 'sc.version': '1', 'sc.action': 'note.new', unrelated: 'preserved' } };
        const before = JSON.stringify(want);
        const first = parseLaunchRequest(want, true);
        first.page = PageKey.DETAIL;
        first.error = 'changed';
        const second = parseLaunchRequest(want, false);
        expect(JSON.stringify(want)).assertEqual(before);
        expect(first === second).assertFalse();
        expect(second.page).assertEqual(PageKey.NOTE);
        expect(second.error).assertEqual('');
        expect(second.source).assertEqual('热启动');
      });
    });
  });
}
