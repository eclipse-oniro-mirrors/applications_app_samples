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

export default function flipClockContactDeleteBothTest() {
  describe('FlipClockContactDeleteBothTest', () => {

    /**
     * @tc.name   testFlipClockContactDeleteBoth0000
     * @tc.number SUB_FLIP_CLOCK_MORE3_CDELB_0000
     * @tc.desc   Delete both ends from 2 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDeleteBoth0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 2; index++) { source.pushData(new Contact('k' + index, 'v', index)); }
      source.deleteData(0); source.deleteData(source.totalCount() - 1);
      expect(source.totalCount()).assertEqual(0); expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockContactDeleteBoth0001
     * @tc.number SUB_FLIP_CLOCK_MORE3_CDELB_0001
     * @tc.desc   Delete both ends from 3 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDeleteBoth0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 3; index++) { source.pushData(new Contact('k' + index, 'v', index)); }
      source.deleteData(0); source.deleteData(source.totalCount() - 1);
      expect(source.totalCount()).assertEqual(1); expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockContactDeleteBoth0002
     * @tc.number SUB_FLIP_CLOCK_MORE3_CDELB_0002
     * @tc.desc   Delete both ends from 4 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDeleteBoth0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 4; index++) { source.pushData(new Contact('k' + index, 'v', index)); }
      source.deleteData(0); source.deleteData(source.totalCount() - 1);
      expect(source.totalCount()).assertEqual(2); expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockContactDeleteBoth0003
     * @tc.number SUB_FLIP_CLOCK_MORE3_CDELB_0003
     * @tc.desc   Delete both ends from 5 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDeleteBoth0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 5; index++) { source.pushData(new Contact('k' + index, 'v', index)); }
      source.deleteData(0); source.deleteData(source.totalCount() - 1);
      expect(source.totalCount()).assertEqual(3); expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockContactDeleteBoth0004
     * @tc.number SUB_FLIP_CLOCK_MORE3_CDELB_0004
     * @tc.desc   Delete both ends from 6 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDeleteBoth0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 6; index++) { source.pushData(new Contact('k' + index, 'v', index)); }
      source.deleteData(0); source.deleteData(source.totalCount() - 1);
      expect(source.totalCount()).assertEqual(4); expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockContactDeleteBoth0005
     * @tc.number SUB_FLIP_CLOCK_MORE3_CDELB_0005
     * @tc.desc   Delete both ends from 7 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDeleteBoth0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 7; index++) { source.pushData(new Contact('k' + index, 'v', index)); }
      source.deleteData(0); source.deleteData(source.totalCount() - 1);
      expect(source.totalCount()).assertEqual(5); expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockContactDeleteBoth0006
     * @tc.number SUB_FLIP_CLOCK_MORE3_CDELB_0006
     * @tc.desc   Delete both ends from 8 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDeleteBoth0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 8; index++) { source.pushData(new Contact('k' + index, 'v', index)); }
      source.deleteData(0); source.deleteData(source.totalCount() - 1);
      expect(source.totalCount()).assertEqual(6); expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockContactDeleteBoth0007
     * @tc.number SUB_FLIP_CLOCK_MORE3_CDELB_0007
     * @tc.desc   Delete both ends from 9 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDeleteBoth0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 9; index++) { source.pushData(new Contact('k' + index, 'v', index)); }
      source.deleteData(0); source.deleteData(source.totalCount() - 1);
      expect(source.totalCount()).assertEqual(7); expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })
  })
}
