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

export default function flipClockVolume2Contact23Test() {
  describe('FlipClockVolume2Contact23Test', () => {

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact23_0001
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0001
     * @tc.desc   Verify source.totalCount() equals 1041.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact23_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1041; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1041));
      expect(source.totalCount()).assertEqual(1041);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1040).reminderId), String(1040));
      expect(source.getData(1040).reminderId).assertEqual(1040);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact23_0002
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0002
     * @tc.desc   Verify source.totalCount() equals 1042.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact23_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1042; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1042));
      expect(source.totalCount()).assertEqual(1042);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1041).reminderId), String(1041));
      expect(source.getData(1041).reminderId).assertEqual(1041);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact23_0003
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0003
     * @tc.desc   Verify source.totalCount() equals 1043.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact23_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1043; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1043));
      expect(source.totalCount()).assertEqual(1043);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1042).reminderId), String(1042));
      expect(source.getData(1042).reminderId).assertEqual(1042);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact23_0004
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0004
     * @tc.desc   Verify source.totalCount() equals 1044.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact23_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1044; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1044));
      expect(source.totalCount()).assertEqual(1044);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1043).reminderId), String(1043));
      expect(source.getData(1043).reminderId).assertEqual(1043);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact23_0005
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0005
     * @tc.desc   Verify source.totalCount() equals 1045.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact23_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1045; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1045));
      expect(source.totalCount()).assertEqual(1045);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1044).reminderId), String(1044));
      expect(source.getData(1044).reminderId).assertEqual(1044);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact23_0006
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0006
     * @tc.desc   Verify source.totalCount() equals 1046.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact23_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1046; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1046));
      expect(source.totalCount()).assertEqual(1046);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1045).reminderId), String(1045));
      expect(source.getData(1045).reminderId).assertEqual(1045);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact23_0007
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0007
     * @tc.desc   Verify source.totalCount() equals 1047.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact23_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1047; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1047));
      expect(source.totalCount()).assertEqual(1047);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1046).reminderId), String(1046));
      expect(source.getData(1046).reminderId).assertEqual(1046);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact23_0008
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0008
     * @tc.desc   Verify source.totalCount() equals 1048.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact23_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1048; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1048));
      expect(source.totalCount()).assertEqual(1048);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1047).reminderId), String(1047));
      expect(source.getData(1047).reminderId).assertEqual(1047);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0008 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact23_0009
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0009
     * @tc.desc   Verify source.totalCount() equals 1049.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact23_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1049; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1049));
      expect(source.totalCount()).assertEqual(1049);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1048).reminderId), String(1048));
      expect(source.getData(1048).reminderId).assertEqual(1048);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0009 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact23_0010
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0010
     * @tc.desc   Verify source.totalCount() equals 1050.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact23_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1050; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1050));
      expect(source.totalCount()).assertEqual(1050);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1049).reminderId), String(1049));
      expect(source.getData(1049).reminderId).assertEqual(1049);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0010 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact23_0011
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0011
     * @tc.desc   Verify source.totalCount() equals 1051.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact23_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1051; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1051));
      expect(source.totalCount()).assertEqual(1051);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1050).reminderId), String(1050));
      expect(source.getData(1050).reminderId).assertEqual(1050);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0011 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact23_0012
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0012
     * @tc.desc   Verify source.totalCount() equals 1052.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact23_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1052; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1052));
      expect(source.totalCount()).assertEqual(1052);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1051).reminderId), String(1051));
      expect(source.getData(1051).reminderId).assertEqual(1051);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0012 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact23_0013
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0013
     * @tc.desc   Verify source.totalCount() equals 1053.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact23_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1053; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1053));
      expect(source.totalCount()).assertEqual(1053);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1052).reminderId), String(1052));
      expect(source.getData(1052).reminderId).assertEqual(1052);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0013 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact23_0014
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0014
     * @tc.desc   Verify source.totalCount() equals 1054.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact23_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1054; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1054));
      expect(source.totalCount()).assertEqual(1054);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1053).reminderId), String(1053));
      expect(source.getData(1053).reminderId).assertEqual(1053);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0014 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact23_0015
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0015
     * @tc.desc   Verify source.totalCount() equals 1055.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact23_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1055; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1055));
      expect(source.totalCount()).assertEqual(1055);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1054).reminderId), String(1054));
      expect(source.getData(1054).reminderId).assertEqual(1054);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0015 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact23_0016
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0016
     * @tc.desc   Verify source.totalCount() equals 1056.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact23_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1056; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1056));
      expect(source.totalCount()).assertEqual(1056);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1055).reminderId), String(1055));
      expect(source.getData(1055).reminderId).assertEqual(1055);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0016 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact23_0017
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0017
     * @tc.desc   Verify source.totalCount() equals 1057.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact23_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1057; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1057));
      expect(source.totalCount()).assertEqual(1057);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1056).reminderId), String(1056));
      expect(source.getData(1056).reminderId).assertEqual(1056);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0017 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact23_0018
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0018
     * @tc.desc   Verify source.totalCount() equals 1058.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact23_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1058; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1058));
      expect(source.totalCount()).assertEqual(1058);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1057).reminderId), String(1057));
      expect(source.getData(1057).reminderId).assertEqual(1057);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0018 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact23_0019
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0019
     * @tc.desc   Verify source.totalCount() equals 1059.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact23_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1059; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1059));
      expect(source.totalCount()).assertEqual(1059);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1058).reminderId), String(1058));
      expect(source.getData(1058).reminderId).assertEqual(1058);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0019 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact23_0020
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0020
     * @tc.desc   Verify source.totalCount() equals 1060.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact23_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1060; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1060));
      expect(source.totalCount()).assertEqual(1060);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1059).reminderId), String(1059));
      expect(source.getData(1059).reminderId).assertEqual(1059);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact23_0020 end');
    })
  })
}
