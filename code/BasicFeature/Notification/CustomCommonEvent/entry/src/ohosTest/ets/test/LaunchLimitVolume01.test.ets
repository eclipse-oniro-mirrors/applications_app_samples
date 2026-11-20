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

export default function launchLimitVolume01Test(): void {
  describe('LaunchLimitVolume01Test', () => {

    /**
     * @tc.name   testLaunchLimitVolume010001
     * @tc.number SUB_CCE_LAUNCHLIM_01_0001
     * @tc.desc   current=0 时阈值判定为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume010001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010001 begin');
      const current: number = 0;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(current >= 10)), String('false'));
      expect(String(current >= 10)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('false'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010001 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume010002
     * @tc.number SUB_CCE_LAUNCHLIM_01_0002
     * @tc.desc   current=1 时阈值判定为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume010002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010002 begin');
      const current: number = 1;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(current >= 10)), String('false'));
      expect(String(current >= 10)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('false'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010002 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume010003
     * @tc.number SUB_CCE_LAUNCHLIM_01_0003
     * @tc.desc   current=2 时阈值判定为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume010003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010003 begin');
      const current: number = 2;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(current >= 10)), String('false'));
      expect(String(current >= 10)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('false'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010003 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume010004
     * @tc.number SUB_CCE_LAUNCHLIM_01_0004
     * @tc.desc   current=3 时阈值判定为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume010004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010004 begin');
      const current: number = 3;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(current >= 10)), String('false'));
      expect(String(current >= 10)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('false'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010004 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume010005
     * @tc.number SUB_CCE_LAUNCHLIM_01_0005
     * @tc.desc   current=4 时阈值判定为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume010005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010005 begin');
      const current: number = 4;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(current >= 10)), String('false'));
      expect(String(current >= 10)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('false'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010005 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume010006
     * @tc.number SUB_CCE_LAUNCHLIM_01_0006
     * @tc.desc   current=5 时阈值判定为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume010006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010006 begin');
      const current: number = 5;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(current >= 10)), String('false'));
      expect(String(current >= 10)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('false'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010006 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume010007
     * @tc.number SUB_CCE_LAUNCHLIM_01_0007
     * @tc.desc   current=6 时阈值判定为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume010007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010007 begin');
      const current: number = 6;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(current >= 10)), String('false'));
      expect(String(current >= 10)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('false'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010007 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume010008
     * @tc.number SUB_CCE_LAUNCHLIM_01_0008
     * @tc.desc   current=7 时阈值判定为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume010008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010008 begin');
      const current: number = 7;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(current >= 10)), String('false'));
      expect(String(current >= 10)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('false'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010008 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume010009
     * @tc.number SUB_CCE_LAUNCHLIM_01_0009
     * @tc.desc   current=8 时阈值判定为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume010009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010009 begin');
      const current: number = 8;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(current >= 10)), String('false'));
      expect(String(current >= 10)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('false'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010009 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume010010
     * @tc.number SUB_CCE_LAUNCHLIM_01_0010
     * @tc.desc   current=9 时阈值判定为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume010010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010010 begin');
      const current: number = 9;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(current >= 10)), String('false'));
      expect(String(current >= 10)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('true'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010010 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume010011
     * @tc.number SUB_CCE_LAUNCHLIM_01_0011
     * @tc.desc   current=10 时阈值判定为 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume010011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010011 begin');
      const current: number = 10;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(current >= 10)), String('true'));
      expect(String(current >= 10)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('true'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010011 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume010012
     * @tc.number SUB_CCE_LAUNCHLIM_01_0012
     * @tc.desc   current=11 时阈值判定为 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume010012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010012 begin');
      const current: number = 11;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(current >= 10)), String('true'));
      expect(String(current >= 10)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('true'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010012 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume010013
     * @tc.number SUB_CCE_LAUNCHLIM_01_0013
     * @tc.desc   current=12 时阈值判定为 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume010013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010013 begin');
      const current: number = 12;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(current >= 10)), String('true'));
      expect(String(current >= 10)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('true'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010013 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume010014
     * @tc.number SUB_CCE_LAUNCHLIM_01_0014
     * @tc.desc   current=100 时阈值判定为 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume010014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010014 begin');
      const current: number = 100;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(current >= 10)), String('true'));
      expect(String(current >= 10)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('true'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010014 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume010015
     * @tc.number SUB_CCE_LAUNCHLIM_01_0015
     * @tc.desc   current=-1 时阈值判定为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume010015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010015 begin');
      const current: number = -1;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(current >= 10)), String('false'));
      expect(String(current >= 10)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('false'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010015 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume010016
     * @tc.number SUB_CCE_LAUNCHLIM_01_0016
     * @tc.desc   current=-100 时阈值判定为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume010016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010016 begin');
      const current: number = -100;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(current >= 10)), String('false'));
      expect(String(current >= 10)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('false'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010016 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume010017
     * @tc.number SUB_CCE_LAUNCHLIM_01_0017
     * @tc.desc   current=0.5 时阈值判定为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume010017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010017 begin');
      const current: number = 0.5;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(current >= 10)), String('false'));
      expect(String(current >= 10)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('false'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010017 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume010018
     * @tc.number SUB_CCE_LAUNCHLIM_01_0018
     * @tc.desc   current=9.5 时阈值判定为 false
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume010018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010018 begin');
      const current: number = 9.5;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('false'));
      expect(String(result)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(current >= 10)), String('false'));
      expect(String(current >= 10)).assertEqual('false');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('true'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010018 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume010019
     * @tc.number SUB_CCE_LAUNCHLIM_01_0019
     * @tc.desc   current=10.5 时阈值判定为 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume010019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010019 begin');
      const current: number = 10.5;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(current >= 10)), String('true'));
      expect(String(current >= 10)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('true'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010019 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume010020
     * @tc.number SUB_CCE_LAUNCHLIM_01_0020
     * @tc.desc   current=10.0001 时阈值判定为 true
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume010020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010020 begin');
      const current: number = 10.0001;
      const result: boolean = launchFeature.reachedRecordLimit(current);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(result)), String('true'));
      expect(String(result)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(current >= 10)), String('true'));
      expect(String(current >= 10)).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(String(launchFeature.reachedRecordLimit(current + 1))), String('true'));
      expect(String(launchFeature.reachedRecordLimit(current + 1))).assertEqual('true');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010020 end');
    })

    /**
     * @tc.name   testLaunchLimitVolume010021
     * @tc.number SUB_CCE_LAUNCHLIM_01_0021
     * @tc.desc   上限常量 10 的左右邻域，9 为假、10 为真、10.0001 为真
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('testLaunchLimitVolume010021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010021 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(launchFeature.reachedRecordLimit(9)), 'false');
      expect(launchFeature.reachedRecordLimit(9)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(launchFeature.reachedRecordLimit(10)), 'true');
      expect(launchFeature.reachedRecordLimit(10)).assertTrue();
      expect(launchFeature.reachedRecordLimit(10.0001)).assertTrue();
      expect(launchFeature.reachedRecordLimit(0)).assertFalse();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testLaunchLimitVolume010021 end');
    })
  })
}
