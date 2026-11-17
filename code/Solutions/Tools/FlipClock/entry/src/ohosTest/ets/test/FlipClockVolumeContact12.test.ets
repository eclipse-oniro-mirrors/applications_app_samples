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

export default function flipClockVolumeContact12Test() {
  describe('FlipClockVolumeContact12Test', () => {

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact12_0001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0001
     * @tc.desc   Verify source.totalCount() equals 221.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact12_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 221; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(221));
      expect(source.totalCount()).assertEqual(221);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(220).reminderId), String(220));
      expect(source.getData(220).reminderId).assertEqual(220);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact12_0002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0002
     * @tc.desc   Verify source.totalCount() equals 222.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact12_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 222; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(222));
      expect(source.totalCount()).assertEqual(222);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(221).reminderId), String(221));
      expect(source.getData(221).reminderId).assertEqual(221);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact12_0003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0003
     * @tc.desc   Verify source.totalCount() equals 223.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact12_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 223; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(223));
      expect(source.totalCount()).assertEqual(223);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(222).reminderId), String(222));
      expect(source.getData(222).reminderId).assertEqual(222);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact12_0004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0004
     * @tc.desc   Verify source.totalCount() equals 224.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact12_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 224; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(224));
      expect(source.totalCount()).assertEqual(224);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(223).reminderId), String(223));
      expect(source.getData(223).reminderId).assertEqual(223);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact12_0005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0005
     * @tc.desc   Verify source.totalCount() equals 225.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact12_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 225; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(225));
      expect(source.totalCount()).assertEqual(225);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(224).reminderId), String(224));
      expect(source.getData(224).reminderId).assertEqual(224);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact12_0006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0006
     * @tc.desc   Verify source.totalCount() equals 226.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact12_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 226; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(226));
      expect(source.totalCount()).assertEqual(226);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(225).reminderId), String(225));
      expect(source.getData(225).reminderId).assertEqual(225);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact12_0007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0007
     * @tc.desc   Verify source.totalCount() equals 227.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact12_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 227; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(227));
      expect(source.totalCount()).assertEqual(227);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(226).reminderId), String(226));
      expect(source.getData(226).reminderId).assertEqual(226);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact12_0008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0008
     * @tc.desc   Verify source.totalCount() equals 228.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact12_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 228; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(228));
      expect(source.totalCount()).assertEqual(228);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(227).reminderId), String(227));
      expect(source.getData(227).reminderId).assertEqual(227);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0008 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact12_0009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0009
     * @tc.desc   Verify source.totalCount() equals 229.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact12_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 229; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(229));
      expect(source.totalCount()).assertEqual(229);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(228).reminderId), String(228));
      expect(source.getData(228).reminderId).assertEqual(228);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0009 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact12_0010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0010
     * @tc.desc   Verify source.totalCount() equals 230.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact12_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 230; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(230));
      expect(source.totalCount()).assertEqual(230);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(229).reminderId), String(229));
      expect(source.getData(229).reminderId).assertEqual(229);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0010 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact12_0011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0011
     * @tc.desc   Verify source.totalCount() equals 231.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact12_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 231; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(231));
      expect(source.totalCount()).assertEqual(231);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(230).reminderId), String(230));
      expect(source.getData(230).reminderId).assertEqual(230);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0011 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact12_0012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0012
     * @tc.desc   Verify source.totalCount() equals 232.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact12_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 232; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(232));
      expect(source.totalCount()).assertEqual(232);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(231).reminderId), String(231));
      expect(source.getData(231).reminderId).assertEqual(231);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0012 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact12_0013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0013
     * @tc.desc   Verify source.totalCount() equals 233.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact12_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 233; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(233));
      expect(source.totalCount()).assertEqual(233);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(232).reminderId), String(232));
      expect(source.getData(232).reminderId).assertEqual(232);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0013 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact12_0014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0014
     * @tc.desc   Verify source.totalCount() equals 234.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact12_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 234; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(234));
      expect(source.totalCount()).assertEqual(234);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(233).reminderId), String(233));
      expect(source.getData(233).reminderId).assertEqual(233);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0014 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact12_0015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0015
     * @tc.desc   Verify source.totalCount() equals 235.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact12_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 235; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(235));
      expect(source.totalCount()).assertEqual(235);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(234).reminderId), String(234));
      expect(source.getData(234).reminderId).assertEqual(234);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0015 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact12_0016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0016
     * @tc.desc   Verify source.totalCount() equals 236.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact12_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 236; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(236));
      expect(source.totalCount()).assertEqual(236);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(235).reminderId), String(235));
      expect(source.getData(235).reminderId).assertEqual(235);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0016 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact12_0017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0017
     * @tc.desc   Verify source.totalCount() equals 237.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact12_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 237; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(237));
      expect(source.totalCount()).assertEqual(237);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(236).reminderId), String(236));
      expect(source.getData(236).reminderId).assertEqual(236);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0017 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact12_0018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0018
     * @tc.desc   Verify source.totalCount() equals 238.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact12_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 238; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(238));
      expect(source.totalCount()).assertEqual(238);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(237).reminderId), String(237));
      expect(source.getData(237).reminderId).assertEqual(237);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0018 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact12_0019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0019
     * @tc.desc   Verify source.totalCount() equals 239.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact12_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 239; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(239));
      expect(source.totalCount()).assertEqual(239);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(238).reminderId), String(238));
      expect(source.getData(238).reminderId).assertEqual(238);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0019 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_VolumeContact12_0020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_12_0020
     * @tc.desc   Verify source.totalCount() equals 240.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_VolumeContact12_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 240; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(240));
      expect(source.totalCount()).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(239).reminderId), String(239));
      expect(source.getData(239).reminderId).assertEqual(239);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_VolumeContact12_0020 end');
    })
  })
}
