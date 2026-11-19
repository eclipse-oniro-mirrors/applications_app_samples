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

export default function flipClockVolume2Contact28Test() {
  describe('FlipClockVolume2Contact28Test', () => {

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact28_0001
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0001
     * @tc.desc   Verify source.totalCount() equals 1141.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact28_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1141; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1141));
      expect(source.totalCount()).assertEqual(1141);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1140).reminderId), String(1140));
      expect(source.getData(1140).reminderId).assertEqual(1140);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact28_0002
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0002
     * @tc.desc   Verify source.totalCount() equals 1142.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact28_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1142; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1142));
      expect(source.totalCount()).assertEqual(1142);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1141).reminderId), String(1141));
      expect(source.getData(1141).reminderId).assertEqual(1141);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact28_0003
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0003
     * @tc.desc   Verify source.totalCount() equals 1143.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact28_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1143; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1143));
      expect(source.totalCount()).assertEqual(1143);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1142).reminderId), String(1142));
      expect(source.getData(1142).reminderId).assertEqual(1142);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact28_0004
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0004
     * @tc.desc   Verify source.totalCount() equals 1144.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact28_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1144; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1144));
      expect(source.totalCount()).assertEqual(1144);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1143).reminderId), String(1143));
      expect(source.getData(1143).reminderId).assertEqual(1143);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact28_0005
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0005
     * @tc.desc   Verify source.totalCount() equals 1145.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact28_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1145; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1145));
      expect(source.totalCount()).assertEqual(1145);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1144).reminderId), String(1144));
      expect(source.getData(1144).reminderId).assertEqual(1144);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact28_0006
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0006
     * @tc.desc   Verify source.totalCount() equals 1146.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact28_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1146; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1146));
      expect(source.totalCount()).assertEqual(1146);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1145).reminderId), String(1145));
      expect(source.getData(1145).reminderId).assertEqual(1145);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact28_0007
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0007
     * @tc.desc   Verify source.totalCount() equals 1147.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact28_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1147; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1147));
      expect(source.totalCount()).assertEqual(1147);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1146).reminderId), String(1146));
      expect(source.getData(1146).reminderId).assertEqual(1146);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact28_0008
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0008
     * @tc.desc   Verify source.totalCount() equals 1148.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact28_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1148; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1148));
      expect(source.totalCount()).assertEqual(1148);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1147).reminderId), String(1147));
      expect(source.getData(1147).reminderId).assertEqual(1147);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0008 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact28_0009
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0009
     * @tc.desc   Verify source.totalCount() equals 1149.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact28_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1149; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1149));
      expect(source.totalCount()).assertEqual(1149);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1148).reminderId), String(1148));
      expect(source.getData(1148).reminderId).assertEqual(1148);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0009 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact28_0010
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0010
     * @tc.desc   Verify source.totalCount() equals 1150.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact28_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1150; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1150));
      expect(source.totalCount()).assertEqual(1150);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1149).reminderId), String(1149));
      expect(source.getData(1149).reminderId).assertEqual(1149);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0010 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact28_0011
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0011
     * @tc.desc   Verify source.totalCount() equals 1151.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact28_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1151; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1151));
      expect(source.totalCount()).assertEqual(1151);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1150).reminderId), String(1150));
      expect(source.getData(1150).reminderId).assertEqual(1150);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0011 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact28_0012
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0012
     * @tc.desc   Verify source.totalCount() equals 1152.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact28_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1152; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1152));
      expect(source.totalCount()).assertEqual(1152);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1151).reminderId), String(1151));
      expect(source.getData(1151).reminderId).assertEqual(1151);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0012 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact28_0013
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0013
     * @tc.desc   Verify source.totalCount() equals 1153.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact28_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1153; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1153));
      expect(source.totalCount()).assertEqual(1153);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1152).reminderId), String(1152));
      expect(source.getData(1152).reminderId).assertEqual(1152);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0013 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact28_0014
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0014
     * @tc.desc   Verify source.totalCount() equals 1154.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact28_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1154; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1154));
      expect(source.totalCount()).assertEqual(1154);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1153).reminderId), String(1153));
      expect(source.getData(1153).reminderId).assertEqual(1153);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0014 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact28_0015
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0015
     * @tc.desc   Verify source.totalCount() equals 1155.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact28_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1155; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1155));
      expect(source.totalCount()).assertEqual(1155);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1154).reminderId), String(1154));
      expect(source.getData(1154).reminderId).assertEqual(1154);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0015 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact28_0016
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0016
     * @tc.desc   Verify source.totalCount() equals 1156.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact28_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1156; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1156));
      expect(source.totalCount()).assertEqual(1156);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1155).reminderId), String(1155));
      expect(source.getData(1155).reminderId).assertEqual(1155);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0016 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact28_0017
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0017
     * @tc.desc   Verify source.totalCount() equals 1157.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact28_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1157; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1157));
      expect(source.totalCount()).assertEqual(1157);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1156).reminderId), String(1156));
      expect(source.getData(1156).reminderId).assertEqual(1156);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0017 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact28_0018
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0018
     * @tc.desc   Verify source.totalCount() equals 1158.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact28_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1158; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1158));
      expect(source.totalCount()).assertEqual(1158);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1157).reminderId), String(1157));
      expect(source.getData(1157).reminderId).assertEqual(1157);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0018 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact28_0019
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0019
     * @tc.desc   Verify source.totalCount() equals 1159.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact28_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1159; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1159));
      expect(source.totalCount()).assertEqual(1159);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1158).reminderId), String(1158));
      expect(source.getData(1158).reminderId).assertEqual(1158);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0019 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact28_0020
     * @tc.number SUB_FLIP_CLOCK_VOL2_28_0020
     * @tc.desc   Verify source.totalCount() equals 1160.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact28_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1160; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1160));
      expect(source.totalCount()).assertEqual(1160);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1159).reminderId), String(1159));
      expect(source.getData(1159).reminderId).assertEqual(1159);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact28_0020 end');
    })
  })
}
