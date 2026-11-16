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

export default function flipClockVolume2Contact22Test() {
  describe('FlipClockVolume2Contact22Test', () => {

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact22_0001
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0001
     * @tc.desc   Verify source.totalCount() equals 1021.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact22_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1021; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1021));
      expect(source.totalCount()).assertEqual(1021);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1020).reminderId), String(1020));
      expect(source.getData(1020).reminderId).assertEqual(1020);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact22_0002
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0002
     * @tc.desc   Verify source.totalCount() equals 1022.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact22_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1022; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1022));
      expect(source.totalCount()).assertEqual(1022);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1021).reminderId), String(1021));
      expect(source.getData(1021).reminderId).assertEqual(1021);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact22_0003
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0003
     * @tc.desc   Verify source.totalCount() equals 1023.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact22_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1023; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1023));
      expect(source.totalCount()).assertEqual(1023);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1022).reminderId), String(1022));
      expect(source.getData(1022).reminderId).assertEqual(1022);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact22_0004
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0004
     * @tc.desc   Verify source.totalCount() equals 1024.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact22_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1024; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1024));
      expect(source.totalCount()).assertEqual(1024);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1023).reminderId), String(1023));
      expect(source.getData(1023).reminderId).assertEqual(1023);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact22_0005
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0005
     * @tc.desc   Verify source.totalCount() equals 1025.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact22_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1025; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1025));
      expect(source.totalCount()).assertEqual(1025);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1024).reminderId), String(1024));
      expect(source.getData(1024).reminderId).assertEqual(1024);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact22_0006
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0006
     * @tc.desc   Verify source.totalCount() equals 1026.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact22_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1026; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1026));
      expect(source.totalCount()).assertEqual(1026);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1025).reminderId), String(1025));
      expect(source.getData(1025).reminderId).assertEqual(1025);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact22_0007
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0007
     * @tc.desc   Verify source.totalCount() equals 1027.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact22_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1027; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1027));
      expect(source.totalCount()).assertEqual(1027);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1026).reminderId), String(1026));
      expect(source.getData(1026).reminderId).assertEqual(1026);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact22_0008
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0008
     * @tc.desc   Verify source.totalCount() equals 1028.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact22_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1028; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1028));
      expect(source.totalCount()).assertEqual(1028);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1027).reminderId), String(1027));
      expect(source.getData(1027).reminderId).assertEqual(1027);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0008 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact22_0009
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0009
     * @tc.desc   Verify source.totalCount() equals 1029.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact22_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1029; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1029));
      expect(source.totalCount()).assertEqual(1029);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1028).reminderId), String(1028));
      expect(source.getData(1028).reminderId).assertEqual(1028);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0009 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact22_0010
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0010
     * @tc.desc   Verify source.totalCount() equals 1030.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact22_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1030; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1030));
      expect(source.totalCount()).assertEqual(1030);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1029).reminderId), String(1029));
      expect(source.getData(1029).reminderId).assertEqual(1029);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0010 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact22_0011
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0011
     * @tc.desc   Verify source.totalCount() equals 1031.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact22_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1031; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1031));
      expect(source.totalCount()).assertEqual(1031);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1030).reminderId), String(1030));
      expect(source.getData(1030).reminderId).assertEqual(1030);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0011 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact22_0012
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0012
     * @tc.desc   Verify source.totalCount() equals 1032.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact22_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1032; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1032));
      expect(source.totalCount()).assertEqual(1032);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1031).reminderId), String(1031));
      expect(source.getData(1031).reminderId).assertEqual(1031);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0012 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact22_0013
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0013
     * @tc.desc   Verify source.totalCount() equals 1033.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact22_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1033; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1033));
      expect(source.totalCount()).assertEqual(1033);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1032).reminderId), String(1032));
      expect(source.getData(1032).reminderId).assertEqual(1032);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0013 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact22_0014
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0014
     * @tc.desc   Verify source.totalCount() equals 1034.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact22_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1034; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1034));
      expect(source.totalCount()).assertEqual(1034);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1033).reminderId), String(1033));
      expect(source.getData(1033).reminderId).assertEqual(1033);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0014 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact22_0015
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0015
     * @tc.desc   Verify source.totalCount() equals 1035.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact22_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1035; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1035));
      expect(source.totalCount()).assertEqual(1035);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1034).reminderId), String(1034));
      expect(source.getData(1034).reminderId).assertEqual(1034);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0015 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact22_0016
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0016
     * @tc.desc   Verify source.totalCount() equals 1036.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact22_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1036; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1036));
      expect(source.totalCount()).assertEqual(1036);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1035).reminderId), String(1035));
      expect(source.getData(1035).reminderId).assertEqual(1035);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0016 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact22_0017
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0017
     * @tc.desc   Verify source.totalCount() equals 1037.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact22_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1037; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1037));
      expect(source.totalCount()).assertEqual(1037);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1036).reminderId), String(1036));
      expect(source.getData(1036).reminderId).assertEqual(1036);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0017 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact22_0018
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0018
     * @tc.desc   Verify source.totalCount() equals 1038.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact22_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1038; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1038));
      expect(source.totalCount()).assertEqual(1038);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1037).reminderId), String(1037));
      expect(source.getData(1037).reminderId).assertEqual(1037);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0018 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact22_0019
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0019
     * @tc.desc   Verify source.totalCount() equals 1039.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact22_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1039; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1039));
      expect(source.totalCount()).assertEqual(1039);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1038).reminderId), String(1038));
      expect(source.getData(1038).reminderId).assertEqual(1038);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0019 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact22_0020
     * @tc.number SUB_FLIP_CLOCK_VOL2_22_0020
     * @tc.desc   Verify source.totalCount() equals 1040.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact22_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1040; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1040));
      expect(source.totalCount()).assertEqual(1040);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1039).reminderId), String(1039));
      expect(source.getData(1039).reminderId).assertEqual(1039);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact22_0020 end');
    })
  })
}
