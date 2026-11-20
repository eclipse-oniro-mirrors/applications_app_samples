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

export default function flipClockVolumeContact30Test() {
  describe('FlipClockVolumeContact30Test', () => {

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact30_0001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_30_0001
     * @tc.desc   Verify source.totalCount() equals 581.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact30_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 581; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(581));
      expect(source.totalCount()).assertEqual(581);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(580).reminderId), String(580));
      expect(source.getData(580).reminderId).assertEqual(580);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact30_0002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_30_0002
     * @tc.desc   Verify source.totalCount() equals 582.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact30_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 582; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(582));
      expect(source.totalCount()).assertEqual(582);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(581).reminderId), String(581));
      expect(source.getData(581).reminderId).assertEqual(581);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact30_0003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_30_0003
     * @tc.desc   Verify source.totalCount() equals 583.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact30_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 583; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(583));
      expect(source.totalCount()).assertEqual(583);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(582).reminderId), String(582));
      expect(source.getData(582).reminderId).assertEqual(582);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact30_0004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_30_0004
     * @tc.desc   Verify source.totalCount() equals 584.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact30_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 584; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(584));
      expect(source.totalCount()).assertEqual(584);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(583).reminderId), String(583));
      expect(source.getData(583).reminderId).assertEqual(583);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact30_0005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_30_0005
     * @tc.desc   Verify source.totalCount() equals 585.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact30_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 585; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(585));
      expect(source.totalCount()).assertEqual(585);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(584).reminderId), String(584));
      expect(source.getData(584).reminderId).assertEqual(584);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact30_0006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_30_0006
     * @tc.desc   Verify source.totalCount() equals 586.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact30_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 586; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(586));
      expect(source.totalCount()).assertEqual(586);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(585).reminderId), String(585));
      expect(source.getData(585).reminderId).assertEqual(585);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact30_0007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_30_0007
     * @tc.desc   Verify source.totalCount() equals 587.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact30_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 587; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(587));
      expect(source.totalCount()).assertEqual(587);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(586).reminderId), String(586));
      expect(source.getData(586).reminderId).assertEqual(586);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact30_0008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_30_0008
     * @tc.desc   Verify source.totalCount() equals 588.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact30_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 588; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(588));
      expect(source.totalCount()).assertEqual(588);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(587).reminderId), String(587));
      expect(source.getData(587).reminderId).assertEqual(587);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0008 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact30_0009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_30_0009
     * @tc.desc   Verify source.totalCount() equals 589.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact30_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 589; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(589));
      expect(source.totalCount()).assertEqual(589);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(588).reminderId), String(588));
      expect(source.getData(588).reminderId).assertEqual(588);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0009 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact30_0010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_30_0010
     * @tc.desc   Verify source.totalCount() equals 590.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact30_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 590; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(590));
      expect(source.totalCount()).assertEqual(590);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(589).reminderId), String(589));
      expect(source.getData(589).reminderId).assertEqual(589);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0010 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact30_0011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_30_0011
     * @tc.desc   Verify source.totalCount() equals 591.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact30_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 591; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(591));
      expect(source.totalCount()).assertEqual(591);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(590).reminderId), String(590));
      expect(source.getData(590).reminderId).assertEqual(590);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0011 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact30_0012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_30_0012
     * @tc.desc   Verify source.totalCount() equals 592.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact30_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 592; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(592));
      expect(source.totalCount()).assertEqual(592);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(591).reminderId), String(591));
      expect(source.getData(591).reminderId).assertEqual(591);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0012 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact30_0013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_30_0013
     * @tc.desc   Verify source.totalCount() equals 593.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact30_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 593; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(593));
      expect(source.totalCount()).assertEqual(593);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(592).reminderId), String(592));
      expect(source.getData(592).reminderId).assertEqual(592);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0013 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact30_0014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_30_0014
     * @tc.desc   Verify source.totalCount() equals 594.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact30_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 594; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(594));
      expect(source.totalCount()).assertEqual(594);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(593).reminderId), String(593));
      expect(source.getData(593).reminderId).assertEqual(593);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0014 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact30_0015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_30_0015
     * @tc.desc   Verify source.totalCount() equals 595.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact30_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 595; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(595));
      expect(source.totalCount()).assertEqual(595);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(594).reminderId), String(594));
      expect(source.getData(594).reminderId).assertEqual(594);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0015 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact30_0016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_30_0016
     * @tc.desc   Verify source.totalCount() equals 596.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact30_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 596; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(596));
      expect(source.totalCount()).assertEqual(596);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(595).reminderId), String(595));
      expect(source.getData(595).reminderId).assertEqual(595);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0016 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact30_0017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_30_0017
     * @tc.desc   Verify source.totalCount() equals 597.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact30_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 597; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(597));
      expect(source.totalCount()).assertEqual(597);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(596).reminderId), String(596));
      expect(source.getData(596).reminderId).assertEqual(596);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0017 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact30_0018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_30_0018
     * @tc.desc   Verify source.totalCount() equals 598.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact30_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 598; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(598));
      expect(source.totalCount()).assertEqual(598);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(597).reminderId), String(597));
      expect(source.getData(597).reminderId).assertEqual(597);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0018 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact30_0019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_30_0019
     * @tc.desc   Verify source.totalCount() equals 599.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact30_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 599; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(599));
      expect(source.totalCount()).assertEqual(599);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(598).reminderId), String(598));
      expect(source.getData(598).reminderId).assertEqual(598);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0019 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact30_0020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_30_0020
     * @tc.desc   Verify source.totalCount() equals 600.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact30_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 600; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(600));
      expect(source.totalCount()).assertEqual(600);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(599).reminderId), String(599));
      expect(source.getData(599).reminderId).assertEqual(599);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact30_0020 end');
    })
  })
}
