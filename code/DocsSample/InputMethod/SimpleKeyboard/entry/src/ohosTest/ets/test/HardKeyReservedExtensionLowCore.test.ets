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
import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { getHardKeyValue } from '../../../main/ets/model/HardKeyUtils';

const TAG: string = '[Sample_HardKeyReservedExtensionLowCoreTest]';
const DOMAIN: number = 0xF814;

export default function HardKeyReservedExtensionLowCoreTest(): void {
  describe('HardKeyReservedExtensionLowCoreTest', () => {
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1751
     * @tc.name      testSimpleKeyboardHardKey1751
     * @tc.desc      Checks hard key mapping for code 2875, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1751', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1751 begin');
      const actual: string = getHardKeyValue(2875, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1751 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1752
     * @tc.name      testSimpleKeyboardHardKey1752
     * @tc.desc      Checks hard key mapping for code 2875, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1752', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1752 begin');
      const actual: string = getHardKeyValue(2875, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1752 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1753
     * @tc.name      testSimpleKeyboardHardKey1753
     * @tc.desc      Checks hard key mapping for code 2876, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1753', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1753 begin');
      const actual: string = getHardKeyValue(2876, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1753 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1754
     * @tc.name      testSimpleKeyboardHardKey1754
     * @tc.desc      Checks hard key mapping for code 2876, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1754', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1754 begin');
      const actual: string = getHardKeyValue(2876, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1754 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1755
     * @tc.name      testSimpleKeyboardHardKey1755
     * @tc.desc      Checks hard key mapping for code 2877, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1755', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1755 begin');
      const actual: string = getHardKeyValue(2877, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1755 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1756
     * @tc.name      testSimpleKeyboardHardKey1756
     * @tc.desc      Checks hard key mapping for code 2877, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1756', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1756 begin');
      const actual: string = getHardKeyValue(2877, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1756 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1757
     * @tc.name      testSimpleKeyboardHardKey1757
     * @tc.desc      Checks hard key mapping for code 2878, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1757', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1757 begin');
      const actual: string = getHardKeyValue(2878, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1757 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1758
     * @tc.name      testSimpleKeyboardHardKey1758
     * @tc.desc      Checks hard key mapping for code 2878, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1758', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1758 begin');
      const actual: string = getHardKeyValue(2878, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1758 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1759
     * @tc.name      testSimpleKeyboardHardKey1759
     * @tc.desc      Checks hard key mapping for code 2879, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1759', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1759 begin');
      const actual: string = getHardKeyValue(2879, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1759 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1760
     * @tc.name      testSimpleKeyboardHardKey1760
     * @tc.desc      Checks hard key mapping for code 2879, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1760', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1760 begin');
      const actual: string = getHardKeyValue(2879, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1760 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1761
     * @tc.name      testSimpleKeyboardHardKey1761
     * @tc.desc      Checks hard key mapping for code 2880, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1761', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1761 begin');
      const actual: string = getHardKeyValue(2880, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1761 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1762
     * @tc.name      testSimpleKeyboardHardKey1762
     * @tc.desc      Checks hard key mapping for code 2880, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1762', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1762 begin');
      const actual: string = getHardKeyValue(2880, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1762 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1763
     * @tc.name      testSimpleKeyboardHardKey1763
     * @tc.desc      Checks hard key mapping for code 2881, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1763', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1763 begin');
      const actual: string = getHardKeyValue(2881, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1763 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1764
     * @tc.name      testSimpleKeyboardHardKey1764
     * @tc.desc      Checks hard key mapping for code 2881, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1764', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1764 begin');
      const actual: string = getHardKeyValue(2881, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1764 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1765
     * @tc.name      testSimpleKeyboardHardKey1765
     * @tc.desc      Checks hard key mapping for code 2882, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1765', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1765 begin');
      const actual: string = getHardKeyValue(2882, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1765 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1766
     * @tc.name      testSimpleKeyboardHardKey1766
     * @tc.desc      Checks hard key mapping for code 2882, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1766', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1766 begin');
      const actual: string = getHardKeyValue(2882, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1766 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1767
     * @tc.name      testSimpleKeyboardHardKey1767
     * @tc.desc      Checks hard key mapping for code 2883, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1767', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1767 begin');
      const actual: string = getHardKeyValue(2883, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1767 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1768
     * @tc.name      testSimpleKeyboardHardKey1768
     * @tc.desc      Checks hard key mapping for code 2883, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1768', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1768 begin');
      const actual: string = getHardKeyValue(2883, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1768 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1769
     * @tc.name      testSimpleKeyboardHardKey1769
     * @tc.desc      Checks hard key mapping for code 2884, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1769', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1769 begin');
      const actual: string = getHardKeyValue(2884, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1769 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1770
     * @tc.name      testSimpleKeyboardHardKey1770
     * @tc.desc      Checks hard key mapping for code 2884, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1770', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1770 begin');
      const actual: string = getHardKeyValue(2884, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1770 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1771
     * @tc.name      testSimpleKeyboardHardKey1771
     * @tc.desc      Checks hard key mapping for code 2885, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1771', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1771 begin');
      const actual: string = getHardKeyValue(2885, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1771 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1772
     * @tc.name      testSimpleKeyboardHardKey1772
     * @tc.desc      Checks hard key mapping for code 2885, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1772', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1772 begin');
      const actual: string = getHardKeyValue(2885, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1772 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1773
     * @tc.name      testSimpleKeyboardHardKey1773
     * @tc.desc      Checks hard key mapping for code 2886, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1773', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1773 begin');
      const actual: string = getHardKeyValue(2886, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1773 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1774
     * @tc.name      testSimpleKeyboardHardKey1774
     * @tc.desc      Checks hard key mapping for code 2886, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1774', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1774 begin');
      const actual: string = getHardKeyValue(2886, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1774 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1775
     * @tc.name      testSimpleKeyboardHardKey1775
     * @tc.desc      Checks hard key mapping for code 2887, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1775', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1775 begin');
      const actual: string = getHardKeyValue(2887, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1775 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1776
     * @tc.name      testSimpleKeyboardHardKey1776
     * @tc.desc      Checks hard key mapping for code 2887, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1776', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1776 begin');
      const actual: string = getHardKeyValue(2887, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1776 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1777
     * @tc.name      testSimpleKeyboardHardKey1777
     * @tc.desc      Checks hard key mapping for code 2888, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1777', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1777 begin');
      const actual: string = getHardKeyValue(2888, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1777 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1778
     * @tc.name      testSimpleKeyboardHardKey1778
     * @tc.desc      Checks hard key mapping for code 2888, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1778', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1778 begin');
      const actual: string = getHardKeyValue(2888, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1778 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1779
     * @tc.name      testSimpleKeyboardHardKey1779
     * @tc.desc      Checks hard key mapping for code 2889, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1779', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1779 begin');
      const actual: string = getHardKeyValue(2889, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1779 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1780
     * @tc.name      testSimpleKeyboardHardKey1780
     * @tc.desc      Checks hard key mapping for code 2889, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1780', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1780 begin');
      const actual: string = getHardKeyValue(2889, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1780 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1781
     * @tc.name      testSimpleKeyboardHardKey1781
     * @tc.desc      Checks hard key mapping for code 2890, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1781', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1781 begin');
      const actual: string = getHardKeyValue(2890, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1781 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1782
     * @tc.name      testSimpleKeyboardHardKey1782
     * @tc.desc      Checks hard key mapping for code 2890, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1782', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1782 begin');
      const actual: string = getHardKeyValue(2890, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1782 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1783
     * @tc.name      testSimpleKeyboardHardKey1783
     * @tc.desc      Checks hard key mapping for code 2891, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1783', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1783 begin');
      const actual: string = getHardKeyValue(2891, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1783 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1784
     * @tc.name      testSimpleKeyboardHardKey1784
     * @tc.desc      Checks hard key mapping for code 2891, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1784', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1784 begin');
      const actual: string = getHardKeyValue(2891, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1784 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1785
     * @tc.name      testSimpleKeyboardHardKey1785
     * @tc.desc      Checks hard key mapping for code 2892, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1785', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1785 begin');
      const actual: string = getHardKeyValue(2892, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1785 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1786
     * @tc.name      testSimpleKeyboardHardKey1786
     * @tc.desc      Checks hard key mapping for code 2892, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1786', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1786 begin');
      const actual: string = getHardKeyValue(2892, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1786 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1787
     * @tc.name      testSimpleKeyboardHardKey1787
     * @tc.desc      Checks hard key mapping for code 2893, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1787', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1787 begin');
      const actual: string = getHardKeyValue(2893, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1787 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1788
     * @tc.name      testSimpleKeyboardHardKey1788
     * @tc.desc      Checks hard key mapping for code 2893, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1788', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1788 begin');
      const actual: string = getHardKeyValue(2893, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1788 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1789
     * @tc.name      testSimpleKeyboardHardKey1789
     * @tc.desc      Checks hard key mapping for code 2894, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1789', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1789 begin');
      const actual: string = getHardKeyValue(2894, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1789 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1790
     * @tc.name      testSimpleKeyboardHardKey1790
     * @tc.desc      Checks hard key mapping for code 2894, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1790', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1790 begin');
      const actual: string = getHardKeyValue(2894, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1790 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1791
     * @tc.name      testSimpleKeyboardHardKey1791
     * @tc.desc      Checks hard key mapping for code 2895, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1791', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1791 begin');
      const actual: string = getHardKeyValue(2895, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1791 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1792
     * @tc.name      testSimpleKeyboardHardKey1792
     * @tc.desc      Checks hard key mapping for code 2895, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1792', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1792 begin');
      const actual: string = getHardKeyValue(2895, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1792 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1793
     * @tc.name      testSimpleKeyboardHardKey1793
     * @tc.desc      Checks hard key mapping for code 2896, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1793', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1793 begin');
      const actual: string = getHardKeyValue(2896, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1793 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1794
     * @tc.name      testSimpleKeyboardHardKey1794
     * @tc.desc      Checks hard key mapping for code 2896, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1794', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1794 begin');
      const actual: string = getHardKeyValue(2896, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1794 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1795
     * @tc.name      testSimpleKeyboardHardKey1795
     * @tc.desc      Checks hard key mapping for code 2897, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1795', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1795 begin');
      const actual: string = getHardKeyValue(2897, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1795 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1796
     * @tc.name      testSimpleKeyboardHardKey1796
     * @tc.desc      Checks hard key mapping for code 2897, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1796', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1796 begin');
      const actual: string = getHardKeyValue(2897, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1796 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1797
     * @tc.name      testSimpleKeyboardHardKey1797
     * @tc.desc      Checks hard key mapping for code 2898, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1797', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1797 begin');
      const actual: string = getHardKeyValue(2898, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1797 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1798
     * @tc.name      testSimpleKeyboardHardKey1798
     * @tc.desc      Checks hard key mapping for code 2898, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1798', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1798 begin');
      const actual: string = getHardKeyValue(2898, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1798 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1799
     * @tc.name      testSimpleKeyboardHardKey1799
     * @tc.desc      Checks hard key mapping for code 2899, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1799', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1799 begin');
      const actual: string = getHardKeyValue(2899, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1799 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1800
     * @tc.name      testSimpleKeyboardHardKey1800
     * @tc.desc      Checks hard key mapping for code 2899, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1800 begin');
      const actual: string = getHardKeyValue(2899, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1800 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1801
     * @tc.name      testSimpleKeyboardHardKey1801
     * @tc.desc      Checks hard key mapping for code 2900, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1801', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1801 begin');
      const actual: string = getHardKeyValue(2900, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1801 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1802
     * @tc.name      testSimpleKeyboardHardKey1802
     * @tc.desc      Checks hard key mapping for code 2900, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1802', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1802 begin');
      const actual: string = getHardKeyValue(2900, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1802 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1803
     * @tc.name      testSimpleKeyboardHardKey1803
     * @tc.desc      Checks hard key mapping for code 2901, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1803', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1803 begin');
      const actual: string = getHardKeyValue(2901, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1803 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1804
     * @tc.name      testSimpleKeyboardHardKey1804
     * @tc.desc      Checks hard key mapping for code 2901, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1804', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1804 begin');
      const actual: string = getHardKeyValue(2901, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1804 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1805
     * @tc.name      testSimpleKeyboardHardKey1805
     * @tc.desc      Checks hard key mapping for code 2902, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1805', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1805 begin');
      const actual: string = getHardKeyValue(2902, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1805 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1806
     * @tc.name      testSimpleKeyboardHardKey1806
     * @tc.desc      Checks hard key mapping for code 2902, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1806', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1806 begin');
      const actual: string = getHardKeyValue(2902, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1806 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1807
     * @tc.name      testSimpleKeyboardHardKey1807
     * @tc.desc      Checks hard key mapping for code 2903, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1807', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1807 begin');
      const actual: string = getHardKeyValue(2903, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1807 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1808
     * @tc.name      testSimpleKeyboardHardKey1808
     * @tc.desc      Checks hard key mapping for code 2903, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1808', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1808 begin');
      const actual: string = getHardKeyValue(2903, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1808 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1809
     * @tc.name      testSimpleKeyboardHardKey1809
     * @tc.desc      Checks hard key mapping for code 2904, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1809', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1809 begin');
      const actual: string = getHardKeyValue(2904, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1809 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1810
     * @tc.name      testSimpleKeyboardHardKey1810
     * @tc.desc      Checks hard key mapping for code 2904, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1810', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1810 begin');
      const actual: string = getHardKeyValue(2904, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1810 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1811
     * @tc.name      testSimpleKeyboardHardKey1811
     * @tc.desc      Checks hard key mapping for code 2905, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1811', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1811 begin');
      const actual: string = getHardKeyValue(2905, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1811 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1812
     * @tc.name      testSimpleKeyboardHardKey1812
     * @tc.desc      Checks hard key mapping for code 2905, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1812', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1812 begin');
      const actual: string = getHardKeyValue(2905, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1812 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1813
     * @tc.name      testSimpleKeyboardHardKey1813
     * @tc.desc      Checks hard key mapping for code 2906, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1813', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1813 begin');
      const actual: string = getHardKeyValue(2906, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1813 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1814
     * @tc.name      testSimpleKeyboardHardKey1814
     * @tc.desc      Checks hard key mapping for code 2906, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1814', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1814 begin');
      const actual: string = getHardKeyValue(2906, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1814 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1815
     * @tc.name      testSimpleKeyboardHardKey1815
     * @tc.desc      Checks hard key mapping for code 2907, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1815', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1815 begin');
      const actual: string = getHardKeyValue(2907, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1815 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1816
     * @tc.name      testSimpleKeyboardHardKey1816
     * @tc.desc      Checks hard key mapping for code 2907, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1816', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1816 begin');
      const actual: string = getHardKeyValue(2907, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1816 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1817
     * @tc.name      testSimpleKeyboardHardKey1817
     * @tc.desc      Checks hard key mapping for code 2908, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1817', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1817 begin');
      const actual: string = getHardKeyValue(2908, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1817 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1818
     * @tc.name      testSimpleKeyboardHardKey1818
     * @tc.desc      Checks hard key mapping for code 2908, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1818', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1818 begin');
      const actual: string = getHardKeyValue(2908, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1818 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1819
     * @tc.name      testSimpleKeyboardHardKey1819
     * @tc.desc      Checks hard key mapping for code 2909, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1819', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1819 begin');
      const actual: string = getHardKeyValue(2909, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1819 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1820
     * @tc.name      testSimpleKeyboardHardKey1820
     * @tc.desc      Checks hard key mapping for code 2909, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1820', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1820 begin');
      const actual: string = getHardKeyValue(2909, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1820 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1821
     * @tc.name      testSimpleKeyboardHardKey1821
     * @tc.desc      Checks hard key mapping for code 2910, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1821', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1821 begin');
      const actual: string = getHardKeyValue(2910, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1821 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1822
     * @tc.name      testSimpleKeyboardHardKey1822
     * @tc.desc      Checks hard key mapping for code 2910, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1822', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1822 begin');
      const actual: string = getHardKeyValue(2910, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1822 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1823
     * @tc.name      testSimpleKeyboardHardKey1823
     * @tc.desc      Checks hard key mapping for code 2911, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1823', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1823 begin');
      const actual: string = getHardKeyValue(2911, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1823 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1824
     * @tc.name      testSimpleKeyboardHardKey1824
     * @tc.desc      Checks hard key mapping for code 2911, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1824', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1824 begin');
      const actual: string = getHardKeyValue(2911, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1824 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1825
     * @tc.name      testSimpleKeyboardHardKey1825
     * @tc.desc      Checks hard key mapping for code 2912, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1825', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1825 begin');
      const actual: string = getHardKeyValue(2912, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1825 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1826
     * @tc.name      testSimpleKeyboardHardKey1826
     * @tc.desc      Checks hard key mapping for code 2912, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1826', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1826 begin');
      const actual: string = getHardKeyValue(2912, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1826 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1827
     * @tc.name      testSimpleKeyboardHardKey1827
     * @tc.desc      Checks hard key mapping for code 2913, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1827', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1827 begin');
      const actual: string = getHardKeyValue(2913, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1827 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1828
     * @tc.name      testSimpleKeyboardHardKey1828
     * @tc.desc      Checks hard key mapping for code 2913, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1828', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1828 begin');
      const actual: string = getHardKeyValue(2913, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1828 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1829
     * @tc.name      testSimpleKeyboardHardKey1829
     * @tc.desc      Checks hard key mapping for code 2914, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1829', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1829 begin');
      const actual: string = getHardKeyValue(2914, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1829 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1830
     * @tc.name      testSimpleKeyboardHardKey1830
     * @tc.desc      Checks hard key mapping for code 2914, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1830', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1830 begin');
      const actual: string = getHardKeyValue(2914, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1830 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1831
     * @tc.name      testSimpleKeyboardHardKey1831
     * @tc.desc      Checks hard key mapping for code 2915, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1831', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1831 begin');
      const actual: string = getHardKeyValue(2915, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1831 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1832
     * @tc.name      testSimpleKeyboardHardKey1832
     * @tc.desc      Checks hard key mapping for code 2915, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1832', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1832 begin');
      const actual: string = getHardKeyValue(2915, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1832 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1833
     * @tc.name      testSimpleKeyboardHardKey1833
     * @tc.desc      Checks hard key mapping for code 2916, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1833', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1833 begin');
      const actual: string = getHardKeyValue(2916, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1833 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1834
     * @tc.name      testSimpleKeyboardHardKey1834
     * @tc.desc      Checks hard key mapping for code 2916, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1834', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1834 begin');
      const actual: string = getHardKeyValue(2916, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1834 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1835
     * @tc.name      testSimpleKeyboardHardKey1835
     * @tc.desc      Checks hard key mapping for code 2917, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1835', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1835 begin');
      const actual: string = getHardKeyValue(2917, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1835 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1836
     * @tc.name      testSimpleKeyboardHardKey1836
     * @tc.desc      Checks hard key mapping for code 2917, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1836', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1836 begin');
      const actual: string = getHardKeyValue(2917, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1836 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1837
     * @tc.name      testSimpleKeyboardHardKey1837
     * @tc.desc      Checks hard key mapping for code 2918, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1837', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1837 begin');
      const actual: string = getHardKeyValue(2918, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1837 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1838
     * @tc.name      testSimpleKeyboardHardKey1838
     * @tc.desc      Checks hard key mapping for code 2918, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1838', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1838 begin');
      const actual: string = getHardKeyValue(2918, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1838 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1839
     * @tc.name      testSimpleKeyboardHardKey1839
     * @tc.desc      Checks hard key mapping for code 2919, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1839', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1839 begin');
      const actual: string = getHardKeyValue(2919, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1839 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1840
     * @tc.name      testSimpleKeyboardHardKey1840
     * @tc.desc      Checks hard key mapping for code 2919, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1840', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1840 begin');
      const actual: string = getHardKeyValue(2919, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1840 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1841
     * @tc.name      testSimpleKeyboardHardKey1841
     * @tc.desc      Checks hard key mapping for code 2920, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1841', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1841 begin');
      const actual: string = getHardKeyValue(2920, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1841 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1842
     * @tc.name      testSimpleKeyboardHardKey1842
     * @tc.desc      Checks hard key mapping for code 2920, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1842', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1842 begin');
      const actual: string = getHardKeyValue(2920, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1842 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1843
     * @tc.name      testSimpleKeyboardHardKey1843
     * @tc.desc      Checks hard key mapping for code 2921, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1843', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1843 begin');
      const actual: string = getHardKeyValue(2921, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1843 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1844
     * @tc.name      testSimpleKeyboardHardKey1844
     * @tc.desc      Checks hard key mapping for code 2921, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1844', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1844 begin');
      const actual: string = getHardKeyValue(2921, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1844 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1845
     * @tc.name      testSimpleKeyboardHardKey1845
     * @tc.desc      Checks hard key mapping for code 2922, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1845', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1845 begin');
      const actual: string = getHardKeyValue(2922, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1845 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1846
     * @tc.name      testSimpleKeyboardHardKey1846
     * @tc.desc      Checks hard key mapping for code 2922, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1846', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1846 begin');
      const actual: string = getHardKeyValue(2922, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1846 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1847
     * @tc.name      testSimpleKeyboardHardKey1847
     * @tc.desc      Checks hard key mapping for code 2923, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1847', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1847 begin');
      const actual: string = getHardKeyValue(2923, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1847 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1848
     * @tc.name      testSimpleKeyboardHardKey1848
     * @tc.desc      Checks hard key mapping for code 2923, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1848', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1848 begin');
      const actual: string = getHardKeyValue(2923, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1848 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1849
     * @tc.name      testSimpleKeyboardHardKey1849
     * @tc.desc      Checks hard key mapping for code 2924, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1849', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1849 begin');
      const actual: string = getHardKeyValue(2924, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1849 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1850
     * @tc.name      testSimpleKeyboardHardKey1850
     * @tc.desc      Checks hard key mapping for code 2924, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1850', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1850 begin');
      const actual: string = getHardKeyValue(2924, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1850 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1851
     * @tc.name      testSimpleKeyboardHardKey1851
     * @tc.desc      Checks hard key mapping for code 2925, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1851', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1851 begin');
      const actual: string = getHardKeyValue(2925, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1851 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1852
     * @tc.name      testSimpleKeyboardHardKey1852
     * @tc.desc      Checks hard key mapping for code 2925, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1852', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1852 begin');
      const actual: string = getHardKeyValue(2925, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1852 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1853
     * @tc.name      testSimpleKeyboardHardKey1853
     * @tc.desc      Checks hard key mapping for code 2926, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1853', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1853 begin');
      const actual: string = getHardKeyValue(2926, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1853 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1854
     * @tc.name      testSimpleKeyboardHardKey1854
     * @tc.desc      Checks hard key mapping for code 2926, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1854', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1854 begin');
      const actual: string = getHardKeyValue(2926, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1854 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1855
     * @tc.name      testSimpleKeyboardHardKey1855
     * @tc.desc      Checks hard key mapping for code 2927, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1855', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1855 begin');
      const actual: string = getHardKeyValue(2927, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1855 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1856
     * @tc.name      testSimpleKeyboardHardKey1856
     * @tc.desc      Checks hard key mapping for code 2927, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1856', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1856 begin');
      const actual: string = getHardKeyValue(2927, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1856 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1857
     * @tc.name      testSimpleKeyboardHardKey1857
     * @tc.desc      Checks hard key mapping for code 2928, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1857', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1857 begin');
      const actual: string = getHardKeyValue(2928, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1857 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1858
     * @tc.name      testSimpleKeyboardHardKey1858
     * @tc.desc      Checks hard key mapping for code 2928, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1858', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1858 begin');
      const actual: string = getHardKeyValue(2928, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1858 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1859
     * @tc.name      testSimpleKeyboardHardKey1859
     * @tc.desc      Checks hard key mapping for code 2929, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1859', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1859 begin');
      const actual: string = getHardKeyValue(2929, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1859 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1860
     * @tc.name      testSimpleKeyboardHardKey1860
     * @tc.desc      Checks hard key mapping for code 2929, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1860', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1860 begin');
      const actual: string = getHardKeyValue(2929, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1860 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1861
     * @tc.name      testSimpleKeyboardHardKey1861
     * @tc.desc      Checks hard key mapping for code 2930, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1861', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1861 begin');
      const actual: string = getHardKeyValue(2930, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1861 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1862
     * @tc.name      testSimpleKeyboardHardKey1862
     * @tc.desc      Checks hard key mapping for code 2930, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1862', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1862 begin');
      const actual: string = getHardKeyValue(2930, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1862 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1863
     * @tc.name      testSimpleKeyboardHardKey1863
     * @tc.desc      Checks hard key mapping for code 2931, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1863', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1863 begin');
      const actual: string = getHardKeyValue(2931, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1863 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1864
     * @tc.name      testSimpleKeyboardHardKey1864
     * @tc.desc      Checks hard key mapping for code 2931, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1864', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1864 begin');
      const actual: string = getHardKeyValue(2931, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1864 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1865
     * @tc.name      testSimpleKeyboardHardKey1865
     * @tc.desc      Checks hard key mapping for code 2932, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1865', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1865 begin');
      const actual: string = getHardKeyValue(2932, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1865 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1866
     * @tc.name      testSimpleKeyboardHardKey1866
     * @tc.desc      Checks hard key mapping for code 2932, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1866', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1866 begin');
      const actual: string = getHardKeyValue(2932, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1866 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1867
     * @tc.name      testSimpleKeyboardHardKey1867
     * @tc.desc      Checks hard key mapping for code 2933, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1867', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1867 begin');
      const actual: string = getHardKeyValue(2933, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1867 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1868
     * @tc.name      testSimpleKeyboardHardKey1868
     * @tc.desc      Checks hard key mapping for code 2933, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1868', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1868 begin');
      const actual: string = getHardKeyValue(2933, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1868 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1869
     * @tc.name      testSimpleKeyboardHardKey1869
     * @tc.desc      Checks hard key mapping for code 2934, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1869', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1869 begin');
      const actual: string = getHardKeyValue(2934, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1869 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1870
     * @tc.name      testSimpleKeyboardHardKey1870
     * @tc.desc      Checks hard key mapping for code 2934, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1870', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1870 begin');
      const actual: string = getHardKeyValue(2934, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1870 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1871
     * @tc.name      testSimpleKeyboardHardKey1871
     * @tc.desc      Checks hard key mapping for code 2935, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1871', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1871 begin');
      const actual: string = getHardKeyValue(2935, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1871 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1872
     * @tc.name      testSimpleKeyboardHardKey1872
     * @tc.desc      Checks hard key mapping for code 2935, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1872', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1872 begin');
      const actual: string = getHardKeyValue(2935, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1872 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1873
     * @tc.name      testSimpleKeyboardHardKey1873
     * @tc.desc      Checks hard key mapping for code 2936, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1873', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1873 begin');
      const actual: string = getHardKeyValue(2936, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1873 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1874
     * @tc.name      testSimpleKeyboardHardKey1874
     * @tc.desc      Checks hard key mapping for code 2936, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1874', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1874 begin');
      const actual: string = getHardKeyValue(2936, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1874 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1875
     * @tc.name      testSimpleKeyboardHardKey1875
     * @tc.desc      Checks hard key mapping for code 2937, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1875', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1875 begin');
      const actual: string = getHardKeyValue(2937, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1875 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1876
     * @tc.name      testSimpleKeyboardHardKey1876
     * @tc.desc      Checks hard key mapping for code 2937, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1876', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1876 begin');
      const actual: string = getHardKeyValue(2937, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1876 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1877
     * @tc.name      testSimpleKeyboardHardKey1877
     * @tc.desc      Checks hard key mapping for code 2938, shift False.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1877', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1877 begin');
      const actual: string = getHardKeyValue(2938, false);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1877 end');
    })
    /**
     * @tc.number    SUB_SIMPLE_KEYBOARD_HARDKEY_1878
     * @tc.name      testSimpleKeyboardHardKey1878
     * @tc.desc      Checks hard key mapping for code 2938, shift True.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSimpleKeyboardHardKey1878', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1878 begin');
      const actual: string = getHardKeyValue(2938, true);
      expect(actual).assertEqual('');
      expect(typeof actual).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testSimpleKeyboardHardKey1878 end');
    })
  })
}
