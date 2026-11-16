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

export default function flipClockContactAux03Test() {
  describe('FlipClockContactAux03Test', () => {

    /**
     * @tc.name   ohos.samples.flipclock_ContactAux03_0001
     * @tc.number SUB_FLIP_CLOCK_AUX_03_0001
     * @tc.desc   Verify source.totalCount() equals 28.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactAux03_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux03_0001 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 29; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(28));
      expect(source.totalCount()).assertEqual(28);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux03_0001 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactAux03_0002
     * @tc.number SUB_FLIP_CLOCK_AUX_03_0002
     * @tc.desc   Verify source.totalCount() equals 29.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactAux03_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux03_0002 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 30; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(29));
      expect(source.totalCount()).assertEqual(29);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux03_0002 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactAux03_0003
     * @tc.number SUB_FLIP_CLOCK_AUX_03_0003
     * @tc.desc   Verify source.totalCount() equals 30.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactAux03_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux03_0003 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 31; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(30));
      expect(source.totalCount()).assertEqual(30);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux03_0003 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactAux03_0004
     * @tc.number SUB_FLIP_CLOCK_AUX_03_0004
     * @tc.desc   Verify source.totalCount() equals 31.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactAux03_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux03_0004 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 32; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(31));
      expect(source.totalCount()).assertEqual(31);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux03_0004 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactAux03_0005
     * @tc.number SUB_FLIP_CLOCK_AUX_03_0005
     * @tc.desc   Verify source.totalCount() equals 32.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactAux03_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux03_0005 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 33; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(32));
      expect(source.totalCount()).assertEqual(32);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux03_0005 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactAux03_0006
     * @tc.number SUB_FLIP_CLOCK_AUX_03_0006
     * @tc.desc   Verify source.totalCount() equals 33.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactAux03_0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux03_0006 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 34; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(33));
      expect(source.totalCount()).assertEqual(33);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux03_0006 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactAux03_0007
     * @tc.number SUB_FLIP_CLOCK_AUX_03_0007
     * @tc.desc   Verify source.totalCount() equals 34.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactAux03_0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux03_0007 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 35; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(34));
      expect(source.totalCount()).assertEqual(34);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux03_0007 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactAux03_0008
     * @tc.number SUB_FLIP_CLOCK_AUX_03_0008
     * @tc.desc   Verify source.totalCount() equals 35.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactAux03_0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux03_0008 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 36; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(35));
      expect(source.totalCount()).assertEqual(35);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux03_0008 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactAux03_0009
     * @tc.number SUB_FLIP_CLOCK_AUX_03_0009
     * @tc.desc   Verify source.totalCount() equals 36.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactAux03_0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux03_0009 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 37; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(36));
      expect(source.totalCount()).assertEqual(36);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux03_0009 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactAux03_0010
     * @tc.number SUB_FLIP_CLOCK_AUX_03_0010
     * @tc.desc   Verify source.totalCount() equals 37.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactAux03_0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux03_0010 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 38; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(37));
      expect(source.totalCount()).assertEqual(37);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux03_0010 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactAux03_0011
     * @tc.number SUB_FLIP_CLOCK_AUX_03_0011
     * @tc.desc   Verify source.totalCount() equals 38.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactAux03_0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux03_0011 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 39; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(38));
      expect(source.totalCount()).assertEqual(38);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux03_0011 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactAux03_0012
     * @tc.number SUB_FLIP_CLOCK_AUX_03_0012
     * @tc.desc   Verify source.totalCount() equals 39.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactAux03_0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux03_0012 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 40; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(39));
      expect(source.totalCount()).assertEqual(39);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux03_0012 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactAux03_0013
     * @tc.number SUB_FLIP_CLOCK_AUX_03_0013
     * @tc.desc   Verify source.totalCount() equals 40.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactAux03_0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux03_0013 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 41; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(40));
      expect(source.totalCount()).assertEqual(40);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux03_0013 end');
    })

    /**
     * @tc.name   ohos.samples.flipclock_ContactAux03_0014
     * @tc.number SUB_FLIP_CLOCK_AUX_03_0014
     * @tc.desc   Verify source.totalCount() equals 41.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('ohos.samples.flipclock_ContactAux03_0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux03_0014 begin');
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 42; index++) {
        source.pushData(new Contact('k' + index, 'v' + index, index));
        }
      source.deleteData(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.totalCount()), String(41));
      expect(source.totalCount()).assertEqual(41);
      if (source.totalCount() > 0) {
        hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(source.getData(0).key), String('k1'));
        expect(source.getData(0).key).assertEqual('k1');
        }
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(source.getData(source.totalCount()) === undefined));
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'ohos.samples.flipclock_ContactAux03_0014 end');
    })
  })
}
