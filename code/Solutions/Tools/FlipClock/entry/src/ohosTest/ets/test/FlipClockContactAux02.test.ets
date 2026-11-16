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

export default function flipClockContactAux02Test() {
  describe('FlipClockContactAux02Test', () => {

    /**
     * @tc.name   testFlipClockAux020001
     * @tc.number SUB_FLIP_CLOCK_AUX_02_0001
     * @tc.desc   Verify source.totalCount() equals 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux020001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 15; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(14));
      expect(source.totalCount()).assertEqual(14);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux020001 end');
    })

    /**
     * @tc.name   testFlipClockAux020002
     * @tc.number SUB_FLIP_CLOCK_AUX_02_0002
     * @tc.desc   Verify source.totalCount() equals 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux020002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 16; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(15));
      expect(source.totalCount()).assertEqual(15);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux020002 end');
    })

    /**
     * @tc.name   testFlipClockAux020003
     * @tc.number SUB_FLIP_CLOCK_AUX_02_0003
     * @tc.desc   Verify source.totalCount() equals 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux020003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 17; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(16));
      expect(source.totalCount()).assertEqual(16);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux020003 end');
    })

    /**
     * @tc.name   testFlipClockAux020004
     * @tc.number SUB_FLIP_CLOCK_AUX_02_0004
     * @tc.desc   Verify source.totalCount() equals 17.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux020004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 18; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(17));
      expect(source.totalCount()).assertEqual(17);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux020004 end');
    })

    /**
     * @tc.name   testFlipClockAux020005
     * @tc.number SUB_FLIP_CLOCK_AUX_02_0005
     * @tc.desc   Verify source.totalCount() equals 18.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux020005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 19; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(18));
      expect(source.totalCount()).assertEqual(18);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux020005 end');
    })

    /**
     * @tc.name   testFlipClockAux020006
     * @tc.number SUB_FLIP_CLOCK_AUX_02_0006
     * @tc.desc   Verify source.totalCount() equals 19.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux020006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 20; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(19));
      expect(source.totalCount()).assertEqual(19);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux020006 end');
    })

    /**
     * @tc.name   testFlipClockAux020007
     * @tc.number SUB_FLIP_CLOCK_AUX_02_0007
     * @tc.desc   Verify source.totalCount() equals 20.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux020007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 21; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(20));
      expect(source.totalCount()).assertEqual(20);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux020007 end');
    })

    /**
     * @tc.name   testFlipClockAux020008
     * @tc.number SUB_FLIP_CLOCK_AUX_02_0008
     * @tc.desc   Verify source.totalCount() equals 21.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux020008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 22; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(21));
      expect(source.totalCount()).assertEqual(21);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux020008 end');
    })

    /**
     * @tc.name   testFlipClockAux020009
     * @tc.number SUB_FLIP_CLOCK_AUX_02_0009
     * @tc.desc   Verify source.totalCount() equals 22.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux020009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 23; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(22));
      expect(source.totalCount()).assertEqual(22);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux020009 end');
    })

    /**
     * @tc.name   testFlipClockAux020010
     * @tc.number SUB_FLIP_CLOCK_AUX_02_0010
     * @tc.desc   Verify source.totalCount() equals 23.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux020010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 24; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(23));
      expect(source.totalCount()).assertEqual(23);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux020010 end');
    })

    /**
     * @tc.name   testFlipClockAux020011
     * @tc.number SUB_FLIP_CLOCK_AUX_02_0011
     * @tc.desc   Verify source.totalCount() equals 24.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux020011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 25; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(24));
      expect(source.totalCount()).assertEqual(24);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux020011 end');
    })

    /**
     * @tc.name   testFlipClockAux020012
     * @tc.number SUB_FLIP_CLOCK_AUX_02_0012
     * @tc.desc   Verify source.totalCount() equals 25.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux020012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 26; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(25));
      expect(source.totalCount()).assertEqual(25);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux020012 end');
    })

    /**
     * @tc.name   testFlipClockAux020013
     * @tc.number SUB_FLIP_CLOCK_AUX_02_0013
     * @tc.desc   Verify source.totalCount() equals 26.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux020013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 27; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(26));
      expect(source.totalCount()).assertEqual(26);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux020013 end');
    })

    /**
     * @tc.name   testFlipClockAux020014
     * @tc.number SUB_FLIP_CLOCK_AUX_02_0014
     * @tc.desc   Verify source.totalCount() equals 27.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux020014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 28; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(27));
      expect(source.totalCount()).assertEqual(27);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux020014 end');
    })
  })
}
