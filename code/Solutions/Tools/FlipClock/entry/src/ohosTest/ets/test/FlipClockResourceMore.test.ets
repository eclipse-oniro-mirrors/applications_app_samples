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
import { common } from '@kit.AbilityKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';
let ctx: common.Context = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();

export default function flipClockResourceMoreTest() {
  describe('FlipClockResourceMoreTest', () => {

    /**
     * @tc.name   ohos.samples.flipclock_ResourceMore_0001
     * @tc.number SUB_FLIP_CLOCK_MORE4_RES_0001
     * @tc.desc   Load the second tab resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ResourceMore_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ResourceMore_0001 begin');
      const value: string = ctx.resourceManager.getStringByNameSync('tab1');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
        expect(value.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'tab1'));
        expect(value === 'tab1').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
        expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ResourceMore_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ResourceMore_0002
     * @tc.number SUB_FLIP_CLOCK_MORE4_RES_0002
     * @tc.desc   Load the third tab resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ResourceMore_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ResourceMore_0002 begin');
      const value: string = ctx.resourceManager.getStringByNameSync('tab2');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
        expect(value.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'tab2'));
        expect(value === 'tab2').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
        expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ResourceMore_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ResourceMore_0003
     * @tc.number SUB_FLIP_CLOCK_MORE4_RES_0003
     * @tc.desc   Load the fourth tab resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ResourceMore_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ResourceMore_0003 begin');
      const value: string = ctx.resourceManager.getStringByNameSync('tab3');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
        expect(value.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'tab3'));
        expect(value === 'tab3').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
        expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ResourceMore_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ResourceMore_0004
     * @tc.number SUB_FLIP_CLOCK_MORE4_RES_0004
     * @tc.desc   Load the setting title resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ResourceMore_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ResourceMore_0004 begin');
      const value: string = ctx.resourceManager.getStringByNameSync('setting');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
        expect(value.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'setting'));
        expect(value === 'setting').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
        expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ResourceMore_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ResourceMore_0005
     * @tc.number SUB_FLIP_CLOCK_MORE4_RES_0005
     * @tc.desc   Load the screen light resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ResourceMore_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ResourceMore_0005 begin');
      const value: string = ctx.resourceManager.getStringByNameSync('screenLight');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
        expect(value.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'screenLight'));
        expect(value === 'screenLight').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
        expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ResourceMore_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ResourceMore_0006
     * @tc.number SUB_FLIP_CLOCK_MORE4_RES_0006
     * @tc.desc   Load the sleep lock control resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ResourceMore_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ResourceMore_0006 begin');
      const value: string = ctx.resourceManager.getStringByNameSync('control_sleepLock');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
        expect(value.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'control_sleepLock'));
        expect(value === 'control_sleepLock').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
        expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ResourceMore_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ResourceMore_0007
     * @tc.number SUB_FLIP_CLOCK_MORE4_RES_0007
     * @tc.desc   Load the sleep lock switch resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ResourceMore_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ResourceMore_0007 begin');
      const value: string = ctx.resourceManager.getStringByNameSync('sleepLockSwitch');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
        expect(value.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'sleepLockSwitch'));
        expect(value === 'sleepLockSwitch').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
        expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ResourceMore_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ResourceMore_0008
     * @tc.number SUB_FLIP_CLOCK_MORE4_RES_0008
     * @tc.desc   Load the sleep lock hint resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ResourceMore_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ResourceMore_0008 begin');
      const value: string = ctx.resourceManager.getStringByNameSync('init_output');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
        expect(value.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'init_output'));
        expect(value === 'init_output').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
        expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ResourceMore_0008 end');
    })
  })
}
