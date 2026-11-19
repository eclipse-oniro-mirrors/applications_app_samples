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

export default function flipClockVolume2Contact30Test() {
  describe('FlipClockVolume2Contact30Test', () => {

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact30_0001
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0001
     * @tc.desc   Verify source.totalCount() equals 1181.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact30_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1181; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1181));
      expect(source.totalCount()).assertEqual(1181);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1180).reminderId), String(1180));
      expect(source.getData(1180).reminderId).assertEqual(1180);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact30_0002
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0002
     * @tc.desc   Verify source.totalCount() equals 1182.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact30_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1182; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1182));
      expect(source.totalCount()).assertEqual(1182);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1181).reminderId), String(1181));
      expect(source.getData(1181).reminderId).assertEqual(1181);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact30_0003
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0003
     * @tc.desc   Verify source.totalCount() equals 1183.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact30_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1183; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1183));
      expect(source.totalCount()).assertEqual(1183);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1182).reminderId), String(1182));
      expect(source.getData(1182).reminderId).assertEqual(1182);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact30_0004
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0004
     * @tc.desc   Verify source.totalCount() equals 1184.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact30_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1184; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1184));
      expect(source.totalCount()).assertEqual(1184);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1183).reminderId), String(1183));
      expect(source.getData(1183).reminderId).assertEqual(1183);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact30_0005
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0005
     * @tc.desc   Verify source.totalCount() equals 1185.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact30_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1185; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1185));
      expect(source.totalCount()).assertEqual(1185);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1184).reminderId), String(1184));
      expect(source.getData(1184).reminderId).assertEqual(1184);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact30_0006
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0006
     * @tc.desc   Verify source.totalCount() equals 1186.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact30_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1186; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1186));
      expect(source.totalCount()).assertEqual(1186);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1185).reminderId), String(1185));
      expect(source.getData(1185).reminderId).assertEqual(1185);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact30_0007
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0007
     * @tc.desc   Verify source.totalCount() equals 1187.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact30_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1187; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1187));
      expect(source.totalCount()).assertEqual(1187);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1186).reminderId), String(1186));
      expect(source.getData(1186).reminderId).assertEqual(1186);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact30_0008
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0008
     * @tc.desc   Verify source.totalCount() equals 1188.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact30_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1188; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1188));
      expect(source.totalCount()).assertEqual(1188);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1187).reminderId), String(1187));
      expect(source.getData(1187).reminderId).assertEqual(1187);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0008 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact30_0009
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0009
     * @tc.desc   Verify source.totalCount() equals 1189.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact30_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1189; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1189));
      expect(source.totalCount()).assertEqual(1189);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1188).reminderId), String(1188));
      expect(source.getData(1188).reminderId).assertEqual(1188);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0009 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact30_0010
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0010
     * @tc.desc   Verify source.totalCount() equals 1190.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact30_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1190; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1190));
      expect(source.totalCount()).assertEqual(1190);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1189).reminderId), String(1189));
      expect(source.getData(1189).reminderId).assertEqual(1189);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0010 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact30_0011
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0011
     * @tc.desc   Verify source.totalCount() equals 1191.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact30_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1191; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1191));
      expect(source.totalCount()).assertEqual(1191);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1190).reminderId), String(1190));
      expect(source.getData(1190).reminderId).assertEqual(1190);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0011 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact30_0012
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0012
     * @tc.desc   Verify source.totalCount() equals 1192.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact30_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1192; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1192));
      expect(source.totalCount()).assertEqual(1192);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1191).reminderId), String(1191));
      expect(source.getData(1191).reminderId).assertEqual(1191);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0012 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact30_0013
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0013
     * @tc.desc   Verify source.totalCount() equals 1193.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact30_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1193; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1193));
      expect(source.totalCount()).assertEqual(1193);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1192).reminderId), String(1192));
      expect(source.getData(1192).reminderId).assertEqual(1192);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0013 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact30_0014
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0014
     * @tc.desc   Verify source.totalCount() equals 1194.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact30_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1194; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1194));
      expect(source.totalCount()).assertEqual(1194);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1193).reminderId), String(1193));
      expect(source.getData(1193).reminderId).assertEqual(1193);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0014 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact30_0015
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0015
     * @tc.desc   Verify source.totalCount() equals 1195.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact30_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1195; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1195));
      expect(source.totalCount()).assertEqual(1195);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1194).reminderId), String(1194));
      expect(source.getData(1194).reminderId).assertEqual(1194);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0015 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact30_0016
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0016
     * @tc.desc   Verify source.totalCount() equals 1196.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact30_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1196; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1196));
      expect(source.totalCount()).assertEqual(1196);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1195).reminderId), String(1195));
      expect(source.getData(1195).reminderId).assertEqual(1195);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0016 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact30_0017
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0017
     * @tc.desc   Verify source.totalCount() equals 1197.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact30_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1197; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1197));
      expect(source.totalCount()).assertEqual(1197);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1196).reminderId), String(1196));
      expect(source.getData(1196).reminderId).assertEqual(1196);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0017 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact30_0018
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0018
     * @tc.desc   Verify source.totalCount() equals 1198.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact30_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1198; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1198));
      expect(source.totalCount()).assertEqual(1198);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1197).reminderId), String(1197));
      expect(source.getData(1197).reminderId).assertEqual(1197);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0018 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact30_0019
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0019
     * @tc.desc   Verify source.totalCount() equals 1199.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact30_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1199; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1199));
      expect(source.totalCount()).assertEqual(1199);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1198).reminderId), String(1198));
      expect(source.getData(1198).reminderId).assertEqual(1198);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0019 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume2Contact30_0020
     * @tc.number SUB_FLIP_CLOCK_VOL2_30_0020
     * @tc.desc   Verify source.totalCount() equals 1200.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume2Contact30_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1200; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1200));
      expect(source.totalCount()).assertEqual(1200);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1199).reminderId), String(1199));
      expect(source.getData(1199).reminderId).assertEqual(1199);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume2Contact30_0020 end');
    })
  })
}
