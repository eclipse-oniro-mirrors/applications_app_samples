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
 
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import {
  PREFS_COUNT_KEY,
  PREFS_MAX_LENGTH,
  PREFS_NAME,
  PREFS_TEXT_KEY,
  buildPrefsSummary,
  canSaveText,
  nextCount,
  normalizePrefsText,
  readCount,
  readText
} from '../../../main/ets/model/PrefsStore';
import { RouteKey, isRouteKey } from '../../../main/ets/common/AppConstants';
import { DEMO_ITEMS } from '../../../main/ets/model/DemoLogic';

export default function prefsStoreTest() {
  describe('prefsStoreTest', () => {

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_PREFSSTORE_0100
     * @tc.name normalizePrefsTextTrimsEdges001
     * @tc.desc Verify leading and trailing whitespace is trimmed while inner spaces stay intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('normalizePrefsText_trimsEdges', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(normalizePrefsText('  hello  ')).assertEqual('hello');
      expect(normalizePrefsText('\t首选项\n')).assertEqual('首选项');
      expect(normalizePrefsText('  中间 空格  ')).assertEqual('中间 空格');
      expect(normalizePrefsText('')).assertEqual('');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_PREFSSTORE_0200
     * @tc.name normalizePrefsTextTruncates002
     * @tc.desc Verify text longer than the limit is cut to exactly the limit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('normalizePrefsText_truncates', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const long = new Array<string>(PREFS_MAX_LENGTH + 20).fill('A').join('');
      expect(normalizePrefsText(long).length).assertEqual(PREFS_MAX_LENGTH);
      expect(normalizePrefsText(long).endsWith('A')).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_PREFSSTORE_0300
     * @tc.name normalizePrefsTextKeepsChinese003
     * @tc.desc Verify Chinese and emoji content is preserved up to the limit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('normalizePrefsText_keepsChinese', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(normalizePrefsText('  原子化服务  ')).assertEqual('原子化服务');
      const chinese = new Array<string>(PREFS_MAX_LENGTH).fill('字').join('');
      expect(normalizePrefsText(chinese).length).assertEqual(PREFS_MAX_LENGTH);
      const emoji = new Array<string>(PREFS_MAX_LENGTH).fill('😀').join('');
      expect(normalizePrefsText(emoji).length).assertEqual(PREFS_MAX_LENGTH);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_PREFSSTORE_0400
     * @tc.name canSaveTextBlankRules004
     * @tc.desc Verify blank-only input is rejected while trimmed content is accepted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('canSaveText_blankRules', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(canSaveText('')).assertFalse();
      expect(canSaveText('   ')).assertFalse();
      expect(canSaveText('\n\t')).assertFalse();
      expect(canSaveText(' 内容 ')).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_PREFSSTORE_0500
     * @tc.name nextCountProgression005
     * @tc.desc Verify counts advance by one and negative values normalize to one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('nextCount_progression', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(nextCount(0)).assertEqual(1);
      expect(nextCount(5)).assertEqual(6);
      expect(nextCount(-3)).assertEqual(1);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_PREFSSTORE_0600
     * @tc.name readCountTypeGuards006
     * @tc.desc Verify only positive numbers are accepted and floats are floored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('readCount_typeGuards', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(readCount(3)).assertEqual(3);
      expect(readCount(3.9)).assertEqual(3);
      expect(readCount(0)).assertEqual(0);
      expect(readCount(-1)).assertEqual(0);
      expect(readCount('5')).assertEqual(0);
      expect(readCount(false)).assertEqual(0);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_PREFSSTORE_0700
     * @tc.name readTextTypeGuards007
     * @tc.desc Verify only string values are returned and other types fall back to an empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('readText_typeGuards', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(readText('内容')).assertEqual('内容');
      expect(readText('')).assertEqual('');
      expect(readText(12)).assertEqual('');
      expect(readText(true)).assertEqual('');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_PREFSSTORE_0800
     * @tc.name prefsSummaryVariants008
     * @tc.desc Verify the summary distinguishes stored content from an empty store
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prefsSummary_variants', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(buildPrefsSummary('Atomic service', 3)).assertEqual('Saved "Atomic service", read 3 times');
      expect(buildPrefsSummary('', 0)).assertEqual('No content yet, read 0 times');
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_PREFSSTORE_0900
     * @tc.name prefsConstantsShape009
     * @tc.desc Verify the store name, keys and length limit are stable and non-empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prefsConstants_shape', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(PREFS_NAME).assertEqual('atomic_service_demo_store');
      expect(PREFS_TEXT_KEY).assertEqual('demoText');
      expect(PREFS_COUNT_KEY).assertEqual('demoCount');
      expect(PREFS_MAX_LENGTH).assertEqual(80);
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_PREFSSTORE_1000
     * @tc.name prefsRouteRegistered010
     * @tc.desc Verify the prefs route key is registered and exposed in the home catalog
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('prefsRoute_registered', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(RouteKey.PREFS).assertEqual('prefs');
      expect(isRouteKey(RouteKey.PREFS)).assertTrue();
      const keys: string[] = DEMO_ITEMS.map((item) => item.key);
      expect(keys.includes(RouteKey.PREFS)).assertTrue();
    });

    /**
     * @tc.number SUB_ATOMIC_SERVICE_COMPONENTS_PREFSSTORE_1100
     * @tc.name normalizePrefsTextExactLimit011
     * @tc.desc Verify content at the limit is kept whole, an extra character is trimmed and edges trim before truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('normalizePrefsText_exactLimitBoundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const exact = new Array<string>(PREFS_MAX_LENGTH).fill('B').join('');
      expect(normalizePrefsText(exact)).assertEqual(exact);
      const over = new Array<string>(PREFS_MAX_LENGTH + 1).fill('B').join('');
      expect(normalizePrefsText(over)).assertEqual(exact);
      expect(normalizePrefsText(`  ${exact}  `)).assertEqual(exact);
    });
  });
}
