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

export default function flipClockVolume2Contact14Test() {
  describe('FlipClockVolume2Contact14Test', () => {

    /**
     * @tc.name   testFlipClockVol2140001
     * @tc.number SUB_FLIP_CLOCK_VOL2_14_0001
     * @tc.desc   Verify source.totalCount() equals 861.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2140001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 861; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(861);');
      expect(source.totalCount()).assertEqual(861);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(860).reminderId).assertEqual(860);');
      expect(source.getData(860).reminderId).assertEqual(860);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140001 end');
    })

    /**
     * @tc.name   testFlipClockVol2140002
     * @tc.number SUB_FLIP_CLOCK_VOL2_14_0002
     * @tc.desc   Verify source.totalCount() equals 862.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2140002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 862; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(862);');
      expect(source.totalCount()).assertEqual(862);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(861).reminderId).assertEqual(861);');
      expect(source.getData(861).reminderId).assertEqual(861);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140002 end');
    })

    /**
     * @tc.name   testFlipClockVol2140003
     * @tc.number SUB_FLIP_CLOCK_VOL2_14_0003
     * @tc.desc   Verify source.totalCount() equals 863.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2140003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 863; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(863);');
      expect(source.totalCount()).assertEqual(863);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(862).reminderId).assertEqual(862);');
      expect(source.getData(862).reminderId).assertEqual(862);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140003 end');
    })

    /**
     * @tc.name   testFlipClockVol2140004
     * @tc.number SUB_FLIP_CLOCK_VOL2_14_0004
     * @tc.desc   Verify source.totalCount() equals 864.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2140004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 864; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(864);');
      expect(source.totalCount()).assertEqual(864);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(863).reminderId).assertEqual(863);');
      expect(source.getData(863).reminderId).assertEqual(863);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140004 end');
    })

    /**
     * @tc.name   testFlipClockVol2140005
     * @tc.number SUB_FLIP_CLOCK_VOL2_14_0005
     * @tc.desc   Verify source.totalCount() equals 865.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2140005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 865; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(865);');
      expect(source.totalCount()).assertEqual(865);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(864).reminderId).assertEqual(864);');
      expect(source.getData(864).reminderId).assertEqual(864);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140005 end');
    })

    /**
     * @tc.name   testFlipClockVol2140006
     * @tc.number SUB_FLIP_CLOCK_VOL2_14_0006
     * @tc.desc   Verify source.totalCount() equals 866.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2140006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 866; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(866);');
      expect(source.totalCount()).assertEqual(866);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(865).reminderId).assertEqual(865);');
      expect(source.getData(865).reminderId).assertEqual(865);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140006 end');
    })

    /**
     * @tc.name   testFlipClockVol2140007
     * @tc.number SUB_FLIP_CLOCK_VOL2_14_0007
     * @tc.desc   Verify source.totalCount() equals 867.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2140007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 867; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(867);');
      expect(source.totalCount()).assertEqual(867);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(866).reminderId).assertEqual(866);');
      expect(source.getData(866).reminderId).assertEqual(866);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140007 end');
    })

    /**
     * @tc.name   testFlipClockVol2140008
     * @tc.number SUB_FLIP_CLOCK_VOL2_14_0008
     * @tc.desc   Verify source.totalCount() equals 868.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2140008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 868; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(868);');
      expect(source.totalCount()).assertEqual(868);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(867).reminderId).assertEqual(867);');
      expect(source.getData(867).reminderId).assertEqual(867);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140008 end');
    })

    /**
     * @tc.name   testFlipClockVol2140009
     * @tc.number SUB_FLIP_CLOCK_VOL2_14_0009
     * @tc.desc   Verify source.totalCount() equals 869.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2140009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 869; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(869);');
      expect(source.totalCount()).assertEqual(869);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(868).reminderId).assertEqual(868);');
      expect(source.getData(868).reminderId).assertEqual(868);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140009 end');
    })

    /**
     * @tc.name   testFlipClockVol2140010
     * @tc.number SUB_FLIP_CLOCK_VOL2_14_0010
     * @tc.desc   Verify source.totalCount() equals 870.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2140010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 870; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(870);');
      expect(source.totalCount()).assertEqual(870);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(869).reminderId).assertEqual(869);');
      expect(source.getData(869).reminderId).assertEqual(869);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140010 end');
    })

    /**
     * @tc.name   testFlipClockVol2140011
     * @tc.number SUB_FLIP_CLOCK_VOL2_14_0011
     * @tc.desc   Verify source.totalCount() equals 871.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2140011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 871; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(871);');
      expect(source.totalCount()).assertEqual(871);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(870).reminderId).assertEqual(870);');
      expect(source.getData(870).reminderId).assertEqual(870);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140011 end');
    })

    /**
     * @tc.name   testFlipClockVol2140012
     * @tc.number SUB_FLIP_CLOCK_VOL2_14_0012
     * @tc.desc   Verify source.totalCount() equals 872.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2140012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 872; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(872);');
      expect(source.totalCount()).assertEqual(872);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(871).reminderId).assertEqual(871);');
      expect(source.getData(871).reminderId).assertEqual(871);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140012 end');
    })

    /**
     * @tc.name   testFlipClockVol2140013
     * @tc.number SUB_FLIP_CLOCK_VOL2_14_0013
     * @tc.desc   Verify source.totalCount() equals 873.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2140013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 873; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(873);');
      expect(source.totalCount()).assertEqual(873);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(872).reminderId).assertEqual(872);');
      expect(source.getData(872).reminderId).assertEqual(872);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140013 end');
    })

    /**
     * @tc.name   testFlipClockVol2140014
     * @tc.number SUB_FLIP_CLOCK_VOL2_14_0014
     * @tc.desc   Verify source.totalCount() equals 874.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2140014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 874; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(874);');
      expect(source.totalCount()).assertEqual(874);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(873).reminderId).assertEqual(873);');
      expect(source.getData(873).reminderId).assertEqual(873);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140014 end');
    })

    /**
     * @tc.name   testFlipClockVol2140015
     * @tc.number SUB_FLIP_CLOCK_VOL2_14_0015
     * @tc.desc   Verify source.totalCount() equals 875.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2140015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 875; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(875);');
      expect(source.totalCount()).assertEqual(875);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(874).reminderId).assertEqual(874);');
      expect(source.getData(874).reminderId).assertEqual(874);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140015 end');
    })

    /**
     * @tc.name   testFlipClockVol2140016
     * @tc.number SUB_FLIP_CLOCK_VOL2_14_0016
     * @tc.desc   Verify source.totalCount() equals 876.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2140016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 876; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(876);');
      expect(source.totalCount()).assertEqual(876);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(875).reminderId).assertEqual(875);');
      expect(source.getData(875).reminderId).assertEqual(875);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140016 end');
    })

    /**
     * @tc.name   testFlipClockVol2140017
     * @tc.number SUB_FLIP_CLOCK_VOL2_14_0017
     * @tc.desc   Verify source.totalCount() equals 877.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2140017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 877; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(877);');
      expect(source.totalCount()).assertEqual(877);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(876).reminderId).assertEqual(876);');
      expect(source.getData(876).reminderId).assertEqual(876);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140017 end');
    })

    /**
     * @tc.name   testFlipClockVol2140018
     * @tc.number SUB_FLIP_CLOCK_VOL2_14_0018
     * @tc.desc   Verify source.totalCount() equals 878.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2140018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 878; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(878);');
      expect(source.totalCount()).assertEqual(878);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(877).reminderId).assertEqual(877);');
      expect(source.getData(877).reminderId).assertEqual(877);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140018 end');
    })

    /**
     * @tc.name   testFlipClockVol2140019
     * @tc.number SUB_FLIP_CLOCK_VOL2_14_0019
     * @tc.desc   Verify source.totalCount() equals 879.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2140019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 879; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(879);');
      expect(source.totalCount()).assertEqual(879);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(878).reminderId).assertEqual(878);');
      expect(source.getData(878).reminderId).assertEqual(878);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140019 end');
    })

    /**
     * @tc.name   testFlipClockVol2140020
     * @tc.number SUB_FLIP_CLOCK_VOL2_14_0020
     * @tc.desc   Verify source.totalCount() equals 880.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2140020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 880; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.totalCount()).assertEqual(880);');
      expect(source.totalCount()).assertEqual(880);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(0).key).assertEqual(\'key0\');');
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(source.getData(879).reminderId).assertEqual(879);');
      expect(source.getData(879).reminderId).assertEqual(879);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2140020 end');
    })
  })
}
