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

export default function flipClockVolumeContact17Test() {
  describe('FlipClockVolumeContact17Test', () => {

    /**
     * @tc.name   testFlipClockVolume170001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0001
     * @tc.desc   Verify source.totalCount() equals 321.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 321; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(321);');
      expect(source.totalCount()).assertEqual(321);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(320).reminderId).assertEqual(320);');
      expect(source.getData(320).reminderId).assertEqual(320);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170001 end');
    })

    /**
     * @tc.name   testFlipClockVolume170002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0002
     * @tc.desc   Verify source.totalCount() equals 322.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 322; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(322);');
      expect(source.totalCount()).assertEqual(322);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(321).reminderId).assertEqual(321);');
      expect(source.getData(321).reminderId).assertEqual(321);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170002 end');
    })

    /**
     * @tc.name   testFlipClockVolume170003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0003
     * @tc.desc   Verify source.totalCount() equals 323.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 323; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(323);');
      expect(source.totalCount()).assertEqual(323);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(322).reminderId).assertEqual(322);');
      expect(source.getData(322).reminderId).assertEqual(322);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170003 end');
    })

    /**
     * @tc.name   testFlipClockVolume170004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0004
     * @tc.desc   Verify source.totalCount() equals 324.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 324; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(324);');
      expect(source.totalCount()).assertEqual(324);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(323).reminderId).assertEqual(323);');
      expect(source.getData(323).reminderId).assertEqual(323);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170004 end');
    })

    /**
     * @tc.name   testFlipClockVolume170005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0005
     * @tc.desc   Verify source.totalCount() equals 325.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 325; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(325);');
      expect(source.totalCount()).assertEqual(325);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(324).reminderId).assertEqual(324);');
      expect(source.getData(324).reminderId).assertEqual(324);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170005 end');
    })

    /**
     * @tc.name   testFlipClockVolume170006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0006
     * @tc.desc   Verify source.totalCount() equals 326.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 326; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(326);');
      expect(source.totalCount()).assertEqual(326);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(325).reminderId).assertEqual(325);');
      expect(source.getData(325).reminderId).assertEqual(325);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170006 end');
    })

    /**
     * @tc.name   testFlipClockVolume170007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0007
     * @tc.desc   Verify source.totalCount() equals 327.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 327; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(327);');
      expect(source.totalCount()).assertEqual(327);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(326).reminderId).assertEqual(326);');
      expect(source.getData(326).reminderId).assertEqual(326);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170007 end');
    })

    /**
     * @tc.name   testFlipClockVolume170008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0008
     * @tc.desc   Verify source.totalCount() equals 328.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 328; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(328);');
      expect(source.totalCount()).assertEqual(328);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(327).reminderId).assertEqual(327);');
      expect(source.getData(327).reminderId).assertEqual(327);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170008 end');
    })

    /**
     * @tc.name   testFlipClockVolume170009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0009
     * @tc.desc   Verify source.totalCount() equals 329.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 329; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(329);');
      expect(source.totalCount()).assertEqual(329);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(328).reminderId).assertEqual(328);');
      expect(source.getData(328).reminderId).assertEqual(328);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170009 end');
    })

    /**
     * @tc.name   testFlipClockVolume170010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0010
     * @tc.desc   Verify source.totalCount() equals 330.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 330; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(330);');
      expect(source.totalCount()).assertEqual(330);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(329).reminderId).assertEqual(329);');
      expect(source.getData(329).reminderId).assertEqual(329);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170010 end');
    })

    /**
     * @tc.name   testFlipClockVolume170011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0011
     * @tc.desc   Verify source.totalCount() equals 331.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 331; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(331);');
      expect(source.totalCount()).assertEqual(331);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(330).reminderId).assertEqual(330);');
      expect(source.getData(330).reminderId).assertEqual(330);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170011 end');
    })

    /**
     * @tc.name   testFlipClockVolume170012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0012
     * @tc.desc   Verify source.totalCount() equals 332.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 332; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(332);');
      expect(source.totalCount()).assertEqual(332);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(331).reminderId).assertEqual(331);');
      expect(source.getData(331).reminderId).assertEqual(331);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170012 end');
    })

    /**
     * @tc.name   testFlipClockVolume170013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0013
     * @tc.desc   Verify source.totalCount() equals 333.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 333; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(333);');
      expect(source.totalCount()).assertEqual(333);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(332).reminderId).assertEqual(332);');
      expect(source.getData(332).reminderId).assertEqual(332);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170013 end');
    })

    /**
     * @tc.name   testFlipClockVolume170014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0014
     * @tc.desc   Verify source.totalCount() equals 334.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 334; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(334);');
      expect(source.totalCount()).assertEqual(334);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(333).reminderId).assertEqual(333);');
      expect(source.getData(333).reminderId).assertEqual(333);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170014 end');
    })

    /**
     * @tc.name   testFlipClockVolume170015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0015
     * @tc.desc   Verify source.totalCount() equals 335.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 335; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(335);');
      expect(source.totalCount()).assertEqual(335);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(334).reminderId).assertEqual(334);');
      expect(source.getData(334).reminderId).assertEqual(334);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170015 end');
    })

    /**
     * @tc.name   testFlipClockVolume170016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0016
     * @tc.desc   Verify source.totalCount() equals 336.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 336; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(336);');
      expect(source.totalCount()).assertEqual(336);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(335).reminderId).assertEqual(335);');
      expect(source.getData(335).reminderId).assertEqual(335);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170016 end');
    })

    /**
     * @tc.name   testFlipClockVolume170017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0017
     * @tc.desc   Verify source.totalCount() equals 337.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 337; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(337);');
      expect(source.totalCount()).assertEqual(337);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(336).reminderId).assertEqual(336);');
      expect(source.getData(336).reminderId).assertEqual(336);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170017 end');
    })

    /**
     * @tc.name   testFlipClockVolume170018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0018
     * @tc.desc   Verify source.totalCount() equals 338.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 338; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(338);');
      expect(source.totalCount()).assertEqual(338);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(337).reminderId).assertEqual(337);');
      expect(source.getData(337).reminderId).assertEqual(337);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170018 end');
    })

    /**
     * @tc.name   testFlipClockVolume170019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0019
     * @tc.desc   Verify source.totalCount() equals 339.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 339; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(339);');
      expect(source.totalCount()).assertEqual(339);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(338).reminderId).assertEqual(338);');
      expect(source.getData(338).reminderId).assertEqual(338);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170019 end');
    })

    /**
     * @tc.name   testFlipClockVolume170020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_17_0020
     * @tc.desc   Verify source.totalCount() equals 340.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume170020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 340; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(340);');
      expect(source.totalCount()).assertEqual(340);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(339).reminderId).assertEqual(339);');
      expect(source.getData(339).reminderId).assertEqual(339);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume170020 end');
    })
  })
}
