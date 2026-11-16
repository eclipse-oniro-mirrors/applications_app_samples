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

export default function flipClockContactAux04Test() {
  describe('FlipClockContactAux04Test', () => {

    /**
     * @tc.name   ohos.samples.flipclock_ContactAux04_0001
     * @tc.number SUB_FLIP_CLOCK_AUX_04_0001
     * @tc.desc   Verify source.totalCount() equals 42.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactAux04_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux04_0001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 43; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(42));
      expect(source.totalCount()).assertEqual(42);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux04_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactAux04_0002
     * @tc.number SUB_FLIP_CLOCK_AUX_04_0002
     * @tc.desc   Verify source.totalCount() equals 43.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactAux04_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux04_0002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 44; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(43));
      expect(source.totalCount()).assertEqual(43);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux04_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactAux04_0003
     * @tc.number SUB_FLIP_CLOCK_AUX_04_0003
     * @tc.desc   Verify source.totalCount() equals 44.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactAux04_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux04_0003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 45; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(44));
      expect(source.totalCount()).assertEqual(44);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux04_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactAux04_0004
     * @tc.number SUB_FLIP_CLOCK_AUX_04_0004
     * @tc.desc   Verify source.totalCount() equals 45.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactAux04_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux04_0004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 46; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(45));
      expect(source.totalCount()).assertEqual(45);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux04_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactAux04_0005
     * @tc.number SUB_FLIP_CLOCK_AUX_04_0005
     * @tc.desc   Verify source.totalCount() equals 46.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactAux04_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux04_0005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 47; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(46));
      expect(source.totalCount()).assertEqual(46);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux04_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactAux04_0006
     * @tc.number SUB_FLIP_CLOCK_AUX_04_0006
     * @tc.desc   Verify source.totalCount() equals 47.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactAux04_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux04_0006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 48; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(47));
      expect(source.totalCount()).assertEqual(47);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux04_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactAux04_0007
     * @tc.number SUB_FLIP_CLOCK_AUX_04_0007
     * @tc.desc   Verify source.totalCount() equals 48.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactAux04_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux04_0007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 49; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(48));
      expect(source.totalCount()).assertEqual(48);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux04_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactAux04_0008
     * @tc.number SUB_FLIP_CLOCK_AUX_04_0008
     * @tc.desc   Verify source.totalCount() equals 49.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactAux04_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux04_0008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 50; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(49));
      expect(source.totalCount()).assertEqual(49);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux04_0008 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactAux04_0009
     * @tc.number SUB_FLIP_CLOCK_AUX_04_0009
     * @tc.desc   Verify source.totalCount() equals 50.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactAux04_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux04_0009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 51; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(50));
      expect(source.totalCount()).assertEqual(50);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux04_0009 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactAux04_0010
     * @tc.number SUB_FLIP_CLOCK_AUX_04_0010
     * @tc.desc   Verify source.totalCount() equals 51.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactAux04_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux04_0010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 52; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(51));
      expect(source.totalCount()).assertEqual(51);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux04_0010 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactAux04_0011
     * @tc.number SUB_FLIP_CLOCK_AUX_04_0011
     * @tc.desc   Verify source.totalCount() equals 52.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactAux04_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux04_0011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 53; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(52));
      expect(source.totalCount()).assertEqual(52);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux04_0011 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactAux04_0012
     * @tc.number SUB_FLIP_CLOCK_AUX_04_0012
     * @tc.desc   Verify source.totalCount() equals 53.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactAux04_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux04_0012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 54; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(53));
      expect(source.totalCount()).assertEqual(53);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux04_0012 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactAux04_0013
     * @tc.number SUB_FLIP_CLOCK_AUX_04_0013
     * @tc.desc   Verify source.totalCount() equals 54.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactAux04_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux04_0013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 55; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(54));
      expect(source.totalCount()).assertEqual(54);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux04_0013 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactAux04_0014
     * @tc.number SUB_FLIP_CLOCK_AUX_04_0014
     * @tc.desc   Verify source.totalCount() equals 55.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactAux04_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux04_0014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 56; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(55));
      expect(source.totalCount()).assertEqual(55);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux04_0014 end');
    })
  })
}
