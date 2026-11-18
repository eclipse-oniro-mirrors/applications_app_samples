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

export default function flipClockVolumeContact23Test() {
  describe('FlipClockVolumeContact23Test', () => {

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact23_0001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0001
     * @tc.desc   Verify source.totalCount() equals 441.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact23_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 441; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(441));
      expect(source.totalCount()).assertEqual(441);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(440).reminderId), String(440));
      expect(source.getData(440).reminderId).assertEqual(440);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact23_0002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0002
     * @tc.desc   Verify source.totalCount() equals 442.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact23_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 442; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(442));
      expect(source.totalCount()).assertEqual(442);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(441).reminderId), String(441));
      expect(source.getData(441).reminderId).assertEqual(441);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact23_0003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0003
     * @tc.desc   Verify source.totalCount() equals 443.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact23_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 443; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(443));
      expect(source.totalCount()).assertEqual(443);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(442).reminderId), String(442));
      expect(source.getData(442).reminderId).assertEqual(442);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact23_0004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0004
     * @tc.desc   Verify source.totalCount() equals 444.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact23_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 444; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(444));
      expect(source.totalCount()).assertEqual(444);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(443).reminderId), String(443));
      expect(source.getData(443).reminderId).assertEqual(443);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact23_0005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0005
     * @tc.desc   Verify source.totalCount() equals 445.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact23_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 445; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(445));
      expect(source.totalCount()).assertEqual(445);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(444).reminderId), String(444));
      expect(source.getData(444).reminderId).assertEqual(444);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact23_0006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0006
     * @tc.desc   Verify source.totalCount() equals 446.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact23_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 446; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(446));
      expect(source.totalCount()).assertEqual(446);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(445).reminderId), String(445));
      expect(source.getData(445).reminderId).assertEqual(445);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact23_0007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0007
     * @tc.desc   Verify source.totalCount() equals 447.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact23_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 447; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(447));
      expect(source.totalCount()).assertEqual(447);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(446).reminderId), String(446));
      expect(source.getData(446).reminderId).assertEqual(446);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact23_0008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0008
     * @tc.desc   Verify source.totalCount() equals 448.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact23_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 448; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(448));
      expect(source.totalCount()).assertEqual(448);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(447).reminderId), String(447));
      expect(source.getData(447).reminderId).assertEqual(447);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0008 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact23_0009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0009
     * @tc.desc   Verify source.totalCount() equals 449.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact23_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 449; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(449));
      expect(source.totalCount()).assertEqual(449);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(448).reminderId), String(448));
      expect(source.getData(448).reminderId).assertEqual(448);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0009 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact23_0010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0010
     * @tc.desc   Verify source.totalCount() equals 450.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact23_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 450; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(450));
      expect(source.totalCount()).assertEqual(450);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(449).reminderId), String(449));
      expect(source.getData(449).reminderId).assertEqual(449);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0010 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact23_0011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0011
     * @tc.desc   Verify source.totalCount() equals 451.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact23_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 451; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(451));
      expect(source.totalCount()).assertEqual(451);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(450).reminderId), String(450));
      expect(source.getData(450).reminderId).assertEqual(450);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0011 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact23_0012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0012
     * @tc.desc   Verify source.totalCount() equals 452.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact23_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 452; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(452));
      expect(source.totalCount()).assertEqual(452);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(451).reminderId), String(451));
      expect(source.getData(451).reminderId).assertEqual(451);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0012 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact23_0013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0013
     * @tc.desc   Verify source.totalCount() equals 453.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact23_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 453; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(453));
      expect(source.totalCount()).assertEqual(453);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(452).reminderId), String(452));
      expect(source.getData(452).reminderId).assertEqual(452);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0013 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact23_0014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0014
     * @tc.desc   Verify source.totalCount() equals 454.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact23_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 454; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(454));
      expect(source.totalCount()).assertEqual(454);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(453).reminderId), String(453));
      expect(source.getData(453).reminderId).assertEqual(453);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0014 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact23_0015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0015
     * @tc.desc   Verify source.totalCount() equals 455.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact23_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 455; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(455));
      expect(source.totalCount()).assertEqual(455);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(454).reminderId), String(454));
      expect(source.getData(454).reminderId).assertEqual(454);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0015 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact23_0016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0016
     * @tc.desc   Verify source.totalCount() equals 456.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact23_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 456; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(456));
      expect(source.totalCount()).assertEqual(456);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(455).reminderId), String(455));
      expect(source.getData(455).reminderId).assertEqual(455);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0016 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact23_0017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0017
     * @tc.desc   Verify source.totalCount() equals 457.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact23_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 457; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(457));
      expect(source.totalCount()).assertEqual(457);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(456).reminderId), String(456));
      expect(source.getData(456).reminderId).assertEqual(456);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0017 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact23_0018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0018
     * @tc.desc   Verify source.totalCount() equals 458.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact23_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 458; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(458));
      expect(source.totalCount()).assertEqual(458);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(457).reminderId), String(457));
      expect(source.getData(457).reminderId).assertEqual(457);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0018 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact23_0019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0019
     * @tc.desc   Verify source.totalCount() equals 459.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact23_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 459; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(459));
      expect(source.totalCount()).assertEqual(459);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(458).reminderId), String(458));
      expect(source.getData(458).reminderId).assertEqual(458);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0019 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact23_0020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_23_0020
     * @tc.desc   Verify source.totalCount() equals 460.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact23_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 460; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(460));
      expect(source.totalCount()).assertEqual(460);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(459).reminderId), String(459));
      expect(source.getData(459).reminderId).assertEqual(459);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact23_0020 end');
    })
  })
}
