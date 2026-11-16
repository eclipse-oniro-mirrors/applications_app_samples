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
import EntryFormAbility from '../../../main/ets/entryformability/EntryFormAbility';

export default function canvasGameFinalFormTest() {
  describe('CanvasGameFinalFormTest', () => {

    /**
     * @tc.name   testCanvasFinalForm0001
     * @tc.number SUB_CANVAS_FINAL_FORM_0001
     * @tc.desc   Final form boundary 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalForm0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'z'.repeat(16); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(16);
    })

    /**
     * @tc.name   testCanvasFinalForm0002
     * @tc.number SUB_CANVAS_FINAL_FORM_0002
     * @tc.desc   Final form boundary 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalForm0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'z'.repeat(32); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(32);
    })

    /**
     * @tc.name   testCanvasFinalForm0003
     * @tc.number SUB_CANVAS_FINAL_FORM_0003
     * @tc.desc   Final form boundary 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalForm0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'z'.repeat(48); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(48);
    })

    /**
     * @tc.name   testCanvasFinalForm0004
     * @tc.number SUB_CANVAS_FINAL_FORM_0004
     * @tc.desc   Final form boundary 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalForm0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'z'.repeat(64); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(64);
    })

    /**
     * @tc.name   testCanvasFinalForm0005
     * @tc.number SUB_CANVAS_FINAL_FORM_0005
     * @tc.desc   Final form boundary 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalForm0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'z'.repeat(80); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(80);
    })

    /**
     * @tc.name   testCanvasFinalForm0006
     * @tc.number SUB_CANVAS_FINAL_FORM_0006
     * @tc.desc   Final form boundary 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalForm0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'z'.repeat(96); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(96);
    })

    /**
     * @tc.name   testCanvasFinalForm0007
     * @tc.number SUB_CANVAS_FINAL_FORM_0007
     * @tc.desc   Final form boundary 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalForm0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'z'.repeat(112); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(112);
    })

    /**
     * @tc.name   testCanvasFinalForm0008
     * @tc.number SUB_CANVAS_FINAL_FORM_0008
     * @tc.desc   Final form boundary 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalForm0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'z'.repeat(128); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(128);
    })

    /**
     * @tc.name   testCanvasFinalForm0009
     * @tc.number SUB_CANVAS_FINAL_FORM_0009
     * @tc.desc   Final form boundary 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalForm0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'z'.repeat(144); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(144);
    })

    /**
     * @tc.name   testCanvasFinalForm0010
     * @tc.number SUB_CANVAS_FINAL_FORM_0010
     * @tc.desc   Final form boundary 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalForm0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'z'.repeat(160); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(160);
    })

    /**
     * @tc.name   testCanvasFinalForm0011
     * @tc.number SUB_CANVAS_FINAL_FORM_0011
     * @tc.desc   Final form boundary 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalForm0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'z'.repeat(176); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(176);
    })

    /**
     * @tc.name   testCanvasFinalForm0012
     * @tc.number SUB_CANVAS_FINAL_FORM_0012
     * @tc.desc   Final form boundary 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalForm0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'z'.repeat(192); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(192);
    })

    /**
     * @tc.name   testCanvasFinalForm0013
     * @tc.number SUB_CANVAS_FINAL_FORM_0013
     * @tc.desc   Final form boundary 13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalForm0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'z'.repeat(208); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(208);
    })

    /**
     * @tc.name   testCanvasFinalForm0014
     * @tc.number SUB_CANVAS_FINAL_FORM_0014
     * @tc.desc   Final form boundary 14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalForm0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'z'.repeat(224); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(224);
    })

    /**
     * @tc.name   testCanvasFinalForm0015
     * @tc.number SUB_CANVAS_FINAL_FORM_0015
     * @tc.desc   Final form boundary 15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalForm0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'z'.repeat(240); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(240);
    })

    /**
     * @tc.name   testCanvasFinalForm0016
     * @tc.number SUB_CANVAS_FINAL_FORM_0016
     * @tc.desc   Final form boundary 16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasFinalForm0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'z'.repeat(256); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(256);
    })
  })
}
