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

export default function flipClockVolume3ContactTest() {
  describe('FlipClockVolume3ContactTest', () => {

    /**
     * @tc.name   ohos.samples.flipclock_Volume3Contact_0001
     * @tc.number SUB_FLIP_CLOCK_VOL3_0001
     * @tc.desc   Verify source.totalCount() equals 1201.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume3Contact_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1201; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1201));
      expect(source.totalCount()).assertEqual(1201);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1200).reminderId), String(1200));
      expect(source.getData(1200).reminderId).assertEqual(1200);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume3Contact_0002
     * @tc.number SUB_FLIP_CLOCK_VOL3_0002
     * @tc.desc   Verify source.totalCount() equals 1202.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume3Contact_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1202; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1202));
      expect(source.totalCount()).assertEqual(1202);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1201).reminderId), String(1201));
      expect(source.getData(1201).reminderId).assertEqual(1201);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume3Contact_0003
     * @tc.number SUB_FLIP_CLOCK_VOL3_0003
     * @tc.desc   Verify source.totalCount() equals 1203.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume3Contact_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1203; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1203));
      expect(source.totalCount()).assertEqual(1203);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1202).reminderId), String(1202));
      expect(source.getData(1202).reminderId).assertEqual(1202);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume3Contact_0004
     * @tc.number SUB_FLIP_CLOCK_VOL3_0004
     * @tc.desc   Verify source.totalCount() equals 1204.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume3Contact_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1204; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1204));
      expect(source.totalCount()).assertEqual(1204);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1203).reminderId), String(1203));
      expect(source.getData(1203).reminderId).assertEqual(1203);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume3Contact_0005
     * @tc.number SUB_FLIP_CLOCK_VOL3_0005
     * @tc.desc   Verify source.totalCount() equals 1205.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume3Contact_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1205; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1205));
      expect(source.totalCount()).assertEqual(1205);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1204).reminderId), String(1204));
      expect(source.getData(1204).reminderId).assertEqual(1204);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume3Contact_0006
     * @tc.number SUB_FLIP_CLOCK_VOL3_0006
     * @tc.desc   Verify source.totalCount() equals 1206.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume3Contact_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1206; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1206));
      expect(source.totalCount()).assertEqual(1206);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1205).reminderId), String(1205));
      expect(source.getData(1205).reminderId).assertEqual(1205);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume3Contact_0007
     * @tc.number SUB_FLIP_CLOCK_VOL3_0007
     * @tc.desc   Verify source.totalCount() equals 1207.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume3Contact_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1207; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1207));
      expect(source.totalCount()).assertEqual(1207);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1206).reminderId), String(1206));
      expect(source.getData(1206).reminderId).assertEqual(1206);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume3Contact_0008
     * @tc.number SUB_FLIP_CLOCK_VOL3_0008
     * @tc.desc   Verify source.totalCount() equals 1208.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume3Contact_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1208; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1208));
      expect(source.totalCount()).assertEqual(1208);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1207).reminderId), String(1207));
      expect(source.getData(1207).reminderId).assertEqual(1207);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0008 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume3Contact_0009
     * @tc.number SUB_FLIP_CLOCK_VOL3_0009
     * @tc.desc   Verify source.totalCount() equals 1209.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume3Contact_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1209; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1209));
      expect(source.totalCount()).assertEqual(1209);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1208).reminderId), String(1208));
      expect(source.getData(1208).reminderId).assertEqual(1208);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0009 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume3Contact_0010
     * @tc.number SUB_FLIP_CLOCK_VOL3_0010
     * @tc.desc   Verify source.totalCount() equals 1210.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume3Contact_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1210; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1210));
      expect(source.totalCount()).assertEqual(1210);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1209).reminderId), String(1209));
      expect(source.getData(1209).reminderId).assertEqual(1209);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0010 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume3Contact_0011
     * @tc.number SUB_FLIP_CLOCK_VOL3_0011
     * @tc.desc   Verify source.totalCount() equals 1211.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume3Contact_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1211; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1211));
      expect(source.totalCount()).assertEqual(1211);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1210).reminderId), String(1210));
      expect(source.getData(1210).reminderId).assertEqual(1210);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0011 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume3Contact_0012
     * @tc.number SUB_FLIP_CLOCK_VOL3_0012
     * @tc.desc   Verify source.totalCount() equals 1212.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume3Contact_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1212; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1212));
      expect(source.totalCount()).assertEqual(1212);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1211).reminderId), String(1211));
      expect(source.getData(1211).reminderId).assertEqual(1211);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0012 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume3Contact_0013
     * @tc.number SUB_FLIP_CLOCK_VOL3_0013
     * @tc.desc   Verify source.totalCount() equals 1213.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume3Contact_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1213; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1213));
      expect(source.totalCount()).assertEqual(1213);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1212).reminderId), String(1212));
      expect(source.getData(1212).reminderId).assertEqual(1212);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0013 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume3Contact_0014
     * @tc.number SUB_FLIP_CLOCK_VOL3_0014
     * @tc.desc   Verify source.totalCount() equals 1214.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume3Contact_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1214; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1214));
      expect(source.totalCount()).assertEqual(1214);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1213).reminderId), String(1213));
      expect(source.getData(1213).reminderId).assertEqual(1213);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0014 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume3Contact_0015
     * @tc.number SUB_FLIP_CLOCK_VOL3_0015
     * @tc.desc   Verify source.totalCount() equals 1215.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume3Contact_0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1215; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1215));
      expect(source.totalCount()).assertEqual(1215);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1214).reminderId), String(1214));
      expect(source.getData(1214).reminderId).assertEqual(1214);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0015 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume3Contact_0016
     * @tc.number SUB_FLIP_CLOCK_VOL3_0016
     * @tc.desc   Verify source.totalCount() equals 1216.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume3Contact_0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1216; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1216));
      expect(source.totalCount()).assertEqual(1216);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1215).reminderId), String(1215));
      expect(source.getData(1215).reminderId).assertEqual(1215);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0016 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume3Contact_0017
     * @tc.number SUB_FLIP_CLOCK_VOL3_0017
     * @tc.desc   Verify source.totalCount() equals 1217.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume3Contact_0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1217; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1217));
      expect(source.totalCount()).assertEqual(1217);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1216).reminderId), String(1216));
      expect(source.getData(1216).reminderId).assertEqual(1216);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0017 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume3Contact_0018
     * @tc.number SUB_FLIP_CLOCK_VOL3_0018
     * @tc.desc   Verify source.totalCount() equals 1218.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume3Contact_0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1218; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1218));
      expect(source.totalCount()).assertEqual(1218);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1217).reminderId), String(1217));
      expect(source.getData(1217).reminderId).assertEqual(1217);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0018 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume3Contact_0019
     * @tc.number SUB_FLIP_CLOCK_VOL3_0019
     * @tc.desc   Verify source.totalCount() equals 1219.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume3Contact_0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1219; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1219));
      expect(source.totalCount()).assertEqual(1219);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1218).reminderId), String(1218));
      expect(source.getData(1218).reminderId).assertEqual(1218);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0019 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_Volume3Contact_0020
     * @tc.number SUB_FLIP_CLOCK_VOL3_0020
     * @tc.desc   Verify source.totalCount() equals 1220.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_Volume3Contact_0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1220; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(1220));
      expect(source.totalCount()).assertEqual(1220);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(1219).reminderId), String(1219));
      expect(source.getData(1219).reminderId).assertEqual(1219);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_Volume3Contact_0020 end');
    })
  })
}
