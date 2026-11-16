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

export default function flipClockContactBigReplaceTest() {
  describe('FlipClockContactBigReplaceTest', () => {

    /**
     * @tc.name   testFlipClockContactBigReplace0000
     * @tc.number SUB_FLIP_CLOCK_MORE5_CBIG_0000
     * @tc.desc   Replace ContactSource with 9 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactBigReplace0000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]); const next: Contact[] = []; for (let index: number = 0; index < 9; index++) { next.push(new Contact('k' + index, 'v', index)); }
      source.replaceData(next); expect(source.totalCount()).assertEqual(9); expect(source.getData(8).reminderId).assertEqual(8);
    })

    /**
     * @tc.name   testFlipClockContactBigReplace0001
     * @tc.number SUB_FLIP_CLOCK_MORE5_CBIG_0001
     * @tc.desc   Replace ContactSource with 10 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactBigReplace0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]); const next: Contact[] = []; for (let index: number = 0; index < 10; index++) { next.push(new Contact('k' + index, 'v', index)); }
      source.replaceData(next); expect(source.totalCount()).assertEqual(10); expect(source.getData(9).reminderId).assertEqual(9);
    })

    /**
     * @tc.name   testFlipClockContactBigReplace0002
     * @tc.number SUB_FLIP_CLOCK_MORE5_CBIG_0002
     * @tc.desc   Replace ContactSource with 11 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactBigReplace0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]); const next: Contact[] = []; for (let index: number = 0; index < 11; index++) { next.push(new Contact('k' + index, 'v', index)); }
      source.replaceData(next); expect(source.totalCount()).assertEqual(11); expect(source.getData(10).reminderId).assertEqual(10);
    })

    /**
     * @tc.name   testFlipClockContactBigReplace0003
     * @tc.number SUB_FLIP_CLOCK_MORE5_CBIG_0003
     * @tc.desc   Replace ContactSource with 12 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactBigReplace0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]); const next: Contact[] = []; for (let index: number = 0; index < 12; index++) { next.push(new Contact('k' + index, 'v', index)); }
      source.replaceData(next); expect(source.totalCount()).assertEqual(12); expect(source.getData(11).reminderId).assertEqual(11);
    })

    /**
     * @tc.name   testFlipClockContactBigReplace0004
     * @tc.number SUB_FLIP_CLOCK_MORE5_CBIG_0004
     * @tc.desc   Replace ContactSource with 13 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactBigReplace0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]); const next: Contact[] = []; for (let index: number = 0; index < 13; index++) { next.push(new Contact('k' + index, 'v', index)); }
      source.replaceData(next); expect(source.totalCount()).assertEqual(13); expect(source.getData(12).reminderId).assertEqual(12);
    })

    /**
     * @tc.name   testFlipClockContactBigReplace0005
     * @tc.number SUB_FLIP_CLOCK_MORE5_CBIG_0005
     * @tc.desc   Replace ContactSource with 14 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactBigReplace0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]); const next: Contact[] = []; for (let index: number = 0; index < 14; index++) { next.push(new Contact('k' + index, 'v', index)); }
      source.replaceData(next); expect(source.totalCount()).assertEqual(14); expect(source.getData(13).reminderId).assertEqual(13);
    })

    /**
     * @tc.name   testFlipClockContactBigReplace0006
     * @tc.number SUB_FLIP_CLOCK_MORE5_CBIG_0006
     * @tc.desc   Replace ContactSource with 15 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactBigReplace0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]); const next: Contact[] = []; for (let index: number = 0; index < 15; index++) { next.push(new Contact('k' + index, 'v', index)); }
      source.replaceData(next); expect(source.totalCount()).assertEqual(15); expect(source.getData(14).reminderId).assertEqual(14);
    })

    /**
     * @tc.name   testFlipClockContactBigReplace0007
     * @tc.number SUB_FLIP_CLOCK_MORE5_CBIG_0007
     * @tc.desc   Replace ContactSource with 16 entries.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testFlipClockContactBigReplace0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const source: ContactSource = new ContactSource([]); const next: Contact[] = []; for (let index: number = 0; index < 16; index++) { next.push(new Contact('k' + index, 'v', index)); }
      source.replaceData(next); expect(source.totalCount()).assertEqual(16); expect(source.getData(15).reminderId).assertEqual(15);
    })
  })
}
