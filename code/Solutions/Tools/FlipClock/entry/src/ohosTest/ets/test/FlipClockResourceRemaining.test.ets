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
import { AbilityDelegatorRegistry } from '@kit.AbilityKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';
let ctx = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext();

export default function flipClockResourceRemainingTest() {
  describe('FlipClockResourceRemainingTest', () => {

    /**
     * @tc.name   testFlipClockResourceRemain0001
     * @tc.number SUB_FLIP_CLOCK_MORE5_RES_0001
     * @tc.desc   Load the support lock resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResourceRemain0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockResourceRemain0001 begin');
      const v: string = ctx.resourceManager.getStringByNameSync('supportLock');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v.length > 0));
        expect(v.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v === 'supportLock'));
        expect(v === 'supportLock').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v), String(v.trim()));
        expect(v).assertEqual(v.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockResourceRemain0001 end');
    })

    /**
     * @tc.name   testFlipClockResourceRemain0002
     * @tc.number SUB_FLIP_CLOCK_MORE5_RES_0002
     * @tc.desc   Load the unsupported lock resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResourceRemain0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockResourceRemain0002 begin');
      const v: string = ctx.resourceManager.getStringByNameSync('unsupportLock');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v.length > 0));
        expect(v.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v === 'unsupportLock'));
        expect(v === 'unsupportLock').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v), String(v.trim()));
        expect(v).assertEqual(v.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockResourceRemain0002 end');
    })

    /**
     * @tc.name   testFlipClockResourceRemain0003
     * @tc.number SUB_FLIP_CLOCK_MORE5_RES_0003
     * @tc.desc   Load the stop sleep resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResourceRemain0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockResourceRemain0003 begin');
      const v: string = ctx.resourceManager.getStringByNameSync('stopSleep');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v.length > 0));
        expect(v.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v === 'stopSleep'));
        expect(v === 'stopSleep').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v), String(v.trim()));
        expect(v).assertEqual(v.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockResourceRemain0003 end');
    })

    /**
     * @tc.name   testFlipClockResourceRemain0004
     * @tc.number SUB_FLIP_CLOCK_MORE5_RES_0004
     * @tc.desc   Load the turn sleep resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResourceRemain0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockResourceRemain0004 begin');
      const v: string = ctx.resourceManager.getStringByNameSync('turnSleep');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v.length > 0));
        expect(v.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v === 'turnSleep'));
        expect(v === 'turnSleep').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v), String(v.trim()));
        expect(v).assertEqual(v.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockResourceRemain0004 end');
    })

    /**
     * @tc.name   testFlipClockResourceRemain0005
     * @tc.number SUB_FLIP_CLOCK_MORE5_RES_0005
     * @tc.desc   Load the screen quenching resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResourceRemain0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockResourceRemain0005 begin');
      const v: string = ctx.resourceManager.getStringByNameSync('screen_quenching');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v.length > 0));
        expect(v.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v === 'screen_quenching'));
        expect(v === 'screen_quenching').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v), String(v.trim()));
        expect(v).assertEqual(v.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockResourceRemain0005 end');
    })

    /**
     * @tc.name   testFlipClockResourceRemain0006
     * @tc.number SUB_FLIP_CLOCK_MORE5_RES_0006
     * @tc.desc   Load the entry main ability resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResourceRemain0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockResourceRemain0006 begin');
      const v: string = ctx.resourceManager.getStringByNameSync('entry_MainAbility');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v.length > 0));
        expect(v.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v === 'entry_MainAbility'));
        expect(v === 'entry_MainAbility').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v), String(v.trim()));
        expect(v).assertEqual(v.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockResourceRemain0006 end');
    })

    /**
     * @tc.name   testFlipClockResourceRemain0007
     * @tc.number SUB_FLIP_CLOCK_MORE5_RES_0007
     * @tc.desc   Load the main ability description resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResourceRemain0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockResourceRemain0007 begin');
      const v: string = ctx.resourceManager.getStringByNameSync('description_mainability');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v.length > 0));
        expect(v.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v === 'description_mainability'));
        expect(v === 'description_mainability').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v), String(v.trim()));
        expect(v).assertEqual(v.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockResourceRemain0007 end');
    })

    /**
     * @tc.name   testFlipClockResourceRemain0008
     * @tc.number SUB_FLIP_CLOCK_MORE5_RES_0008
     * @tc.desc   Load the setting title resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResourceRemain0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockResourceRemain0008 begin');
      const v: string = ctx.resourceManager.getStringByNameSync('setting');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v.length > 0));
        expect(v.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(v === 'setting'));
        expect(v === 'setting').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(v), String(v.trim()));
        expect(v).assertEqual(v.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockResourceRemain0008 end');
    })
  })
}
