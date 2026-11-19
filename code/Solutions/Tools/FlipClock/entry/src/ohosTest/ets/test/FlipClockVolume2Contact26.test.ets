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

export default function flipClockVolume2Contact26Test() {
  describe('FlipClockVolume2Contact26Test', () => {

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact26_0001
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0001
     * @tc.desc   Verify source.totalCount() equals 1101.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact26_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1101; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1101));
      expect(source.totalCount()).assertEqual(1101);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1100).reminderId), String(1100));
      expect(source.getData(1100).reminderId).assertEqual(1100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact26_0002
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0002
     * @tc.desc   Verify source.totalCount() equals 1102.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact26_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1102; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1102));
      expect(source.totalCount()).assertEqual(1102);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1101).reminderId), String(1101));
      expect(source.getData(1101).reminderId).assertEqual(1101);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact26_0003
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0003
     * @tc.desc   Verify source.totalCount() equals 1103.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact26_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1103; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1103));
      expect(source.totalCount()).assertEqual(1103);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1102).reminderId), String(1102));
      expect(source.getData(1102).reminderId).assertEqual(1102);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact26_0004
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0004
     * @tc.desc   Verify source.totalCount() equals 1104.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact26_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1104; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1104));
      expect(source.totalCount()).assertEqual(1104);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1103).reminderId), String(1103));
      expect(source.getData(1103).reminderId).assertEqual(1103);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact26_0005
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0005
     * @tc.desc   Verify source.totalCount() equals 1105.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact26_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1105; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1105));
      expect(source.totalCount()).assertEqual(1105);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1104).reminderId), String(1104));
      expect(source.getData(1104).reminderId).assertEqual(1104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact26_0006
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0006
     * @tc.desc   Verify source.totalCount() equals 1106.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact26_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1106; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1106));
      expect(source.totalCount()).assertEqual(1106);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1105).reminderId), String(1105));
      expect(source.getData(1105).reminderId).assertEqual(1105);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact26_0007
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0007
     * @tc.desc   Verify source.totalCount() equals 1107.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact26_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1107; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1107));
      expect(source.totalCount()).assertEqual(1107);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1106).reminderId), String(1106));
      expect(source.getData(1106).reminderId).assertEqual(1106);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact26_0008
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0008
     * @tc.desc   Verify source.totalCount() equals 1108.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact26_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1108; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1108));
      expect(source.totalCount()).assertEqual(1108);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1107).reminderId), String(1107));
      expect(source.getData(1107).reminderId).assertEqual(1107);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0008 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact26_0009
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0009
     * @tc.desc   Verify source.totalCount() equals 1109.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact26_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1109; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1109));
      expect(source.totalCount()).assertEqual(1109);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1108).reminderId), String(1108));
      expect(source.getData(1108).reminderId).assertEqual(1108);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0009 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact26_0010
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0010
     * @tc.desc   Verify source.totalCount() equals 1110.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact26_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1110; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1110));
      expect(source.totalCount()).assertEqual(1110);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1109).reminderId), String(1109));
      expect(source.getData(1109).reminderId).assertEqual(1109);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0010 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact26_0011
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0011
     * @tc.desc   Verify source.totalCount() equals 1111.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact26_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1111; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1111));
      expect(source.totalCount()).assertEqual(1111);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1110).reminderId), String(1110));
      expect(source.getData(1110).reminderId).assertEqual(1110);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0011 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact26_0012
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0012
     * @tc.desc   Verify source.totalCount() equals 1112.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact26_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1112; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1112));
      expect(source.totalCount()).assertEqual(1112);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1111).reminderId), String(1111));
      expect(source.getData(1111).reminderId).assertEqual(1111);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0012 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact26_0013
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0013
     * @tc.desc   Verify source.totalCount() equals 1113.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact26_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1113; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1113));
      expect(source.totalCount()).assertEqual(1113);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1112).reminderId), String(1112));
      expect(source.getData(1112).reminderId).assertEqual(1112);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0013 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact26_0014
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0014
     * @tc.desc   Verify source.totalCount() equals 1114.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact26_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1114; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1114));
      expect(source.totalCount()).assertEqual(1114);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1113).reminderId), String(1113));
      expect(source.getData(1113).reminderId).assertEqual(1113);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0014 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact26_0015
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0015
     * @tc.desc   Verify source.totalCount() equals 1115.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact26_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1115; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1115));
      expect(source.totalCount()).assertEqual(1115);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1114).reminderId), String(1114));
      expect(source.getData(1114).reminderId).assertEqual(1114);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0015 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact26_0016
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0016
     * @tc.desc   Verify source.totalCount() equals 1116.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact26_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1116; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1116));
      expect(source.totalCount()).assertEqual(1116);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1115).reminderId), String(1115));
      expect(source.getData(1115).reminderId).assertEqual(1115);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0016 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact26_0017
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0017
     * @tc.desc   Verify source.totalCount() equals 1117.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact26_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1117; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1117));
      expect(source.totalCount()).assertEqual(1117);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1116).reminderId), String(1116));
      expect(source.getData(1116).reminderId).assertEqual(1116);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0017 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact26_0018
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0018
     * @tc.desc   Verify source.totalCount() equals 1118.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact26_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1118; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1118));
      expect(source.totalCount()).assertEqual(1118);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1117).reminderId), String(1117));
      expect(source.getData(1117).reminderId).assertEqual(1117);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0018 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact26_0019
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0019
     * @tc.desc   Verify source.totalCount() equals 1119.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact26_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1119; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1119));
      expect(source.totalCount()).assertEqual(1119);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1118).reminderId), String(1118));
      expect(source.getData(1118).reminderId).assertEqual(1118);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0019 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact26_0020
     * @tc.number SUB_FLIP_CLOCK_VOL2_26_0020
     * @tc.desc   Verify source.totalCount() equals 1120.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact26_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1120; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1120));
      expect(source.totalCount()).assertEqual(1120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1119).reminderId), String(1119));
      expect(source.getData(1119).reminderId).assertEqual(1119);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact26_0020 end');
    })
  })
}
