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
     * @tc.name   testFlipClockVol2230001
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0001
     * @tc.desc   Verify source.totalCount() equals 1041.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1041; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1041);');
      expect(source.totalCount()).assertEqual(1041);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1040).reminderId).assertEqual(1040);');
      expect(source.getData(1040).reminderId).assertEqual(1040);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230001 end');
    })

    /**
     * @tc.name   testFlipClockVol2230002
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0002
     * @tc.desc   Verify source.totalCount() equals 1042.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1042; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1042);');
      expect(source.totalCount()).assertEqual(1042);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1041).reminderId).assertEqual(1041);');
      expect(source.getData(1041).reminderId).assertEqual(1041);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230002 end');
    })

    /**
     * @tc.name   testFlipClockVol2230003
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0003
     * @tc.desc   Verify source.totalCount() equals 1043.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1043; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1043);');
      expect(source.totalCount()).assertEqual(1043);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1042).reminderId).assertEqual(1042);');
      expect(source.getData(1042).reminderId).assertEqual(1042);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230003 end');
    })

    /**
     * @tc.name   testFlipClockVol2230004
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0004
     * @tc.desc   Verify source.totalCount() equals 1044.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1044; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1044);');
      expect(source.totalCount()).assertEqual(1044);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1043).reminderId).assertEqual(1043);');
      expect(source.getData(1043).reminderId).assertEqual(1043);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230004 end');
    })

    /**
     * @tc.name   testFlipClockVol2230005
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0005
     * @tc.desc   Verify source.totalCount() equals 1045.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1045; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1045);');
      expect(source.totalCount()).assertEqual(1045);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1044).reminderId).assertEqual(1044);');
      expect(source.getData(1044).reminderId).assertEqual(1044);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230005 end');
    })

    /**
     * @tc.name   testFlipClockVol2230006
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0006
     * @tc.desc   Verify source.totalCount() equals 1046.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1046; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1046);');
      expect(source.totalCount()).assertEqual(1046);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1045).reminderId).assertEqual(1045);');
      expect(source.getData(1045).reminderId).assertEqual(1045);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230006 end');
    })

    /**
     * @tc.name   testFlipClockVol2230007
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0007
     * @tc.desc   Verify source.totalCount() equals 1047.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1047; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1047);');
      expect(source.totalCount()).assertEqual(1047);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1046).reminderId).assertEqual(1046);');
      expect(source.getData(1046).reminderId).assertEqual(1046);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230007 end');
    })

    /**
     * @tc.name   testFlipClockVol2230008
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0008
     * @tc.desc   Verify source.totalCount() equals 1048.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1048; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1048);');
      expect(source.totalCount()).assertEqual(1048);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1047).reminderId).assertEqual(1047);');
      expect(source.getData(1047).reminderId).assertEqual(1047);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230008 end');
    })

    /**
     * @tc.name   testFlipClockVol2230009
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0009
     * @tc.desc   Verify source.totalCount() equals 1049.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1049; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1049);');
      expect(source.totalCount()).assertEqual(1049);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1048).reminderId).assertEqual(1048);');
      expect(source.getData(1048).reminderId).assertEqual(1048);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230009 end');
    })

    /**
     * @tc.name   testFlipClockVol2230010
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0010
     * @tc.desc   Verify source.totalCount() equals 1050.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1050; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1050);');
      expect(source.totalCount()).assertEqual(1050);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1049).reminderId).assertEqual(1049);');
      expect(source.getData(1049).reminderId).assertEqual(1049);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230010 end');
    })

    /**
     * @tc.name   testFlipClockVol2230011
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0011
     * @tc.desc   Verify source.totalCount() equals 1051.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1051; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1051);');
      expect(source.totalCount()).assertEqual(1051);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1050).reminderId).assertEqual(1050);');
      expect(source.getData(1050).reminderId).assertEqual(1050);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230011 end');
    })

    /**
     * @tc.name   testFlipClockVol2230012
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0012
     * @tc.desc   Verify source.totalCount() equals 1052.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1052; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1052);');
      expect(source.totalCount()).assertEqual(1052);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1051).reminderId).assertEqual(1051);');
      expect(source.getData(1051).reminderId).assertEqual(1051);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230012 end');
    })

    /**
     * @tc.name   testFlipClockVol2230013
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0013
     * @tc.desc   Verify source.totalCount() equals 1053.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1053; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1053);');
      expect(source.totalCount()).assertEqual(1053);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1052).reminderId).assertEqual(1052);');
      expect(source.getData(1052).reminderId).assertEqual(1052);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230013 end');
    })

    /**
     * @tc.name   testFlipClockVol2230014
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0014
     * @tc.desc   Verify source.totalCount() equals 1054.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1054; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1054);');
      expect(source.totalCount()).assertEqual(1054);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1053).reminderId).assertEqual(1053);');
      expect(source.getData(1053).reminderId).assertEqual(1053);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230014 end');
    })

    /**
     * @tc.name   testFlipClockVol2230015
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0015
     * @tc.desc   Verify source.totalCount() equals 1055.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1055; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1055);');
      expect(source.totalCount()).assertEqual(1055);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1054).reminderId).assertEqual(1054);');
      expect(source.getData(1054).reminderId).assertEqual(1054);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230015 end');
    })

    /**
     * @tc.name   testFlipClockVol2230016
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0016
     * @tc.desc   Verify source.totalCount() equals 1056.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1056; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1056);');
      expect(source.totalCount()).assertEqual(1056);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1055).reminderId).assertEqual(1055);');
      expect(source.getData(1055).reminderId).assertEqual(1055);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230016 end');
    })

    /**
     * @tc.name   testFlipClockVol2230017
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0017
     * @tc.desc   Verify source.totalCount() equals 1057.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1057; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1057);');
      expect(source.totalCount()).assertEqual(1057);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1056).reminderId).assertEqual(1056);');
      expect(source.getData(1056).reminderId).assertEqual(1056);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230017 end');
    })

    /**
     * @tc.name   testFlipClockVol2230018
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0018
     * @tc.desc   Verify source.totalCount() equals 1058.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1058; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1058);');
      expect(source.totalCount()).assertEqual(1058);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1057).reminderId).assertEqual(1057);');
      expect(source.getData(1057).reminderId).assertEqual(1057);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230018 end');
    })

    /**
     * @tc.name   testFlipClockVol2230019
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0019
     * @tc.desc   Verify source.totalCount() equals 1059.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1059; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1059);');
      expect(source.totalCount()).assertEqual(1059);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1058).reminderId).assertEqual(1058);');
      expect(source.getData(1058).reminderId).assertEqual(1058);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230019 end');
    })

    /**
     * @tc.name   testFlipClockVol2230020
     * @tc.number SUB_FLIP_CLOCK_VOL2_23_0020
     * @tc.desc   Verify source.totalCount() equals 1060.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2230020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 1060; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(1060);');
      expect(source.totalCount()).assertEqual(1060);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(1059).reminderId).assertEqual(1059);');
      expect(source.getData(1059).reminderId).assertEqual(1059);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2230020 end');
    })
  })
}
