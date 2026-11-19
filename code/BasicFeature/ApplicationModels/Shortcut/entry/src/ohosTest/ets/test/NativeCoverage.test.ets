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
import { preferences } from '@kit.ArkData';
import { describe } from '@ohos/hypium';
import { caseName, expect, it } from '../support/TestCase';
import { BusinessWriteError, PreferencesBusinessStorage } from '../../../main/ets/business/BusinessStorage';
import { PlatformShortcutApi } from '../../../main/ets/services/ShortcutApi';
import { getTestContext, runCase } from '../support/CaseScope';
import { runWithCleanup } from '../support/CaseLifecycle';

/** Real SDK integration on the target phone; no shortcut visibility or user business data is modified. */
export default function nativeCoverageTests(): void {
  describe('ShortcutNativeCoverage', () => {
    /**
     * @tc.number    SUB_SHORTCUT_SHORTCUTNATIVECOVERAGE_0100
     * @tc.name      testShortcutNativeCoverage0001
     * @tc.desc      Verify native support and installed shortcut manifest are consistent
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it(caseName('ShortcutNativeCoverage', '0001'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutNativeCoverage', '0001'), async (): Promise<void> => {
        const api = new PlatformShortcutApi();
        expect(api.isShortcutSupported(), caseName('ShortcutNativeCoverage', '0001'), 'NativeCoverage.test.ets:A0001').assertTrue();
        const infos = await api.getAllShortcutInfoForSelf();
        const expected = ['sc.note.new', 'sc.todo.today', 'sc.collection.saved'];
        for (const id of expected) {
          const info = infos.find((item: shortcutManager.ShortcutInfo) => item.id === id);
          expect(info !== undefined, caseName('ShortcutNativeCoverage', '0001'), 'NativeCoverage.test.ets:A0002').assertTrue();
          if (info === undefined) { throw new Error(`Installed shortcut missing: ${id}`); }
          expect(info.bundleName, caseName('ShortcutNativeCoverage', '0001'), 'NativeCoverage.test.ets:A0003').assertEqual('com.samples.shortcut');
          expect(info.moduleName, caseName('ShortcutNativeCoverage', '0001'), 'NativeCoverage.test.ets:A0004').assertEqual('entry');
          expect((info.wants ?? []).length, caseName('ShortcutNativeCoverage', '0001'), 'NativeCoverage.test.ets:A0005').assertEqual(1);
          expect((info.wants ?? [])[0].targetAbility, caseName('ShortcutNativeCoverage', '0001'), 'NativeCoverage.test.ets:A0006').assertEqual('EntryAbility');
          expect((info.wants ?? [])[0].targetBundle, caseName('ShortcutNativeCoverage', '0001'), 'NativeCoverage.test.ets:A0007').assertEqual('com.samples.shortcut');
        }
      });
    });
    /**
     * @tc.number    SUB_SHORTCUT_SHORTCUTNATIVECOVERAGE_0200
     * @tc.name      testShortcutNativeCoverage0002
     * @tc.desc      Verify native nonexistent id is rejected without changing real shortcuts
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ShortcutNativeCoverage', '0002'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutNativeCoverage', '0002'), async (): Promise<void> => {
        const api = new PlatformShortcutApi();
        const before = await api.getAllShortcutInfoForSelf();
        const marker = `coverage.missing.${Date.now()}`;
        expect(before.some((item: shortcutManager.ShortcutInfo) => item.id === marker), caseName('ShortcutNativeCoverage', '0002'), 'NativeCoverage.test.ets:A0008').assertFalse();
        let code = 0;
        try {
          await api.setShortcutVisibleForSelf(marker, false);
        } catch (error) {
          code = (error as BusinessError).code;
        }
        expect(code, caseName('ShortcutNativeCoverage', '0002'), 'NativeCoverage.test.ets:A0009').assertEqual(17700070);
        const after = await api.getAllShortcutInfoForSelf();
        expect(after.length, caseName('ShortcutNativeCoverage', '0002'), 'NativeCoverage.test.ets:A0010').assertEqual(before.length);
        for (const item of before) {
          const current = after.find((entry: shortcutManager.ShortcutInfo) => entry.id === item.id);
          expect(current !== undefined, caseName('ShortcutNativeCoverage', '0002'), 'NativeCoverage.test.ets:A0011').assertTrue();
          expect(current?.visible, caseName('ShortcutNativeCoverage', '0002'), 'NativeCoverage.test.ets:A0012').assertEqual(item.visible);
        }
      });
    });
    /**
     * @tc.number    SUB_SHORTCUT_SHORTCUTNATIVECOVERAGE_0300
     * @tc.name      testShortcutNativeCoverage0003
     * @tc.desc      Verify production preferences adapter rejects write before read
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ShortcutNativeCoverage', '0003'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutNativeCoverage', '0003'), async (): Promise<void> => {
        const storage = new PreferencesBusinessStorage();
        let message = '';
        let failure: Error | undefined = undefined;
        try {
          await storage.write('must-not-be-written');
        } catch (error) {
          failure = error as Error;
          message = (error as Error).message;
        }
        expect(message, caseName('ShortcutNativeCoverage', '0003'), 'NativeCoverage.test.ets:A0013').assertEqual('Storage has not been initialized');
        expect(message.length, caseName('ShortcutNativeCoverage', '0003'), 'NativeCoverage.test.ets:A0014').assertEqual(32);
        expect(message.indexOf('not been initialized') > 0, caseName('ShortcutNativeCoverage', '0003'), 'NativeCoverage.test.ets:A0015').assertTrue();
        expect(failure instanceof BusinessWriteError, caseName('ShortcutNativeCoverage', '0003'), 'NativeCoverage.test.ets:A0016').assertTrue();
        expect((failure as BusinessWriteError).uncertain, caseName('ShortcutNativeCoverage', '0003'), 'NativeCoverage.test.ets:A0017').assertFalse();
      });
    });
    /**
     * @tc.number    SUB_SHORTCUT_SHORTCUTNATIVECOVERAGE_0400
     * @tc.name      testShortcutNativeCoverage0004
     * @tc.desc      Verify native preferences flush cache reload preserves test data
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it(caseName('ShortcutNativeCoverage', '0004'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutNativeCoverage', '0004'), async (): Promise<void> => {
        const context = getTestContext();
        const name = `shortcut_coverage_${Date.now()}`;
        await runWithCleanup(`${caseName('ShortcutNativeCoverage', '0004')} preferences-cleanup`, async (): Promise<void> => {
          const first = await preferences.getPreferences(context, { name: name });
          await first.put('unicode', '中文\nline2 😀');
          await first.put('flag', false);
          await first.put('zero', 0);
          await first.flush();
          await preferences.removePreferencesFromCache(context, name);
          const second = await preferences.getPreferences(context, { name: name });
          expect(await second.get('unicode', ''), caseName('ShortcutNativeCoverage', '0004'), 'NativeCoverage.test.ets:A0018').assertEqual('中文\nline2 😀');
          expect(await second.get('flag', true), caseName('ShortcutNativeCoverage', '0004'), 'NativeCoverage.test.ets:A0019').assertFalse();
          expect(await second.get('zero', 1), caseName('ShortcutNativeCoverage', '0004'), 'NativeCoverage.test.ets:A0020').assertEqual(0);
          expect(await second.has('missing'), caseName('ShortcutNativeCoverage', '0004'), 'NativeCoverage.test.ets:A0021').assertFalse();
        }, [async (): Promise<void> => {
          await preferences.deletePreferences(context, name);
        }]);
      });
    });
  });
}
