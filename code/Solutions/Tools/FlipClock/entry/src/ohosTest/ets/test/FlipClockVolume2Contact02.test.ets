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
import { ContactSource, Contact } from '../../../main/ets/common/DataSource';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

export default function flipClockVolume2Contact02Test() {
  describe('FlipClockVolume2Contact02Test', () => {

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact02_0001
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0001
     * @tc.desc   Verify source.totalCount() equals 621.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact02_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 621; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(621));
      expect(source.totalCount()).assertEqual(621);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(620).reminderId), String(620));
      expect(source.getData(620).reminderId).assertEqual(620);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact02_0002
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0002
     * @tc.desc   Verify source.totalCount() equals 622.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact02_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 622; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(622));
      expect(source.totalCount()).assertEqual(622);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(621).reminderId), String(621));
      expect(source.getData(621).reminderId).assertEqual(621);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact02_0003
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0003
     * @tc.desc   Verify source.totalCount() equals 623.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact02_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 623; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(623));
      expect(source.totalCount()).assertEqual(623);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(622).reminderId), String(622));
      expect(source.getData(622).reminderId).assertEqual(622);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact02_0004
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0004
     * @tc.desc   Verify source.totalCount() equals 624.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact02_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 624; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(624));
      expect(source.totalCount()).assertEqual(624);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(623).reminderId), String(623));
      expect(source.getData(623).reminderId).assertEqual(623);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact02_0005
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0005
     * @tc.desc   Verify source.totalCount() equals 625.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact02_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 625; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(625));
      expect(source.totalCount()).assertEqual(625);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(624).reminderId), String(624));
      expect(source.getData(624).reminderId).assertEqual(624);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact02_0006
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0006
     * @tc.desc   Verify source.totalCount() equals 626.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact02_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 626; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(626));
      expect(source.totalCount()).assertEqual(626);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(625).reminderId), String(625));
      expect(source.getData(625).reminderId).assertEqual(625);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact02_0007
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0007
     * @tc.desc   Verify source.totalCount() equals 627.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact02_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 627; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(627));
      expect(source.totalCount()).assertEqual(627);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(626).reminderId), String(626));
      expect(source.getData(626).reminderId).assertEqual(626);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact02_0008
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0008
     * @tc.desc   Verify source.totalCount() equals 628.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact02_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 628; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(628));
      expect(source.totalCount()).assertEqual(628);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(627).reminderId), String(627));
      expect(source.getData(627).reminderId).assertEqual(627);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0008 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact02_0009
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0009
     * @tc.desc   Verify source.totalCount() equals 629.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact02_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 629; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(629));
      expect(source.totalCount()).assertEqual(629);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(628).reminderId), String(628));
      expect(source.getData(628).reminderId).assertEqual(628);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0009 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact02_0010
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0010
     * @tc.desc   Verify source.totalCount() equals 630.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact02_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 630; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(630));
      expect(source.totalCount()).assertEqual(630);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(629).reminderId), String(629));
      expect(source.getData(629).reminderId).assertEqual(629);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0010 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact02_0011
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0011
     * @tc.desc   Verify source.totalCount() equals 631.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact02_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 631; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(631));
      expect(source.totalCount()).assertEqual(631);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(630).reminderId), String(630));
      expect(source.getData(630).reminderId).assertEqual(630);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0011 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact02_0012
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0012
     * @tc.desc   Verify source.totalCount() equals 632.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact02_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 632; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(632));
      expect(source.totalCount()).assertEqual(632);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(631).reminderId), String(631));
      expect(source.getData(631).reminderId).assertEqual(631);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0012 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact02_0013
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0013
     * @tc.desc   Verify source.totalCount() equals 633.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact02_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 633; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(633));
      expect(source.totalCount()).assertEqual(633);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(632).reminderId), String(632));
      expect(source.getData(632).reminderId).assertEqual(632);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0013 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact02_0014
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0014
     * @tc.desc   Verify source.totalCount() equals 634.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact02_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 634; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(634));
      expect(source.totalCount()).assertEqual(634);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(633).reminderId), String(633));
      expect(source.getData(633).reminderId).assertEqual(633);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0014 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact02_0015
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0015
     * @tc.desc   Verify source.totalCount() equals 635.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact02_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 635; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(635));
      expect(source.totalCount()).assertEqual(635);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(634).reminderId), String(634));
      expect(source.getData(634).reminderId).assertEqual(634);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0015 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact02_0016
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0016
     * @tc.desc   Verify source.totalCount() equals 636.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact02_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 636; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(636));
      expect(source.totalCount()).assertEqual(636);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(635).reminderId), String(635));
      expect(source.getData(635).reminderId).assertEqual(635);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0016 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact02_0017
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0017
     * @tc.desc   Verify source.totalCount() equals 637.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact02_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 637; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(637));
      expect(source.totalCount()).assertEqual(637);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(636).reminderId), String(636));
      expect(source.getData(636).reminderId).assertEqual(636);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0017 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact02_0018
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0018
     * @tc.desc   Verify source.totalCount() equals 638.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact02_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 638; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(638));
      expect(source.totalCount()).assertEqual(638);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(637).reminderId), String(637));
      expect(source.getData(637).reminderId).assertEqual(637);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0018 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact02_0019
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0019
     * @tc.desc   Verify source.totalCount() equals 639.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact02_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 639; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(639));
      expect(source.totalCount()).assertEqual(639);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(638).reminderId), String(638));
      expect(source.getData(638).reminderId).assertEqual(638);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0019 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact02_0020
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0020
     * @tc.desc   Verify source.totalCount() equals 640.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact02_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 640; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(640));
      expect(source.totalCount()).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(639).reminderId), String(639));
      expect(source.getData(639).reminderId).assertEqual(639);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact02_0020 end');
    })
  })
}
