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

export default function flipClockVolumeContact06Test() {
  describe('FlipClockVolumeContact06Test', () => {

    /**
     * @tc.name   testFlipClockVolume060001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0001
     * @tc.desc   Verify source.totalCount() equals 101.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 101; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(101);');
      expect(source.totalCount()).assertEqual(101);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(100).reminderId).assertEqual(100);');
      expect(source.getData(100).reminderId).assertEqual(100);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060001 end');
    })

    /**
     * @tc.name   testFlipClockVolume060002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0002
     * @tc.desc   Verify source.totalCount() equals 102.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 102; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(102);');
      expect(source.totalCount()).assertEqual(102);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(101).reminderId).assertEqual(101);');
      expect(source.getData(101).reminderId).assertEqual(101);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060002 end');
    })

    /**
     * @tc.name   testFlipClockVolume060003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0003
     * @tc.desc   Verify source.totalCount() equals 103.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 103; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(103);');
      expect(source.totalCount()).assertEqual(103);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(102).reminderId).assertEqual(102);');
      expect(source.getData(102).reminderId).assertEqual(102);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060003 end');
    })

    /**
     * @tc.name   testFlipClockVolume060004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0004
     * @tc.desc   Verify source.totalCount() equals 104.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 104; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(104);');
      expect(source.totalCount()).assertEqual(104);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(103).reminderId).assertEqual(103);');
      expect(source.getData(103).reminderId).assertEqual(103);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060004 end');
    })

    /**
     * @tc.name   testFlipClockVolume060005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0005
     * @tc.desc   Verify source.totalCount() equals 105.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 105; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(105);');
      expect(source.totalCount()).assertEqual(105);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(104).reminderId).assertEqual(104);');
      expect(source.getData(104).reminderId).assertEqual(104);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060005 end');
    })

    /**
     * @tc.name   testFlipClockVolume060006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0006
     * @tc.desc   Verify source.totalCount() equals 106.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 106; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(106);');
      expect(source.totalCount()).assertEqual(106);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(105).reminderId).assertEqual(105);');
      expect(source.getData(105).reminderId).assertEqual(105);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060006 end');
    })

    /**
     * @tc.name   testFlipClockVolume060007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0007
     * @tc.desc   Verify source.totalCount() equals 107.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 107; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(107);');
      expect(source.totalCount()).assertEqual(107);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(106).reminderId).assertEqual(106);');
      expect(source.getData(106).reminderId).assertEqual(106);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060007 end');
    })

    /**
     * @tc.name   testFlipClockVolume060008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0008
     * @tc.desc   Verify source.totalCount() equals 108.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 108; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(108);');
      expect(source.totalCount()).assertEqual(108);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(107).reminderId).assertEqual(107);');
      expect(source.getData(107).reminderId).assertEqual(107);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060008 end');
    })

    /**
     * @tc.name   testFlipClockVolume060009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0009
     * @tc.desc   Verify source.totalCount() equals 109.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 109; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(109);');
      expect(source.totalCount()).assertEqual(109);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(108).reminderId).assertEqual(108);');
      expect(source.getData(108).reminderId).assertEqual(108);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060009 end');
    })

    /**
     * @tc.name   testFlipClockVolume060010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0010
     * @tc.desc   Verify source.totalCount() equals 110.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 110; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(110);');
      expect(source.totalCount()).assertEqual(110);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(109).reminderId).assertEqual(109);');
      expect(source.getData(109).reminderId).assertEqual(109);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060010 end');
    })

    /**
     * @tc.name   testFlipClockVolume060011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0011
     * @tc.desc   Verify source.totalCount() equals 111.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 111; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(111);');
      expect(source.totalCount()).assertEqual(111);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(110).reminderId).assertEqual(110);');
      expect(source.getData(110).reminderId).assertEqual(110);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060011 end');
    })

    /**
     * @tc.name   testFlipClockVolume060012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0012
     * @tc.desc   Verify source.totalCount() equals 112.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 112; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(112);');
      expect(source.totalCount()).assertEqual(112);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(111).reminderId).assertEqual(111);');
      expect(source.getData(111).reminderId).assertEqual(111);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060012 end');
    })

    /**
     * @tc.name   testFlipClockVolume060013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0013
     * @tc.desc   Verify source.totalCount() equals 113.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 113; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(113);');
      expect(source.totalCount()).assertEqual(113);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(112).reminderId).assertEqual(112);');
      expect(source.getData(112).reminderId).assertEqual(112);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060013 end');
    })

    /**
     * @tc.name   testFlipClockVolume060014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0014
     * @tc.desc   Verify source.totalCount() equals 114.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 114; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(114);');
      expect(source.totalCount()).assertEqual(114);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(113).reminderId).assertEqual(113);');
      expect(source.getData(113).reminderId).assertEqual(113);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060014 end');
    })

    /**
     * @tc.name   testFlipClockVolume060015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0015
     * @tc.desc   Verify source.totalCount() equals 115.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 115; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(115);');
      expect(source.totalCount()).assertEqual(115);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(114).reminderId).assertEqual(114);');
      expect(source.getData(114).reminderId).assertEqual(114);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060015 end');
    })

    /**
     * @tc.name   testFlipClockVolume060016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0016
     * @tc.desc   Verify source.totalCount() equals 116.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 116; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(116);');
      expect(source.totalCount()).assertEqual(116);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(115).reminderId).assertEqual(115);');
      expect(source.getData(115).reminderId).assertEqual(115);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060016 end');
    })

    /**
     * @tc.name   testFlipClockVolume060017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0017
     * @tc.desc   Verify source.totalCount() equals 117.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 117; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(117);');
      expect(source.totalCount()).assertEqual(117);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(116).reminderId).assertEqual(116);');
      expect(source.getData(116).reminderId).assertEqual(116);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060017 end');
    })

    /**
     * @tc.name   testFlipClockVolume060018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0018
     * @tc.desc   Verify source.totalCount() equals 118.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 118; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(118);');
      expect(source.totalCount()).assertEqual(118);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(117).reminderId).assertEqual(117);');
      expect(source.getData(117).reminderId).assertEqual(117);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060018 end');
    })

    /**
     * @tc.name   testFlipClockVolume060019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0019
     * @tc.desc   Verify source.totalCount() equals 119.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 119; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(119);');
      expect(source.totalCount()).assertEqual(119);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(118).reminderId).assertEqual(118);');
      expect(source.getData(118).reminderId).assertEqual(118);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060019 end');
    })

    /**
     * @tc.name   testFlipClockVolume060020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_06_0020
     * @tc.desc   Verify source.totalCount() equals 120.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume060020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 120; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(120);');
      expect(source.totalCount()).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(119).reminderId).assertEqual(119);');
      expect(source.getData(119).reminderId).assertEqual(119);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume060020 end');
    })
  })
}
