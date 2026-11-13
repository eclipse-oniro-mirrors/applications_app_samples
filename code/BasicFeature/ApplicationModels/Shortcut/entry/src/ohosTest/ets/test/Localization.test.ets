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
import { setStringResolver, uiText } from '../../../main/ets/i18n/Strings';
import { FEATURES } from '../../../main/ets/model/ShortcutScenes';
import { runCase } from '../support/CaseScope';
import { useModelBaselineStrings } from '../support/TestStrings';

export default function localizationTests(): void {
  describe('ShortcutLocalization', (): void => {
    /**
     * @tc.number SUB_SHORTCUT_LOCALIZATION_0100
     * @tc.name testShortcutLocalization0001
     * @tc.desc Without a resource provider, existing string APIs receive the English base text.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutLocalization', '0001'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutLocalization', '0001'), async (): Promise<void> => {
        try {
          setStringResolver(undefined);
          expect(uiText('shortcut_text_0619'), caseName('ShortcutLocalization', '0001')).assertEqual('Create note');
        } finally {
          useModelBaselineStrings();
        }
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_LOCALIZATION_0200
     * @tc.name testShortcutLocalization0002
     * @tc.desc A user argument containing placeholder syntax is substituted exactly once and preserved.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutLocalization', '0002'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutLocalization', '0002'), async (): Promise<void> => {
        try {
          setStringResolver(undefined);
          expect(uiText('shortcut_text_0016', ['%2$s']), caseName('ShortcutLocalization', '0002')).assertEqual('%2$s, view details');
        } finally {
          useModelBaselineStrings();
        }
      });
    });

    /**
     * @tc.number SUB_SHORTCUT_LOCALIZATION_0300
     * @tc.name testShortcutLocalization0003
     * @tc.desc Module-level feature titles resolve lazily; provider failure falls back without changing feature IDs.
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(caseName('ShortcutLocalization', '0003'), 0, async (): Promise<void> => {
      await runCase(caseName('ShortcutLocalization', '0003'), async (): Promise<void> => {
        const id: string = FEATURES[0].id;
        try {
          setStringResolver((_name: string): string => 'Localized title');
          expect(FEATURES[0].title, caseName('ShortcutLocalization', '0003')).assertEqual('Localized title');
          setStringResolver((_name: string): string => { throw new Error('Controlled resource failure'); });
          expect(FEATURES[0].title, caseName('ShortcutLocalization', '0003')).assertEqual('Create note');
          expect(FEATURES[0].id, caseName('ShortcutLocalization', '0003')).assertEqual(id);
        } finally {
          useModelBaselineStrings();
        }
      });
    });
  });
}
