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

export default function flipClockVolumeContact13Test() {
  describe('FlipClockVolumeContact13Test', () => {

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact13_0001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0001
     * @tc.desc   Verify source.totalCount() equals 241.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact13_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 241; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(241));
      expect(source.totalCount()).assertEqual(241);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(240).reminderId), String(240));
      expect(source.getData(240).reminderId).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact13_0002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0002
     * @tc.desc   Verify source.totalCount() equals 242.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact13_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 242; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(242));
      expect(source.totalCount()).assertEqual(242);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(241).reminderId), String(241));
      expect(source.getData(241).reminderId).assertEqual(241);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact13_0003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0003
     * @tc.desc   Verify source.totalCount() equals 243.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact13_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 243; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(243));
      expect(source.totalCount()).assertEqual(243);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(242).reminderId), String(242));
      expect(source.getData(242).reminderId).assertEqual(242);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact13_0004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0004
     * @tc.desc   Verify source.totalCount() equals 244.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact13_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 244; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(244));
      expect(source.totalCount()).assertEqual(244);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(243).reminderId), String(243));
      expect(source.getData(243).reminderId).assertEqual(243);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact13_0005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0005
     * @tc.desc   Verify source.totalCount() equals 245.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact13_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 245; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(245));
      expect(source.totalCount()).assertEqual(245);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(244).reminderId), String(244));
      expect(source.getData(244).reminderId).assertEqual(244);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact13_0006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0006
     * @tc.desc   Verify source.totalCount() equals 246.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact13_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 246; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(246));
      expect(source.totalCount()).assertEqual(246);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(245).reminderId), String(245));
      expect(source.getData(245).reminderId).assertEqual(245);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact13_0007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0007
     * @tc.desc   Verify source.totalCount() equals 247.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact13_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 247; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(247));
      expect(source.totalCount()).assertEqual(247);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(246).reminderId), String(246));
      expect(source.getData(246).reminderId).assertEqual(246);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact13_0008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0008
     * @tc.desc   Verify source.totalCount() equals 248.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact13_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 248; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(248));
      expect(source.totalCount()).assertEqual(248);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(247).reminderId), String(247));
      expect(source.getData(247).reminderId).assertEqual(247);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0008 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact13_0009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0009
     * @tc.desc   Verify source.totalCount() equals 249.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact13_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 249; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(249));
      expect(source.totalCount()).assertEqual(249);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(248).reminderId), String(248));
      expect(source.getData(248).reminderId).assertEqual(248);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0009 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact13_0010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0010
     * @tc.desc   Verify source.totalCount() equals 250.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact13_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 250; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(250));
      expect(source.totalCount()).assertEqual(250);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(249).reminderId), String(249));
      expect(source.getData(249).reminderId).assertEqual(249);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0010 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact13_0011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0011
     * @tc.desc   Verify source.totalCount() equals 251.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact13_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 251; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(251));
      expect(source.totalCount()).assertEqual(251);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(250).reminderId), String(250));
      expect(source.getData(250).reminderId).assertEqual(250);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0011 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact13_0012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0012
     * @tc.desc   Verify source.totalCount() equals 252.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact13_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 252; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(252));
      expect(source.totalCount()).assertEqual(252);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(251).reminderId), String(251));
      expect(source.getData(251).reminderId).assertEqual(251);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0012 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact13_0013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0013
     * @tc.desc   Verify source.totalCount() equals 253.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact13_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 253; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(253));
      expect(source.totalCount()).assertEqual(253);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(252).reminderId), String(252));
      expect(source.getData(252).reminderId).assertEqual(252);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0013 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact13_0014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0014
     * @tc.desc   Verify source.totalCount() equals 254.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact13_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 254; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(254));
      expect(source.totalCount()).assertEqual(254);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(253).reminderId), String(253));
      expect(source.getData(253).reminderId).assertEqual(253);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0014 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact13_0015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0015
     * @tc.desc   Verify source.totalCount() equals 255.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact13_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 255; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(255));
      expect(source.totalCount()).assertEqual(255);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(254).reminderId), String(254));
      expect(source.getData(254).reminderId).assertEqual(254);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0015 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact13_0016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0016
     * @tc.desc   Verify source.totalCount() equals 256.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact13_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 256; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(256));
      expect(source.totalCount()).assertEqual(256);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(255).reminderId), String(255));
      expect(source.getData(255).reminderId).assertEqual(255);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0016 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact13_0017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0017
     * @tc.desc   Verify source.totalCount() equals 257.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact13_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 257; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(257));
      expect(source.totalCount()).assertEqual(257);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(256).reminderId), String(256));
      expect(source.getData(256).reminderId).assertEqual(256);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0017 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact13_0018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0018
     * @tc.desc   Verify source.totalCount() equals 258.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact13_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 258; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(258));
      expect(source.totalCount()).assertEqual(258);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(257).reminderId), String(257));
      expect(source.getData(257).reminderId).assertEqual(257);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0018 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact13_0019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0019
     * @tc.desc   Verify source.totalCount() equals 259.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact13_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 259; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(259));
      expect(source.totalCount()).assertEqual(259);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(258).reminderId), String(258));
      expect(source.getData(258).reminderId).assertEqual(258);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0019 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact13_0020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_13_0020
     * @tc.desc   Verify source.totalCount() equals 260.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact13_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 260; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(260));
      expect(source.totalCount()).assertEqual(260);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(259).reminderId), String(259));
      expect(source.getData(259).reminderId).assertEqual(259);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact13_0020 end');
    })
  })
}
