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

export default function flipClockVolume2Contact04Test() {
  describe('FlipClockVolume2Contact04Test', () => {

    /**
     * @tc.name   testFlipClockVol2040001
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0001
     * @tc.desc   Verify source.totalCount() equals 661.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 661; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(661));
      expect(source.totalCount()).assertEqual(661);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(660).reminderId), String(660));
      expect(source.getData(660).reminderId).assertEqual(660);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040001 end');
    })

    /**
     * @tc.name   testFlipClockVol2040002
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0002
     * @tc.desc   Verify source.totalCount() equals 662.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 662; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(662));
      expect(source.totalCount()).assertEqual(662);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(661).reminderId), String(661));
      expect(source.getData(661).reminderId).assertEqual(661);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040002 end');
    })

    /**
     * @tc.name   testFlipClockVol2040003
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0003
     * @tc.desc   Verify source.totalCount() equals 663.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 663; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(663));
      expect(source.totalCount()).assertEqual(663);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(662).reminderId), String(662));
      expect(source.getData(662).reminderId).assertEqual(662);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040003 end');
    })

    /**
     * @tc.name   testFlipClockVol2040004
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0004
     * @tc.desc   Verify source.totalCount() equals 664.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 664; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(664));
      expect(source.totalCount()).assertEqual(664);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(663).reminderId), String(663));
      expect(source.getData(663).reminderId).assertEqual(663);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040004 end');
    })

    /**
     * @tc.name   testFlipClockVol2040005
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0005
     * @tc.desc   Verify source.totalCount() equals 665.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 665; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(665));
      expect(source.totalCount()).assertEqual(665);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(664).reminderId), String(664));
      expect(source.getData(664).reminderId).assertEqual(664);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040005 end');
    })

    /**
     * @tc.name   testFlipClockVol2040006
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0006
     * @tc.desc   Verify source.totalCount() equals 666.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 666; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(666));
      expect(source.totalCount()).assertEqual(666);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(665).reminderId), String(665));
      expect(source.getData(665).reminderId).assertEqual(665);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040006 end');
    })

    /**
     * @tc.name   testFlipClockVol2040007
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0007
     * @tc.desc   Verify source.totalCount() equals 667.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 667; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(667));
      expect(source.totalCount()).assertEqual(667);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(666).reminderId), String(666));
      expect(source.getData(666).reminderId).assertEqual(666);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040007 end');
    })

    /**
     * @tc.name   testFlipClockVol2040008
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0008
     * @tc.desc   Verify source.totalCount() equals 668.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 668; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(668));
      expect(source.totalCount()).assertEqual(668);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(667).reminderId), String(667));
      expect(source.getData(667).reminderId).assertEqual(667);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040008 end');
    })

    /**
     * @tc.name   testFlipClockVol2040009
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0009
     * @tc.desc   Verify source.totalCount() equals 669.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 669; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(669));
      expect(source.totalCount()).assertEqual(669);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(668).reminderId), String(668));
      expect(source.getData(668).reminderId).assertEqual(668);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040009 end');
    })

    /**
     * @tc.name   testFlipClockVol2040010
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0010
     * @tc.desc   Verify source.totalCount() equals 670.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 670; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(670));
      expect(source.totalCount()).assertEqual(670);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(669).reminderId), String(669));
      expect(source.getData(669).reminderId).assertEqual(669);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040010 end');
    })

    /**
     * @tc.name   testFlipClockVol2040011
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0011
     * @tc.desc   Verify source.totalCount() equals 671.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 671; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(671));
      expect(source.totalCount()).assertEqual(671);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(670).reminderId), String(670));
      expect(source.getData(670).reminderId).assertEqual(670);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040011 end');
    })

    /**
     * @tc.name   testFlipClockVol2040012
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0012
     * @tc.desc   Verify source.totalCount() equals 672.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 672; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(672));
      expect(source.totalCount()).assertEqual(672);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(671).reminderId), String(671));
      expect(source.getData(671).reminderId).assertEqual(671);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040012 end');
    })

    /**
     * @tc.name   testFlipClockVol2040013
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0013
     * @tc.desc   Verify source.totalCount() equals 673.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 673; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(673));
      expect(source.totalCount()).assertEqual(673);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(672).reminderId), String(672));
      expect(source.getData(672).reminderId).assertEqual(672);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040013 end');
    })

    /**
     * @tc.name   testFlipClockVol2040014
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0014
     * @tc.desc   Verify source.totalCount() equals 674.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 674; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(674));
      expect(source.totalCount()).assertEqual(674);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(673).reminderId), String(673));
      expect(source.getData(673).reminderId).assertEqual(673);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040014 end');
    })

    /**
     * @tc.name   testFlipClockVol2040015
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0015
     * @tc.desc   Verify source.totalCount() equals 675.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 675; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(675));
      expect(source.totalCount()).assertEqual(675);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(674).reminderId), String(674));
      expect(source.getData(674).reminderId).assertEqual(674);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040015 end');
    })

    /**
     * @tc.name   testFlipClockVol2040016
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0016
     * @tc.desc   Verify source.totalCount() equals 676.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 676; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(676));
      expect(source.totalCount()).assertEqual(676);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(675).reminderId), String(675));
      expect(source.getData(675).reminderId).assertEqual(675);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040016 end');
    })

    /**
     * @tc.name   testFlipClockVol2040017
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0017
     * @tc.desc   Verify source.totalCount() equals 677.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 677; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(677));
      expect(source.totalCount()).assertEqual(677);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(676).reminderId), String(676));
      expect(source.getData(676).reminderId).assertEqual(676);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040017 end');
    })

    /**
     * @tc.name   testFlipClockVol2040018
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0018
     * @tc.desc   Verify source.totalCount() equals 678.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 678; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(678));
      expect(source.totalCount()).assertEqual(678);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(677).reminderId), String(677));
      expect(source.getData(677).reminderId).assertEqual(677);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040018 end');
    })

    /**
     * @tc.name   testFlipClockVol2040019
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0019
     * @tc.desc   Verify source.totalCount() equals 679.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 679; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(679));
      expect(source.totalCount()).assertEqual(679);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(678).reminderId), String(678));
      expect(source.getData(678).reminderId).assertEqual(678);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040019 end');
    })

    /**
     * @tc.name   testFlipClockVol2040020
     * @tc.number SUB_FLIP_CLOCK_VOL2_04_0020
     * @tc.desc   Verify source.totalCount() equals 680.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2040020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 680; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(680));
      expect(source.totalCount()).assertEqual(680);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(679).reminderId), String(679));
      expect(source.getData(679).reminderId).assertEqual(679);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2040020 end');
    })
  })
}
