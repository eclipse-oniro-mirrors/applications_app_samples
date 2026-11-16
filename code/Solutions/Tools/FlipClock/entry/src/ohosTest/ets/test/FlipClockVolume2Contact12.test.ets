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

export default function flipClockVolume2Contact12Test() {
  describe('FlipClockVolume2Contact12Test', () => {

    /**
     * @tc.name   testFlipClockVol2120001
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0001
     * @tc.desc   Verify source.totalCount() equals 821.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 821; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(821);');
      expect(source.totalCount()).assertEqual(821);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(820).reminderId).assertEqual(820);');
      expect(source.getData(820).reminderId).assertEqual(820);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120001 end');
    })

    /**
     * @tc.name   testFlipClockVol2120002
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0002
     * @tc.desc   Verify source.totalCount() equals 822.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 822; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(822);');
      expect(source.totalCount()).assertEqual(822);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(821).reminderId).assertEqual(821);');
      expect(source.getData(821).reminderId).assertEqual(821);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120002 end');
    })

    /**
     * @tc.name   testFlipClockVol2120003
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0003
     * @tc.desc   Verify source.totalCount() equals 823.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 823; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(823);');
      expect(source.totalCount()).assertEqual(823);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(822).reminderId).assertEqual(822);');
      expect(source.getData(822).reminderId).assertEqual(822);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120003 end');
    })

    /**
     * @tc.name   testFlipClockVol2120004
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0004
     * @tc.desc   Verify source.totalCount() equals 824.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 824; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(824);');
      expect(source.totalCount()).assertEqual(824);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(823).reminderId).assertEqual(823);');
      expect(source.getData(823).reminderId).assertEqual(823);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120004 end');
    })

    /**
     * @tc.name   testFlipClockVol2120005
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0005
     * @tc.desc   Verify source.totalCount() equals 825.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 825; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(825);');
      expect(source.totalCount()).assertEqual(825);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(824).reminderId).assertEqual(824);');
      expect(source.getData(824).reminderId).assertEqual(824);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120005 end');
    })

    /**
     * @tc.name   testFlipClockVol2120006
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0006
     * @tc.desc   Verify source.totalCount() equals 826.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 826; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(826);');
      expect(source.totalCount()).assertEqual(826);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(825).reminderId).assertEqual(825);');
      expect(source.getData(825).reminderId).assertEqual(825);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120006 end');
    })

    /**
     * @tc.name   testFlipClockVol2120007
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0007
     * @tc.desc   Verify source.totalCount() equals 827.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 827; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(827);');
      expect(source.totalCount()).assertEqual(827);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(826).reminderId).assertEqual(826);');
      expect(source.getData(826).reminderId).assertEqual(826);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120007 end');
    })

    /**
     * @tc.name   testFlipClockVol2120008
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0008
     * @tc.desc   Verify source.totalCount() equals 828.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 828; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(828);');
      expect(source.totalCount()).assertEqual(828);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(827).reminderId).assertEqual(827);');
      expect(source.getData(827).reminderId).assertEqual(827);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120008 end');
    })

    /**
     * @tc.name   testFlipClockVol2120009
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0009
     * @tc.desc   Verify source.totalCount() equals 829.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 829; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(829);');
      expect(source.totalCount()).assertEqual(829);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(828).reminderId).assertEqual(828);');
      expect(source.getData(828).reminderId).assertEqual(828);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120009 end');
    })

    /**
     * @tc.name   testFlipClockVol2120010
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0010
     * @tc.desc   Verify source.totalCount() equals 830.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 830; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(830);');
      expect(source.totalCount()).assertEqual(830);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(829).reminderId).assertEqual(829);');
      expect(source.getData(829).reminderId).assertEqual(829);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120010 end');
    })

    /**
     * @tc.name   testFlipClockVol2120011
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0011
     * @tc.desc   Verify source.totalCount() equals 831.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 831; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(831);');
      expect(source.totalCount()).assertEqual(831);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(830).reminderId).assertEqual(830);');
      expect(source.getData(830).reminderId).assertEqual(830);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120011 end');
    })

    /**
     * @tc.name   testFlipClockVol2120012
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0012
     * @tc.desc   Verify source.totalCount() equals 832.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 832; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(832);');
      expect(source.totalCount()).assertEqual(832);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(831).reminderId).assertEqual(831);');
      expect(source.getData(831).reminderId).assertEqual(831);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120012 end');
    })

    /**
     * @tc.name   testFlipClockVol2120013
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0013
     * @tc.desc   Verify source.totalCount() equals 833.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 833; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(833);');
      expect(source.totalCount()).assertEqual(833);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(832).reminderId).assertEqual(832);');
      expect(source.getData(832).reminderId).assertEqual(832);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120013 end');
    })

    /**
     * @tc.name   testFlipClockVol2120014
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0014
     * @tc.desc   Verify source.totalCount() equals 834.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 834; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(834);');
      expect(source.totalCount()).assertEqual(834);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(833).reminderId).assertEqual(833);');
      expect(source.getData(833).reminderId).assertEqual(833);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120014 end');
    })

    /**
     * @tc.name   testFlipClockVol2120015
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0015
     * @tc.desc   Verify source.totalCount() equals 835.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 835; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(835);');
      expect(source.totalCount()).assertEqual(835);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(834).reminderId).assertEqual(834);');
      expect(source.getData(834).reminderId).assertEqual(834);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120015 end');
    })

    /**
     * @tc.name   testFlipClockVol2120016
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0016
     * @tc.desc   Verify source.totalCount() equals 836.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 836; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(836);');
      expect(source.totalCount()).assertEqual(836);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(835).reminderId).assertEqual(835);');
      expect(source.getData(835).reminderId).assertEqual(835);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120016 end');
    })

    /**
     * @tc.name   testFlipClockVol2120017
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0017
     * @tc.desc   Verify source.totalCount() equals 837.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 837; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(837);');
      expect(source.totalCount()).assertEqual(837);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(836).reminderId).assertEqual(836);');
      expect(source.getData(836).reminderId).assertEqual(836);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120017 end');
    })

    /**
     * @tc.name   testFlipClockVol2120018
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0018
     * @tc.desc   Verify source.totalCount() equals 838.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 838; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(838);');
      expect(source.totalCount()).assertEqual(838);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(837).reminderId).assertEqual(837);');
      expect(source.getData(837).reminderId).assertEqual(837);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120018 end');
    })

    /**
     * @tc.name   testFlipClockVol2120019
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0019
     * @tc.desc   Verify source.totalCount() equals 839.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 839; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(839);');
      expect(source.totalCount()).assertEqual(839);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(838).reminderId).assertEqual(838);');
      expect(source.getData(838).reminderId).assertEqual(838);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120019 end');
    })

    /**
     * @tc.name   testFlipClockVol2120020
     * @tc.number SUB_FLIP_CLOCK_VOL2_12_0020
     * @tc.desc   Verify source.totalCount() equals 840.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2120020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 840; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(840);');
      expect(source.totalCount()).assertEqual(840);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(839).reminderId).assertEqual(839);');
      expect(source.getData(839).reminderId).assertEqual(839);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2120020 end');
    })
  })
}
