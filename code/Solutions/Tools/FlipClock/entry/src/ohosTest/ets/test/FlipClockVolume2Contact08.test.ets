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

export default function flipClockVolume2Contact08Test() {
  describe('FlipClockVolume2Contact08Test', () => {

    /**
     * @tc.name   testFlipClockVol2080001
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0001
     * @tc.desc   Verify source.totalCount() equals 741.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 741; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(741);');
      expect(source.totalCount()).assertEqual(741);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(740).reminderId).assertEqual(740);');
      expect(source.getData(740).reminderId).assertEqual(740);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080001 end');
    })

    /**
     * @tc.name   testFlipClockVol2080002
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0002
     * @tc.desc   Verify source.totalCount() equals 742.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 742; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(742);');
      expect(source.totalCount()).assertEqual(742);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(741).reminderId).assertEqual(741);');
      expect(source.getData(741).reminderId).assertEqual(741);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080002 end');
    })

    /**
     * @tc.name   testFlipClockVol2080003
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0003
     * @tc.desc   Verify source.totalCount() equals 743.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 743; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(743);');
      expect(source.totalCount()).assertEqual(743);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(742).reminderId).assertEqual(742);');
      expect(source.getData(742).reminderId).assertEqual(742);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080003 end');
    })

    /**
     * @tc.name   testFlipClockVol2080004
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0004
     * @tc.desc   Verify source.totalCount() equals 744.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 744; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(744);');
      expect(source.totalCount()).assertEqual(744);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(743).reminderId).assertEqual(743);');
      expect(source.getData(743).reminderId).assertEqual(743);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080004 end');
    })

    /**
     * @tc.name   testFlipClockVol2080005
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0005
     * @tc.desc   Verify source.totalCount() equals 745.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 745; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(745);');
      expect(source.totalCount()).assertEqual(745);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(744).reminderId).assertEqual(744);');
      expect(source.getData(744).reminderId).assertEqual(744);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080005 end');
    })

    /**
     * @tc.name   testFlipClockVol2080006
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0006
     * @tc.desc   Verify source.totalCount() equals 746.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 746; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(746);');
      expect(source.totalCount()).assertEqual(746);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(745).reminderId).assertEqual(745);');
      expect(source.getData(745).reminderId).assertEqual(745);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080006 end');
    })

    /**
     * @tc.name   testFlipClockVol2080007
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0007
     * @tc.desc   Verify source.totalCount() equals 747.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 747; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(747);');
      expect(source.totalCount()).assertEqual(747);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(746).reminderId).assertEqual(746);');
      expect(source.getData(746).reminderId).assertEqual(746);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080007 end');
    })

    /**
     * @tc.name   testFlipClockVol2080008
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0008
     * @tc.desc   Verify source.totalCount() equals 748.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 748; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(748);');
      expect(source.totalCount()).assertEqual(748);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(747).reminderId).assertEqual(747);');
      expect(source.getData(747).reminderId).assertEqual(747);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080008 end');
    })

    /**
     * @tc.name   testFlipClockVol2080009
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0009
     * @tc.desc   Verify source.totalCount() equals 749.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 749; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(749);');
      expect(source.totalCount()).assertEqual(749);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(748).reminderId).assertEqual(748);');
      expect(source.getData(748).reminderId).assertEqual(748);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080009 end');
    })

    /**
     * @tc.name   testFlipClockVol2080010
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0010
     * @tc.desc   Verify source.totalCount() equals 750.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 750; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(750);');
      expect(source.totalCount()).assertEqual(750);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(749).reminderId).assertEqual(749);');
      expect(source.getData(749).reminderId).assertEqual(749);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080010 end');
    })

    /**
     * @tc.name   testFlipClockVol2080011
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0011
     * @tc.desc   Verify source.totalCount() equals 751.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 751; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(751);');
      expect(source.totalCount()).assertEqual(751);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(750).reminderId).assertEqual(750);');
      expect(source.getData(750).reminderId).assertEqual(750);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080011 end');
    })

    /**
     * @tc.name   testFlipClockVol2080012
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0012
     * @tc.desc   Verify source.totalCount() equals 752.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 752; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(752);');
      expect(source.totalCount()).assertEqual(752);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(751).reminderId).assertEqual(751);');
      expect(source.getData(751).reminderId).assertEqual(751);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080012 end');
    })

    /**
     * @tc.name   testFlipClockVol2080013
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0013
     * @tc.desc   Verify source.totalCount() equals 753.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 753; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(753);');
      expect(source.totalCount()).assertEqual(753);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(752).reminderId).assertEqual(752);');
      expect(source.getData(752).reminderId).assertEqual(752);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080013 end');
    })

    /**
     * @tc.name   testFlipClockVol2080014
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0014
     * @tc.desc   Verify source.totalCount() equals 754.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 754; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(754);');
      expect(source.totalCount()).assertEqual(754);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(753).reminderId).assertEqual(753);');
      expect(source.getData(753).reminderId).assertEqual(753);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080014 end');
    })

    /**
     * @tc.name   testFlipClockVol2080015
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0015
     * @tc.desc   Verify source.totalCount() equals 755.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 755; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(755);');
      expect(source.totalCount()).assertEqual(755);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(754).reminderId).assertEqual(754);');
      expect(source.getData(754).reminderId).assertEqual(754);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080015 end');
    })

    /**
     * @tc.name   testFlipClockVol2080016
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0016
     * @tc.desc   Verify source.totalCount() equals 756.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 756; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(756);');
      expect(source.totalCount()).assertEqual(756);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(755).reminderId).assertEqual(755);');
      expect(source.getData(755).reminderId).assertEqual(755);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080016 end');
    })

    /**
     * @tc.name   testFlipClockVol2080017
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0017
     * @tc.desc   Verify source.totalCount() equals 757.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 757; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(757);');
      expect(source.totalCount()).assertEqual(757);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(756).reminderId).assertEqual(756);');
      expect(source.getData(756).reminderId).assertEqual(756);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080017 end');
    })

    /**
     * @tc.name   testFlipClockVol2080018
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0018
     * @tc.desc   Verify source.totalCount() equals 758.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 758; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(758);');
      expect(source.totalCount()).assertEqual(758);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(757).reminderId).assertEqual(757);');
      expect(source.getData(757).reminderId).assertEqual(757);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080018 end');
    })

    /**
     * @tc.name   testFlipClockVol2080019
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0019
     * @tc.desc   Verify source.totalCount() equals 759.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 759; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(759);');
      expect(source.totalCount()).assertEqual(759);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(758).reminderId).assertEqual(758);');
      expect(source.getData(758).reminderId).assertEqual(758);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080019 end');
    })

    /**
     * @tc.name   testFlipClockVol2080020
     * @tc.number SUB_FLIP_CLOCK_VOL2_08_0020
     * @tc.desc   Verify source.totalCount() equals 760.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2080020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 760; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(760);');
      expect(source.totalCount()).assertEqual(760);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(759).reminderId).assertEqual(759);');
      expect(source.getData(759).reminderId).assertEqual(759);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2080020 end');
    })
  })
}
