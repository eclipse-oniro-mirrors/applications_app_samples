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

export default function flipClockVolume2Contact29Test() {
  describe('FlipClockVolume2Contact29Test', () => {

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact29_0001
     * @tc.number SUB_FLIP_CLOCK_VOL2_29_0001
     * @tc.desc   Verify source.totalCount() equals 1161.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact29_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1161; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1161));
      expect(source.totalCount()).assertEqual(1161);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1160).reminderId), String(1160));
      expect(source.getData(1160).reminderId).assertEqual(1160);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact29_0002
     * @tc.number SUB_FLIP_CLOCK_VOL2_29_0002
     * @tc.desc   Verify source.totalCount() equals 1162.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact29_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1162; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1162));
      expect(source.totalCount()).assertEqual(1162);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1161).reminderId), String(1161));
      expect(source.getData(1161).reminderId).assertEqual(1161);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact29_0003
     * @tc.number SUB_FLIP_CLOCK_VOL2_29_0003
     * @tc.desc   Verify source.totalCount() equals 1163.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact29_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1163; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1163));
      expect(source.totalCount()).assertEqual(1163);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1162).reminderId), String(1162));
      expect(source.getData(1162).reminderId).assertEqual(1162);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact29_0004
     * @tc.number SUB_FLIP_CLOCK_VOL2_29_0004
     * @tc.desc   Verify source.totalCount() equals 1164.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact29_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1164; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1164));
      expect(source.totalCount()).assertEqual(1164);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1163).reminderId), String(1163));
      expect(source.getData(1163).reminderId).assertEqual(1163);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact29_0005
     * @tc.number SUB_FLIP_CLOCK_VOL2_29_0005
     * @tc.desc   Verify source.totalCount() equals 1165.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact29_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1165; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1165));
      expect(source.totalCount()).assertEqual(1165);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1164).reminderId), String(1164));
      expect(source.getData(1164).reminderId).assertEqual(1164);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact29_0006
     * @tc.number SUB_FLIP_CLOCK_VOL2_29_0006
     * @tc.desc   Verify source.totalCount() equals 1166.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact29_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1166; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1166));
      expect(source.totalCount()).assertEqual(1166);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1165).reminderId), String(1165));
      expect(source.getData(1165).reminderId).assertEqual(1165);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact29_0007
     * @tc.number SUB_FLIP_CLOCK_VOL2_29_0007
     * @tc.desc   Verify source.totalCount() equals 1167.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact29_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1167; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1167));
      expect(source.totalCount()).assertEqual(1167);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1166).reminderId), String(1166));
      expect(source.getData(1166).reminderId).assertEqual(1166);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact29_0008
     * @tc.number SUB_FLIP_CLOCK_VOL2_29_0008
     * @tc.desc   Verify source.totalCount() equals 1168.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact29_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1168; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1168));
      expect(source.totalCount()).assertEqual(1168);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1167).reminderId), String(1167));
      expect(source.getData(1167).reminderId).assertEqual(1167);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0008 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact29_0009
     * @tc.number SUB_FLIP_CLOCK_VOL2_29_0009
     * @tc.desc   Verify source.totalCount() equals 1169.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact29_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1169; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1169));
      expect(source.totalCount()).assertEqual(1169);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1168).reminderId), String(1168));
      expect(source.getData(1168).reminderId).assertEqual(1168);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0009 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact29_0010
     * @tc.number SUB_FLIP_CLOCK_VOL2_29_0010
     * @tc.desc   Verify source.totalCount() equals 1170.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact29_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1170; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1170));
      expect(source.totalCount()).assertEqual(1170);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1169).reminderId), String(1169));
      expect(source.getData(1169).reminderId).assertEqual(1169);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0010 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact29_0011
     * @tc.number SUB_FLIP_CLOCK_VOL2_29_0011
     * @tc.desc   Verify source.totalCount() equals 1171.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact29_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1171; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1171));
      expect(source.totalCount()).assertEqual(1171);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1170).reminderId), String(1170));
      expect(source.getData(1170).reminderId).assertEqual(1170);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0011 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact29_0012
     * @tc.number SUB_FLIP_CLOCK_VOL2_29_0012
     * @tc.desc   Verify source.totalCount() equals 1172.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact29_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1172; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1172));
      expect(source.totalCount()).assertEqual(1172);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1171).reminderId), String(1171));
      expect(source.getData(1171).reminderId).assertEqual(1171);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0012 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact29_0013
     * @tc.number SUB_FLIP_CLOCK_VOL2_29_0013
     * @tc.desc   Verify source.totalCount() equals 1173.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact29_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1173; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1173));
      expect(source.totalCount()).assertEqual(1173);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1172).reminderId), String(1172));
      expect(source.getData(1172).reminderId).assertEqual(1172);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0013 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact29_0014
     * @tc.number SUB_FLIP_CLOCK_VOL2_29_0014
     * @tc.desc   Verify source.totalCount() equals 1174.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact29_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1174; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1174));
      expect(source.totalCount()).assertEqual(1174);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1173).reminderId), String(1173));
      expect(source.getData(1173).reminderId).assertEqual(1173);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0014 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact29_0015
     * @tc.number SUB_FLIP_CLOCK_VOL2_29_0015
     * @tc.desc   Verify source.totalCount() equals 1175.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact29_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1175; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1175));
      expect(source.totalCount()).assertEqual(1175);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1174).reminderId), String(1174));
      expect(source.getData(1174).reminderId).assertEqual(1174);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0015 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact29_0016
     * @tc.number SUB_FLIP_CLOCK_VOL2_29_0016
     * @tc.desc   Verify source.totalCount() equals 1176.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact29_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1176; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1176));
      expect(source.totalCount()).assertEqual(1176);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1175).reminderId), String(1175));
      expect(source.getData(1175).reminderId).assertEqual(1175);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0016 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact29_0017
     * @tc.number SUB_FLIP_CLOCK_VOL2_29_0017
     * @tc.desc   Verify source.totalCount() equals 1177.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact29_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1177; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1177));
      expect(source.totalCount()).assertEqual(1177);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1176).reminderId), String(1176));
      expect(source.getData(1176).reminderId).assertEqual(1176);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0017 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact29_0018
     * @tc.number SUB_FLIP_CLOCK_VOL2_29_0018
     * @tc.desc   Verify source.totalCount() equals 1178.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact29_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1178; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1178));
      expect(source.totalCount()).assertEqual(1178);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1177).reminderId), String(1177));
      expect(source.getData(1177).reminderId).assertEqual(1177);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0018 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact29_0019
     * @tc.number SUB_FLIP_CLOCK_VOL2_29_0019
     * @tc.desc   Verify source.totalCount() equals 1179.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact29_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1179; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1179));
      expect(source.totalCount()).assertEqual(1179);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1178).reminderId), String(1178));
      expect(source.getData(1178).reminderId).assertEqual(1178);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0019 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact29_0020
     * @tc.number SUB_FLIP_CLOCK_VOL2_29_0020
     * @tc.desc   Verify source.totalCount() equals 1180.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact29_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1180; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1180));
      expect(source.totalCount()).assertEqual(1180);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1179).reminderId), String(1179));
      expect(source.getData(1179).reminderId).assertEqual(1179);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact29_0020 end');
    })
  })
}
