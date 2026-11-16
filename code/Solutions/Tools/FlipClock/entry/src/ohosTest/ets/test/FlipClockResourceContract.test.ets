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
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';
let appContext = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext();

export default function flipClockResourceContractTest() {
  describe('FlipClockResourceContractTest', () => {

    /**
     * @tc.name   testFlipClockResource001
     * @tc.number SUB_FLIP_CLOCK_RESOURCE_001
     * @tc.desc   Load the alarm clock title resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResource001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockResource001 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('alarmClock');
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value.length > 0).assertTrue();');
        expect(value.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value === \'alarmClock\').assertFalse();');
        expect(value === 'alarmClock').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value).assertEqual(value.trim());');
        expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockResource001 end');
    })

    /**
     * @tc.name   testFlipClockResource002
     * @tc.number SUB_FLIP_CLOCK_RESOURCE_002
     * @tc.desc   Load the delete label resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResource002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockResource002 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('delete');
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value.length > 0).assertTrue();');
        expect(value.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value === \'delete\').assertFalse();');
        expect(value === 'delete').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value).assertEqual(value.trim());');
        expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockResource002 end');
    })

    /**
     * @tc.name   testFlipClockResource003
     * @tc.number SUB_FLIP_CLOCK_RESOURCE_003
     * @tc.desc   Load the hour label resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResource003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockResource003 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('hour');
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value.length > 0).assertTrue();');
        expect(value.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value === \'hour\').assertFalse();');
        expect(value === 'hour').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value).assertEqual(value.trim());');
        expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockResource003 end');
    })

    /**
     * @tc.name   testFlipClockResource004
     * @tc.number SUB_FLIP_CLOCK_RESOURCE_004
     * @tc.desc   Load the minute label resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResource004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockResource004 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('minute');
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value.length > 0).assertTrue();');
        expect(value.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value === \'minute\').assertFalse();');
        expect(value === 'minute').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value).assertEqual(value.trim());');
        expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockResource004 end');
    })

    /**
     * @tc.name   testFlipClockResource005
     * @tc.number SUB_FLIP_CLOCK_RESOURCE_005
     * @tc.desc   Load the seconds label resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResource005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockResource005 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('seconds');
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value.length > 0).assertTrue();');
        expect(value.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value === \'seconds\').assertFalse();');
        expect(value === 'seconds').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value).assertEqual(value.trim());');
        expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockResource005 end');
    })

    /**
     * @tc.name   testFlipClockResource006
     * @tc.number SUB_FLIP_CLOCK_RESOURCE_006
     * @tc.desc   Load the yes label resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResource006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockResource006 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('yes');
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value.length > 0).assertTrue();');
        expect(value.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value === \'yes\').assertFalse();');
        expect(value === 'yes').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value).assertEqual(value.trim());');
        expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockResource006 end');
    })

    /**
     * @tc.name   testFlipClockResource007
     * @tc.number SUB_FLIP_CLOCK_RESOURCE_007
     * @tc.desc   Load the no label resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResource007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockResource007 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('no');
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value.length > 0).assertTrue();');
        expect(value.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value === \'no\').assertFalse();');
        expect(value === 'no').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value).assertEqual(value.trim());');
        expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockResource007 end');
    })

    /**
     * @tc.name   testFlipClockResource008
     * @tc.number SUB_FLIP_CLOCK_RESOURCE_008
     * @tc.desc   Load the full screen label resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResource008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockResource008 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('fullScreen');
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value.length > 0).assertTrue();');
        expect(value.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value === \'fullScreen\').assertFalse();');
        expect(value === 'fullScreen').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value).assertEqual(value.trim());');
        expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockResource008 end');
    })

    /**
     * @tc.name   testFlipClockResource009
     * @tc.number SUB_FLIP_CLOCK_RESOURCE_009
     * @tc.desc   Load the brightness label resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResource009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockResource009 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('brightness');
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value.length > 0).assertTrue();');
        expect(value.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value === \'brightness\').assertFalse();');
        expect(value === 'brightness').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value).assertEqual(value.trim());');
        expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockResource009 end');
    })

    /**
     * @tc.name   testFlipClockResource010
     * @tc.number SUB_FLIP_CLOCK_RESOURCE_010
     * @tc.desc   Load the first tab label resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockResource010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockResource010 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('tab0');
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value.length > 0).assertTrue();');
        expect(value.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value === \'tab0\').assertFalse();');
        expect(value === 'tab0').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(value).assertEqual(value.trim());');
        expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockResource010 end');
    })
  })
}
