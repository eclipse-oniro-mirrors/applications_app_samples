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
     * @tc.name   testFlipClockVol30001
     * @tc.number SUB_FLIP_CLOCK_VOL3_0001
     * @tc.desc   Verify source.totalCount() equals 1201.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol30001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1201; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1201);');
      expect(source.totalCount()).assertEqual(1201);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1200).reminderId).assertEqual(1200);');
      expect(source.getData(1200).reminderId).assertEqual(1200);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30001 end');
    })

    /**
     * @tc.name   testFlipClockVol30002
     * @tc.number SUB_FLIP_CLOCK_VOL3_0002
     * @tc.desc   Verify source.totalCount() equals 1202.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol30002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1202; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1202);');
      expect(source.totalCount()).assertEqual(1202);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1201).reminderId).assertEqual(1201);');
      expect(source.getData(1201).reminderId).assertEqual(1201);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30002 end');
    })

    /**
     * @tc.name   testFlipClockVol30003
     * @tc.number SUB_FLIP_CLOCK_VOL3_0003
     * @tc.desc   Verify source.totalCount() equals 1203.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol30003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1203; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1203);');
      expect(source.totalCount()).assertEqual(1203);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1202).reminderId).assertEqual(1202);');
      expect(source.getData(1202).reminderId).assertEqual(1202);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30003 end');
    })

    /**
     * @tc.name   testFlipClockVol30004
     * @tc.number SUB_FLIP_CLOCK_VOL3_0004
     * @tc.desc   Verify source.totalCount() equals 1204.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol30004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1204; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1204);');
      expect(source.totalCount()).assertEqual(1204);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1203).reminderId).assertEqual(1203);');
      expect(source.getData(1203).reminderId).assertEqual(1203);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30004 end');
    })

    /**
     * @tc.name   testFlipClockVol30005
     * @tc.number SUB_FLIP_CLOCK_VOL3_0005
     * @tc.desc   Verify source.totalCount() equals 1205.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol30005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1205; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1205);');
      expect(source.totalCount()).assertEqual(1205);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1204).reminderId).assertEqual(1204);');
      expect(source.getData(1204).reminderId).assertEqual(1204);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30005 end');
    })

    /**
     * @tc.name   testFlipClockVol30006
     * @tc.number SUB_FLIP_CLOCK_VOL3_0006
     * @tc.desc   Verify source.totalCount() equals 1206.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol30006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1206; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1206);');
      expect(source.totalCount()).assertEqual(1206);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1205).reminderId).assertEqual(1205);');
      expect(source.getData(1205).reminderId).assertEqual(1205);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30006 end');
    })

    /**
     * @tc.name   testFlipClockVol30007
     * @tc.number SUB_FLIP_CLOCK_VOL3_0007
     * @tc.desc   Verify source.totalCount() equals 1207.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol30007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1207; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1207);');
      expect(source.totalCount()).assertEqual(1207);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1206).reminderId).assertEqual(1206);');
      expect(source.getData(1206).reminderId).assertEqual(1206);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30007 end');
    })

    /**
     * @tc.name   testFlipClockVol30008
     * @tc.number SUB_FLIP_CLOCK_VOL3_0008
     * @tc.desc   Verify source.totalCount() equals 1208.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol30008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1208; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1208);');
      expect(source.totalCount()).assertEqual(1208);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1207).reminderId).assertEqual(1207);');
      expect(source.getData(1207).reminderId).assertEqual(1207);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30008 end');
    })

    /**
     * @tc.name   testFlipClockVol30009
     * @tc.number SUB_FLIP_CLOCK_VOL3_0009
     * @tc.desc   Verify source.totalCount() equals 1209.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol30009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1209; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1209);');
      expect(source.totalCount()).assertEqual(1209);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1208).reminderId).assertEqual(1208);');
      expect(source.getData(1208).reminderId).assertEqual(1208);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30009 end');
    })

    /**
     * @tc.name   testFlipClockVol30010
     * @tc.number SUB_FLIP_CLOCK_VOL3_0010
     * @tc.desc   Verify source.totalCount() equals 1210.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol30010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1210; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1210);');
      expect(source.totalCount()).assertEqual(1210);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1209).reminderId).assertEqual(1209);');
      expect(source.getData(1209).reminderId).assertEqual(1209);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30010 end');
    })

    /**
     * @tc.name   testFlipClockVol30011
     * @tc.number SUB_FLIP_CLOCK_VOL3_0011
     * @tc.desc   Verify source.totalCount() equals 1211.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol30011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1211; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1211);');
      expect(source.totalCount()).assertEqual(1211);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1210).reminderId).assertEqual(1210);');
      expect(source.getData(1210).reminderId).assertEqual(1210);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30011 end');
    })

    /**
     * @tc.name   testFlipClockVol30012
     * @tc.number SUB_FLIP_CLOCK_VOL3_0012
     * @tc.desc   Verify source.totalCount() equals 1212.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol30012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1212; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1212);');
      expect(source.totalCount()).assertEqual(1212);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1211).reminderId).assertEqual(1211);');
      expect(source.getData(1211).reminderId).assertEqual(1211);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30012 end');
    })

    /**
     * @tc.name   testFlipClockVol30013
     * @tc.number SUB_FLIP_CLOCK_VOL3_0013
     * @tc.desc   Verify source.totalCount() equals 1213.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol30013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1213; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1213);');
      expect(source.totalCount()).assertEqual(1213);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1212).reminderId).assertEqual(1212);');
      expect(source.getData(1212).reminderId).assertEqual(1212);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30013 end');
    })

    /**
     * @tc.name   testFlipClockVol30014
     * @tc.number SUB_FLIP_CLOCK_VOL3_0014
     * @tc.desc   Verify source.totalCount() equals 1214.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol30014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1214; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1214);');
      expect(source.totalCount()).assertEqual(1214);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1213).reminderId).assertEqual(1213);');
      expect(source.getData(1213).reminderId).assertEqual(1213);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30014 end');
    })

    /**
     * @tc.name   testFlipClockVol30015
     * @tc.number SUB_FLIP_CLOCK_VOL3_0015
     * @tc.desc   Verify source.totalCount() equals 1215.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol30015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1215; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1215);');
      expect(source.totalCount()).assertEqual(1215);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1214).reminderId).assertEqual(1214);');
      expect(source.getData(1214).reminderId).assertEqual(1214);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30015 end');
    })

    /**
     * @tc.name   testFlipClockVol30016
     * @tc.number SUB_FLIP_CLOCK_VOL3_0016
     * @tc.desc   Verify source.totalCount() equals 1216.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol30016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1216; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1216);');
      expect(source.totalCount()).assertEqual(1216);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1215).reminderId).assertEqual(1215);');
      expect(source.getData(1215).reminderId).assertEqual(1215);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30016 end');
    })

    /**
     * @tc.name   testFlipClockVol30017
     * @tc.number SUB_FLIP_CLOCK_VOL3_0017
     * @tc.desc   Verify source.totalCount() equals 1217.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol30017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1217; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1217);');
      expect(source.totalCount()).assertEqual(1217);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1216).reminderId).assertEqual(1216);');
      expect(source.getData(1216).reminderId).assertEqual(1216);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30017 end');
    })

    /**
     * @tc.name   testFlipClockVol30018
     * @tc.number SUB_FLIP_CLOCK_VOL3_0018
     * @tc.desc   Verify source.totalCount() equals 1218.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol30018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1218; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1218);');
      expect(source.totalCount()).assertEqual(1218);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1217).reminderId).assertEqual(1217);');
      expect(source.getData(1217).reminderId).assertEqual(1217);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30018 end');
    })

    /**
     * @tc.name   testFlipClockVol30019
     * @tc.number SUB_FLIP_CLOCK_VOL3_0019
     * @tc.desc   Verify source.totalCount() equals 1219.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol30019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1219; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1219);');
      expect(source.totalCount()).assertEqual(1219);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1218).reminderId).assertEqual(1218);');
      expect(source.getData(1218).reminderId).assertEqual(1218);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30019 end');
    })

    /**
     * @tc.name   testFlipClockVol30020
     * @tc.number SUB_FLIP_CLOCK_VOL3_0020
     * @tc.desc   Verify source.totalCount() equals 1220.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol30020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1220; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1220);');
      expect(source.totalCount()).assertEqual(1220);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1219).reminderId).assertEqual(1219);');
      expect(source.getData(1219).reminderId).assertEqual(1219);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol30020 end');
    })
  })
}
