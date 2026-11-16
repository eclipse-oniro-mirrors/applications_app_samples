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

export default function flipClockVolume2Contact07Test() {
  describe('FlipClockVolume2Contact07Test', () => {

    /**
     * @tc.name   testFlipClockVol2070001
     * @tc.number SUB_FLIP_CLOCK_VOL2_07_0001
     * @tc.desc   Verify source.totalCount() equals 721.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2070001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 721; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(721);');
      expect(source.totalCount()).assertEqual(721);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(720).reminderId).assertEqual(720);');
      expect(source.getData(720).reminderId).assertEqual(720);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070001 end');
    })

    /**
     * @tc.name   testFlipClockVol2070002
     * @tc.number SUB_FLIP_CLOCK_VOL2_07_0002
     * @tc.desc   Verify source.totalCount() equals 722.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2070002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 722; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(722);');
      expect(source.totalCount()).assertEqual(722);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(721).reminderId).assertEqual(721);');
      expect(source.getData(721).reminderId).assertEqual(721);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070002 end');
    })

    /**
     * @tc.name   testFlipClockVol2070003
     * @tc.number SUB_FLIP_CLOCK_VOL2_07_0003
     * @tc.desc   Verify source.totalCount() equals 723.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2070003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 723; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(723);');
      expect(source.totalCount()).assertEqual(723);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(722).reminderId).assertEqual(722);');
      expect(source.getData(722).reminderId).assertEqual(722);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070003 end');
    })

    /**
     * @tc.name   testFlipClockVol2070004
     * @tc.number SUB_FLIP_CLOCK_VOL2_07_0004
     * @tc.desc   Verify source.totalCount() equals 724.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2070004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 724; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(724);');
      expect(source.totalCount()).assertEqual(724);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(723).reminderId).assertEqual(723);');
      expect(source.getData(723).reminderId).assertEqual(723);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070004 end');
    })

    /**
     * @tc.name   testFlipClockVol2070005
     * @tc.number SUB_FLIP_CLOCK_VOL2_07_0005
     * @tc.desc   Verify source.totalCount() equals 725.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2070005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 725; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(725);');
      expect(source.totalCount()).assertEqual(725);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(724).reminderId).assertEqual(724);');
      expect(source.getData(724).reminderId).assertEqual(724);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070005 end');
    })

    /**
     * @tc.name   testFlipClockVol2070006
     * @tc.number SUB_FLIP_CLOCK_VOL2_07_0006
     * @tc.desc   Verify source.totalCount() equals 726.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2070006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 726; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(726);');
      expect(source.totalCount()).assertEqual(726);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(725).reminderId).assertEqual(725);');
      expect(source.getData(725).reminderId).assertEqual(725);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070006 end');
    })

    /**
     * @tc.name   testFlipClockVol2070007
     * @tc.number SUB_FLIP_CLOCK_VOL2_07_0007
     * @tc.desc   Verify source.totalCount() equals 727.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2070007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 727; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(727);');
      expect(source.totalCount()).assertEqual(727);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(726).reminderId).assertEqual(726);');
      expect(source.getData(726).reminderId).assertEqual(726);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070007 end');
    })

    /**
     * @tc.name   testFlipClockVol2070008
     * @tc.number SUB_FLIP_CLOCK_VOL2_07_0008
     * @tc.desc   Verify source.totalCount() equals 728.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2070008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 728; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(728);');
      expect(source.totalCount()).assertEqual(728);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(727).reminderId).assertEqual(727);');
      expect(source.getData(727).reminderId).assertEqual(727);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070008 end');
    })

    /**
     * @tc.name   testFlipClockVol2070009
     * @tc.number SUB_FLIP_CLOCK_VOL2_07_0009
     * @tc.desc   Verify source.totalCount() equals 729.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2070009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 729; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(729);');
      expect(source.totalCount()).assertEqual(729);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(728).reminderId).assertEqual(728);');
      expect(source.getData(728).reminderId).assertEqual(728);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070009 end');
    })

    /**
     * @tc.name   testFlipClockVol2070010
     * @tc.number SUB_FLIP_CLOCK_VOL2_07_0010
     * @tc.desc   Verify source.totalCount() equals 730.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2070010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 730; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(730);');
      expect(source.totalCount()).assertEqual(730);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(729).reminderId).assertEqual(729);');
      expect(source.getData(729).reminderId).assertEqual(729);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070010 end');
    })

    /**
     * @tc.name   testFlipClockVol2070011
     * @tc.number SUB_FLIP_CLOCK_VOL2_07_0011
     * @tc.desc   Verify source.totalCount() equals 731.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2070011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 731; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(731);');
      expect(source.totalCount()).assertEqual(731);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(730).reminderId).assertEqual(730);');
      expect(source.getData(730).reminderId).assertEqual(730);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070011 end');
    })

    /**
     * @tc.name   testFlipClockVol2070012
     * @tc.number SUB_FLIP_CLOCK_VOL2_07_0012
     * @tc.desc   Verify source.totalCount() equals 732.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2070012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 732; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(732);');
      expect(source.totalCount()).assertEqual(732);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(731).reminderId).assertEqual(731);');
      expect(source.getData(731).reminderId).assertEqual(731);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070012 end');
    })

    /**
     * @tc.name   testFlipClockVol2070013
     * @tc.number SUB_FLIP_CLOCK_VOL2_07_0013
     * @tc.desc   Verify source.totalCount() equals 733.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2070013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 733; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(733);');
      expect(source.totalCount()).assertEqual(733);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(732).reminderId).assertEqual(732);');
      expect(source.getData(732).reminderId).assertEqual(732);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070013 end');
    })

    /**
     * @tc.name   testFlipClockVol2070014
     * @tc.number SUB_FLIP_CLOCK_VOL2_07_0014
     * @tc.desc   Verify source.totalCount() equals 734.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2070014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 734; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(734);');
      expect(source.totalCount()).assertEqual(734);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(733).reminderId).assertEqual(733);');
      expect(source.getData(733).reminderId).assertEqual(733);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070014 end');
    })

    /**
     * @tc.name   testFlipClockVol2070015
     * @tc.number SUB_FLIP_CLOCK_VOL2_07_0015
     * @tc.desc   Verify source.totalCount() equals 735.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2070015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 735; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(735);');
      expect(source.totalCount()).assertEqual(735);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(734).reminderId).assertEqual(734);');
      expect(source.getData(734).reminderId).assertEqual(734);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070015 end');
    })

    /**
     * @tc.name   testFlipClockVol2070016
     * @tc.number SUB_FLIP_CLOCK_VOL2_07_0016
     * @tc.desc   Verify source.totalCount() equals 736.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2070016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 736; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(736);');
      expect(source.totalCount()).assertEqual(736);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(735).reminderId).assertEqual(735);');
      expect(source.getData(735).reminderId).assertEqual(735);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070016 end');
    })

    /**
     * @tc.name   testFlipClockVol2070017
     * @tc.number SUB_FLIP_CLOCK_VOL2_07_0017
     * @tc.desc   Verify source.totalCount() equals 737.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2070017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 737; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(737);');
      expect(source.totalCount()).assertEqual(737);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(736).reminderId).assertEqual(736);');
      expect(source.getData(736).reminderId).assertEqual(736);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070017 end');
    })

    /**
     * @tc.name   testFlipClockVol2070018
     * @tc.number SUB_FLIP_CLOCK_VOL2_07_0018
     * @tc.desc   Verify source.totalCount() equals 738.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2070018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 738; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(738);');
      expect(source.totalCount()).assertEqual(738);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(737).reminderId).assertEqual(737);');
      expect(source.getData(737).reminderId).assertEqual(737);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070018 end');
    })

    /**
     * @tc.name   testFlipClockVol2070019
     * @tc.number SUB_FLIP_CLOCK_VOL2_07_0019
     * @tc.desc   Verify source.totalCount() equals 739.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2070019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 739; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(739);');
      expect(source.totalCount()).assertEqual(739);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(738).reminderId).assertEqual(738);');
      expect(source.getData(738).reminderId).assertEqual(738);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070019 end');
    })

    /**
     * @tc.name   testFlipClockVol2070020
     * @tc.number SUB_FLIP_CLOCK_VOL2_07_0020
     * @tc.desc   Verify source.totalCount() equals 740.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2070020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 740; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(740);');
      expect(source.totalCount()).assertEqual(740);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(739).reminderId).assertEqual(739);');
      expect(source.getData(739).reminderId).assertEqual(739);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2070020 end');
    })
  })
}
