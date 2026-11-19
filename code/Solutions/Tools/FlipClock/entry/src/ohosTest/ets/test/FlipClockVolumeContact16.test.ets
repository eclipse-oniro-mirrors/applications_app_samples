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

export default function flipClockVolumeContact16Test() {
  describe('FlipClockVolumeContact16Test', () => {

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact16_0001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0001
     * @tc.desc   Verify source.totalCount() equals 301.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact16_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 301; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(301));
      expect(source.totalCount()).assertEqual(301);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(300).reminderId), String(300));
      expect(source.getData(300).reminderId).assertEqual(300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact16_0002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0002
     * @tc.desc   Verify source.totalCount() equals 302.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact16_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 302; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(302));
      expect(source.totalCount()).assertEqual(302);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(301).reminderId), String(301));
      expect(source.getData(301).reminderId).assertEqual(301);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact16_0003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0003
     * @tc.desc   Verify source.totalCount() equals 303.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact16_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 303; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(303));
      expect(source.totalCount()).assertEqual(303);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(302).reminderId), String(302));
      expect(source.getData(302).reminderId).assertEqual(302);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact16_0004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0004
     * @tc.desc   Verify source.totalCount() equals 304.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact16_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 304; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(304));
      expect(source.totalCount()).assertEqual(304);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(303).reminderId), String(303));
      expect(source.getData(303).reminderId).assertEqual(303);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact16_0005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0005
     * @tc.desc   Verify source.totalCount() equals 305.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact16_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 305; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(305));
      expect(source.totalCount()).assertEqual(305);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(304).reminderId), String(304));
      expect(source.getData(304).reminderId).assertEqual(304);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact16_0006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0006
     * @tc.desc   Verify source.totalCount() equals 306.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact16_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 306; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(306));
      expect(source.totalCount()).assertEqual(306);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(305).reminderId), String(305));
      expect(source.getData(305).reminderId).assertEqual(305);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact16_0007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0007
     * @tc.desc   Verify source.totalCount() equals 307.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact16_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 307; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(307));
      expect(source.totalCount()).assertEqual(307);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(306).reminderId), String(306));
      expect(source.getData(306).reminderId).assertEqual(306);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact16_0008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0008
     * @tc.desc   Verify source.totalCount() equals 308.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact16_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 308; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(308));
      expect(source.totalCount()).assertEqual(308);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(307).reminderId), String(307));
      expect(source.getData(307).reminderId).assertEqual(307);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0008 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact16_0009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0009
     * @tc.desc   Verify source.totalCount() equals 309.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact16_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 309; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(309));
      expect(source.totalCount()).assertEqual(309);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(308).reminderId), String(308));
      expect(source.getData(308).reminderId).assertEqual(308);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0009 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact16_0010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0010
     * @tc.desc   Verify source.totalCount() equals 310.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact16_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 310; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(310));
      expect(source.totalCount()).assertEqual(310);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(309).reminderId), String(309));
      expect(source.getData(309).reminderId).assertEqual(309);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0010 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact16_0011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0011
     * @tc.desc   Verify source.totalCount() equals 311.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact16_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 311; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(311));
      expect(source.totalCount()).assertEqual(311);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(310).reminderId), String(310));
      expect(source.getData(310).reminderId).assertEqual(310);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0011 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact16_0012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0012
     * @tc.desc   Verify source.totalCount() equals 312.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact16_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 312; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(312));
      expect(source.totalCount()).assertEqual(312);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(311).reminderId), String(311));
      expect(source.getData(311).reminderId).assertEqual(311);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0012 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact16_0013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0013
     * @tc.desc   Verify source.totalCount() equals 313.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact16_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 313; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(313));
      expect(source.totalCount()).assertEqual(313);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(312).reminderId), String(312));
      expect(source.getData(312).reminderId).assertEqual(312);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0013 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact16_0014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0014
     * @tc.desc   Verify source.totalCount() equals 314.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact16_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 314; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(314));
      expect(source.totalCount()).assertEqual(314);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(313).reminderId), String(313));
      expect(source.getData(313).reminderId).assertEqual(313);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0014 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact16_0015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0015
     * @tc.desc   Verify source.totalCount() equals 315.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact16_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 315; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(315));
      expect(source.totalCount()).assertEqual(315);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(314).reminderId), String(314));
      expect(source.getData(314).reminderId).assertEqual(314);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0015 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact16_0016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0016
     * @tc.desc   Verify source.totalCount() equals 316.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact16_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 316; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(316));
      expect(source.totalCount()).assertEqual(316);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(315).reminderId), String(315));
      expect(source.getData(315).reminderId).assertEqual(315);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0016 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact16_0017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0017
     * @tc.desc   Verify source.totalCount() equals 317.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact16_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 317; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(317));
      expect(source.totalCount()).assertEqual(317);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(316).reminderId), String(316));
      expect(source.getData(316).reminderId).assertEqual(316);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0017 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact16_0018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0018
     * @tc.desc   Verify source.totalCount() equals 318.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact16_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 318; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(318));
      expect(source.totalCount()).assertEqual(318);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(317).reminderId), String(317));
      expect(source.getData(317).reminderId).assertEqual(317);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0018 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact16_0019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0019
     * @tc.desc   Verify source.totalCount() equals 319.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact16_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 319; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(319));
      expect(source.totalCount()).assertEqual(319);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(318).reminderId), String(318));
      expect(source.getData(318).reminderId).assertEqual(318);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0019 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact16_0020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_16_0020
     * @tc.desc   Verify source.totalCount() equals 320.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact16_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 320; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(320));
      expect(source.totalCount()).assertEqual(320);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(319).reminderId), String(319));
      expect(source.getData(319).reminderId).assertEqual(319);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact16_0020 end');
    })
  })
}
