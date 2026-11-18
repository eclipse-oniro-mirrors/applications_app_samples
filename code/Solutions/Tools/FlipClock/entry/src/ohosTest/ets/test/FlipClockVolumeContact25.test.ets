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

export default function flipClockVolumeContact25Test() {
  describe('FlipClockVolumeContact25Test', () => {

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact25_0001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0001
     * @tc.desc   Verify source.totalCount() equals 481.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact25_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 481; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(481));
      expect(source.totalCount()).assertEqual(481);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(480).reminderId), String(480));
      expect(source.getData(480).reminderId).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact25_0002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0002
     * @tc.desc   Verify source.totalCount() equals 482.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact25_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 482; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(482));
      expect(source.totalCount()).assertEqual(482);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(481).reminderId), String(481));
      expect(source.getData(481).reminderId).assertEqual(481);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact25_0003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0003
     * @tc.desc   Verify source.totalCount() equals 483.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact25_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 483; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(483));
      expect(source.totalCount()).assertEqual(483);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(482).reminderId), String(482));
      expect(source.getData(482).reminderId).assertEqual(482);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact25_0004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0004
     * @tc.desc   Verify source.totalCount() equals 484.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact25_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 484; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(484));
      expect(source.totalCount()).assertEqual(484);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(483).reminderId), String(483));
      expect(source.getData(483).reminderId).assertEqual(483);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact25_0005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0005
     * @tc.desc   Verify source.totalCount() equals 485.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact25_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 485; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(485));
      expect(source.totalCount()).assertEqual(485);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(484).reminderId), String(484));
      expect(source.getData(484).reminderId).assertEqual(484);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact25_0006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0006
     * @tc.desc   Verify source.totalCount() equals 486.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact25_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 486; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(486));
      expect(source.totalCount()).assertEqual(486);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(485).reminderId), String(485));
      expect(source.getData(485).reminderId).assertEqual(485);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact25_0007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0007
     * @tc.desc   Verify source.totalCount() equals 487.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact25_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 487; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(487));
      expect(source.totalCount()).assertEqual(487);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(486).reminderId), String(486));
      expect(source.getData(486).reminderId).assertEqual(486);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact25_0008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0008
     * @tc.desc   Verify source.totalCount() equals 488.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact25_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 488; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(488));
      expect(source.totalCount()).assertEqual(488);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(487).reminderId), String(487));
      expect(source.getData(487).reminderId).assertEqual(487);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0008 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact25_0009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0009
     * @tc.desc   Verify source.totalCount() equals 489.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact25_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 489; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(489));
      expect(source.totalCount()).assertEqual(489);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(488).reminderId), String(488));
      expect(source.getData(488).reminderId).assertEqual(488);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0009 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact25_0010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0010
     * @tc.desc   Verify source.totalCount() equals 490.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact25_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 490; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(490));
      expect(source.totalCount()).assertEqual(490);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(489).reminderId), String(489));
      expect(source.getData(489).reminderId).assertEqual(489);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0010 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact25_0011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0011
     * @tc.desc   Verify source.totalCount() equals 491.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact25_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 491; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(491));
      expect(source.totalCount()).assertEqual(491);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(490).reminderId), String(490));
      expect(source.getData(490).reminderId).assertEqual(490);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0011 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact25_0012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0012
     * @tc.desc   Verify source.totalCount() equals 492.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact25_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 492; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(492));
      expect(source.totalCount()).assertEqual(492);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(491).reminderId), String(491));
      expect(source.getData(491).reminderId).assertEqual(491);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0012 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact25_0013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0013
     * @tc.desc   Verify source.totalCount() equals 493.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact25_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 493; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(493));
      expect(source.totalCount()).assertEqual(493);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(492).reminderId), String(492));
      expect(source.getData(492).reminderId).assertEqual(492);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0013 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact25_0014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0014
     * @tc.desc   Verify source.totalCount() equals 494.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact25_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 494; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(494));
      expect(source.totalCount()).assertEqual(494);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(493).reminderId), String(493));
      expect(source.getData(493).reminderId).assertEqual(493);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0014 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact25_0015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0015
     * @tc.desc   Verify source.totalCount() equals 495.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact25_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 495; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(495));
      expect(source.totalCount()).assertEqual(495);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(494).reminderId), String(494));
      expect(source.getData(494).reminderId).assertEqual(494);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0015 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact25_0016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0016
     * @tc.desc   Verify source.totalCount() equals 496.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact25_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 496; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(496));
      expect(source.totalCount()).assertEqual(496);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(495).reminderId), String(495));
      expect(source.getData(495).reminderId).assertEqual(495);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0016 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact25_0017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0017
     * @tc.desc   Verify source.totalCount() equals 497.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact25_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 497; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(497));
      expect(source.totalCount()).assertEqual(497);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(496).reminderId), String(496));
      expect(source.getData(496).reminderId).assertEqual(496);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0017 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact25_0018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0018
     * @tc.desc   Verify source.totalCount() equals 498.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact25_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 498; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(498));
      expect(source.totalCount()).assertEqual(498);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(497).reminderId), String(497));
      expect(source.getData(497).reminderId).assertEqual(497);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0018 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact25_0019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0019
     * @tc.desc   Verify source.totalCount() equals 499.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact25_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 499; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(499));
      expect(source.totalCount()).assertEqual(499);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(498).reminderId), String(498));
      expect(source.getData(498).reminderId).assertEqual(498);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0019 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact25_0020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_25_0020
     * @tc.desc   Verify source.totalCount() equals 500.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact25_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 500; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(500));
      expect(source.totalCount()).assertEqual(500);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(499).reminderId), String(499));
      expect(source.getData(499).reminderId).assertEqual(499);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact25_0020 end');
    })
  })
}
