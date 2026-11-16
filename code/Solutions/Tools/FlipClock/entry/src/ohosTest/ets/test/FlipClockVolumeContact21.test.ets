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

export default function flipClockVolumeContact21Test() {
  describe('FlipClockVolumeContact21Test', () => {

    /**
     * @tc.name   testFlipClockVolume210001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_21_0001
     * @tc.desc   Verify source.totalCount() equals 401.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume210001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 401; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(401);');
      expect(source.totalCount()).assertEqual(401);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(400).reminderId).assertEqual(400);');
      expect(source.getData(400).reminderId).assertEqual(400);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210001 end');
    })

    /**
     * @tc.name   testFlipClockVolume210002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_21_0002
     * @tc.desc   Verify source.totalCount() equals 402.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume210002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 402; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(402);');
      expect(source.totalCount()).assertEqual(402);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(401).reminderId).assertEqual(401);');
      expect(source.getData(401).reminderId).assertEqual(401);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210002 end');
    })

    /**
     * @tc.name   testFlipClockVolume210003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_21_0003
     * @tc.desc   Verify source.totalCount() equals 403.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume210003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 403; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(403);');
      expect(source.totalCount()).assertEqual(403);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(402).reminderId).assertEqual(402);');
      expect(source.getData(402).reminderId).assertEqual(402);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210003 end');
    })

    /**
     * @tc.name   testFlipClockVolume210004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_21_0004
     * @tc.desc   Verify source.totalCount() equals 404.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume210004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 404; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(404);');
      expect(source.totalCount()).assertEqual(404);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(403).reminderId).assertEqual(403);');
      expect(source.getData(403).reminderId).assertEqual(403);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210004 end');
    })

    /**
     * @tc.name   testFlipClockVolume210005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_21_0005
     * @tc.desc   Verify source.totalCount() equals 405.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume210005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 405; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(405);');
      expect(source.totalCount()).assertEqual(405);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(404).reminderId).assertEqual(404);');
      expect(source.getData(404).reminderId).assertEqual(404);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210005 end');
    })

    /**
     * @tc.name   testFlipClockVolume210006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_21_0006
     * @tc.desc   Verify source.totalCount() equals 406.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume210006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 406; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(406);');
      expect(source.totalCount()).assertEqual(406);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(405).reminderId).assertEqual(405);');
      expect(source.getData(405).reminderId).assertEqual(405);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210006 end');
    })

    /**
     * @tc.name   testFlipClockVolume210007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_21_0007
     * @tc.desc   Verify source.totalCount() equals 407.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume210007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 407; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(407);');
      expect(source.totalCount()).assertEqual(407);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(406).reminderId).assertEqual(406);');
      expect(source.getData(406).reminderId).assertEqual(406);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210007 end');
    })

    /**
     * @tc.name   testFlipClockVolume210008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_21_0008
     * @tc.desc   Verify source.totalCount() equals 408.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume210008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 408; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(408);');
      expect(source.totalCount()).assertEqual(408);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(407).reminderId).assertEqual(407);');
      expect(source.getData(407).reminderId).assertEqual(407);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210008 end');
    })

    /**
     * @tc.name   testFlipClockVolume210009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_21_0009
     * @tc.desc   Verify source.totalCount() equals 409.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume210009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 409; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(409);');
      expect(source.totalCount()).assertEqual(409);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(408).reminderId).assertEqual(408);');
      expect(source.getData(408).reminderId).assertEqual(408);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210009 end');
    })

    /**
     * @tc.name   testFlipClockVolume210010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_21_0010
     * @tc.desc   Verify source.totalCount() equals 410.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume210010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 410; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(410);');
      expect(source.totalCount()).assertEqual(410);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(409).reminderId).assertEqual(409);');
      expect(source.getData(409).reminderId).assertEqual(409);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210010 end');
    })

    /**
     * @tc.name   testFlipClockVolume210011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_21_0011
     * @tc.desc   Verify source.totalCount() equals 411.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume210011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 411; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(411);');
      expect(source.totalCount()).assertEqual(411);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(410).reminderId).assertEqual(410);');
      expect(source.getData(410).reminderId).assertEqual(410);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210011 end');
    })

    /**
     * @tc.name   testFlipClockVolume210012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_21_0012
     * @tc.desc   Verify source.totalCount() equals 412.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume210012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 412; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(412);');
      expect(source.totalCount()).assertEqual(412);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(411).reminderId).assertEqual(411);');
      expect(source.getData(411).reminderId).assertEqual(411);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210012 end');
    })

    /**
     * @tc.name   testFlipClockVolume210013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_21_0013
     * @tc.desc   Verify source.totalCount() equals 413.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume210013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 413; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(413);');
      expect(source.totalCount()).assertEqual(413);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(412).reminderId).assertEqual(412);');
      expect(source.getData(412).reminderId).assertEqual(412);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210013 end');
    })

    /**
     * @tc.name   testFlipClockVolume210014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_21_0014
     * @tc.desc   Verify source.totalCount() equals 414.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume210014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 414; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(414);');
      expect(source.totalCount()).assertEqual(414);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(413).reminderId).assertEqual(413);');
      expect(source.getData(413).reminderId).assertEqual(413);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210014 end');
    })

    /**
     * @tc.name   testFlipClockVolume210015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_21_0015
     * @tc.desc   Verify source.totalCount() equals 415.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume210015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 415; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(415);');
      expect(source.totalCount()).assertEqual(415);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(414).reminderId).assertEqual(414);');
      expect(source.getData(414).reminderId).assertEqual(414);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210015 end');
    })

    /**
     * @tc.name   testFlipClockVolume210016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_21_0016
     * @tc.desc   Verify source.totalCount() equals 416.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume210016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 416; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(416);');
      expect(source.totalCount()).assertEqual(416);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(415).reminderId).assertEqual(415);');
      expect(source.getData(415).reminderId).assertEqual(415);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210016 end');
    })

    /**
     * @tc.name   testFlipClockVolume210017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_21_0017
     * @tc.desc   Verify source.totalCount() equals 417.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume210017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 417; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(417);');
      expect(source.totalCount()).assertEqual(417);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(416).reminderId).assertEqual(416);');
      expect(source.getData(416).reminderId).assertEqual(416);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210017 end');
    })

    /**
     * @tc.name   testFlipClockVolume210018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_21_0018
     * @tc.desc   Verify source.totalCount() equals 418.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume210018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 418; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(418);');
      expect(source.totalCount()).assertEqual(418);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(417).reminderId).assertEqual(417);');
      expect(source.getData(417).reminderId).assertEqual(417);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210018 end');
    })

    /**
     * @tc.name   testFlipClockVolume210019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_21_0019
     * @tc.desc   Verify source.totalCount() equals 419.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume210019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 419; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(419);');
      expect(source.totalCount()).assertEqual(419);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(418).reminderId).assertEqual(418);');
      expect(source.getData(418).reminderId).assertEqual(418);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210019 end');
    })

    /**
     * @tc.name   testFlipClockVolume210020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_21_0020
     * @tc.desc   Verify source.totalCount() equals 420.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume210020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 420; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(420);');
      expect(source.totalCount()).assertEqual(420);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(419).reminderId).assertEqual(419);');
      expect(source.getData(419).reminderId).assertEqual(419);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume210020 end');
    })
  })
}
