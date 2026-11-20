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

export default function flipClockVolume2Contact17Test() {
  describe('FlipClockVolume2Contact17Test', () => {

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact17_0001
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0001
     * @tc.desc   Verify source.totalCount() equals 921.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact17_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 921; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(921));
      expect(source.totalCount()).assertEqual(921);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(920).reminderId), String(920));
      expect(source.getData(920).reminderId).assertEqual(920);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact17_0002
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0002
     * @tc.desc   Verify source.totalCount() equals 922.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact17_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 922; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(922));
      expect(source.totalCount()).assertEqual(922);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(921).reminderId), String(921));
      expect(source.getData(921).reminderId).assertEqual(921);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact17_0003
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0003
     * @tc.desc   Verify source.totalCount() equals 923.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact17_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 923; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(923));
      expect(source.totalCount()).assertEqual(923);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(922).reminderId), String(922));
      expect(source.getData(922).reminderId).assertEqual(922);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact17_0004
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0004
     * @tc.desc   Verify source.totalCount() equals 924.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact17_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 924; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(924));
      expect(source.totalCount()).assertEqual(924);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(923).reminderId), String(923));
      expect(source.getData(923).reminderId).assertEqual(923);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact17_0005
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0005
     * @tc.desc   Verify source.totalCount() equals 925.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact17_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 925; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(925));
      expect(source.totalCount()).assertEqual(925);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(924).reminderId), String(924));
      expect(source.getData(924).reminderId).assertEqual(924);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact17_0006
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0006
     * @tc.desc   Verify source.totalCount() equals 926.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact17_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 926; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(926));
      expect(source.totalCount()).assertEqual(926);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(925).reminderId), String(925));
      expect(source.getData(925).reminderId).assertEqual(925);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact17_0007
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0007
     * @tc.desc   Verify source.totalCount() equals 927.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact17_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 927; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(927));
      expect(source.totalCount()).assertEqual(927);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(926).reminderId), String(926));
      expect(source.getData(926).reminderId).assertEqual(926);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact17_0008
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0008
     * @tc.desc   Verify source.totalCount() equals 928.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact17_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 928; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(928));
      expect(source.totalCount()).assertEqual(928);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(927).reminderId), String(927));
      expect(source.getData(927).reminderId).assertEqual(927);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0008 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact17_0009
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0009
     * @tc.desc   Verify source.totalCount() equals 929.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact17_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 929; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(929));
      expect(source.totalCount()).assertEqual(929);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(928).reminderId), String(928));
      expect(source.getData(928).reminderId).assertEqual(928);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0009 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact17_0010
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0010
     * @tc.desc   Verify source.totalCount() equals 930.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact17_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 930; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(930));
      expect(source.totalCount()).assertEqual(930);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(929).reminderId), String(929));
      expect(source.getData(929).reminderId).assertEqual(929);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0010 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact17_0011
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0011
     * @tc.desc   Verify source.totalCount() equals 931.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact17_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 931; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(931));
      expect(source.totalCount()).assertEqual(931);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(930).reminderId), String(930));
      expect(source.getData(930).reminderId).assertEqual(930);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0011 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact17_0012
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0012
     * @tc.desc   Verify source.totalCount() equals 932.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact17_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 932; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(932));
      expect(source.totalCount()).assertEqual(932);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(931).reminderId), String(931));
      expect(source.getData(931).reminderId).assertEqual(931);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0012 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact17_0013
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0013
     * @tc.desc   Verify source.totalCount() equals 933.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact17_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 933; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(933));
      expect(source.totalCount()).assertEqual(933);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(932).reminderId), String(932));
      expect(source.getData(932).reminderId).assertEqual(932);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0013 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact17_0014
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0014
     * @tc.desc   Verify source.totalCount() equals 934.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact17_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 934; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(934));
      expect(source.totalCount()).assertEqual(934);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(933).reminderId), String(933));
      expect(source.getData(933).reminderId).assertEqual(933);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0014 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact17_0015
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0015
     * @tc.desc   Verify source.totalCount() equals 935.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact17_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 935; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(935));
      expect(source.totalCount()).assertEqual(935);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(934).reminderId), String(934));
      expect(source.getData(934).reminderId).assertEqual(934);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0015 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact17_0016
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0016
     * @tc.desc   Verify source.totalCount() equals 936.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact17_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 936; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(936));
      expect(source.totalCount()).assertEqual(936);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(935).reminderId), String(935));
      expect(source.getData(935).reminderId).assertEqual(935);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0016 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact17_0017
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0017
     * @tc.desc   Verify source.totalCount() equals 937.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact17_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 937; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(937));
      expect(source.totalCount()).assertEqual(937);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(936).reminderId), String(936));
      expect(source.getData(936).reminderId).assertEqual(936);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0017 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact17_0018
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0018
     * @tc.desc   Verify source.totalCount() equals 938.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact17_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 938; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(938));
      expect(source.totalCount()).assertEqual(938);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(937).reminderId), String(937));
      expect(source.getData(937).reminderId).assertEqual(937);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0018 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact17_0019
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0019
     * @tc.desc   Verify source.totalCount() equals 939.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact17_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 939; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(939));
      expect(source.totalCount()).assertEqual(939);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(938).reminderId), String(938));
      expect(source.getData(938).reminderId).assertEqual(938);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0019 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact17_0020
     * @tc.number SUB_FLIP_CLOCK_VOL2_17_0020
     * @tc.desc   Verify source.totalCount() equals 940.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact17_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 940; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(940));
      expect(source.totalCount()).assertEqual(940);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(939).reminderId), String(939));
      expect(source.getData(939).reminderId).assertEqual(939);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact17_0020 end');
    })
  })
}
