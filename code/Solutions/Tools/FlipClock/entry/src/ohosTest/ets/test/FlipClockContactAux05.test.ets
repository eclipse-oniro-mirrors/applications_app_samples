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
import { ContactSource, Contact } from '../../../main/ets/common/DataSource';

export default function flipClockContactAux05Test() {
  describe('FlipClockContactAux05Test', () => {

    /**
     * @tc.name   testFlipClockAux050001
     * @tc.number SUB_FLIP_CLOCK_AUX_05_0001
     * @tc.desc   Contact auxiliary size 5-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux050001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 57; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(56);
      if (source.totalCount() > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux050002
     * @tc.number SUB_FLIP_CLOCK_AUX_05_0002
     * @tc.desc   Contact auxiliary size 5-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux050002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 58; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(57);
      if (source.totalCount() > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux050003
     * @tc.number SUB_FLIP_CLOCK_AUX_05_0003
     * @tc.desc   Contact auxiliary size 5-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux050003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 59; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(58);
      if (source.totalCount() > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux050004
     * @tc.number SUB_FLIP_CLOCK_AUX_05_0004
     * @tc.desc   Contact auxiliary size 5-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux050004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 60; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(59);
      if (source.totalCount() > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux050005
     * @tc.number SUB_FLIP_CLOCK_AUX_05_0005
     * @tc.desc   Contact auxiliary size 5-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux050005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 61; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(60);
      if (source.totalCount() > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux050006
     * @tc.number SUB_FLIP_CLOCK_AUX_05_0006
     * @tc.desc   Contact auxiliary size 5-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux050006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 62; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(61);
      if (source.totalCount() > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux050007
     * @tc.number SUB_FLIP_CLOCK_AUX_05_0007
     * @tc.desc   Contact auxiliary size 5-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux050007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 63; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(62);
      if (source.totalCount() > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux050008
     * @tc.number SUB_FLIP_CLOCK_AUX_05_0008
     * @tc.desc   Contact auxiliary size 5-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux050008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 64; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(63);
      if (source.totalCount() > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux050009
     * @tc.number SUB_FLIP_CLOCK_AUX_05_0009
     * @tc.desc   Contact auxiliary size 5-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux050009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 65; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(64);
      if (source.totalCount() > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux050010
     * @tc.number SUB_FLIP_CLOCK_AUX_05_0010
     * @tc.desc   Contact auxiliary size 5-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux050010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 66; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(65);
      if (source.totalCount() > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux050011
     * @tc.number SUB_FLIP_CLOCK_AUX_05_0011
     * @tc.desc   Contact auxiliary size 5-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux050011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 67; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(66);
      if (source.totalCount() > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux050012
     * @tc.number SUB_FLIP_CLOCK_AUX_05_0012
     * @tc.desc   Contact auxiliary size 5-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux050012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 68; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(67);
      if (source.totalCount() > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux050013
     * @tc.number SUB_FLIP_CLOCK_AUX_05_0013
     * @tc.desc   Contact auxiliary size 5-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux050013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 69; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(68);
      if (source.totalCount() > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockAux050014
     * @tc.number SUB_FLIP_CLOCK_AUX_05_0014
     * @tc.desc   Contact auxiliary size 5-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockAux050014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 70; index++) { source.pushData(new Contact('k' + index, 'v' + index, index)); }
      source.deleteData(0);
      expect(source.totalCount()).assertEqual(69);
      if (source.totalCount() > 0) { expect(source.getData(0).key).assertEqual('k1'); }
      expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })
  })
}
