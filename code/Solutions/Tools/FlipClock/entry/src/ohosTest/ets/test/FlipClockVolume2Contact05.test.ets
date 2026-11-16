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

export default function flipClockVolume2Contact05Test() {
  describe('FlipClockVolume2Contact05Test', () => {

    /**
     * @tc.name   testFlipClockVol2050001
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0001
     * @tc.desc   Verify source.totalCount() equals 681.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 681; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(681));
      expect(source.totalCount()).assertEqual(681);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(680).reminderId), String(680));
      expect(source.getData(680).reminderId).assertEqual(680);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050001 end');
    })

    /**
     * @tc.name   testFlipClockVol2050002
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0002
     * @tc.desc   Verify source.totalCount() equals 682.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 682; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(682));
      expect(source.totalCount()).assertEqual(682);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(681).reminderId), String(681));
      expect(source.getData(681).reminderId).assertEqual(681);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050002 end');
    })

    /**
     * @tc.name   testFlipClockVol2050003
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0003
     * @tc.desc   Verify source.totalCount() equals 683.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 683; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(683));
      expect(source.totalCount()).assertEqual(683);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(682).reminderId), String(682));
      expect(source.getData(682).reminderId).assertEqual(682);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050003 end');
    })

    /**
     * @tc.name   testFlipClockVol2050004
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0004
     * @tc.desc   Verify source.totalCount() equals 684.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 684; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(684));
      expect(source.totalCount()).assertEqual(684);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(683).reminderId), String(683));
      expect(source.getData(683).reminderId).assertEqual(683);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050004 end');
    })

    /**
     * @tc.name   testFlipClockVol2050005
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0005
     * @tc.desc   Verify source.totalCount() equals 685.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 685; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(685));
      expect(source.totalCount()).assertEqual(685);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(684).reminderId), String(684));
      expect(source.getData(684).reminderId).assertEqual(684);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050005 end');
    })

    /**
     * @tc.name   testFlipClockVol2050006
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0006
     * @tc.desc   Verify source.totalCount() equals 686.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 686; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(686));
      expect(source.totalCount()).assertEqual(686);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(685).reminderId), String(685));
      expect(source.getData(685).reminderId).assertEqual(685);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050006 end');
    })

    /**
     * @tc.name   testFlipClockVol2050007
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0007
     * @tc.desc   Verify source.totalCount() equals 687.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 687; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(687));
      expect(source.totalCount()).assertEqual(687);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(686).reminderId), String(686));
      expect(source.getData(686).reminderId).assertEqual(686);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050007 end');
    })

    /**
     * @tc.name   testFlipClockVol2050008
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0008
     * @tc.desc   Verify source.totalCount() equals 688.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 688; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(688));
      expect(source.totalCount()).assertEqual(688);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(687).reminderId), String(687));
      expect(source.getData(687).reminderId).assertEqual(687);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050008 end');
    })

    /**
     * @tc.name   testFlipClockVol2050009
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0009
     * @tc.desc   Verify source.totalCount() equals 689.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 689; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(689));
      expect(source.totalCount()).assertEqual(689);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(688).reminderId), String(688));
      expect(source.getData(688).reminderId).assertEqual(688);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050009 end');
    })

    /**
     * @tc.name   testFlipClockVol2050010
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0010
     * @tc.desc   Verify source.totalCount() equals 690.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 690; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(690));
      expect(source.totalCount()).assertEqual(690);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(689).reminderId), String(689));
      expect(source.getData(689).reminderId).assertEqual(689);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050010 end');
    })

    /**
     * @tc.name   testFlipClockVol2050011
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0011
     * @tc.desc   Verify source.totalCount() equals 691.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 691; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(691));
      expect(source.totalCount()).assertEqual(691);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(690).reminderId), String(690));
      expect(source.getData(690).reminderId).assertEqual(690);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050011 end');
    })

    /**
     * @tc.name   testFlipClockVol2050012
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0012
     * @tc.desc   Verify source.totalCount() equals 692.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 692; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(692));
      expect(source.totalCount()).assertEqual(692);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(691).reminderId), String(691));
      expect(source.getData(691).reminderId).assertEqual(691);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050012 end');
    })

    /**
     * @tc.name   testFlipClockVol2050013
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0013
     * @tc.desc   Verify source.totalCount() equals 693.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 693; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(693));
      expect(source.totalCount()).assertEqual(693);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(692).reminderId), String(692));
      expect(source.getData(692).reminderId).assertEqual(692);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050013 end');
    })

    /**
     * @tc.name   testFlipClockVol2050014
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0014
     * @tc.desc   Verify source.totalCount() equals 694.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 694; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(694));
      expect(source.totalCount()).assertEqual(694);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(693).reminderId), String(693));
      expect(source.getData(693).reminderId).assertEqual(693);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050014 end');
    })

    /**
     * @tc.name   testFlipClockVol2050015
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0015
     * @tc.desc   Verify source.totalCount() equals 695.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 695; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(695));
      expect(source.totalCount()).assertEqual(695);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(694).reminderId), String(694));
      expect(source.getData(694).reminderId).assertEqual(694);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050015 end');
    })

    /**
     * @tc.name   testFlipClockVol2050016
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0016
     * @tc.desc   Verify source.totalCount() equals 696.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 696; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(696));
      expect(source.totalCount()).assertEqual(696);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(695).reminderId), String(695));
      expect(source.getData(695).reminderId).assertEqual(695);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050016 end');
    })

    /**
     * @tc.name   testFlipClockVol2050017
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0017
     * @tc.desc   Verify source.totalCount() equals 697.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 697; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(697));
      expect(source.totalCount()).assertEqual(697);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(696).reminderId), String(696));
      expect(source.getData(696).reminderId).assertEqual(696);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050017 end');
    })

    /**
     * @tc.name   testFlipClockVol2050018
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0018
     * @tc.desc   Verify source.totalCount() equals 698.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 698; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(698));
      expect(source.totalCount()).assertEqual(698);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(697).reminderId), String(697));
      expect(source.getData(697).reminderId).assertEqual(697);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050018 end');
    })

    /**
     * @tc.name   testFlipClockVol2050019
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0019
     * @tc.desc   Verify source.totalCount() equals 699.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 699; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(699));
      expect(source.totalCount()).assertEqual(699);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(698).reminderId), String(698));
      expect(source.getData(698).reminderId).assertEqual(698);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050019 end');
    })

    /**
     * @tc.name   testFlipClockVol2050020
     * @tc.number SUB_FLIP_CLOCK_VOL2_05_0020
     * @tc.desc   Verify source.totalCount() equals 700.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2050020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 700; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(700));
      expect(source.totalCount()).assertEqual(700);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(699).reminderId), String(699));
      expect(source.getData(699).reminderId).assertEqual(699);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2050020 end');
    })
  })
}
