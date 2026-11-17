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

export default function flipClockVolume2Contact16Test() {
  describe('FlipClockVolume2Contact16Test', () => {

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact16_0001
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0001
     * @tc.desc   Verify source.totalCount() equals 901.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact16_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 901; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(901));
      expect(source.totalCount()).assertEqual(901);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(900).reminderId), String(900));
      expect(source.getData(900).reminderId).assertEqual(900);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact16_0002
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0002
     * @tc.desc   Verify source.totalCount() equals 902.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact16_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 902; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(902));
      expect(source.totalCount()).assertEqual(902);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(901).reminderId), String(901));
      expect(source.getData(901).reminderId).assertEqual(901);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact16_0003
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0003
     * @tc.desc   Verify source.totalCount() equals 903.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact16_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 903; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(903));
      expect(source.totalCount()).assertEqual(903);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(902).reminderId), String(902));
      expect(source.getData(902).reminderId).assertEqual(902);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact16_0004
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0004
     * @tc.desc   Verify source.totalCount() equals 904.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact16_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 904; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(904));
      expect(source.totalCount()).assertEqual(904);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(903).reminderId), String(903));
      expect(source.getData(903).reminderId).assertEqual(903);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact16_0005
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0005
     * @tc.desc   Verify source.totalCount() equals 905.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact16_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 905; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(905));
      expect(source.totalCount()).assertEqual(905);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(904).reminderId), String(904));
      expect(source.getData(904).reminderId).assertEqual(904);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact16_0006
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0006
     * @tc.desc   Verify source.totalCount() equals 906.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact16_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 906; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(906));
      expect(source.totalCount()).assertEqual(906);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(905).reminderId), String(905));
      expect(source.getData(905).reminderId).assertEqual(905);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact16_0007
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0007
     * @tc.desc   Verify source.totalCount() equals 907.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact16_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 907; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(907));
      expect(source.totalCount()).assertEqual(907);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(906).reminderId), String(906));
      expect(source.getData(906).reminderId).assertEqual(906);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact16_0008
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0008
     * @tc.desc   Verify source.totalCount() equals 908.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact16_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 908; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(908));
      expect(source.totalCount()).assertEqual(908);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(907).reminderId), String(907));
      expect(source.getData(907).reminderId).assertEqual(907);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0008 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact16_0009
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0009
     * @tc.desc   Verify source.totalCount() equals 909.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact16_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 909; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(909));
      expect(source.totalCount()).assertEqual(909);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(908).reminderId), String(908));
      expect(source.getData(908).reminderId).assertEqual(908);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0009 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact16_0010
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0010
     * @tc.desc   Verify source.totalCount() equals 910.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact16_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 910; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(910));
      expect(source.totalCount()).assertEqual(910);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(909).reminderId), String(909));
      expect(source.getData(909).reminderId).assertEqual(909);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0010 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact16_0011
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0011
     * @tc.desc   Verify source.totalCount() equals 911.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact16_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 911; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(911));
      expect(source.totalCount()).assertEqual(911);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(910).reminderId), String(910));
      expect(source.getData(910).reminderId).assertEqual(910);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0011 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact16_0012
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0012
     * @tc.desc   Verify source.totalCount() equals 912.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact16_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 912; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(912));
      expect(source.totalCount()).assertEqual(912);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(911).reminderId), String(911));
      expect(source.getData(911).reminderId).assertEqual(911);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0012 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact16_0013
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0013
     * @tc.desc   Verify source.totalCount() equals 913.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact16_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 913; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(913));
      expect(source.totalCount()).assertEqual(913);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(912).reminderId), String(912));
      expect(source.getData(912).reminderId).assertEqual(912);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0013 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact16_0014
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0014
     * @tc.desc   Verify source.totalCount() equals 914.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact16_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 914; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(914));
      expect(source.totalCount()).assertEqual(914);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(913).reminderId), String(913));
      expect(source.getData(913).reminderId).assertEqual(913);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0014 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact16_0015
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0015
     * @tc.desc   Verify source.totalCount() equals 915.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact16_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 915; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(915));
      expect(source.totalCount()).assertEqual(915);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(914).reminderId), String(914));
      expect(source.getData(914).reminderId).assertEqual(914);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0015 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact16_0016
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0016
     * @tc.desc   Verify source.totalCount() equals 916.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact16_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 916; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(916));
      expect(source.totalCount()).assertEqual(916);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(915).reminderId), String(915));
      expect(source.getData(915).reminderId).assertEqual(915);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0016 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact16_0017
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0017
     * @tc.desc   Verify source.totalCount() equals 917.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact16_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 917; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(917));
      expect(source.totalCount()).assertEqual(917);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(916).reminderId), String(916));
      expect(source.getData(916).reminderId).assertEqual(916);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0017 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact16_0018
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0018
     * @tc.desc   Verify source.totalCount() equals 918.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact16_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 918; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(918));
      expect(source.totalCount()).assertEqual(918);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(917).reminderId), String(917));
      expect(source.getData(917).reminderId).assertEqual(917);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0018 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact16_0019
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0019
     * @tc.desc   Verify source.totalCount() equals 919.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact16_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 919; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(919));
      expect(source.totalCount()).assertEqual(919);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(918).reminderId), String(918));
      expect(source.getData(918).reminderId).assertEqual(918);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0019 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact16_0020
     * @tc.number SUB_FLIP_CLOCK_VOL2_16_0020
     * @tc.desc   Verify source.totalCount() equals 920.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact16_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 920; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(920));
      expect(source.totalCount()).assertEqual(920);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(919).reminderId), String(919));
      expect(source.getData(919).reminderId).assertEqual(919);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact16_0020 end');
    })
  })
}
