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

export default function flipClockVolumeContact24Test() {
  describe('FlipClockVolumeContact24Test', () => {

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact24_0001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0001
     * @tc.desc   Verify source.totalCount() equals 461.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact24_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 461; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(461));
      expect(source.totalCount()).assertEqual(461);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(460).reminderId), String(460));
      expect(source.getData(460).reminderId).assertEqual(460);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact24_0002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0002
     * @tc.desc   Verify source.totalCount() equals 462.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact24_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 462; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(462));
      expect(source.totalCount()).assertEqual(462);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(461).reminderId), String(461));
      expect(source.getData(461).reminderId).assertEqual(461);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact24_0003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0003
     * @tc.desc   Verify source.totalCount() equals 463.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact24_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 463; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(463));
      expect(source.totalCount()).assertEqual(463);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(462).reminderId), String(462));
      expect(source.getData(462).reminderId).assertEqual(462);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact24_0004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0004
     * @tc.desc   Verify source.totalCount() equals 464.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact24_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 464; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(464));
      expect(source.totalCount()).assertEqual(464);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(463).reminderId), String(463));
      expect(source.getData(463).reminderId).assertEqual(463);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact24_0005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0005
     * @tc.desc   Verify source.totalCount() equals 465.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact24_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 465; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(465));
      expect(source.totalCount()).assertEqual(465);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(464).reminderId), String(464));
      expect(source.getData(464).reminderId).assertEqual(464);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact24_0006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0006
     * @tc.desc   Verify source.totalCount() equals 466.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact24_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 466; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(466));
      expect(source.totalCount()).assertEqual(466);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(465).reminderId), String(465));
      expect(source.getData(465).reminderId).assertEqual(465);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact24_0007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0007
     * @tc.desc   Verify source.totalCount() equals 467.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact24_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 467; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(467));
      expect(source.totalCount()).assertEqual(467);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(466).reminderId), String(466));
      expect(source.getData(466).reminderId).assertEqual(466);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact24_0008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0008
     * @tc.desc   Verify source.totalCount() equals 468.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact24_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 468; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(468));
      expect(source.totalCount()).assertEqual(468);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(467).reminderId), String(467));
      expect(source.getData(467).reminderId).assertEqual(467);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0008 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact24_0009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0009
     * @tc.desc   Verify source.totalCount() equals 469.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact24_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 469; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(469));
      expect(source.totalCount()).assertEqual(469);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(468).reminderId), String(468));
      expect(source.getData(468).reminderId).assertEqual(468);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0009 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact24_0010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0010
     * @tc.desc   Verify source.totalCount() equals 470.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact24_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 470; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(470));
      expect(source.totalCount()).assertEqual(470);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(469).reminderId), String(469));
      expect(source.getData(469).reminderId).assertEqual(469);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0010 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact24_0011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0011
     * @tc.desc   Verify source.totalCount() equals 471.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact24_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 471; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(471));
      expect(source.totalCount()).assertEqual(471);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(470).reminderId), String(470));
      expect(source.getData(470).reminderId).assertEqual(470);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0011 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact24_0012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0012
     * @tc.desc   Verify source.totalCount() equals 472.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact24_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 472; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(472));
      expect(source.totalCount()).assertEqual(472);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(471).reminderId), String(471));
      expect(source.getData(471).reminderId).assertEqual(471);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0012 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact24_0013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0013
     * @tc.desc   Verify source.totalCount() equals 473.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact24_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 473; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(473));
      expect(source.totalCount()).assertEqual(473);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(472).reminderId), String(472));
      expect(source.getData(472).reminderId).assertEqual(472);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0013 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact24_0014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0014
     * @tc.desc   Verify source.totalCount() equals 474.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact24_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 474; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(474));
      expect(source.totalCount()).assertEqual(474);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(473).reminderId), String(473));
      expect(source.getData(473).reminderId).assertEqual(473);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0014 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact24_0015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0015
     * @tc.desc   Verify source.totalCount() equals 475.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact24_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 475; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(475));
      expect(source.totalCount()).assertEqual(475);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(474).reminderId), String(474));
      expect(source.getData(474).reminderId).assertEqual(474);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0015 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact24_0016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0016
     * @tc.desc   Verify source.totalCount() equals 476.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact24_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 476; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(476));
      expect(source.totalCount()).assertEqual(476);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(475).reminderId), String(475));
      expect(source.getData(475).reminderId).assertEqual(475);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0016 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact24_0017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0017
     * @tc.desc   Verify source.totalCount() equals 477.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact24_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 477; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(477));
      expect(source.totalCount()).assertEqual(477);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(476).reminderId), String(476));
      expect(source.getData(476).reminderId).assertEqual(476);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0017 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact24_0018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0018
     * @tc.desc   Verify source.totalCount() equals 478.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact24_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 478; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(478));
      expect(source.totalCount()).assertEqual(478);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(477).reminderId), String(477));
      expect(source.getData(477).reminderId).assertEqual(477);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0018 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact24_0019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0019
     * @tc.desc   Verify source.totalCount() equals 479.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact24_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 479; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(479));
      expect(source.totalCount()).assertEqual(479);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(478).reminderId), String(478));
      expect(source.getData(478).reminderId).assertEqual(478);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0019 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact24_0020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_24_0020
     * @tc.desc   Verify source.totalCount() equals 480.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact24_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 480; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(480));
      expect(source.totalCount()).assertEqual(480);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(479).reminderId), String(479));
      expect(source.getData(479).reminderId).assertEqual(479);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact24_0020 end');
    })
  })
}
