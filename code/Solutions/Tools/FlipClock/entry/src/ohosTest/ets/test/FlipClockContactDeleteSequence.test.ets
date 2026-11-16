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

export default function flipClockContactDeleteSequenceTest() {
  describe('FlipClockContactDeleteSequenceTest', () => {

    /**
     * @tc.name   testFlipClockContactDeleteSeq0000
     * @tc.number SUB_FLIP_CLOCK_MORE4_CDEL_0000
     * @tc.desc   Delete first from 2 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDeleteSeq0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 2; index++) { source.pushData(new Contact('k' + index, 'v', index)); }
      source.deleteData(0); expect(source.totalCount()).assertEqual(1); expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockContactDeleteSeq0001
     * @tc.number SUB_FLIP_CLOCK_MORE4_CDEL_0001
     * @tc.desc   Delete first from 3 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDeleteSeq0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 3; index++) { source.pushData(new Contact('k' + index, 'v', index)); }
      source.deleteData(0); expect(source.totalCount()).assertEqual(2); expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockContactDeleteSeq0002
     * @tc.number SUB_FLIP_CLOCK_MORE4_CDEL_0002
     * @tc.desc   Delete first from 4 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDeleteSeq0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 4; index++) { source.pushData(new Contact('k' + index, 'v', index)); }
      source.deleteData(0); expect(source.totalCount()).assertEqual(3); expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockContactDeleteSeq0003
     * @tc.number SUB_FLIP_CLOCK_MORE4_CDEL_0003
     * @tc.desc   Delete first from 5 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDeleteSeq0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 5; index++) { source.pushData(new Contact('k' + index, 'v', index)); }
      source.deleteData(0); expect(source.totalCount()).assertEqual(4); expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockContactDeleteSeq0004
     * @tc.number SUB_FLIP_CLOCK_MORE4_CDEL_0004
     * @tc.desc   Delete first from 6 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDeleteSeq0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 6; index++) { source.pushData(new Contact('k' + index, 'v', index)); }
      source.deleteData(0); expect(source.totalCount()).assertEqual(5); expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockContactDeleteSeq0005
     * @tc.number SUB_FLIP_CLOCK_MORE4_CDEL_0005
     * @tc.desc   Delete first from 7 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDeleteSeq0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 7; index++) { source.pushData(new Contact('k' + index, 'v', index)); }
      source.deleteData(0); expect(source.totalCount()).assertEqual(6); expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockContactDeleteSeq0006
     * @tc.number SUB_FLIP_CLOCK_MORE4_CDEL_0006
     * @tc.desc   Delete first from 8 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDeleteSeq0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 8; index++) { source.pushData(new Contact('k' + index, 'v', index)); }
      source.deleteData(0); expect(source.totalCount()).assertEqual(7); expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })

    /**
     * @tc.name   testFlipClockContactDeleteSeq0007
     * @tc.number SUB_FLIP_CLOCK_MORE4_CDEL_0007
     * @tc.desc   Delete first from 9 contacts.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactDeleteSeq0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]);
      for (let index: number = 0; index < 9; index++) { source.pushData(new Contact('k' + index, 'v', index)); }
      source.deleteData(0); expect(source.totalCount()).assertEqual(8); expect(source.getData(source.totalCount()) === undefined).assertTrue();
    })
  })
}
