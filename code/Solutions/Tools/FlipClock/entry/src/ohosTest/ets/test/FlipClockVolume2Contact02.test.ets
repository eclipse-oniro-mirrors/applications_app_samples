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

export default function flipClockVolume2Contact02Test() {
  describe('FlipClockVolume2Contact02Test', () => {

    /**
     * @tc.name   testFlipClockVol2020001
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0001
     * @tc.desc   Verify source.totalCount() equals 621.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 621; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(621);');
      expect(source.totalCount()).assertEqual(621);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(620).reminderId).assertEqual(620);');
      expect(source.getData(620).reminderId).assertEqual(620);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020001 end');
    })

    /**
     * @tc.name   testFlipClockVol2020002
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0002
     * @tc.desc   Verify source.totalCount() equals 622.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 622; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(622);');
      expect(source.totalCount()).assertEqual(622);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(621).reminderId).assertEqual(621);');
      expect(source.getData(621).reminderId).assertEqual(621);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020002 end');
    })

    /**
     * @tc.name   testFlipClockVol2020003
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0003
     * @tc.desc   Verify source.totalCount() equals 623.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 623; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(623);');
      expect(source.totalCount()).assertEqual(623);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(622).reminderId).assertEqual(622);');
      expect(source.getData(622).reminderId).assertEqual(622);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020003 end');
    })

    /**
     * @tc.name   testFlipClockVol2020004
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0004
     * @tc.desc   Verify source.totalCount() equals 624.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 624; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(624);');
      expect(source.totalCount()).assertEqual(624);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(623).reminderId).assertEqual(623);');
      expect(source.getData(623).reminderId).assertEqual(623);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020004 end');
    })

    /**
     * @tc.name   testFlipClockVol2020005
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0005
     * @tc.desc   Verify source.totalCount() equals 625.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 625; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(625);');
      expect(source.totalCount()).assertEqual(625);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(624).reminderId).assertEqual(624);');
      expect(source.getData(624).reminderId).assertEqual(624);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020005 end');
    })

    /**
     * @tc.name   testFlipClockVol2020006
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0006
     * @tc.desc   Verify source.totalCount() equals 626.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 626; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(626);');
      expect(source.totalCount()).assertEqual(626);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(625).reminderId).assertEqual(625);');
      expect(source.getData(625).reminderId).assertEqual(625);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020006 end');
    })

    /**
     * @tc.name   testFlipClockVol2020007
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0007
     * @tc.desc   Verify source.totalCount() equals 627.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 627; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(627);');
      expect(source.totalCount()).assertEqual(627);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(626).reminderId).assertEqual(626);');
      expect(source.getData(626).reminderId).assertEqual(626);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020007 end');
    })

    /**
     * @tc.name   testFlipClockVol2020008
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0008
     * @tc.desc   Verify source.totalCount() equals 628.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 628; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(628);');
      expect(source.totalCount()).assertEqual(628);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(627).reminderId).assertEqual(627);');
      expect(source.getData(627).reminderId).assertEqual(627);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020008 end');
    })

    /**
     * @tc.name   testFlipClockVol2020009
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0009
     * @tc.desc   Verify source.totalCount() equals 629.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 629; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(629);');
      expect(source.totalCount()).assertEqual(629);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(628).reminderId).assertEqual(628);');
      expect(source.getData(628).reminderId).assertEqual(628);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020009 end');
    })

    /**
     * @tc.name   testFlipClockVol2020010
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0010
     * @tc.desc   Verify source.totalCount() equals 630.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 630; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(630);');
      expect(source.totalCount()).assertEqual(630);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(629).reminderId).assertEqual(629);');
      expect(source.getData(629).reminderId).assertEqual(629);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020010 end');
    })

    /**
     * @tc.name   testFlipClockVol2020011
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0011
     * @tc.desc   Verify source.totalCount() equals 631.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 631; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(631);');
      expect(source.totalCount()).assertEqual(631);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(630).reminderId).assertEqual(630);');
      expect(source.getData(630).reminderId).assertEqual(630);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020011 end');
    })

    /**
     * @tc.name   testFlipClockVol2020012
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0012
     * @tc.desc   Verify source.totalCount() equals 632.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 632; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(632);');
      expect(source.totalCount()).assertEqual(632);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(631).reminderId).assertEqual(631);');
      expect(source.getData(631).reminderId).assertEqual(631);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020012 end');
    })

    /**
     * @tc.name   testFlipClockVol2020013
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0013
     * @tc.desc   Verify source.totalCount() equals 633.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 633; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(633);');
      expect(source.totalCount()).assertEqual(633);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(632).reminderId).assertEqual(632);');
      expect(source.getData(632).reminderId).assertEqual(632);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020013 end');
    })

    /**
     * @tc.name   testFlipClockVol2020014
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0014
     * @tc.desc   Verify source.totalCount() equals 634.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 634; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(634);');
      expect(source.totalCount()).assertEqual(634);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(633).reminderId).assertEqual(633);');
      expect(source.getData(633).reminderId).assertEqual(633);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020014 end');
    })

    /**
     * @tc.name   testFlipClockVol2020015
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0015
     * @tc.desc   Verify source.totalCount() equals 635.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 635; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(635);');
      expect(source.totalCount()).assertEqual(635);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(634).reminderId).assertEqual(634);');
      expect(source.getData(634).reminderId).assertEqual(634);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020015 end');
    })

    /**
     * @tc.name   testFlipClockVol2020016
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0016
     * @tc.desc   Verify source.totalCount() equals 636.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 636; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(636);');
      expect(source.totalCount()).assertEqual(636);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(635).reminderId).assertEqual(635);');
      expect(source.getData(635).reminderId).assertEqual(635);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020016 end');
    })

    /**
     * @tc.name   testFlipClockVol2020017
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0017
     * @tc.desc   Verify source.totalCount() equals 637.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 637; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(637);');
      expect(source.totalCount()).assertEqual(637);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(636).reminderId).assertEqual(636);');
      expect(source.getData(636).reminderId).assertEqual(636);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020017 end');
    })

    /**
     * @tc.name   testFlipClockVol2020018
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0018
     * @tc.desc   Verify source.totalCount() equals 638.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 638; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(638);');
      expect(source.totalCount()).assertEqual(638);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(637).reminderId).assertEqual(637);');
      expect(source.getData(637).reminderId).assertEqual(637);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020018 end');
    })

    /**
     * @tc.name   testFlipClockVol2020019
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0019
     * @tc.desc   Verify source.totalCount() equals 639.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 639; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(639);');
      expect(source.totalCount()).assertEqual(639);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(638).reminderId).assertEqual(638);');
      expect(source.getData(638).reminderId).assertEqual(638);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020019 end');
    })

    /**
     * @tc.name   testFlipClockVol2020020
     * @tc.number SUB_FLIP_CLOCK_VOL2_02_0020
     * @tc.desc   Verify source.totalCount() equals 640.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2020020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 640; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(640);');
      expect(source.totalCount()).assertEqual(640);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(639).reminderId).assertEqual(639);');
      expect(source.getData(639).reminderId).assertEqual(639);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2020020 end');
    })
  })
}
