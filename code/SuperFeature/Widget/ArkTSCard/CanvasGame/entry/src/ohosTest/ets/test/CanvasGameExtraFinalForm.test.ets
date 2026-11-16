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

export default function canvasGameExtraFinalFormTest() {
  describe('CanvasGameExtraFinalFormTest', () => {

    /**
     * @tc.name   testCanvasExtraFinalForm0001
     * @tc.number SUB_CANVAS_EXTRA_FINAL_FORM_0001
     * @tc.desc   Extra CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraFinalForm0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'u'.repeat(192); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(192);
    })

    /**
     * @tc.name   testCanvasExtraFinalForm0002
     * @tc.number SUB_CANVAS_EXTRA_FINAL_FORM_0002
     * @tc.desc   Extra CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraFinalForm0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'u'.repeat(384); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(384);
    })

    /**
     * @tc.name   testCanvasExtraFinalForm0003
     * @tc.number SUB_CANVAS_EXTRA_FINAL_FORM_0003
     * @tc.desc   Extra CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraFinalForm0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'u'.repeat(576); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(576);
    })

    /**
     * @tc.name   testCanvasExtraFinalForm0004
     * @tc.number SUB_CANVAS_EXTRA_FINAL_FORM_0004
     * @tc.desc   Extra CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraFinalForm0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'u'.repeat(768); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(768);
    })

    /**
     * @tc.name   testCanvasExtraFinalForm0005
     * @tc.number SUB_CANVAS_EXTRA_FINAL_FORM_0005
     * @tc.desc   Extra CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraFinalForm0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'u'.repeat(960); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(960);
    })

    /**
     * @tc.name   testCanvasExtraFinalForm0006
     * @tc.number SUB_CANVAS_EXTRA_FINAL_FORM_0006
     * @tc.desc   Extra CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraFinalForm0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'u'.repeat(1152); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(1152);
    })

    /**
     * @tc.name   testCanvasExtraFinalForm0007
     * @tc.number SUB_CANVAS_EXTRA_FINAL_FORM_0007
     * @tc.desc   Extra CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraFinalForm0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'u'.repeat(1344); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(1344);
    })

    /**
     * @tc.name   testCanvasExtraFinalForm0008
     * @tc.number SUB_CANVAS_EXTRA_FINAL_FORM_0008
     * @tc.desc   Extra CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraFinalForm0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'u'.repeat(1536); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(1536);
    })

    /**
     * @tc.name   testCanvasExtraFinalForm0009
     * @tc.number SUB_CANVAS_EXTRA_FINAL_FORM_0009
     * @tc.desc   Extra CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraFinalForm0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'u'.repeat(1728); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(1728);
    })

    /**
     * @tc.name   testCanvasExtraFinalForm0010
     * @tc.number SUB_CANVAS_EXTRA_FINAL_FORM_0010
     * @tc.desc   Extra CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraFinalForm0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'u'.repeat(1920); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(1920);
    })

    /**
     * @tc.name   testCanvasExtraFinalForm0011
     * @tc.number SUB_CANVAS_EXTRA_FINAL_FORM_0011
     * @tc.desc   Extra CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraFinalForm0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'u'.repeat(2112); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(2112);
    })

    /**
     * @tc.name   testCanvasExtraFinalForm0012
     * @tc.number SUB_CANVAS_EXTRA_FINAL_FORM_0012
     * @tc.desc   Extra CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraFinalForm0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'u'.repeat(2304); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(2304);
    })

    /**
     * @tc.name   testCanvasExtraFinalForm0013
     * @tc.number SUB_CANVAS_EXTRA_FINAL_FORM_0013
     * @tc.desc   Extra CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraFinalForm0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'u'.repeat(2496); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(2496);
    })

    /**
     * @tc.name   testCanvasExtraFinalForm0014
     * @tc.number SUB_CANVAS_EXTRA_FINAL_FORM_0014
     * @tc.desc   Extra CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraFinalForm0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'u'.repeat(2688); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(2688);
    })

    /**
     * @tc.name   testCanvasExtraFinalForm0015
     * @tc.number SUB_CANVAS_EXTRA_FINAL_FORM_0015
     * @tc.desc   Extra CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraFinalForm0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'u'.repeat(2880); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(2880);
    })

    /**
     * @tc.name   testCanvasExtraFinalForm0016
     * @tc.number SUB_CANVAS_EXTRA_FINAL_FORM_0016
     * @tc.desc   Extra CanvasGame boundary case.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasExtraFinalForm0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'u'.repeat(3072); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(3072);
    })
  })
}
