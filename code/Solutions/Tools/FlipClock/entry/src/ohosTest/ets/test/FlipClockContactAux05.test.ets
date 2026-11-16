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

export default function flipClockContactAux05Test() {
  describe('FlipClockContactAux05Test', () => {

    /**
     * @tc.name   testFlipClockAux050001
     * @tc.number SUB_FLIP_CLOCK_AUX_05_0001
     * @tc.desc   Verify source.totalCount() equals 56.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux050001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux050001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 57; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(56));
      expect(source.totalCount()).assertEqual(56);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux050001 end');
    })

    /**
     * @tc.name   testFlipClockAux050002
     * @tc.number SUB_FLIP_CLOCK_AUX_05_0002
     * @tc.desc   Verify source.totalCount() equals 57.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux050002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux050002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 58; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(57));
      expect(source.totalCount()).assertEqual(57);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux050002 end');
    })

    /**
     * @tc.name   testFlipClockAux050003
     * @tc.number SUB_FLIP_CLOCK_AUX_05_0003
     * @tc.desc   Verify source.totalCount() equals 58.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux050003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux050003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 59; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(58));
      expect(source.totalCount()).assertEqual(58);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux050003 end');
    })

    /**
     * @tc.name   testFlipClockAux050004
     * @tc.number SUB_FLIP_CLOCK_AUX_05_0004
     * @tc.desc   Verify source.totalCount() equals 59.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux050004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux050004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 60; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(59));
      expect(source.totalCount()).assertEqual(59);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux050004 end');
    })

    /**
     * @tc.name   testFlipClockAux050005
     * @tc.number SUB_FLIP_CLOCK_AUX_05_0005
     * @tc.desc   Verify source.totalCount() equals 60.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux050005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux050005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 61; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(60));
      expect(source.totalCount()).assertEqual(60);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux050005 end');
    })

    /**
     * @tc.name   testFlipClockAux050006
     * @tc.number SUB_FLIP_CLOCK_AUX_05_0006
     * @tc.desc   Verify source.totalCount() equals 61.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux050006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux050006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 62; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(61));
      expect(source.totalCount()).assertEqual(61);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux050006 end');
    })

    /**
     * @tc.name   testFlipClockAux050007
     * @tc.number SUB_FLIP_CLOCK_AUX_05_0007
     * @tc.desc   Verify source.totalCount() equals 62.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux050007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux050007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 63; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(62));
      expect(source.totalCount()).assertEqual(62);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux050007 end');
    })

    /**
     * @tc.name   testFlipClockAux050008
     * @tc.number SUB_FLIP_CLOCK_AUX_05_0008
     * @tc.desc   Verify source.totalCount() equals 63.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux050008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux050008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 64; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(63));
      expect(source.totalCount()).assertEqual(63);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux050008 end');
    })

    /**
     * @tc.name   testFlipClockAux050009
     * @tc.number SUB_FLIP_CLOCK_AUX_05_0009
     * @tc.desc   Verify source.totalCount() equals 64.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux050009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux050009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 65; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(64));
      expect(source.totalCount()).assertEqual(64);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux050009 end');
    })

    /**
     * @tc.name   testFlipClockAux050010
     * @tc.number SUB_FLIP_CLOCK_AUX_05_0010
     * @tc.desc   Verify source.totalCount() equals 65.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux050010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux050010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 66; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(65));
      expect(source.totalCount()).assertEqual(65);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux050010 end');
    })

    /**
     * @tc.name   testFlipClockAux050011
     * @tc.number SUB_FLIP_CLOCK_AUX_05_0011
     * @tc.desc   Verify source.totalCount() equals 66.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux050011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux050011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 67; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(66));
      expect(source.totalCount()).assertEqual(66);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux050011 end');
    })

    /**
     * @tc.name   testFlipClockAux050012
     * @tc.number SUB_FLIP_CLOCK_AUX_05_0012
     * @tc.desc   Verify source.totalCount() equals 67.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux050012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux050012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 68; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(67));
      expect(source.totalCount()).assertEqual(67);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux050012 end');
    })

    /**
     * @tc.name   testFlipClockAux050013
     * @tc.number SUB_FLIP_CLOCK_AUX_05_0013
     * @tc.desc   Verify source.totalCount() equals 68.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux050013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux050013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 69; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(68));
      expect(source.totalCount()).assertEqual(68);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux050013 end');
    })

    /**
     * @tc.name   testFlipClockAux050014
     * @tc.number SUB_FLIP_CLOCK_AUX_05_0014
     * @tc.desc   Verify source.totalCount() equals 69.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux050014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux050014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 70; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(69));
      expect(source.totalCount()).assertEqual(69);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testFlipClockAux050014 end');
    })
  })
}
