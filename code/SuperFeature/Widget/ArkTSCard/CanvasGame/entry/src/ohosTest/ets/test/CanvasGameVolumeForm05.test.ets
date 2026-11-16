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

export default function canvasGameVolumeForm05Test() {
  describe('CanvasGameVolumeForm05Test', () => {

    /**
     * @tc.name   testCanvasVolForm050001
     * @tc.number SUB_CANVAS_VOL_FORM_05_0001
     * @tc.desc   Form volume case 5-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm050001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'm'.repeat(520); expect(a.onFormEvent('id-65', m) === undefined).assertTrue(); expect(m.length).assertEqual(520);
    })

    /**
     * @tc.name   testCanvasVolForm050002
     * @tc.number SUB_CANVAS_VOL_FORM_05_0002
     * @tc.desc   Form volume case 5-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm050002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); for (let i: number = 0; i < 2; i++) { expect(a.onChangeFormVisibility(i % 2 === 0) === undefined).assertTrue(); }
    })

    /**
     * @tc.name   testCanvasVolForm050003
     * @tc.number SUB_CANVAS_VOL_FORM_05_0003
     * @tc.desc   Form volume case 5-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm050003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'f'.repeat(67); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(67);
    })

    /**
     * @tc.name   testCanvasVolForm050004
     * @tc.number SUB_CANVAS_VOL_FORM_05_0004
     * @tc.desc   Form volume case 5-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm050004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'm'.repeat(544); expect(a.onFormEvent('id-68', m) === undefined).assertTrue(); expect(m.length).assertEqual(544);
    })

    /**
     * @tc.name   testCanvasVolForm050005
     * @tc.number SUB_CANVAS_VOL_FORM_05_0005
     * @tc.desc   Form volume case 5-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm050005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); for (let i: number = 0; i < 5; i++) { expect(a.onChangeFormVisibility(i % 2 === 0) === undefined).assertTrue(); }
    })

    /**
     * @tc.name   testCanvasVolForm050006
     * @tc.number SUB_CANVAS_VOL_FORM_05_0006
     * @tc.desc   Form volume case 5-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm050006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'f'.repeat(70); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(70);
    })

    /**
     * @tc.name   testCanvasVolForm050007
     * @tc.number SUB_CANVAS_VOL_FORM_05_0007
     * @tc.desc   Form volume case 5-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm050007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'm'.repeat(568); expect(a.onFormEvent('id-71', m) === undefined).assertTrue(); expect(m.length).assertEqual(568);
    })

    /**
     * @tc.name   testCanvasVolForm050008
     * @tc.number SUB_CANVAS_VOL_FORM_05_0008
     * @tc.desc   Form volume case 5-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm050008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); for (let i: number = 0; i < 3; i++) { expect(a.onChangeFormVisibility(i % 2 === 0) === undefined).assertTrue(); }
    })

    /**
     * @tc.name   testCanvasVolForm050009
     * @tc.number SUB_CANVAS_VOL_FORM_05_0009
     * @tc.desc   Form volume case 5-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm050009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'f'.repeat(73); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(73);
    })

    /**
     * @tc.name   testCanvasVolForm050010
     * @tc.number SUB_CANVAS_VOL_FORM_05_0010
     * @tc.desc   Form volume case 5-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm050010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'm'.repeat(592); expect(a.onFormEvent('id-74', m) === undefined).assertTrue(); expect(m.length).assertEqual(592);
    })

    /**
     * @tc.name   testCanvasVolForm050011
     * @tc.number SUB_CANVAS_VOL_FORM_05_0011
     * @tc.desc   Form volume case 5-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm050011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); for (let i: number = 0; i < 1; i++) { expect(a.onChangeFormVisibility(i % 2 === 0) === undefined).assertTrue(); }
    })

    /**
     * @tc.name   testCanvasVolForm050012
     * @tc.number SUB_CANVAS_VOL_FORM_05_0012
     * @tc.desc   Form volume case 5-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm050012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'f'.repeat(76); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(76);
    })

    /**
     * @tc.name   testCanvasVolForm050013
     * @tc.number SUB_CANVAS_VOL_FORM_05_0013
     * @tc.desc   Form volume case 5-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm050013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'm'.repeat(616); expect(a.onFormEvent('id-77', m) === undefined).assertTrue(); expect(m.length).assertEqual(616);
    })

    /**
     * @tc.name   testCanvasVolForm050014
     * @tc.number SUB_CANVAS_VOL_FORM_05_0014
     * @tc.desc   Form volume case 5-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm050014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); for (let i: number = 0; i < 4; i++) { expect(a.onChangeFormVisibility(i % 2 === 0) === undefined).assertTrue(); }
    })

    /**
     * @tc.name   testCanvasVolForm050015
     * @tc.number SUB_CANVAS_VOL_FORM_05_0015
     * @tc.desc   Form volume case 5-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm050015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'f'.repeat(79); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(79);
    })

    /**
     * @tc.name   testCanvasVolForm050016
     * @tc.number SUB_CANVAS_VOL_FORM_05_0016
     * @tc.desc   Form volume case 5-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm050016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'm'.repeat(640); expect(a.onFormEvent('id-80', m) === undefined).assertTrue(); expect(m.length).assertEqual(640);
    })
  })
}
