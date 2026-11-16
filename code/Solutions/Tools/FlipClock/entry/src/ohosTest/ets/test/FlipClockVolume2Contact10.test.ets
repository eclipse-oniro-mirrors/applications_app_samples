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

export default function flipClockVolume2Contact10Test() {
  describe('FlipClockVolume2Contact10Test', () => {

    /**
     * @tc.name   testFlipClockVol2100001
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0001
     * @tc.desc   Verify source.totalCount() equals 781.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 781; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(781));
      expect(source.totalCount()).assertEqual(781);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(780).reminderId), String(780));
      expect(source.getData(780).reminderId).assertEqual(780);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100001 end');
    })

    /**
     * @tc.name   testFlipClockVol2100002
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0002
     * @tc.desc   Verify source.totalCount() equals 782.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 782; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(782));
      expect(source.totalCount()).assertEqual(782);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(781).reminderId), String(781));
      expect(source.getData(781).reminderId).assertEqual(781);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100002 end');
    })

    /**
     * @tc.name   testFlipClockVol2100003
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0003
     * @tc.desc   Verify source.totalCount() equals 783.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 783; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(783));
      expect(source.totalCount()).assertEqual(783);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(782).reminderId), String(782));
      expect(source.getData(782).reminderId).assertEqual(782);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100003 end');
    })

    /**
     * @tc.name   testFlipClockVol2100004
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0004
     * @tc.desc   Verify source.totalCount() equals 784.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 784; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(784));
      expect(source.totalCount()).assertEqual(784);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(783).reminderId), String(783));
      expect(source.getData(783).reminderId).assertEqual(783);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100004 end');
    })

    /**
     * @tc.name   testFlipClockVol2100005
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0005
     * @tc.desc   Verify source.totalCount() equals 785.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 785; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(785));
      expect(source.totalCount()).assertEqual(785);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(784).reminderId), String(784));
      expect(source.getData(784).reminderId).assertEqual(784);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100005 end');
    })

    /**
     * @tc.name   testFlipClockVol2100006
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0006
     * @tc.desc   Verify source.totalCount() equals 786.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 786; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(786));
      expect(source.totalCount()).assertEqual(786);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(785).reminderId), String(785));
      expect(source.getData(785).reminderId).assertEqual(785);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100006 end');
    })

    /**
     * @tc.name   testFlipClockVol2100007
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0007
     * @tc.desc   Verify source.totalCount() equals 787.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 787; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(787));
      expect(source.totalCount()).assertEqual(787);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(786).reminderId), String(786));
      expect(source.getData(786).reminderId).assertEqual(786);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100007 end');
    })

    /**
     * @tc.name   testFlipClockVol2100008
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0008
     * @tc.desc   Verify source.totalCount() equals 788.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 788; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(788));
      expect(source.totalCount()).assertEqual(788);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(787).reminderId), String(787));
      expect(source.getData(787).reminderId).assertEqual(787);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100008 end');
    })

    /**
     * @tc.name   testFlipClockVol2100009
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0009
     * @tc.desc   Verify source.totalCount() equals 789.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 789; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(789));
      expect(source.totalCount()).assertEqual(789);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(788).reminderId), String(788));
      expect(source.getData(788).reminderId).assertEqual(788);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100009 end');
    })

    /**
     * @tc.name   testFlipClockVol2100010
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0010
     * @tc.desc   Verify source.totalCount() equals 790.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 790; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(790));
      expect(source.totalCount()).assertEqual(790);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(789).reminderId), String(789));
      expect(source.getData(789).reminderId).assertEqual(789);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100010 end');
    })

    /**
     * @tc.name   testFlipClockVol2100011
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0011
     * @tc.desc   Verify source.totalCount() equals 791.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 791; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(791));
      expect(source.totalCount()).assertEqual(791);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(790).reminderId), String(790));
      expect(source.getData(790).reminderId).assertEqual(790);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100011 end');
    })

    /**
     * @tc.name   testFlipClockVol2100012
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0012
     * @tc.desc   Verify source.totalCount() equals 792.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 792; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(792));
      expect(source.totalCount()).assertEqual(792);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(791).reminderId), String(791));
      expect(source.getData(791).reminderId).assertEqual(791);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100012 end');
    })

    /**
     * @tc.name   testFlipClockVol2100013
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0013
     * @tc.desc   Verify source.totalCount() equals 793.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 793; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(793));
      expect(source.totalCount()).assertEqual(793);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(792).reminderId), String(792));
      expect(source.getData(792).reminderId).assertEqual(792);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100013 end');
    })

    /**
     * @tc.name   testFlipClockVol2100014
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0014
     * @tc.desc   Verify source.totalCount() equals 794.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 794; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(794));
      expect(source.totalCount()).assertEqual(794);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(793).reminderId), String(793));
      expect(source.getData(793).reminderId).assertEqual(793);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100014 end');
    })

    /**
     * @tc.name   testFlipClockVol2100015
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0015
     * @tc.desc   Verify source.totalCount() equals 795.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100015 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 795; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(795));
      expect(source.totalCount()).assertEqual(795);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(794).reminderId), String(794));
      expect(source.getData(794).reminderId).assertEqual(794);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100015 end');
    })

    /**
     * @tc.name   testFlipClockVol2100016
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0016
     * @tc.desc   Verify source.totalCount() equals 796.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100016 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 796; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(796));
      expect(source.totalCount()).assertEqual(796);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(795).reminderId), String(795));
      expect(source.getData(795).reminderId).assertEqual(795);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100016 end');
    })

    /**
     * @tc.name   testFlipClockVol2100017
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0017
     * @tc.desc   Verify source.totalCount() equals 797.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100017 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 797; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(797));
      expect(source.totalCount()).assertEqual(797);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(796).reminderId), String(796));
      expect(source.getData(796).reminderId).assertEqual(796);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100017 end');
    })

    /**
     * @tc.name   testFlipClockVol2100018
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0018
     * @tc.desc   Verify source.totalCount() equals 798.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100018 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 798; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(798));
      expect(source.totalCount()).assertEqual(798);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(797).reminderId), String(797));
      expect(source.getData(797).reminderId).assertEqual(797);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100018 end');
    })

    /**
     * @tc.name   testFlipClockVol2100019
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0019
     * @tc.desc   Verify source.totalCount() equals 799.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100019 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 799; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(799));
      expect(source.totalCount()).assertEqual(799);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(798).reminderId), String(798));
      expect(source.getData(798).reminderId).assertEqual(798);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100019 end');
    })

    /**
     * @tc.name   testFlipClockVol2100020
     * @tc.number SUB_FLIP_CLOCK_VOL2_10_0020
     * @tc.desc   Verify source.totalCount() equals 800.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockVol2100020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100020 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 800; index++) {
        source.pushData(new Contact('key' + index, 'value', index));
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(800));
      expect(source.totalCount()).assertEqual(800);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('key0'));
      expect(source.getData(0).key).assertEqual('key0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(799).reminderId), String(799));
      expect(source.getData(799).reminderId).assertEqual(799);
      await Promise.resolve();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockVol2100020 end');
    })
  })
}
