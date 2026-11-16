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

export default function flipClockVolume2Contact25Test() {
  describe('FlipClockVolume2Contact25Test', () => {

    /**
     * @tc.name   testFlipClockVol2250001
     * @tc.number SUB_FLIP_CLOCK_VOL2_25_0001
     * @tc.desc   Verify source.totalCount() equals 1081.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2250001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1081; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1081);');
      expect(source.totalCount()).assertEqual(1081);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1080).reminderId).assertEqual(1080);');
      expect(source.getData(1080).reminderId).assertEqual(1080);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250001 end');
    })

    /**
     * @tc.name   testFlipClockVol2250002
     * @tc.number SUB_FLIP_CLOCK_VOL2_25_0002
     * @tc.desc   Verify source.totalCount() equals 1082.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2250002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1082; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1082);');
      expect(source.totalCount()).assertEqual(1082);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1081).reminderId).assertEqual(1081);');
      expect(source.getData(1081).reminderId).assertEqual(1081);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250002 end');
    })

    /**
     * @tc.name   testFlipClockVol2250003
     * @tc.number SUB_FLIP_CLOCK_VOL2_25_0003
     * @tc.desc   Verify source.totalCount() equals 1083.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2250003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1083; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1083);');
      expect(source.totalCount()).assertEqual(1083);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1082).reminderId).assertEqual(1082);');
      expect(source.getData(1082).reminderId).assertEqual(1082);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250003 end');
    })

    /**
     * @tc.name   testFlipClockVol2250004
     * @tc.number SUB_FLIP_CLOCK_VOL2_25_0004
     * @tc.desc   Verify source.totalCount() equals 1084.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2250004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1084; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1084);');
      expect(source.totalCount()).assertEqual(1084);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1083).reminderId).assertEqual(1083);');
      expect(source.getData(1083).reminderId).assertEqual(1083);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250004 end');
    })

    /**
     * @tc.name   testFlipClockVol2250005
     * @tc.number SUB_FLIP_CLOCK_VOL2_25_0005
     * @tc.desc   Verify source.totalCount() equals 1085.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2250005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1085; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1085);');
      expect(source.totalCount()).assertEqual(1085);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1084).reminderId).assertEqual(1084);');
      expect(source.getData(1084).reminderId).assertEqual(1084);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250005 end');
    })

    /**
     * @tc.name   testFlipClockVol2250006
     * @tc.number SUB_FLIP_CLOCK_VOL2_25_0006
     * @tc.desc   Verify source.totalCount() equals 1086.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2250006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1086; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1086);');
      expect(source.totalCount()).assertEqual(1086);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1085).reminderId).assertEqual(1085);');
      expect(source.getData(1085).reminderId).assertEqual(1085);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250006 end');
    })

    /**
     * @tc.name   testFlipClockVol2250007
     * @tc.number SUB_FLIP_CLOCK_VOL2_25_0007
     * @tc.desc   Verify source.totalCount() equals 1087.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2250007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1087; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1087);');
      expect(source.totalCount()).assertEqual(1087);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1086).reminderId).assertEqual(1086);');
      expect(source.getData(1086).reminderId).assertEqual(1086);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250007 end');
    })

    /**
     * @tc.name   testFlipClockVol2250008
     * @tc.number SUB_FLIP_CLOCK_VOL2_25_0008
     * @tc.desc   Verify source.totalCount() equals 1088.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2250008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1088; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1088);');
      expect(source.totalCount()).assertEqual(1088);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1087).reminderId).assertEqual(1087);');
      expect(source.getData(1087).reminderId).assertEqual(1087);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250008 end');
    })

    /**
     * @tc.name   testFlipClockVol2250009
     * @tc.number SUB_FLIP_CLOCK_VOL2_25_0009
     * @tc.desc   Verify source.totalCount() equals 1089.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2250009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1089; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1089);');
      expect(source.totalCount()).assertEqual(1089);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1088).reminderId).assertEqual(1088);');
      expect(source.getData(1088).reminderId).assertEqual(1088);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250009 end');
    })

    /**
     * @tc.name   testFlipClockVol2250010
     * @tc.number SUB_FLIP_CLOCK_VOL2_25_0010
     * @tc.desc   Verify source.totalCount() equals 1090.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2250010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1090; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1090);');
      expect(source.totalCount()).assertEqual(1090);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1089).reminderId).assertEqual(1089);');
      expect(source.getData(1089).reminderId).assertEqual(1089);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250010 end');
    })

    /**
     * @tc.name   testFlipClockVol2250011
     * @tc.number SUB_FLIP_CLOCK_VOL2_25_0011
     * @tc.desc   Verify source.totalCount() equals 1091.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2250011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1091; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1091);');
      expect(source.totalCount()).assertEqual(1091);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1090).reminderId).assertEqual(1090);');
      expect(source.getData(1090).reminderId).assertEqual(1090);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250011 end');
    })

    /**
     * @tc.name   testFlipClockVol2250012
     * @tc.number SUB_FLIP_CLOCK_VOL2_25_0012
     * @tc.desc   Verify source.totalCount() equals 1092.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2250012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1092; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1092);');
      expect(source.totalCount()).assertEqual(1092);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1091).reminderId).assertEqual(1091);');
      expect(source.getData(1091).reminderId).assertEqual(1091);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250012 end');
    })

    /**
     * @tc.name   testFlipClockVol2250013
     * @tc.number SUB_FLIP_CLOCK_VOL2_25_0013
     * @tc.desc   Verify source.totalCount() equals 1093.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2250013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1093; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1093);');
      expect(source.totalCount()).assertEqual(1093);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1092).reminderId).assertEqual(1092);');
      expect(source.getData(1092).reminderId).assertEqual(1092);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250013 end');
    })

    /**
     * @tc.name   testFlipClockVol2250014
     * @tc.number SUB_FLIP_CLOCK_VOL2_25_0014
     * @tc.desc   Verify source.totalCount() equals 1094.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2250014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1094; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1094);');
      expect(source.totalCount()).assertEqual(1094);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1093).reminderId).assertEqual(1093);');
      expect(source.getData(1093).reminderId).assertEqual(1093);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250014 end');
    })

    /**
     * @tc.name   testFlipClockVol2250015
     * @tc.number SUB_FLIP_CLOCK_VOL2_25_0015
     * @tc.desc   Verify source.totalCount() equals 1095.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2250015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1095; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1095);');
      expect(source.totalCount()).assertEqual(1095);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1094).reminderId).assertEqual(1094);');
      expect(source.getData(1094).reminderId).assertEqual(1094);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250015 end');
    })

    /**
     * @tc.name   testFlipClockVol2250016
     * @tc.number SUB_FLIP_CLOCK_VOL2_25_0016
     * @tc.desc   Verify source.totalCount() equals 1096.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2250016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1096; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1096);');
      expect(source.totalCount()).assertEqual(1096);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1095).reminderId).assertEqual(1095);');
      expect(source.getData(1095).reminderId).assertEqual(1095);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250016 end');
    })

    /**
     * @tc.name   testFlipClockVol2250017
     * @tc.number SUB_FLIP_CLOCK_VOL2_25_0017
     * @tc.desc   Verify source.totalCount() equals 1097.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2250017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1097; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1097);');
      expect(source.totalCount()).assertEqual(1097);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1096).reminderId).assertEqual(1096);');
      expect(source.getData(1096).reminderId).assertEqual(1096);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250017 end');
    })

    /**
     * @tc.name   testFlipClockVol2250018
     * @tc.number SUB_FLIP_CLOCK_VOL2_25_0018
     * @tc.desc   Verify source.totalCount() equals 1098.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2250018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1098; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1098);');
      expect(source.totalCount()).assertEqual(1098);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1097).reminderId).assertEqual(1097);');
      expect(source.getData(1097).reminderId).assertEqual(1097);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250018 end');
    })

    /**
     * @tc.name   testFlipClockVol2250019
     * @tc.number SUB_FLIP_CLOCK_VOL2_25_0019
     * @tc.desc   Verify source.totalCount() equals 1099.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2250019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1099; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1099);');
      expect(source.totalCount()).assertEqual(1099);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1098).reminderId).assertEqual(1098);');
      expect(source.getData(1098).reminderId).assertEqual(1098);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250019 end');
    })

    /**
     * @tc.name   testFlipClockVol2250020
     * @tc.number SUB_FLIP_CLOCK_VOL2_25_0020
     * @tc.desc   Verify source.totalCount() equals 1100.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2250020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1100; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1100);');
      expect(source.totalCount()).assertEqual(1100);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1099).reminderId).assertEqual(1099);');
      expect(source.getData(1099).reminderId).assertEqual(1099);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2250020 end');
    })
  })
}
