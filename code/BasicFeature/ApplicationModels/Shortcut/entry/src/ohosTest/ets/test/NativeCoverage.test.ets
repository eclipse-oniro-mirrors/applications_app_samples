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
import { describe, expect, it } from '@ohos/hypium';
import { PreferencesBusinessStorage } from '../../../main/ets/business/BusinessStorage';
import { PlatformShortcutApi } from '../../../main/ets/services/ShortcutApi';
import { getTestContext, runCase } from '../support/CaseScope';

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

    it('testShortcutNativeCoverage0001', 0, async () => {
      await runCase(async () => {
        const api = new PlatformShortcutApi();
        expect(api.isShortcutSupported()).assertTrue();
        const infos = await api.getAllShortcutInfoForSelf();
        const expected = ['sc.note.new', 'sc.todo.today', 'sc.collection.saved'];
        for (const id of expected) {
          const info = infos.find((item: shortcutManager.ShortcutInfo) => item.id === id);
          expect(info !== undefined).assertTrue();
          if (info === undefined) { throw new Error(`Installed shortcut missing: ${id}`); }
          expect(info.bundleName).assertEqual('com.example.shortcut');
          expect(info.moduleName).assertEqual('entry');
          expect((info.wants ?? []).length).assertEqual(1);
          expect((info.wants ?? [])[0].targetAbility).assertEqual('EntryAbility');
          expect((info.wants ?? [])[0].targetBundle).assertEqual('com.example.shortcut');
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

    it('testShortcutNativeCoverage0002', 0, async () => {
      await runCase(async () => {
        const api = new PlatformShortcutApi();
        const before = await api.getAllShortcutInfoForSelf();
        const marker = `coverage.missing.${Date.now()}`;
        expect(before.some((item: shortcutManager.ShortcutInfo) => item.id === marker)).assertFalse();
        let code = 0;
        try {
          await api.setShortcutVisibleForSelf(marker, false);
        } catch (error) {
          code = (error as BusinessError).code;
        }
        expect(code).assertEqual(17700070);
        const after = await api.getAllShortcutInfoForSelf();
        expect(after.length).assertEqual(before.length);
        for (const item of before) {
          const current = after.find((entry: shortcutManager.ShortcutInfo) => entry.id === item.id);
          expect(current !== undefined).assertTrue();
          expect(current?.visible).assertEqual(item.visible);
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

    it('testShortcutNativeCoverage0003', 0, async () => {
      await runCase(async () => {
        const storage = new PreferencesBusinessStorage();
        let message = '';
        try {
          await storage.write('must-not-be-written');
        } catch (error) {
          message = (error as Error).message;
        }
        expect(message).assertEqual('存储尚未初始化');
        expect(message.length).assertEqual(7);
        expect(message.indexOf('尚未初始化') > 0).assertTrue();
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

    it('testShortcutNativeCoverage0004', 0, async () => {
      await runCase(async () => {
        const context = getTestContext();
        const name = `shortcut_coverage_${Date.now()}`;
        try {
          const first = await preferences.getPreferences(context, { name: name });
          await first.put('unicode', '中文\nline2 😀');
          await first.put('flag', false);
          await first.put('zero', 0);
          await first.flush();
          await preferences.removePreferencesFromCache(context, name);
          const second = await preferences.getPreferences(context, { name: name });
          expect(await second.get('unicode', '')).assertEqual('中文\nline2 😀');
          expect(await second.get('flag', true)).assertFalse();
          expect(await second.get('zero', 1)).assertEqual(0);
          expect(await second.has('missing')).assertFalse();
        } finally {
          await preferences.deletePreferences(context, name);
        }
      });
    });
  });
}
