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

export default function flipClockVolume2Contact08Test() {
  describe('FlipClockVolume2Contact08Test', () => {

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact08_0001
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0001
     * @tc.desc   Verify source.totalCount() equals 741.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact08_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 741; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(741));
      expect(source.totalCount()).assertEqual(741);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(740).reminderId), String(740));
      expect(source.getData(740).reminderId).assertEqual(740);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact08_0002
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0002
     * @tc.desc   Verify source.totalCount() equals 742.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact08_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 742; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(742));
      expect(source.totalCount()).assertEqual(742);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(741).reminderId), String(741));
      expect(source.getData(741).reminderId).assertEqual(741);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact08_0003
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0003
     * @tc.desc   Verify source.totalCount() equals 743.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact08_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 743; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(743));
      expect(source.totalCount()).assertEqual(743);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(742).reminderId), String(742));
      expect(source.getData(742).reminderId).assertEqual(742);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact08_0004
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0004
     * @tc.desc   Verify source.totalCount() equals 744.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact08_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 744; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(744));
      expect(source.totalCount()).assertEqual(744);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(743).reminderId), String(743));
      expect(source.getData(743).reminderId).assertEqual(743);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact08_0005
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0005
     * @tc.desc   Verify source.totalCount() equals 745.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact08_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 745; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(745));
      expect(source.totalCount()).assertEqual(745);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(744).reminderId), String(744));
      expect(source.getData(744).reminderId).assertEqual(744);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact08_0006
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0006
     * @tc.desc   Verify source.totalCount() equals 746.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact08_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 746; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(746));
      expect(source.totalCount()).assertEqual(746);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(745).reminderId), String(745));
      expect(source.getData(745).reminderId).assertEqual(745);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact08_0007
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0007
     * @tc.desc   Verify source.totalCount() equals 747.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact08_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 747; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(747));
      expect(source.totalCount()).assertEqual(747);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(746).reminderId), String(746));
      expect(source.getData(746).reminderId).assertEqual(746);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact08_0008
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0008
     * @tc.desc   Verify source.totalCount() equals 748.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact08_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 748; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(748));
      expect(source.totalCount()).assertEqual(748);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(747).reminderId), String(747));
      expect(source.getData(747).reminderId).assertEqual(747);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0008 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact08_0009
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0009
     * @tc.desc   Verify source.totalCount() equals 749.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact08_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 749; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(749));
      expect(source.totalCount()).assertEqual(749);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(748).reminderId), String(748));
      expect(source.getData(748).reminderId).assertEqual(748);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0009 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact08_0010
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0010
     * @tc.desc   Verify source.totalCount() equals 750.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact08_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 750; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(750));
      expect(source.totalCount()).assertEqual(750);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(749).reminderId), String(749));
      expect(source.getData(749).reminderId).assertEqual(749);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0010 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact08_0011
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0011
     * @tc.desc   Verify source.totalCount() equals 751.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact08_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 751; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(751));
      expect(source.totalCount()).assertEqual(751);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(750).reminderId), String(750));
      expect(source.getData(750).reminderId).assertEqual(750);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0011 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact08_0012
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0012
     * @tc.desc   Verify source.totalCount() equals 752.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact08_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 752; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(752));
      expect(source.totalCount()).assertEqual(752);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(751).reminderId), String(751));
      expect(source.getData(751).reminderId).assertEqual(751);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0012 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact08_0013
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0013
     * @tc.desc   Verify source.totalCount() equals 753.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact08_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 753; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(753));
      expect(source.totalCount()).assertEqual(753);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(752).reminderId), String(752));
      expect(source.getData(752).reminderId).assertEqual(752);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0013 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact08_0014
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0014
     * @tc.desc   Verify source.totalCount() equals 754.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact08_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 754; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(754));
      expect(source.totalCount()).assertEqual(754);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(753).reminderId), String(753));
      expect(source.getData(753).reminderId).assertEqual(753);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0014 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact08_0015
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0015
     * @tc.desc   Verify source.totalCount() equals 755.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact08_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 755; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(755));
      expect(source.totalCount()).assertEqual(755);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(754).reminderId), String(754));
      expect(source.getData(754).reminderId).assertEqual(754);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0015 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact08_0016
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0016
     * @tc.desc   Verify source.totalCount() equals 756.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact08_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 756; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(756));
      expect(source.totalCount()).assertEqual(756);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(755).reminderId), String(755));
      expect(source.getData(755).reminderId).assertEqual(755);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0016 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact08_0017
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0017
     * @tc.desc   Verify source.totalCount() equals 757.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact08_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 757; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(757));
      expect(source.totalCount()).assertEqual(757);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(756).reminderId), String(756));
      expect(source.getData(756).reminderId).assertEqual(756);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0017 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact08_0018
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0018
     * @tc.desc   Verify source.totalCount() equals 758.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact08_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 758; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(758));
      expect(source.totalCount()).assertEqual(758);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(757).reminderId), String(757));
      expect(source.getData(757).reminderId).assertEqual(757);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0018 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact08_0019
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0019
     * @tc.desc   Verify source.totalCount() equals 759.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact08_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 759; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(759));
      expect(source.totalCount()).assertEqual(759);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(758).reminderId), String(758));
      expect(source.getData(758).reminderId).assertEqual(758);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0019 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact08_0020
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0020
     * @tc.desc   Verify source.totalCount() equals 760.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact08_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 760; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(760));
      expect(source.totalCount()).assertEqual(760);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(759).reminderId), String(759));
      expect(source.getData(759).reminderId).assertEqual(759);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact08_0020 end');
    })
  })
}
