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
import { common, AbilityDelegatorRegistry } from '@kit.AbilityKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';
let appContext: common.Context = AbilityDelegatorRegistry.getAbilityDelegator().getAppContext();

export default function flipClockResourceContractTest() {
  describe('FlipClockResourceContractTest', () => {

    /**
     * @tc.name   ohos.samples.flipclock_ResourceContract_0001
     * @tc.number SUB_FLIP_CLOCK_RESOURCE_001
     * @tc.desc   Load the alarm clock title resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ResourceContract_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ResourceContract_0001 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('alarmClock');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
        expect(value.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'alarmClock'));
        expect(value === 'alarmClock').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
        expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ResourceContract_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ResourceContract_0002
     * @tc.number SUB_FLIP_CLOCK_RESOURCE_002
     * @tc.desc   Load the delete label resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ResourceContract_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ResourceContract_0002 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('delete');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
        expect(value.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'delete'));
        expect(value === 'delete').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
        expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ResourceContract_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ResourceContract_0003
     * @tc.number SUB_FLIP_CLOCK_RESOURCE_003
     * @tc.desc   Load the hour label resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ResourceContract_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ResourceContract_0003 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('hour');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
        expect(value.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'hour'));
        expect(value === 'hour').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
        expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ResourceContract_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ResourceContract_0004
     * @tc.number SUB_FLIP_CLOCK_RESOURCE_004
     * @tc.desc   Load the minute label resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ResourceContract_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ResourceContract_0004 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('minute');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
        expect(value.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'minute'));
        expect(value === 'minute').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
        expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ResourceContract_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ResourceContract_0005
     * @tc.number SUB_FLIP_CLOCK_RESOURCE_005
     * @tc.desc   Load the seconds label resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ResourceContract_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ResourceContract_0005 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('seconds');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
        expect(value.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'seconds'));
        expect(value === 'seconds').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
        expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ResourceContract_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ResourceContract_0006
     * @tc.number SUB_FLIP_CLOCK_RESOURCE_006
     * @tc.desc   Load the yes label resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ResourceContract_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ResourceContract_0006 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('yes');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
        expect(value.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'yes'));
        expect(value === 'yes').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
        expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ResourceContract_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ResourceContract_0007
     * @tc.number SUB_FLIP_CLOCK_RESOURCE_007
     * @tc.desc   Load the no label resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ResourceContract_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ResourceContract_0007 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('no');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
        expect(value.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'no'));
        expect(value === 'no').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
        expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ResourceContract_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ResourceContract_0008
     * @tc.number SUB_FLIP_CLOCK_RESOURCE_008
     * @tc.desc   Load the full screen label resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ResourceContract_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ResourceContract_0008 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('fullScreen');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
        expect(value.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'fullScreen'));
        expect(value === 'fullScreen').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
        expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ResourceContract_0008 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ResourceContract_0009
     * @tc.number SUB_FLIP_CLOCK_RESOURCE_009
     * @tc.desc   Load the brightness label resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ResourceContract_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ResourceContract_0009 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('brightness');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
        expect(value.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'brightness'));
        expect(value === 'brightness').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
        expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ResourceContract_0009 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ResourceContract_0010
     * @tc.number SUB_FLIP_CLOCK_RESOURCE_010
     * @tc.desc   Load the first tab label resource.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ResourceContract_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ResourceContract_0010 begin');
      const value: string = appContext.resourceManager.getStringByNameSync('tab0');
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value.length > 0));
        expect(value.length > 0).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(value === 'tab0'));
        expect(value === 'tab0').assertFalse();
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(value), String(value.trim()));
        expect(value).assertEqual(value.trim());
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ResourceContract_0010 end');
    })
  })
}
