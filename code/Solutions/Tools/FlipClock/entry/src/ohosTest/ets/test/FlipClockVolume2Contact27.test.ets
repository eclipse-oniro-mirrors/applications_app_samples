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

export default function flipClockVolume2Contact27Test() {
  describe('FlipClockVolume2Contact27Test', () => {

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact27_0001
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0001
     * @tc.desc   Verify source.totalCount() equals 1121.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact27_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1121; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1121));
      expect(source.totalCount()).assertEqual(1121);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1120).reminderId), String(1120));
      expect(source.getData(1120).reminderId).assertEqual(1120);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact27_0002
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0002
     * @tc.desc   Verify source.totalCount() equals 1122.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact27_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1122; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1122));
      expect(source.totalCount()).assertEqual(1122);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1121).reminderId), String(1121));
      expect(source.getData(1121).reminderId).assertEqual(1121);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact27_0003
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0003
     * @tc.desc   Verify source.totalCount() equals 1123.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact27_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1123; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1123));
      expect(source.totalCount()).assertEqual(1123);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1122).reminderId), String(1122));
      expect(source.getData(1122).reminderId).assertEqual(1122);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact27_0004
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0004
     * @tc.desc   Verify source.totalCount() equals 1124.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact27_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1124; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1124));
      expect(source.totalCount()).assertEqual(1124);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1123).reminderId), String(1123));
      expect(source.getData(1123).reminderId).assertEqual(1123);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact27_0005
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0005
     * @tc.desc   Verify source.totalCount() equals 1125.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact27_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1125; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1125));
      expect(source.totalCount()).assertEqual(1125);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1124).reminderId), String(1124));
      expect(source.getData(1124).reminderId).assertEqual(1124);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact27_0006
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0006
     * @tc.desc   Verify source.totalCount() equals 1126.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact27_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1126; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1126));
      expect(source.totalCount()).assertEqual(1126);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1125).reminderId), String(1125));
      expect(source.getData(1125).reminderId).assertEqual(1125);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact27_0007
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0007
     * @tc.desc   Verify source.totalCount() equals 1127.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact27_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1127; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1127));
      expect(source.totalCount()).assertEqual(1127);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1126).reminderId), String(1126));
      expect(source.getData(1126).reminderId).assertEqual(1126);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact27_0008
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0008
     * @tc.desc   Verify source.totalCount() equals 1128.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact27_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1128; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1128));
      expect(source.totalCount()).assertEqual(1128);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1127).reminderId), String(1127));
      expect(source.getData(1127).reminderId).assertEqual(1127);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0008 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact27_0009
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0009
     * @tc.desc   Verify source.totalCount() equals 1129.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact27_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1129; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1129));
      expect(source.totalCount()).assertEqual(1129);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1128).reminderId), String(1128));
      expect(source.getData(1128).reminderId).assertEqual(1128);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0009 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact27_0010
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0010
     * @tc.desc   Verify source.totalCount() equals 1130.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact27_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1130; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1130));
      expect(source.totalCount()).assertEqual(1130);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1129).reminderId), String(1129));
      expect(source.getData(1129).reminderId).assertEqual(1129);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0010 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact27_0011
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0011
     * @tc.desc   Verify source.totalCount() equals 1131.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact27_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1131; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1131));
      expect(source.totalCount()).assertEqual(1131);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1130).reminderId), String(1130));
      expect(source.getData(1130).reminderId).assertEqual(1130);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0011 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact27_0012
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0012
     * @tc.desc   Verify source.totalCount() equals 1132.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact27_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1132; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1132));
      expect(source.totalCount()).assertEqual(1132);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1131).reminderId), String(1131));
      expect(source.getData(1131).reminderId).assertEqual(1131);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0012 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact27_0013
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0013
     * @tc.desc   Verify source.totalCount() equals 1133.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact27_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1133; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1133));
      expect(source.totalCount()).assertEqual(1133);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1132).reminderId), String(1132));
      expect(source.getData(1132).reminderId).assertEqual(1132);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0013 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact27_0014
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0014
     * @tc.desc   Verify source.totalCount() equals 1134.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact27_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1134; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1134));
      expect(source.totalCount()).assertEqual(1134);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1133).reminderId), String(1133));
      expect(source.getData(1133).reminderId).assertEqual(1133);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0014 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact27_0015
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0015
     * @tc.desc   Verify source.totalCount() equals 1135.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact27_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1135; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1135));
      expect(source.totalCount()).assertEqual(1135);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1134).reminderId), String(1134));
      expect(source.getData(1134).reminderId).assertEqual(1134);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0015 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact27_0016
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0016
     * @tc.desc   Verify source.totalCount() equals 1136.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact27_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1136; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1136));
      expect(source.totalCount()).assertEqual(1136);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1135).reminderId), String(1135));
      expect(source.getData(1135).reminderId).assertEqual(1135);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0016 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact27_0017
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0017
     * @tc.desc   Verify source.totalCount() equals 1137.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact27_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1137; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1137));
      expect(source.totalCount()).assertEqual(1137);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1136).reminderId), String(1136));
      expect(source.getData(1136).reminderId).assertEqual(1136);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0017 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact27_0018
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0018
     * @tc.desc   Verify source.totalCount() equals 1138.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact27_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1138; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1138));
      expect(source.totalCount()).assertEqual(1138);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1137).reminderId), String(1137));
      expect(source.getData(1137).reminderId).assertEqual(1137);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0018 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact27_0019
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0019
     * @tc.desc   Verify source.totalCount() equals 1139.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact27_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1139; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1139));
      expect(source.totalCount()).assertEqual(1139);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1138).reminderId), String(1138));
      expect(source.getData(1138).reminderId).assertEqual(1138);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0019 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact27_0020
     * @tc.number SUB_FLIP_CLOCK_VOL2_27_0020
     * @tc.desc   Verify source.totalCount() equals 1140.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact27_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1140; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1140));
      expect(source.totalCount()).assertEqual(1140);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1139).reminderId), String(1139));
      expect(source.getData(1139).reminderId).assertEqual(1139);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact27_0020 end');
    })
  })
}
