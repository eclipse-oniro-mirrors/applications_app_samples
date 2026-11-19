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

export default function flipClockVolume2Contact21Test() {
  describe('FlipClockVolume2Contact21Test', () => {

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact21_0001
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0001
     * @tc.desc   Verify source.totalCount() equals 1001.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact21_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1001; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1001));
      expect(source.totalCount()).assertEqual(1001);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1000).reminderId), String(1000));
      expect(source.getData(1000).reminderId).assertEqual(1000);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact21_0002
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0002
     * @tc.desc   Verify source.totalCount() equals 1002.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact21_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1002; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1002));
      expect(source.totalCount()).assertEqual(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1001).reminderId), String(1001));
      expect(source.getData(1001).reminderId).assertEqual(1001);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact21_0003
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0003
     * @tc.desc   Verify source.totalCount() equals 1003.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact21_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1003; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1003));
      expect(source.totalCount()).assertEqual(1003);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1002).reminderId), String(1002));
      expect(source.getData(1002).reminderId).assertEqual(1002);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact21_0004
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0004
     * @tc.desc   Verify source.totalCount() equals 1004.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact21_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1004; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1004));
      expect(source.totalCount()).assertEqual(1004);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1003).reminderId), String(1003));
      expect(source.getData(1003).reminderId).assertEqual(1003);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact21_0005
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0005
     * @tc.desc   Verify source.totalCount() equals 1005.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact21_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1005; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1005));
      expect(source.totalCount()).assertEqual(1005);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1004).reminderId), String(1004));
      expect(source.getData(1004).reminderId).assertEqual(1004);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact21_0006
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0006
     * @tc.desc   Verify source.totalCount() equals 1006.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact21_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1006; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1006));
      expect(source.totalCount()).assertEqual(1006);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1005).reminderId), String(1005));
      expect(source.getData(1005).reminderId).assertEqual(1005);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact21_0007
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0007
     * @tc.desc   Verify source.totalCount() equals 1007.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact21_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1007; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1007));
      expect(source.totalCount()).assertEqual(1007);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1006).reminderId), String(1006));
      expect(source.getData(1006).reminderId).assertEqual(1006);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact21_0008
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0008
     * @tc.desc   Verify source.totalCount() equals 1008.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact21_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1008; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1008));
      expect(source.totalCount()).assertEqual(1008);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1007).reminderId), String(1007));
      expect(source.getData(1007).reminderId).assertEqual(1007);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0008 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact21_0009
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0009
     * @tc.desc   Verify source.totalCount() equals 1009.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact21_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1009; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1009));
      expect(source.totalCount()).assertEqual(1009);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1008).reminderId), String(1008));
      expect(source.getData(1008).reminderId).assertEqual(1008);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0009 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact21_0010
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0010
     * @tc.desc   Verify source.totalCount() equals 1010.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact21_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1010; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1010));
      expect(source.totalCount()).assertEqual(1010);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1009).reminderId), String(1009));
      expect(source.getData(1009).reminderId).assertEqual(1009);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0010 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact21_0011
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0011
     * @tc.desc   Verify source.totalCount() equals 1011.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact21_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1011; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1011));
      expect(source.totalCount()).assertEqual(1011);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1010).reminderId), String(1010));
      expect(source.getData(1010).reminderId).assertEqual(1010);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0011 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact21_0012
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0012
     * @tc.desc   Verify source.totalCount() equals 1012.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact21_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1012; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1012));
      expect(source.totalCount()).assertEqual(1012);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1011).reminderId), String(1011));
      expect(source.getData(1011).reminderId).assertEqual(1011);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0012 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact21_0013
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0013
     * @tc.desc   Verify source.totalCount() equals 1013.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact21_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1013; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1013));
      expect(source.totalCount()).assertEqual(1013);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1012).reminderId), String(1012));
      expect(source.getData(1012).reminderId).assertEqual(1012);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0013 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact21_0014
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0014
     * @tc.desc   Verify source.totalCount() equals 1014.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact21_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1014; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1014));
      expect(source.totalCount()).assertEqual(1014);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1013).reminderId), String(1013));
      expect(source.getData(1013).reminderId).assertEqual(1013);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0014 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact21_0015
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0015
     * @tc.desc   Verify source.totalCount() equals 1015.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact21_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1015; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1015));
      expect(source.totalCount()).assertEqual(1015);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1014).reminderId), String(1014));
      expect(source.getData(1014).reminderId).assertEqual(1014);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0015 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact21_0016
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0016
     * @tc.desc   Verify source.totalCount() equals 1016.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact21_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1016; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1016));
      expect(source.totalCount()).assertEqual(1016);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1015).reminderId), String(1015));
      expect(source.getData(1015).reminderId).assertEqual(1015);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0016 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact21_0017
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0017
     * @tc.desc   Verify source.totalCount() equals 1017.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact21_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1017; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1017));
      expect(source.totalCount()).assertEqual(1017);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1016).reminderId), String(1016));
      expect(source.getData(1016).reminderId).assertEqual(1016);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0017 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact21_0018
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0018
     * @tc.desc   Verify source.totalCount() equals 1018.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact21_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1018; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1018));
      expect(source.totalCount()).assertEqual(1018);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1017).reminderId), String(1017));
      expect(source.getData(1017).reminderId).assertEqual(1017);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0018 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact21_0019
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0019
     * @tc.desc   Verify source.totalCount() equals 1019.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact21_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1019; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1019));
      expect(source.totalCount()).assertEqual(1019);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1018).reminderId), String(1018));
      expect(source.getData(1018).reminderId).assertEqual(1018);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0019 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact21_0020
     * @tc.number SUB_FLIP_CLOCK_VOL2_21_0020
     * @tc.desc   Verify source.totalCount() equals 1020.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact21_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1020; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1020));
      expect(source.totalCount()).assertEqual(1020);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1019).reminderId), String(1019));
      expect(source.getData(1019).reminderId).assertEqual(1019);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact21_0020 end');
    })
  })
}
