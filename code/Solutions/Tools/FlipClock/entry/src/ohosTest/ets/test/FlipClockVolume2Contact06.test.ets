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

export default function flipClockVolume2Contact06Test() {
  describe('FlipClockVolume2Contact06Test', () => {

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact06_0001
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0001
     * @tc.desc   Verify source.totalCount() equals 701.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact06_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 701; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(701));
      expect(source.totalCount()).assertEqual(701);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(700).reminderId), String(700));
      expect(source.getData(700).reminderId).assertEqual(700);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact06_0002
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0002
     * @tc.desc   Verify source.totalCount() equals 702.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact06_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 702; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(702));
      expect(source.totalCount()).assertEqual(702);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(701).reminderId), String(701));
      expect(source.getData(701).reminderId).assertEqual(701);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact06_0003
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0003
     * @tc.desc   Verify source.totalCount() equals 703.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact06_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 703; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(703));
      expect(source.totalCount()).assertEqual(703);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(702).reminderId), String(702));
      expect(source.getData(702).reminderId).assertEqual(702);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact06_0004
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0004
     * @tc.desc   Verify source.totalCount() equals 704.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact06_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 704; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(704));
      expect(source.totalCount()).assertEqual(704);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(703).reminderId), String(703));
      expect(source.getData(703).reminderId).assertEqual(703);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact06_0005
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0005
     * @tc.desc   Verify source.totalCount() equals 705.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact06_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 705; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(705));
      expect(source.totalCount()).assertEqual(705);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(704).reminderId), String(704));
      expect(source.getData(704).reminderId).assertEqual(704);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact06_0006
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0006
     * @tc.desc   Verify source.totalCount() equals 706.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact06_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 706; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(706));
      expect(source.totalCount()).assertEqual(706);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(705).reminderId), String(705));
      expect(source.getData(705).reminderId).assertEqual(705);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact06_0007
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0007
     * @tc.desc   Verify source.totalCount() equals 707.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact06_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 707; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(707));
      expect(source.totalCount()).assertEqual(707);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(706).reminderId), String(706));
      expect(source.getData(706).reminderId).assertEqual(706);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact06_0008
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0008
     * @tc.desc   Verify source.totalCount() equals 708.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact06_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 708; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(708));
      expect(source.totalCount()).assertEqual(708);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(707).reminderId), String(707));
      expect(source.getData(707).reminderId).assertEqual(707);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0008 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact06_0009
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0009
     * @tc.desc   Verify source.totalCount() equals 709.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact06_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 709; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(709));
      expect(source.totalCount()).assertEqual(709);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(708).reminderId), String(708));
      expect(source.getData(708).reminderId).assertEqual(708);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0009 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact06_0010
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0010
     * @tc.desc   Verify source.totalCount() equals 710.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact06_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 710; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(710));
      expect(source.totalCount()).assertEqual(710);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(709).reminderId), String(709));
      expect(source.getData(709).reminderId).assertEqual(709);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0010 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact06_0011
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0011
     * @tc.desc   Verify source.totalCount() equals 711.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact06_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 711; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(711));
      expect(source.totalCount()).assertEqual(711);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(710).reminderId), String(710));
      expect(source.getData(710).reminderId).assertEqual(710);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0011 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact06_0012
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0012
     * @tc.desc   Verify source.totalCount() equals 712.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact06_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 712; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(712));
      expect(source.totalCount()).assertEqual(712);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(711).reminderId), String(711));
      expect(source.getData(711).reminderId).assertEqual(711);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0012 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact06_0013
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0013
     * @tc.desc   Verify source.totalCount() equals 713.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact06_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 713; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(713));
      expect(source.totalCount()).assertEqual(713);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(712).reminderId), String(712));
      expect(source.getData(712).reminderId).assertEqual(712);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0013 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact06_0014
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0014
     * @tc.desc   Verify source.totalCount() equals 714.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact06_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 714; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(714));
      expect(source.totalCount()).assertEqual(714);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(713).reminderId), String(713));
      expect(source.getData(713).reminderId).assertEqual(713);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0014 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact06_0015
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0015
     * @tc.desc   Verify source.totalCount() equals 715.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact06_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 715; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(715));
      expect(source.totalCount()).assertEqual(715);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(714).reminderId), String(714));
      expect(source.getData(714).reminderId).assertEqual(714);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0015 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact06_0016
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0016
     * @tc.desc   Verify source.totalCount() equals 716.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact06_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 716; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(716));
      expect(source.totalCount()).assertEqual(716);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(715).reminderId), String(715));
      expect(source.getData(715).reminderId).assertEqual(715);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0016 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact06_0017
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0017
     * @tc.desc   Verify source.totalCount() equals 717.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact06_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 717; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(717));
      expect(source.totalCount()).assertEqual(717);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(716).reminderId), String(716));
      expect(source.getData(716).reminderId).assertEqual(716);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0017 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact06_0018
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0018
     * @tc.desc   Verify source.totalCount() equals 718.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact06_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 718; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(718));
      expect(source.totalCount()).assertEqual(718);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(717).reminderId), String(717));
      expect(source.getData(717).reminderId).assertEqual(717);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0018 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact06_0019
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0019
     * @tc.desc   Verify source.totalCount() equals 719.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact06_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 719; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(719));
      expect(source.totalCount()).assertEqual(719);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(718).reminderId), String(718));
      expect(source.getData(718).reminderId).assertEqual(718);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0019 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact06_0020
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0020
     * @tc.desc   Verify source.totalCount() equals 720.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact06_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 720; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(720));
      expect(source.totalCount()).assertEqual(720);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(719).reminderId), String(719));
      expect(source.getData(719).reminderId).assertEqual(719);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact06_0020 end');
    })
  })
}
