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

export default function flipClockVolumeContact14Test() {
  describe('FlipClockVolumeContact14Test', () => {

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact14_0001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0001
     * @tc.desc   Verify source.totalCount() equals 261.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact14_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 261; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(261));
      expect(source.totalCount()).assertEqual(261);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(260).reminderId), String(260));
      expect(source.getData(260).reminderId).assertEqual(260);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact14_0002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0002
     * @tc.desc   Verify source.totalCount() equals 262.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact14_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 262; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(262));
      expect(source.totalCount()).assertEqual(262);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(261).reminderId), String(261));
      expect(source.getData(261).reminderId).assertEqual(261);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact14_0003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0003
     * @tc.desc   Verify source.totalCount() equals 263.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact14_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 263; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(263));
      expect(source.totalCount()).assertEqual(263);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(262).reminderId), String(262));
      expect(source.getData(262).reminderId).assertEqual(262);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact14_0004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0004
     * @tc.desc   Verify source.totalCount() equals 264.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact14_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 264; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(264));
      expect(source.totalCount()).assertEqual(264);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(263).reminderId), String(263));
      expect(source.getData(263).reminderId).assertEqual(263);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact14_0005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0005
     * @tc.desc   Verify source.totalCount() equals 265.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact14_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 265; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(265));
      expect(source.totalCount()).assertEqual(265);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(264).reminderId), String(264));
      expect(source.getData(264).reminderId).assertEqual(264);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact14_0006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0006
     * @tc.desc   Verify source.totalCount() equals 266.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact14_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 266; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(266));
      expect(source.totalCount()).assertEqual(266);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(265).reminderId), String(265));
      expect(source.getData(265).reminderId).assertEqual(265);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact14_0007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0007
     * @tc.desc   Verify source.totalCount() equals 267.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact14_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 267; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(267));
      expect(source.totalCount()).assertEqual(267);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(266).reminderId), String(266));
      expect(source.getData(266).reminderId).assertEqual(266);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact14_0008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0008
     * @tc.desc   Verify source.totalCount() equals 268.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact14_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 268; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(268));
      expect(source.totalCount()).assertEqual(268);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(267).reminderId), String(267));
      expect(source.getData(267).reminderId).assertEqual(267);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0008 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact14_0009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0009
     * @tc.desc   Verify source.totalCount() equals 269.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact14_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 269; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(269));
      expect(source.totalCount()).assertEqual(269);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(268).reminderId), String(268));
      expect(source.getData(268).reminderId).assertEqual(268);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0009 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact14_0010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0010
     * @tc.desc   Verify source.totalCount() equals 270.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact14_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 270; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(270));
      expect(source.totalCount()).assertEqual(270);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(269).reminderId), String(269));
      expect(source.getData(269).reminderId).assertEqual(269);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0010 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact14_0011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0011
     * @tc.desc   Verify source.totalCount() equals 271.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact14_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 271; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(271));
      expect(source.totalCount()).assertEqual(271);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(270).reminderId), String(270));
      expect(source.getData(270).reminderId).assertEqual(270);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0011 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact14_0012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0012
     * @tc.desc   Verify source.totalCount() equals 272.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact14_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 272; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(272));
      expect(source.totalCount()).assertEqual(272);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(271).reminderId), String(271));
      expect(source.getData(271).reminderId).assertEqual(271);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0012 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact14_0013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0013
     * @tc.desc   Verify source.totalCount() equals 273.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact14_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 273; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(273));
      expect(source.totalCount()).assertEqual(273);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(272).reminderId), String(272));
      expect(source.getData(272).reminderId).assertEqual(272);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0013 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact14_0014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0014
     * @tc.desc   Verify source.totalCount() equals 274.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact14_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 274; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(274));
      expect(source.totalCount()).assertEqual(274);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(273).reminderId), String(273));
      expect(source.getData(273).reminderId).assertEqual(273);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0014 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact14_0015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0015
     * @tc.desc   Verify source.totalCount() equals 275.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact14_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 275; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(275));
      expect(source.totalCount()).assertEqual(275);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(274).reminderId), String(274));
      expect(source.getData(274).reminderId).assertEqual(274);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0015 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact14_0016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0016
     * @tc.desc   Verify source.totalCount() equals 276.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact14_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 276; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(276));
      expect(source.totalCount()).assertEqual(276);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(275).reminderId), String(275));
      expect(source.getData(275).reminderId).assertEqual(275);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0016 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact14_0017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0017
     * @tc.desc   Verify source.totalCount() equals 277.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact14_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 277; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(277));
      expect(source.totalCount()).assertEqual(277);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(276).reminderId), String(276));
      expect(source.getData(276).reminderId).assertEqual(276);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0017 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact14_0018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0018
     * @tc.desc   Verify source.totalCount() equals 278.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact14_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 278; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(278));
      expect(source.totalCount()).assertEqual(278);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(277).reminderId), String(277));
      expect(source.getData(277).reminderId).assertEqual(277);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0018 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact14_0019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0019
     * @tc.desc   Verify source.totalCount() equals 279.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact14_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 279; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(279));
      expect(source.totalCount()).assertEqual(279);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(278).reminderId), String(278));
      expect(source.getData(278).reminderId).assertEqual(278);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0019 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact14_0020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_14_0020
     * @tc.desc   Verify source.totalCount() equals 280.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact14_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 280; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(280));
      expect(source.totalCount()).assertEqual(280);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(279).reminderId), String(279));
      expect(source.getData(279).reminderId).assertEqual(279);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact14_0020 end');
    })
  })
}
