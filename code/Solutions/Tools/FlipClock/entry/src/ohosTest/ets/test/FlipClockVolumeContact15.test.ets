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

export default function flipClockVolumeContact15Test() {
  describe('FlipClockVolumeContact15Test', () => {

    /**
     * @tc.name   testFlipClockVolume150001
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0001
     * @tc.desc   Verify source.totalCount() equals 281.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 281; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(281);');
      expect(source.totalCount()).assertEqual(281);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(280).reminderId).assertEqual(280);');
      expect(source.getData(280).reminderId).assertEqual(280);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150001 end');
    })

    /**
     * @tc.name   testFlipClockVolume150002
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0002
     * @tc.desc   Verify source.totalCount() equals 282.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 282; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(282);');
      expect(source.totalCount()).assertEqual(282);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(281).reminderId).assertEqual(281);');
      expect(source.getData(281).reminderId).assertEqual(281);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150002 end');
    })

    /**
     * @tc.name   testFlipClockVolume150003
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0003
     * @tc.desc   Verify source.totalCount() equals 283.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 283; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(283);');
      expect(source.totalCount()).assertEqual(283);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(282).reminderId).assertEqual(282);');
      expect(source.getData(282).reminderId).assertEqual(282);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150003 end');
    })

    /**
     * @tc.name   testFlipClockVolume150004
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0004
     * @tc.desc   Verify source.totalCount() equals 284.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 284; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(284);');
      expect(source.totalCount()).assertEqual(284);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(283).reminderId).assertEqual(283);');
      expect(source.getData(283).reminderId).assertEqual(283);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150004 end');
    })

    /**
     * @tc.name   testFlipClockVolume150005
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0005
     * @tc.desc   Verify source.totalCount() equals 285.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 285; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(285);');
      expect(source.totalCount()).assertEqual(285);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(284).reminderId).assertEqual(284);');
      expect(source.getData(284).reminderId).assertEqual(284);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150005 end');
    })

    /**
     * @tc.name   testFlipClockVolume150006
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0006
     * @tc.desc   Verify source.totalCount() equals 286.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 286; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(286);');
      expect(source.totalCount()).assertEqual(286);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(285).reminderId).assertEqual(285);');
      expect(source.getData(285).reminderId).assertEqual(285);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150006 end');
    })

    /**
     * @tc.name   testFlipClockVolume150007
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0007
     * @tc.desc   Verify source.totalCount() equals 287.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 287; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(287);');
      expect(source.totalCount()).assertEqual(287);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(286).reminderId).assertEqual(286);');
      expect(source.getData(286).reminderId).assertEqual(286);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150007 end');
    })

    /**
     * @tc.name   testFlipClockVolume150008
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0008
     * @tc.desc   Verify source.totalCount() equals 288.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 288; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(288);');
      expect(source.totalCount()).assertEqual(288);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(287).reminderId).assertEqual(287);');
      expect(source.getData(287).reminderId).assertEqual(287);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150008 end');
    })

    /**
     * @tc.name   testFlipClockVolume150009
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0009
     * @tc.desc   Verify source.totalCount() equals 289.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 289; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(289);');
      expect(source.totalCount()).assertEqual(289);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(288).reminderId).assertEqual(288);');
      expect(source.getData(288).reminderId).assertEqual(288);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150009 end');
    })

    /**
     * @tc.name   testFlipClockVolume150010
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0010
     * @tc.desc   Verify source.totalCount() equals 290.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 290; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(290);');
      expect(source.totalCount()).assertEqual(290);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(289).reminderId).assertEqual(289);');
      expect(source.getData(289).reminderId).assertEqual(289);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150010 end');
    })

    /**
     * @tc.name   testFlipClockVolume150011
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0011
     * @tc.desc   Verify source.totalCount() equals 291.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 291; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(291);');
      expect(source.totalCount()).assertEqual(291);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(290).reminderId).assertEqual(290);');
      expect(source.getData(290).reminderId).assertEqual(290);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150011 end');
    })

    /**
     * @tc.name   testFlipClockVolume150012
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0012
     * @tc.desc   Verify source.totalCount() equals 292.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 292; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(292);');
      expect(source.totalCount()).assertEqual(292);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(291).reminderId).assertEqual(291);');
      expect(source.getData(291).reminderId).assertEqual(291);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150012 end');
    })

    /**
     * @tc.name   testFlipClockVolume150013
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0013
     * @tc.desc   Verify source.totalCount() equals 293.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 293; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(293);');
      expect(source.totalCount()).assertEqual(293);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(292).reminderId).assertEqual(292);');
      expect(source.getData(292).reminderId).assertEqual(292);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150013 end');
    })

    /**
     * @tc.name   testFlipClockVolume150014
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0014
     * @tc.desc   Verify source.totalCount() equals 294.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 294; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(294);');
      expect(source.totalCount()).assertEqual(294);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(293).reminderId).assertEqual(293);');
      expect(source.getData(293).reminderId).assertEqual(293);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150014 end');
    })

    /**
     * @tc.name   testFlipClockVolume150015
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0015
     * @tc.desc   Verify source.totalCount() equals 295.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 295; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(295);');
      expect(source.totalCount()).assertEqual(295);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(294).reminderId).assertEqual(294);');
      expect(source.getData(294).reminderId).assertEqual(294);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150015 end');
    })

    /**
     * @tc.name   testFlipClockVolume150016
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0016
     * @tc.desc   Verify source.totalCount() equals 296.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 296; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(296);');
      expect(source.totalCount()).assertEqual(296);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(295).reminderId).assertEqual(295);');
      expect(source.getData(295).reminderId).assertEqual(295);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150016 end');
    })

    /**
     * @tc.name   testFlipClockVolume150017
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0017
     * @tc.desc   Verify source.totalCount() equals 297.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 297; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(297);');
      expect(source.totalCount()).assertEqual(297);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(296).reminderId).assertEqual(296);');
      expect(source.getData(296).reminderId).assertEqual(296);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150017 end');
    })

    /**
     * @tc.name   testFlipClockVolume150018
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0018
     * @tc.desc   Verify source.totalCount() equals 298.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 298; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(298);');
      expect(source.totalCount()).assertEqual(298);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(297).reminderId).assertEqual(297);');
      expect(source.getData(297).reminderId).assertEqual(297);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150018 end');
    })

    /**
     * @tc.name   testFlipClockVolume150019
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0019
     * @tc.desc   Verify source.totalCount() equals 299.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 299; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(299);');
      expect(source.totalCount()).assertEqual(299);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(298).reminderId).assertEqual(298);');
      expect(source.getData(298).reminderId).assertEqual(298);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150019 end');
    })

    /**
     * @tc.name   testFlipClockVolume150020
     * @tc.number SUB_FLIP_CLOCK_VOLUME_15_0020
     * @tc.desc   Verify source.totalCount() equals 300.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVolume150020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 300; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(300);');
      expect(source.totalCount()).assertEqual(300);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(299).reminderId).assertEqual(299);');
      expect(source.getData(299).reminderId).assertEqual(299);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVolume150020 end');
    })
  })
}
