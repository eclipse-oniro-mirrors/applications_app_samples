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
     * @tc.name   testFlipClockVol2060001
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0001
     * @tc.desc   Verify source.totalCount() equals 701.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2060001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060001 begin');
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
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060001 end');
    })

    /**
     * @tc.name   testFlipClockVol2060002
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0002
     * @tc.desc   Verify source.totalCount() equals 702.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2060002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060002 begin');
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
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060002 end');
    })

    /**
     * @tc.name   testFlipClockVol2060003
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0003
     * @tc.desc   Verify source.totalCount() equals 703.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2060003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060003 begin');
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
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060003 end');
    })

    /**
     * @tc.name   testFlipClockVol2060004
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0004
     * @tc.desc   Verify source.totalCount() equals 704.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2060004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060004 begin');
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
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060004 end');
    })

    /**
     * @tc.name   testFlipClockVol2060005
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0005
     * @tc.desc   Verify source.totalCount() equals 705.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2060005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060005 begin');
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
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060005 end');
    })

    /**
     * @tc.name   testFlipClockVol2060006
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0006
     * @tc.desc   Verify source.totalCount() equals 706.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2060006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060006 begin');
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
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060006 end');
    })

    /**
     * @tc.name   testFlipClockVol2060007
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0007
     * @tc.desc   Verify source.totalCount() equals 707.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2060007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060007 begin');
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
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060007 end');
    })

    /**
     * @tc.name   testFlipClockVol2060008
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0008
     * @tc.desc   Verify source.totalCount() equals 708.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2060008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060008 begin');
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
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060008 end');
    })

    /**
     * @tc.name   testFlipClockVol2060009
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0009
     * @tc.desc   Verify source.totalCount() equals 709.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2060009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060009 begin');
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
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060009 end');
    })

    /**
     * @tc.name   testFlipClockVol2060010
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0010
     * @tc.desc   Verify source.totalCount() equals 710.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2060010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060010 begin');
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
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060010 end');
    })

    /**
     * @tc.name   testFlipClockVol2060011
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0011
     * @tc.desc   Verify source.totalCount() equals 711.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2060011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060011 begin');
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
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060011 end');
    })

    /**
     * @tc.name   testFlipClockVol2060012
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0012
     * @tc.desc   Verify source.totalCount() equals 712.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2060012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060012 begin');
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
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060012 end');
    })

    /**
     * @tc.name   testFlipClockVol2060013
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0013
     * @tc.desc   Verify source.totalCount() equals 713.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2060013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060013 begin');
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
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060013 end');
    })

    /**
     * @tc.name   testFlipClockVol2060014
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0014
     * @tc.desc   Verify source.totalCount() equals 714.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2060014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060014 begin');
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
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060014 end');
    })

    /**
     * @tc.name   testFlipClockVol2060015
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0015
     * @tc.desc   Verify source.totalCount() equals 715.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2060015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060015 begin');
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
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060015 end');
    })

    /**
     * @tc.name   testFlipClockVol2060016
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0016
     * @tc.desc   Verify source.totalCount() equals 716.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2060016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060016 begin');
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
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060016 end');
    })

    /**
     * @tc.name   testFlipClockVol2060017
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0017
     * @tc.desc   Verify source.totalCount() equals 717.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2060017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060017 begin');
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
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060017 end');
    })

    /**
     * @tc.name   testFlipClockVol2060018
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0018
     * @tc.desc   Verify source.totalCount() equals 718.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2060018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060018 begin');
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
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060018 end');
    })

    /**
     * @tc.name   testFlipClockVol2060019
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0019
     * @tc.desc   Verify source.totalCount() equals 719.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2060019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060019 begin');
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
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060019 end');
    })

    /**
     * @tc.name   testFlipClockVol2060020
     * @tc.number SUB_FLIP_CLOCK_VOL2_06_0020
     * @tc.desc   Verify source.totalCount() equals 720.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2060020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060020 begin');
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
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2060020 end');
    })
  })
}
