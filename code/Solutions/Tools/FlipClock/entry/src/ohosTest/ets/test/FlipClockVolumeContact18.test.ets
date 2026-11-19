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

export default function flipClockVolumeContact18Test() {
  describe('FlipClockVolumeContact18Test', () => {

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact18_0001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0001
     * @tc.desc   Verify source.totalCount() equals 341.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact18_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 341; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(341));
      expect(source.totalCount()).assertEqual(341);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(340).reminderId), String(340));
      expect(source.getData(340).reminderId).assertEqual(340);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact18_0002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0002
     * @tc.desc   Verify source.totalCount() equals 342.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact18_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 342; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(342));
      expect(source.totalCount()).assertEqual(342);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(341).reminderId), String(341));
      expect(source.getData(341).reminderId).assertEqual(341);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact18_0003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0003
     * @tc.desc   Verify source.totalCount() equals 343.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact18_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 343; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(343));
      expect(source.totalCount()).assertEqual(343);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(342).reminderId), String(342));
      expect(source.getData(342).reminderId).assertEqual(342);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact18_0004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0004
     * @tc.desc   Verify source.totalCount() equals 344.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact18_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 344; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(344));
      expect(source.totalCount()).assertEqual(344);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(343).reminderId), String(343));
      expect(source.getData(343).reminderId).assertEqual(343);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact18_0005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0005
     * @tc.desc   Verify source.totalCount() equals 345.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact18_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 345; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(345));
      expect(source.totalCount()).assertEqual(345);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(344).reminderId), String(344));
      expect(source.getData(344).reminderId).assertEqual(344);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact18_0006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0006
     * @tc.desc   Verify source.totalCount() equals 346.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact18_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 346; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(346));
      expect(source.totalCount()).assertEqual(346);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(345).reminderId), String(345));
      expect(source.getData(345).reminderId).assertEqual(345);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact18_0007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0007
     * @tc.desc   Verify source.totalCount() equals 347.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact18_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 347; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(347));
      expect(source.totalCount()).assertEqual(347);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(346).reminderId), String(346));
      expect(source.getData(346).reminderId).assertEqual(346);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact18_0008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0008
     * @tc.desc   Verify source.totalCount() equals 348.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact18_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 348; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(348));
      expect(source.totalCount()).assertEqual(348);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(347).reminderId), String(347));
      expect(source.getData(347).reminderId).assertEqual(347);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0008 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact18_0009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0009
     * @tc.desc   Verify source.totalCount() equals 349.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact18_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 349; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(349));
      expect(source.totalCount()).assertEqual(349);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(348).reminderId), String(348));
      expect(source.getData(348).reminderId).assertEqual(348);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0009 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact18_0010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0010
     * @tc.desc   Verify source.totalCount() equals 350.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact18_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 350; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(350));
      expect(source.totalCount()).assertEqual(350);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(349).reminderId), String(349));
      expect(source.getData(349).reminderId).assertEqual(349);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0010 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact18_0011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0011
     * @tc.desc   Verify source.totalCount() equals 351.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact18_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 351; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(351));
      expect(source.totalCount()).assertEqual(351);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(350).reminderId), String(350));
      expect(source.getData(350).reminderId).assertEqual(350);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0011 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact18_0012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0012
     * @tc.desc   Verify source.totalCount() equals 352.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact18_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 352; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(352));
      expect(source.totalCount()).assertEqual(352);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(351).reminderId), String(351));
      expect(source.getData(351).reminderId).assertEqual(351);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0012 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact18_0013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0013
     * @tc.desc   Verify source.totalCount() equals 353.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact18_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 353; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(353));
      expect(source.totalCount()).assertEqual(353);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(352).reminderId), String(352));
      expect(source.getData(352).reminderId).assertEqual(352);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0013 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact18_0014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0014
     * @tc.desc   Verify source.totalCount() equals 354.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact18_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 354; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(354));
      expect(source.totalCount()).assertEqual(354);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(353).reminderId), String(353));
      expect(source.getData(353).reminderId).assertEqual(353);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0014 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact18_0015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0015
     * @tc.desc   Verify source.totalCount() equals 355.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact18_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 355; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(355));
      expect(source.totalCount()).assertEqual(355);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(354).reminderId), String(354));
      expect(source.getData(354).reminderId).assertEqual(354);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0015 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact18_0016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0016
     * @tc.desc   Verify source.totalCount() equals 356.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact18_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 356; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(356));
      expect(source.totalCount()).assertEqual(356);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(355).reminderId), String(355));
      expect(source.getData(355).reminderId).assertEqual(355);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0016 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact18_0017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0017
     * @tc.desc   Verify source.totalCount() equals 357.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact18_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 357; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(357));
      expect(source.totalCount()).assertEqual(357);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(356).reminderId), String(356));
      expect(source.getData(356).reminderId).assertEqual(356);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0017 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact18_0018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0018
     * @tc.desc   Verify source.totalCount() equals 358.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact18_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 358; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(358));
      expect(source.totalCount()).assertEqual(358);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(357).reminderId), String(357));
      expect(source.getData(357).reminderId).assertEqual(357);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0018 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact18_0019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0019
     * @tc.desc   Verify source.totalCount() equals 359.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact18_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 359; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(359));
      expect(source.totalCount()).assertEqual(359);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(358).reminderId), String(358));
      expect(source.getData(358).reminderId).assertEqual(358);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0019 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact18_0020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_18_0020
     * @tc.desc   Verify source.totalCount() equals 360.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact18_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 360; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(360));
      expect(source.totalCount()).assertEqual(360);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(359).reminderId), String(359));
      expect(source.getData(359).reminderId).assertEqual(359);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact18_0020 end');
    })
  })
}
