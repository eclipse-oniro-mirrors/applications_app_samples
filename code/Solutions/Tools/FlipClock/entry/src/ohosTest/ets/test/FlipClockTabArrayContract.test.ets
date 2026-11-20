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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { testTabs as tabArray } from './FlipClockTestTabs';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function flipClockTabArrayContractTest() {
  describe('FlipClockTabArrayContractTest', () => {

    /**
     * @tc.name   ohos.samples.flipclock_TabArrayContract_0001
     * @tc.number SUB_FLIP_CLOCK_MORE_TAB_001
     * @tc.desc   Verify the tab array size.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_TabArrayContract_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_TabArrayContract_0001 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tabArray.length), String(4));
      expect(tabArray.length).assertEqual(4);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tabArray[0].num), String(0));
      expect(tabArray[0].num).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tabArray[3].num), String(3));
      expect(tabArray[3].num).assertEqual(3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_TabArrayContract_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_TabArrayContract_0002
     * @tc.number SUB_FLIP_CLOCK_MORE_TAB_002
     * @tc.desc   Verify every tab has icon resources.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_TabArrayContract_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_TabArrayContract_0002 begin');
      for (let i: number = 0; i < tabArray.length; i++) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tabArray[i].icon !== undefined));
        expect(tabArray[i].icon !== undefined).assertTrue();
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tabArray[0].icon !== undefined));
      expect(tabArray[0].icon !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_TabArrayContract_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_TabArrayContract_0003
     * @tc.number SUB_FLIP_CLOCK_MORE_TAB_003
     * @tc.desc   Verify every tab has selected icon resources.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_TabArrayContract_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_TabArrayContract_0003 begin');
      for (let i: number = 0; i < tabArray.length; i++) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tabArray[i].icon_after !== undefined));
        expect(tabArray[i].icon_after !== undefined).assertTrue();
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tabArray[2].icon_after !== undefined));
      expect(tabArray[2].icon_after !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_TabArrayContract_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_TabArrayContract_0004
     * @tc.number SUB_FLIP_CLOCK_MORE_TAB_004
     * @tc.desc   Verify every tab has a text resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_TabArrayContract_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_TabArrayContract_0004 begin');
      for (let i: number = 0; i < tabArray.length; i++) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tabArray[i].text !== undefined));
        expect(tabArray[i].text !== undefined).assertTrue();
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tabArray[1].text !== undefined));
      expect(tabArray[1].text !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_TabArrayContract_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_TabArrayContract_0005
     * @tc.number SUB_FLIP_CLOCK_MORE_TAB_005
     * @tc.desc   Verify tab numeric identifiers are unique.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_TabArrayContract_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_TabArrayContract_0005 begin');
      const nums: Set<number> = new Set<number>();
        for (let i: number = 0; i < tabArray.length; i++) {
          nums.add(tabArray[i].num);
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(nums.size), String(4));
      expect(nums.size).assertEqual(4);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(nums.has(0) && nums.has(3)));
        expect(nums.has(0) && nums.has(3)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_TabArrayContract_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_TabArrayContract_0006
     * @tc.number SUB_FLIP_CLOCK_MORE_TAB_006
     * @tc.desc   Verify the first tab entry.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_TabArrayContract_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_TabArrayContract_0006 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tabArray[0].num), String(0));
      expect(tabArray[0].num).assertEqual(0);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tabArray[0].icon !== undefined));
        expect(tabArray[0].icon !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tabArray[0].text !== undefined));
        expect(tabArray[0].text !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_TabArrayContract_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_TabArrayContract_0007
     * @tc.number SUB_FLIP_CLOCK_MORE_TAB_007
     * @tc.desc   Verify the last tab entry.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_TabArrayContract_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_TabArrayContract_0007 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tabArray[3].num), String(3));
      expect(tabArray[3].num).assertEqual(3);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tabArray[3].icon !== undefined));
        expect(tabArray[3].icon !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tabArray[3].text !== undefined));
        expect(tabArray[3].text !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_TabArrayContract_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_TabArrayContract_0008
     * @tc.number SUB_FLIP_CLOCK_MORE_TAB_008
     * @tc.desc   Verify the middle tab entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_TabArrayContract_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_TabArrayContract_0008 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tabArray[1].num), String(1));
      expect(tabArray[1].num).assertEqual(1);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(tabArray[2].num), String(2));
        expect(tabArray[2].num).assertEqual(2);
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(tabArray[1].icon !== undefined));
        expect(tabArray[1].icon !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_TabArrayContract_0008 end');
    })
  })
}
