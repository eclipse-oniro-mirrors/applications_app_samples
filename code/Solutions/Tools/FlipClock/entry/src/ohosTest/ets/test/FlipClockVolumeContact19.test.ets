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

export default function flipClockVolumeContact19Test() {
  describe('FlipClockVolumeContact19Test', () => {

    /**
     * @tc.name   testFlipClockVolume190001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0001
     * @tc.desc   Verify source.totalCount() equals 361.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume190001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 361; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(361);');
      expect(source.totalCount()).assertEqual(361);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(360).reminderId).assertEqual(360);');
      expect(source.getData(360).reminderId).assertEqual(360);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190001 end');
    })

    /**
     * @tc.name   testFlipClockVolume190002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0002
     * @tc.desc   Verify source.totalCount() equals 362.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume190002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 362; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(362);');
      expect(source.totalCount()).assertEqual(362);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(361).reminderId).assertEqual(361);');
      expect(source.getData(361).reminderId).assertEqual(361);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190002 end');
    })

    /**
     * @tc.name   testFlipClockVolume190003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0003
     * @tc.desc   Verify source.totalCount() equals 363.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume190003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 363; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(363);');
      expect(source.totalCount()).assertEqual(363);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(362).reminderId).assertEqual(362);');
      expect(source.getData(362).reminderId).assertEqual(362);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190003 end');
    })

    /**
     * @tc.name   testFlipClockVolume190004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0004
     * @tc.desc   Verify source.totalCount() equals 364.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume190004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 364; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(364);');
      expect(source.totalCount()).assertEqual(364);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(363).reminderId).assertEqual(363);');
      expect(source.getData(363).reminderId).assertEqual(363);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190004 end');
    })

    /**
     * @tc.name   testFlipClockVolume190005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0005
     * @tc.desc   Verify source.totalCount() equals 365.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume190005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 365; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(365);');
      expect(source.totalCount()).assertEqual(365);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(364).reminderId).assertEqual(364);');
      expect(source.getData(364).reminderId).assertEqual(364);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190005 end');
    })

    /**
     * @tc.name   testFlipClockVolume190006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0006
     * @tc.desc   Verify source.totalCount() equals 366.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume190006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 366; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(366);');
      expect(source.totalCount()).assertEqual(366);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(365).reminderId).assertEqual(365);');
      expect(source.getData(365).reminderId).assertEqual(365);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190006 end');
    })

    /**
     * @tc.name   testFlipClockVolume190007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0007
     * @tc.desc   Verify source.totalCount() equals 367.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume190007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 367; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(367);');
      expect(source.totalCount()).assertEqual(367);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(366).reminderId).assertEqual(366);');
      expect(source.getData(366).reminderId).assertEqual(366);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190007 end');
    })

    /**
     * @tc.name   testFlipClockVolume190008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0008
     * @tc.desc   Verify source.totalCount() equals 368.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume190008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 368; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(368);');
      expect(source.totalCount()).assertEqual(368);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(367).reminderId).assertEqual(367);');
      expect(source.getData(367).reminderId).assertEqual(367);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190008 end');
    })

    /**
     * @tc.name   testFlipClockVolume190009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0009
     * @tc.desc   Verify source.totalCount() equals 369.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume190009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 369; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(369);');
      expect(source.totalCount()).assertEqual(369);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(368).reminderId).assertEqual(368);');
      expect(source.getData(368).reminderId).assertEqual(368);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190009 end');
    })

    /**
     * @tc.name   testFlipClockVolume190010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0010
     * @tc.desc   Verify source.totalCount() equals 370.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume190010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 370; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(370);');
      expect(source.totalCount()).assertEqual(370);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(369).reminderId).assertEqual(369);');
      expect(source.getData(369).reminderId).assertEqual(369);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190010 end');
    })

    /**
     * @tc.name   testFlipClockVolume190011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0011
     * @tc.desc   Verify source.totalCount() equals 371.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume190011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 371; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(371);');
      expect(source.totalCount()).assertEqual(371);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(370).reminderId).assertEqual(370);');
      expect(source.getData(370).reminderId).assertEqual(370);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190011 end');
    })

    /**
     * @tc.name   testFlipClockVolume190012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0012
     * @tc.desc   Verify source.totalCount() equals 372.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume190012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 372; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(372);');
      expect(source.totalCount()).assertEqual(372);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(371).reminderId).assertEqual(371);');
      expect(source.getData(371).reminderId).assertEqual(371);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190012 end');
    })

    /**
     * @tc.name   testFlipClockVolume190013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0013
     * @tc.desc   Verify source.totalCount() equals 373.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume190013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 373; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(373);');
      expect(source.totalCount()).assertEqual(373);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(372).reminderId).assertEqual(372);');
      expect(source.getData(372).reminderId).assertEqual(372);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190013 end');
    })

    /**
     * @tc.name   testFlipClockVolume190014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0014
     * @tc.desc   Verify source.totalCount() equals 374.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume190014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 374; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(374);');
      expect(source.totalCount()).assertEqual(374);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(373).reminderId).assertEqual(373);');
      expect(source.getData(373).reminderId).assertEqual(373);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190014 end');
    })

    /**
     * @tc.name   testFlipClockVolume190015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0015
     * @tc.desc   Verify source.totalCount() equals 375.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume190015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 375; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(375);');
      expect(source.totalCount()).assertEqual(375);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(374).reminderId).assertEqual(374);');
      expect(source.getData(374).reminderId).assertEqual(374);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190015 end');
    })

    /**
     * @tc.name   testFlipClockVolume190016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0016
     * @tc.desc   Verify source.totalCount() equals 376.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume190016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 376; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(376);');
      expect(source.totalCount()).assertEqual(376);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(375).reminderId).assertEqual(375);');
      expect(source.getData(375).reminderId).assertEqual(375);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190016 end');
    })

    /**
     * @tc.name   testFlipClockVolume190017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0017
     * @tc.desc   Verify source.totalCount() equals 377.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume190017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 377; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(377);');
      expect(source.totalCount()).assertEqual(377);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(376).reminderId).assertEqual(376);');
      expect(source.getData(376).reminderId).assertEqual(376);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190017 end');
    })

    /**
     * @tc.name   testFlipClockVolume190018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0018
     * @tc.desc   Verify source.totalCount() equals 378.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume190018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 378; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(378);');
      expect(source.totalCount()).assertEqual(378);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(377).reminderId).assertEqual(377);');
      expect(source.getData(377).reminderId).assertEqual(377);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190018 end');
    })

    /**
     * @tc.name   testFlipClockVolume190019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0019
     * @tc.desc   Verify source.totalCount() equals 379.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume190019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 379; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(379);');
      expect(source.totalCount()).assertEqual(379);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(378).reminderId).assertEqual(378);');
      expect(source.getData(378).reminderId).assertEqual(378);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190019 end');
    })

    /**
     * @tc.name   testFlipClockVolume190020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_19_0020
     * @tc.desc   Verify source.totalCount() equals 380.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume190020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 380; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(380);');
      expect(source.totalCount()).assertEqual(380);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(379).reminderId).assertEqual(379);');
      expect(source.getData(379).reminderId).assertEqual(379);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume190020 end');
    })
  })
}
