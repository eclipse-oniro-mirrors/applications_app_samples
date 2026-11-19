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

export default function flipClockVolume2Contact13Test() {
  describe('FlipClockVolume2Contact13Test', () => {

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact13_0001
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0001
     * @tc.desc   Verify source.totalCount() equals 841.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact13_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 841; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(841));
      expect(source.totalCount()).assertEqual(841);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(840).reminderId), String(840));
      expect(source.getData(840).reminderId).assertEqual(840);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact13_0002
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0002
     * @tc.desc   Verify source.totalCount() equals 842.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact13_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 842; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(842));
      expect(source.totalCount()).assertEqual(842);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(841).reminderId), String(841));
      expect(source.getData(841).reminderId).assertEqual(841);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact13_0003
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0003
     * @tc.desc   Verify source.totalCount() equals 843.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact13_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 843; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(843));
      expect(source.totalCount()).assertEqual(843);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(842).reminderId), String(842));
      expect(source.getData(842).reminderId).assertEqual(842);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact13_0004
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0004
     * @tc.desc   Verify source.totalCount() equals 844.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact13_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 844; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(844));
      expect(source.totalCount()).assertEqual(844);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(843).reminderId), String(843));
      expect(source.getData(843).reminderId).assertEqual(843);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact13_0005
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0005
     * @tc.desc   Verify source.totalCount() equals 845.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact13_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 845; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(845));
      expect(source.totalCount()).assertEqual(845);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(844).reminderId), String(844));
      expect(source.getData(844).reminderId).assertEqual(844);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact13_0006
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0006
     * @tc.desc   Verify source.totalCount() equals 846.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact13_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 846; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(846));
      expect(source.totalCount()).assertEqual(846);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(845).reminderId), String(845));
      expect(source.getData(845).reminderId).assertEqual(845);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact13_0007
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0007
     * @tc.desc   Verify source.totalCount() equals 847.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact13_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 847; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(847));
      expect(source.totalCount()).assertEqual(847);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(846).reminderId), String(846));
      expect(source.getData(846).reminderId).assertEqual(846);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact13_0008
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0008
     * @tc.desc   Verify source.totalCount() equals 848.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact13_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 848; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(848));
      expect(source.totalCount()).assertEqual(848);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(847).reminderId), String(847));
      expect(source.getData(847).reminderId).assertEqual(847);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0008 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact13_0009
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0009
     * @tc.desc   Verify source.totalCount() equals 849.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact13_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 849; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(849));
      expect(source.totalCount()).assertEqual(849);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(848).reminderId), String(848));
      expect(source.getData(848).reminderId).assertEqual(848);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0009 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact13_0010
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0010
     * @tc.desc   Verify source.totalCount() equals 850.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact13_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 850; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(850));
      expect(source.totalCount()).assertEqual(850);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(849).reminderId), String(849));
      expect(source.getData(849).reminderId).assertEqual(849);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0010 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact13_0011
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0011
     * @tc.desc   Verify source.totalCount() equals 851.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact13_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 851; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(851));
      expect(source.totalCount()).assertEqual(851);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(850).reminderId), String(850));
      expect(source.getData(850).reminderId).assertEqual(850);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0011 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact13_0012
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0012
     * @tc.desc   Verify source.totalCount() equals 852.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact13_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 852; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(852));
      expect(source.totalCount()).assertEqual(852);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(851).reminderId), String(851));
      expect(source.getData(851).reminderId).assertEqual(851);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0012 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact13_0013
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0013
     * @tc.desc   Verify source.totalCount() equals 853.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact13_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 853; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(853));
      expect(source.totalCount()).assertEqual(853);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(852).reminderId), String(852));
      expect(source.getData(852).reminderId).assertEqual(852);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0013 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact13_0014
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0014
     * @tc.desc   Verify source.totalCount() equals 854.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact13_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 854; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(854));
      expect(source.totalCount()).assertEqual(854);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(853).reminderId), String(853));
      expect(source.getData(853).reminderId).assertEqual(853);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0014 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact13_0015
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0015
     * @tc.desc   Verify source.totalCount() equals 855.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact13_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 855; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(855));
      expect(source.totalCount()).assertEqual(855);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(854).reminderId), String(854));
      expect(source.getData(854).reminderId).assertEqual(854);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0015 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact13_0016
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0016
     * @tc.desc   Verify source.totalCount() equals 856.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact13_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 856; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(856));
      expect(source.totalCount()).assertEqual(856);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(855).reminderId), String(855));
      expect(source.getData(855).reminderId).assertEqual(855);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0016 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact13_0017
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0017
     * @tc.desc   Verify source.totalCount() equals 857.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact13_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 857; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(857));
      expect(source.totalCount()).assertEqual(857);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(856).reminderId), String(856));
      expect(source.getData(856).reminderId).assertEqual(856);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0017 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact13_0018
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0018
     * @tc.desc   Verify source.totalCount() equals 858.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact13_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 858; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(858));
      expect(source.totalCount()).assertEqual(858);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(857).reminderId), String(857));
      expect(source.getData(857).reminderId).assertEqual(857);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0018 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact13_0019
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0019
     * @tc.desc   Verify source.totalCount() equals 859.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact13_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 859; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(859));
      expect(source.totalCount()).assertEqual(859);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(858).reminderId), String(858));
      expect(source.getData(858).reminderId).assertEqual(858);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0019 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact13_0020
     * @tc.number SUB_FLIP_CLOCK_VOL2_13_0020
     * @tc.desc   Verify source.totalCount() equals 860.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact13_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 860; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(860));
      expect(source.totalCount()).assertEqual(860);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(859).reminderId), String(859));
      expect(source.getData(859).reminderId).assertEqual(859);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact13_0020 end');
    })
  })
}
