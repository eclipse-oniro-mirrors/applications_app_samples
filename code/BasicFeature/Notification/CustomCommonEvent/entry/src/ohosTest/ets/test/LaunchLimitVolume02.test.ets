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
import launchFeature from '../../../main/ets/feature/LaunchFeature';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_CustomCommonEvent]';

export default function launchLimitVolume02Test(): void {
  describe('LaunchLimitVolume02Test', () => {

    /**
     * @tc.name   testLaunchLimitVolume020001
     * @tc.number SUB_CCE_LAUNCHLIM_02_0001
     * @tc.desc   current=9.9 时阈值判定为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020001 begin');
      const current: number = 9.9;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('true'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(-current))), String('false'));
      expect(String(launchFeature.reachedRecordLimit(-current))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020001 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume020002
     * @tc.number SUB_CCE_LAUNCHLIM_02_0002
     * @tc.desc   current=9.99 时阈值判定为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020002 begin');
      const current: number = 9.99;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('true'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(-current))), String('false'));
      expect(String(launchFeature.reachedRecordLimit(-current))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020002 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume020003
     * @tc.number SUB_CCE_LAUNCHLIM_02_0003
     * @tc.desc   current=9.999 时阈值判定为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020003 begin');
      const current: number = 9.999;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('true'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(-current))), String('false'));
      expect(String(launchFeature.reachedRecordLimit(-current))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020003 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume020004
     * @tc.number SUB_CCE_LAUNCHLIM_02_0004
     * @tc.desc   current=9.9999 时阈值判定为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020004 begin');
      const current: number = 9.9999;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('true'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(-current))), String('false'));
      expect(String(launchFeature.reachedRecordLimit(-current))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020004 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume020005
     * @tc.number SUB_CCE_LAUNCHLIM_02_0005
     * @tc.desc   current=10.0001 时阈值判定为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020005 begin');
      const current: number = 10.0001;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('true'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(-current))), String('false'));
      expect(String(launchFeature.reachedRecordLimit(-current))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020005 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume020006
     * @tc.number SUB_CCE_LAUNCHLIM_02_0006
     * @tc.desc   current=10.001 时阈值判定为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020006 begin');
      const current: number = 10.001;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('true'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(-current))), String('false'));
      expect(String(launchFeature.reachedRecordLimit(-current))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020006 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume020007
     * @tc.number SUB_CCE_LAUNCHLIM_02_0007
     * @tc.desc   current=10.01 时阈值判定为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020007 begin');
      const current: number = 10.01;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('true'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(-current))), String('false'));
      expect(String(launchFeature.reachedRecordLimit(-current))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020007 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume020008
     * @tc.number SUB_CCE_LAUNCHLIM_02_0008
     * @tc.desc   current=10.1 时阈值判定为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020008 begin');
      const current: number = 10.1;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('true'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(-current))), String('false'));
      expect(String(launchFeature.reachedRecordLimit(-current))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020008 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume020009
     * @tc.number SUB_CCE_LAUNCHLIM_02_0009
     * @tc.desc   current=10.9 时阈值判定为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020009 begin');
      const current: number = 10.9;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('true'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(-current))), String('false'));
      expect(String(launchFeature.reachedRecordLimit(-current))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020009 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume020010
     * @tc.number SUB_CCE_LAUNCHLIM_02_0010
     * @tc.desc   current=19 时阈值判定为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020010 begin');
      const current: number = 19;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('true'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(-current))), String('false'));
      expect(String(launchFeature.reachedRecordLimit(-current))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020010 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume020011
     * @tc.number SUB_CCE_LAUNCHLIM_02_0011
     * @tc.desc   current=29 时阈值判定为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020011 begin');
      const current: number = 29;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('true'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(-current))), String('false'));
      expect(String(launchFeature.reachedRecordLimit(-current))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020011 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume020012
     * @tc.number SUB_CCE_LAUNCHLIM_02_0012
     * @tc.desc   current=99 时阈值判定为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020012 begin');
      const current: number = 99;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('true'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(-current))), String('false'));
      expect(String(launchFeature.reachedRecordLimit(-current))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020012 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume020013
     * @tc.number SUB_CCE_LAUNCHLIM_02_0013
     * @tc.desc   current=999 时阈值判定为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020013 begin');
      const current: number = 999;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('true'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(-current))), String('false'));
      expect(String(launchFeature.reachedRecordLimit(-current))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020013 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume020014
     * @tc.number SUB_CCE_LAUNCHLIM_02_0014
     * @tc.desc   current=9999 时阈值判定为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020014 begin');
      const current: number = 9999;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('true'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(-current))), String('false'));
      expect(String(launchFeature.reachedRecordLimit(-current))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020014 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume020015
     * @tc.number SUB_CCE_LAUNCHLIM_02_0015
     * @tc.desc   current=99999 时阈值判定为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020015 begin');
      const current: number = 99999;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('true'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(-current))), String('false'));
      expect(String(launchFeature.reachedRecordLimit(-current))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020015 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume020016
     * @tc.number SUB_CCE_LAUNCHLIM_02_0016
     * @tc.desc   current=999999 时阈值判定为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020016 begin');
      const current: number = 999999;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('true'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(-current))), String('false'));
      expect(String(launchFeature.reachedRecordLimit(-current))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020016 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume020017
     * @tc.number SUB_CCE_LAUNCHLIM_02_0017
     * @tc.desc   current=1000000 时阈值判定为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume020017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020017 begin');
      const current: number = 1000000;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('true'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(-current))), String('false'));
      expect(String(launchFeature.reachedRecordLimit(-current))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020017 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume020018
     * @tc.number SUB_CCE_LAUNCHLIM_02_0018
     * @tc.desc   current=9007199254740991 时阈值判定为 true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume020018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020018 begin');
      const current: number = 9007199254740991;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('true'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(-current))), String('false'));
      expect(String(launchFeature.reachedRecordLimit(-current))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020018 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume020019
     * @tc.number SUB_CCE_LAUNCHLIM_02_0019
     * @tc.desc   current=-0.1 时阈值判定为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume020019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020019 begin');
      const current: number = -0.1;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('false'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(-current))), String('false'));
      expect(String(launchFeature.reachedRecordLimit(-current))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020019 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume020020
     * @tc.number SUB_CCE_LAUNCHLIM_02_0020
     * @tc.desc   current=-9.9 时阈值判定为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume020020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020020 begin');
      const current: number = -9.9;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('false'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(-current))), String('false'));
      expect(String(launchFeature.reachedRecordLimit(-current))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020020 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume020021
     * @tc.number SUB_CCE_LAUNCHLIM_02_0021
     * @tc.desc   current=-9007199254740991 时阈值判定为 false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume020021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020021 begin');
      const current: number = -9007199254740991;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('false'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(-current))), String('true'));
      expect(String(launchFeature.reachedRecordLimit(-current))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020021 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume020022
     * @tc.number SUB_CCE_LAUNCHLIM_02_0022
     * @tc.desc   阈值右邻域高密度采样：9.99999/9.999999 为假，10.000001 为真
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume020022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020022 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(launchFeature.reachedRecordLimit(9.99999)), 'false');
      expect(launchFeature.reachedRecordLimit(9.99999)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(launchFeature.reachedRecordLimit(9.999999)), 'false');
      expect(launchFeature.reachedRecordLimit(9.999999)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(launchFeature.reachedRecordLimit(10.000001)), 'true');
      expect(launchFeature.reachedRecordLimit(10.000001)).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume020022 end');
    })
  })
}
