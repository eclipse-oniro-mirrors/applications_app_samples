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

export default function flipClockVolume2Contact11Test() {
  describe('FlipClockVolume2Contact11Test', () => {

    /**
     * @tc.name   testFlipClockVol2110001
     * @tc.number SUB_FLIP_CLOCK_VOL2_11_0001
     * @tc.desc   Verify source.totalCount() equals 801.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2110001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 801; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(801);');
      expect(source.totalCount()).assertEqual(801);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(800).reminderId).assertEqual(800);');
      expect(source.getData(800).reminderId).assertEqual(800);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110001 end');
    })

    /**
     * @tc.name   testFlipClockVol2110002
     * @tc.number SUB_FLIP_CLOCK_VOL2_11_0002
     * @tc.desc   Verify source.totalCount() equals 802.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2110002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 802; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(802);');
      expect(source.totalCount()).assertEqual(802);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(801).reminderId).assertEqual(801);');
      expect(source.getData(801).reminderId).assertEqual(801);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110002 end');
    })

    /**
     * @tc.name   testFlipClockVol2110003
     * @tc.number SUB_FLIP_CLOCK_VOL2_11_0003
     * @tc.desc   Verify source.totalCount() equals 803.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2110003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 803; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(803);');
      expect(source.totalCount()).assertEqual(803);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(802).reminderId).assertEqual(802);');
      expect(source.getData(802).reminderId).assertEqual(802);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110003 end');
    })

    /**
     * @tc.name   testFlipClockVol2110004
     * @tc.number SUB_FLIP_CLOCK_VOL2_11_0004
     * @tc.desc   Verify source.totalCount() equals 804.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2110004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 804; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(804);');
      expect(source.totalCount()).assertEqual(804);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(803).reminderId).assertEqual(803);');
      expect(source.getData(803).reminderId).assertEqual(803);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110004 end');
    })

    /**
     * @tc.name   testFlipClockVol2110005
     * @tc.number SUB_FLIP_CLOCK_VOL2_11_0005
     * @tc.desc   Verify source.totalCount() equals 805.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2110005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 805; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(805);');
      expect(source.totalCount()).assertEqual(805);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(804).reminderId).assertEqual(804);');
      expect(source.getData(804).reminderId).assertEqual(804);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110005 end');
    })

    /**
     * @tc.name   testFlipClockVol2110006
     * @tc.number SUB_FLIP_CLOCK_VOL2_11_0006
     * @tc.desc   Verify source.totalCount() equals 806.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2110006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 806; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(806);');
      expect(source.totalCount()).assertEqual(806);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(805).reminderId).assertEqual(805);');
      expect(source.getData(805).reminderId).assertEqual(805);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110006 end');
    })

    /**
     * @tc.name   testFlipClockVol2110007
     * @tc.number SUB_FLIP_CLOCK_VOL2_11_0007
     * @tc.desc   Verify source.totalCount() equals 807.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2110007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 807; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(807);');
      expect(source.totalCount()).assertEqual(807);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(806).reminderId).assertEqual(806);');
      expect(source.getData(806).reminderId).assertEqual(806);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110007 end');
    })

    /**
     * @tc.name   testFlipClockVol2110008
     * @tc.number SUB_FLIP_CLOCK_VOL2_11_0008
     * @tc.desc   Verify source.totalCount() equals 808.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2110008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 808; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(808);');
      expect(source.totalCount()).assertEqual(808);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(807).reminderId).assertEqual(807);');
      expect(source.getData(807).reminderId).assertEqual(807);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110008 end');
    })

    /**
     * @tc.name   testFlipClockVol2110009
     * @tc.number SUB_FLIP_CLOCK_VOL2_11_0009
     * @tc.desc   Verify source.totalCount() equals 809.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2110009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 809; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(809);');
      expect(source.totalCount()).assertEqual(809);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(808).reminderId).assertEqual(808);');
      expect(source.getData(808).reminderId).assertEqual(808);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110009 end');
    })

    /**
     * @tc.name   testFlipClockVol2110010
     * @tc.number SUB_FLIP_CLOCK_VOL2_11_0010
     * @tc.desc   Verify source.totalCount() equals 810.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2110010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 810; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(810);');
      expect(source.totalCount()).assertEqual(810);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(809).reminderId).assertEqual(809);');
      expect(source.getData(809).reminderId).assertEqual(809);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110010 end');
    })

    /**
     * @tc.name   testFlipClockVol2110011
     * @tc.number SUB_FLIP_CLOCK_VOL2_11_0011
     * @tc.desc   Verify source.totalCount() equals 811.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2110011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 811; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(811);');
      expect(source.totalCount()).assertEqual(811);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(810).reminderId).assertEqual(810);');
      expect(source.getData(810).reminderId).assertEqual(810);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110011 end');
    })

    /**
     * @tc.name   testFlipClockVol2110012
     * @tc.number SUB_FLIP_CLOCK_VOL2_11_0012
     * @tc.desc   Verify source.totalCount() equals 812.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2110012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 812; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(812);');
      expect(source.totalCount()).assertEqual(812);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(811).reminderId).assertEqual(811);');
      expect(source.getData(811).reminderId).assertEqual(811);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110012 end');
    })

    /**
     * @tc.name   testFlipClockVol2110013
     * @tc.number SUB_FLIP_CLOCK_VOL2_11_0013
     * @tc.desc   Verify source.totalCount() equals 813.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2110013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 813; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(813);');
      expect(source.totalCount()).assertEqual(813);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(812).reminderId).assertEqual(812);');
      expect(source.getData(812).reminderId).assertEqual(812);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110013 end');
    })

    /**
     * @tc.name   testFlipClockVol2110014
     * @tc.number SUB_FLIP_CLOCK_VOL2_11_0014
     * @tc.desc   Verify source.totalCount() equals 814.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2110014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 814; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(814);');
      expect(source.totalCount()).assertEqual(814);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(813).reminderId).assertEqual(813);');
      expect(source.getData(813).reminderId).assertEqual(813);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110014 end');
    })

    /**
     * @tc.name   testFlipClockVol2110015
     * @tc.number SUB_FLIP_CLOCK_VOL2_11_0015
     * @tc.desc   Verify source.totalCount() equals 815.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2110015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 815; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(815);');
      expect(source.totalCount()).assertEqual(815);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(814).reminderId).assertEqual(814);');
      expect(source.getData(814).reminderId).assertEqual(814);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110015 end');
    })

    /**
     * @tc.name   testFlipClockVol2110016
     * @tc.number SUB_FLIP_CLOCK_VOL2_11_0016
     * @tc.desc   Verify source.totalCount() equals 816.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2110016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 816; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(816);');
      expect(source.totalCount()).assertEqual(816);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(815).reminderId).assertEqual(815);');
      expect(source.getData(815).reminderId).assertEqual(815);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110016 end');
    })

    /**
     * @tc.name   testFlipClockVol2110017
     * @tc.number SUB_FLIP_CLOCK_VOL2_11_0017
     * @tc.desc   Verify source.totalCount() equals 817.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2110017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 817; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(817);');
      expect(source.totalCount()).assertEqual(817);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(816).reminderId).assertEqual(816);');
      expect(source.getData(816).reminderId).assertEqual(816);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110017 end');
    })

    /**
     * @tc.name   testFlipClockVol2110018
     * @tc.number SUB_FLIP_CLOCK_VOL2_11_0018
     * @tc.desc   Verify source.totalCount() equals 818.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2110018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 818; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(818);');
      expect(source.totalCount()).assertEqual(818);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(817).reminderId).assertEqual(817);');
      expect(source.getData(817).reminderId).assertEqual(817);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110018 end');
    })

    /**
     * @tc.name   testFlipClockVol2110019
     * @tc.number SUB_FLIP_CLOCK_VOL2_11_0019
     * @tc.desc   Verify source.totalCount() equals 819.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2110019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 819; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(819);');
      expect(source.totalCount()).assertEqual(819);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(818).reminderId).assertEqual(818);');
      expect(source.getData(818).reminderId).assertEqual(818);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110019 end');
    })

    /**
     * @tc.name   testFlipClockVol2110020
     * @tc.number SUB_FLIP_CLOCK_VOL2_11_0020
     * @tc.desc   Verify source.totalCount() equals 820.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2110020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 820; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(820);');
      expect(source.totalCount()).assertEqual(820);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(819).reminderId).assertEqual(819);');
      expect(source.getData(819).reminderId).assertEqual(819);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2110020 end');
    })
  })
}
