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

export default function flipClockVolumeContact07Test() {
  describe('FlipClockVolumeContact07Test', () => {

    /**
     * @tc.name   testFlipClockVolume070001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_07_0001
     * @tc.desc   Verify source.totalCount() equals 121.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume070001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 121; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(121);');
      expect(source.totalCount()).assertEqual(121);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(120).reminderId).assertEqual(120);');
      expect(source.getData(120).reminderId).assertEqual(120);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070001 end');
    })

    /**
     * @tc.name   testFlipClockVolume070002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_07_0002
     * @tc.desc   Verify source.totalCount() equals 122.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume070002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 122; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(122);');
      expect(source.totalCount()).assertEqual(122);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(121).reminderId).assertEqual(121);');
      expect(source.getData(121).reminderId).assertEqual(121);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070002 end');
    })

    /**
     * @tc.name   testFlipClockVolume070003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_07_0003
     * @tc.desc   Verify source.totalCount() equals 123.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume070003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 123; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(123);');
      expect(source.totalCount()).assertEqual(123);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(122).reminderId).assertEqual(122);');
      expect(source.getData(122).reminderId).assertEqual(122);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070003 end');
    })

    /**
     * @tc.name   testFlipClockVolume070004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_07_0004
     * @tc.desc   Verify source.totalCount() equals 124.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume070004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 124; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(124);');
      expect(source.totalCount()).assertEqual(124);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(123).reminderId).assertEqual(123);');
      expect(source.getData(123).reminderId).assertEqual(123);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070004 end');
    })

    /**
     * @tc.name   testFlipClockVolume070005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_07_0005
     * @tc.desc   Verify source.totalCount() equals 125.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume070005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 125; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(125);');
      expect(source.totalCount()).assertEqual(125);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(124).reminderId).assertEqual(124);');
      expect(source.getData(124).reminderId).assertEqual(124);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070005 end');
    })

    /**
     * @tc.name   testFlipClockVolume070006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_07_0006
     * @tc.desc   Verify source.totalCount() equals 126.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume070006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 126; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(126);');
      expect(source.totalCount()).assertEqual(126);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(125).reminderId).assertEqual(125);');
      expect(source.getData(125).reminderId).assertEqual(125);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070006 end');
    })

    /**
     * @tc.name   testFlipClockVolume070007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_07_0007
     * @tc.desc   Verify source.totalCount() equals 127.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume070007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 127; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(127);');
      expect(source.totalCount()).assertEqual(127);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(126).reminderId).assertEqual(126);');
      expect(source.getData(126).reminderId).assertEqual(126);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070007 end');
    })

    /**
     * @tc.name   testFlipClockVolume070008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_07_0008
     * @tc.desc   Verify source.totalCount() equals 128.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume070008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 128; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(128);');
      expect(source.totalCount()).assertEqual(128);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(127).reminderId).assertEqual(127);');
      expect(source.getData(127).reminderId).assertEqual(127);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070008 end');
    })

    /**
     * @tc.name   testFlipClockVolume070009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_07_0009
     * @tc.desc   Verify source.totalCount() equals 129.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume070009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 129; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(129);');
      expect(source.totalCount()).assertEqual(129);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(128).reminderId).assertEqual(128);');
      expect(source.getData(128).reminderId).assertEqual(128);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070009 end');
    })

    /**
     * @tc.name   testFlipClockVolume070010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_07_0010
     * @tc.desc   Verify source.totalCount() equals 130.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume070010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 130; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(130);');
      expect(source.totalCount()).assertEqual(130);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(129).reminderId).assertEqual(129);');
      expect(source.getData(129).reminderId).assertEqual(129);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070010 end');
    })

    /**
     * @tc.name   testFlipClockVolume070011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_07_0011
     * @tc.desc   Verify source.totalCount() equals 131.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume070011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 131; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(131);');
      expect(source.totalCount()).assertEqual(131);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(130).reminderId).assertEqual(130);');
      expect(source.getData(130).reminderId).assertEqual(130);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070011 end');
    })

    /**
     * @tc.name   testFlipClockVolume070012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_07_0012
     * @tc.desc   Verify source.totalCount() equals 132.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume070012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 132; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(132);');
      expect(source.totalCount()).assertEqual(132);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(131).reminderId).assertEqual(131);');
      expect(source.getData(131).reminderId).assertEqual(131);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070012 end');
    })

    /**
     * @tc.name   testFlipClockVolume070013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_07_0013
     * @tc.desc   Verify source.totalCount() equals 133.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume070013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 133; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(133);');
      expect(source.totalCount()).assertEqual(133);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(132).reminderId).assertEqual(132);');
      expect(source.getData(132).reminderId).assertEqual(132);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070013 end');
    })

    /**
     * @tc.name   testFlipClockVolume070014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_07_0014
     * @tc.desc   Verify source.totalCount() equals 134.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume070014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 134; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(134);');
      expect(source.totalCount()).assertEqual(134);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(133).reminderId).assertEqual(133);');
      expect(source.getData(133).reminderId).assertEqual(133);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070014 end');
    })

    /**
     * @tc.name   testFlipClockVolume070015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_07_0015
     * @tc.desc   Verify source.totalCount() equals 135.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume070015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 135; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(135);');
      expect(source.totalCount()).assertEqual(135);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(134).reminderId).assertEqual(134);');
      expect(source.getData(134).reminderId).assertEqual(134);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070015 end');
    })

    /**
     * @tc.name   testFlipClockVolume070016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_07_0016
     * @tc.desc   Verify source.totalCount() equals 136.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume070016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 136; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(136);');
      expect(source.totalCount()).assertEqual(136);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(135).reminderId).assertEqual(135);');
      expect(source.getData(135).reminderId).assertEqual(135);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070016 end');
    })

    /**
     * @tc.name   testFlipClockVolume070017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_07_0017
     * @tc.desc   Verify source.totalCount() equals 137.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume070017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 137; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(137);');
      expect(source.totalCount()).assertEqual(137);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(136).reminderId).assertEqual(136);');
      expect(source.getData(136).reminderId).assertEqual(136);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070017 end');
    })

    /**
     * @tc.name   testFlipClockVolume070018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_07_0018
     * @tc.desc   Verify source.totalCount() equals 138.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume070018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 138; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(138);');
      expect(source.totalCount()).assertEqual(138);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(137).reminderId).assertEqual(137);');
      expect(source.getData(137).reminderId).assertEqual(137);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070018 end');
    })

    /**
     * @tc.name   testFlipClockVolume070019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_07_0019
     * @tc.desc   Verify source.totalCount() equals 139.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume070019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 139; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(139);');
      expect(source.totalCount()).assertEqual(139);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(138).reminderId).assertEqual(138);');
      expect(source.getData(138).reminderId).assertEqual(138);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070019 end');
    })

    /**
     * @tc.name   testFlipClockVolume070020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_07_0020
     * @tc.desc   Verify source.totalCount() equals 140.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume070020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 140; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(140);');
      expect(source.totalCount()).assertEqual(140);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(139).reminderId).assertEqual(139);');
      expect(source.getData(139).reminderId).assertEqual(139);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume070020 end');
    })
  })
}
