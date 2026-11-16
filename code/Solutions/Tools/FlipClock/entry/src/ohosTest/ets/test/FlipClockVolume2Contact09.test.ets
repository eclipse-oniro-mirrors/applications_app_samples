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

export default function flipClockVolume2Contact09Test() {
  describe('FlipClockVolume2Contact09Test', () => {

    /**
     * @tc.name   testFlipClockVol2090001
     * @tc.number SUB_FLIP_CLOCK_VOL2_09_0001
     * @tc.desc   Verify source.totalCount() equals 761.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2090001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 761; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(761);');
      expect(source.totalCount()).assertEqual(761);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(760).reminderId).assertEqual(760);');
      expect(source.getData(760).reminderId).assertEqual(760);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090001 end');
    })

    /**
     * @tc.name   testFlipClockVol2090002
     * @tc.number SUB_FLIP_CLOCK_VOL2_09_0002
     * @tc.desc   Verify source.totalCount() equals 762.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2090002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 762; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(762);');
      expect(source.totalCount()).assertEqual(762);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(761).reminderId).assertEqual(761);');
      expect(source.getData(761).reminderId).assertEqual(761);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090002 end');
    })

    /**
     * @tc.name   testFlipClockVol2090003
     * @tc.number SUB_FLIP_CLOCK_VOL2_09_0003
     * @tc.desc   Verify source.totalCount() equals 763.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2090003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 763; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(763);');
      expect(source.totalCount()).assertEqual(763);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(762).reminderId).assertEqual(762);');
      expect(source.getData(762).reminderId).assertEqual(762);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090003 end');
    })

    /**
     * @tc.name   testFlipClockVol2090004
     * @tc.number SUB_FLIP_CLOCK_VOL2_09_0004
     * @tc.desc   Verify source.totalCount() equals 764.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2090004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 764; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(764);');
      expect(source.totalCount()).assertEqual(764);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(763).reminderId).assertEqual(763);');
      expect(source.getData(763).reminderId).assertEqual(763);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090004 end');
    })

    /**
     * @tc.name   testFlipClockVol2090005
     * @tc.number SUB_FLIP_CLOCK_VOL2_09_0005
     * @tc.desc   Verify source.totalCount() equals 765.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2090005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 765; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(765);');
      expect(source.totalCount()).assertEqual(765);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(764).reminderId).assertEqual(764);');
      expect(source.getData(764).reminderId).assertEqual(764);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090005 end');
    })

    /**
     * @tc.name   testFlipClockVol2090006
     * @tc.number SUB_FLIP_CLOCK_VOL2_09_0006
     * @tc.desc   Verify source.totalCount() equals 766.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2090006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 766; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(766);');
      expect(source.totalCount()).assertEqual(766);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(765).reminderId).assertEqual(765);');
      expect(source.getData(765).reminderId).assertEqual(765);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090006 end');
    })

    /**
     * @tc.name   testFlipClockVol2090007
     * @tc.number SUB_FLIP_CLOCK_VOL2_09_0007
     * @tc.desc   Verify source.totalCount() equals 767.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2090007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 767; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(767);');
      expect(source.totalCount()).assertEqual(767);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(766).reminderId).assertEqual(766);');
      expect(source.getData(766).reminderId).assertEqual(766);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090007 end');
    })

    /**
     * @tc.name   testFlipClockVol2090008
     * @tc.number SUB_FLIP_CLOCK_VOL2_09_0008
     * @tc.desc   Verify source.totalCount() equals 768.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2090008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 768; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(768);');
      expect(source.totalCount()).assertEqual(768);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(767).reminderId).assertEqual(767);');
      expect(source.getData(767).reminderId).assertEqual(767);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090008 end');
    })

    /**
     * @tc.name   testFlipClockVol2090009
     * @tc.number SUB_FLIP_CLOCK_VOL2_09_0009
     * @tc.desc   Verify source.totalCount() equals 769.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2090009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 769; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(769);');
      expect(source.totalCount()).assertEqual(769);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(768).reminderId).assertEqual(768);');
      expect(source.getData(768).reminderId).assertEqual(768);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090009 end');
    })

    /**
     * @tc.name   testFlipClockVol2090010
     * @tc.number SUB_FLIP_CLOCK_VOL2_09_0010
     * @tc.desc   Verify source.totalCount() equals 770.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2090010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 770; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(770);');
      expect(source.totalCount()).assertEqual(770);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(769).reminderId).assertEqual(769);');
      expect(source.getData(769).reminderId).assertEqual(769);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090010 end');
    })

    /**
     * @tc.name   testFlipClockVol2090011
     * @tc.number SUB_FLIP_CLOCK_VOL2_09_0011
     * @tc.desc   Verify source.totalCount() equals 771.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2090011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 771; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(771);');
      expect(source.totalCount()).assertEqual(771);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(770).reminderId).assertEqual(770);');
      expect(source.getData(770).reminderId).assertEqual(770);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090011 end');
    })

    /**
     * @tc.name   testFlipClockVol2090012
     * @tc.number SUB_FLIP_CLOCK_VOL2_09_0012
     * @tc.desc   Verify source.totalCount() equals 772.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2090012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 772; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(772);');
      expect(source.totalCount()).assertEqual(772);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(771).reminderId).assertEqual(771);');
      expect(source.getData(771).reminderId).assertEqual(771);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090012 end');
    })

    /**
     * @tc.name   testFlipClockVol2090013
     * @tc.number SUB_FLIP_CLOCK_VOL2_09_0013
     * @tc.desc   Verify source.totalCount() equals 773.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2090013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 773; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(773);');
      expect(source.totalCount()).assertEqual(773);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(772).reminderId).assertEqual(772);');
      expect(source.getData(772).reminderId).assertEqual(772);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090013 end');
    })

    /**
     * @tc.name   testFlipClockVol2090014
     * @tc.number SUB_FLIP_CLOCK_VOL2_09_0014
     * @tc.desc   Verify source.totalCount() equals 774.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2090014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 774; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(774);');
      expect(source.totalCount()).assertEqual(774);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(773).reminderId).assertEqual(773);');
      expect(source.getData(773).reminderId).assertEqual(773);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090014 end');
    })

    /**
     * @tc.name   testFlipClockVol2090015
     * @tc.number SUB_FLIP_CLOCK_VOL2_09_0015
     * @tc.desc   Verify source.totalCount() equals 775.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2090015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 775; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(775);');
      expect(source.totalCount()).assertEqual(775);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(774).reminderId).assertEqual(774);');
      expect(source.getData(774).reminderId).assertEqual(774);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090015 end');
    })

    /**
     * @tc.name   testFlipClockVol2090016
     * @tc.number SUB_FLIP_CLOCK_VOL2_09_0016
     * @tc.desc   Verify source.totalCount() equals 776.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2090016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 776; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(776);');
      expect(source.totalCount()).assertEqual(776);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(775).reminderId).assertEqual(775);');
      expect(source.getData(775).reminderId).assertEqual(775);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090016 end');
    })

    /**
     * @tc.name   testFlipClockVol2090017
     * @tc.number SUB_FLIP_CLOCK_VOL2_09_0017
     * @tc.desc   Verify source.totalCount() equals 777.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2090017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 777; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(777);');
      expect(source.totalCount()).assertEqual(777);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(776).reminderId).assertEqual(776);');
      expect(source.getData(776).reminderId).assertEqual(776);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090017 end');
    })

    /**
     * @tc.name   testFlipClockVol2090018
     * @tc.number SUB_FLIP_CLOCK_VOL2_09_0018
     * @tc.desc   Verify source.totalCount() equals 778.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2090018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 778; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(778);');
      expect(source.totalCount()).assertEqual(778);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(777).reminderId).assertEqual(777);');
      expect(source.getData(777).reminderId).assertEqual(777);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090018 end');
    })

    /**
     * @tc.name   testFlipClockVol2090019
     * @tc.number SUB_FLIP_CLOCK_VOL2_09_0019
     * @tc.desc   Verify source.totalCount() equals 779.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2090019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 779; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(779);');
      expect(source.totalCount()).assertEqual(779);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(778).reminderId).assertEqual(778);');
      expect(source.getData(778).reminderId).assertEqual(778);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090019 end');
    })

    /**
     * @tc.name   testFlipClockVol2090020
     * @tc.number SUB_FLIP_CLOCK_VOL2_09_0020
     * @tc.desc   Verify source.totalCount() equals 780.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2090020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 780; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(780);');
      expect(source.totalCount()).assertEqual(780);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(779).reminderId).assertEqual(779);');
      expect(source.getData(779).reminderId).assertEqual(779);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2090020 end');
    })
  })
}
