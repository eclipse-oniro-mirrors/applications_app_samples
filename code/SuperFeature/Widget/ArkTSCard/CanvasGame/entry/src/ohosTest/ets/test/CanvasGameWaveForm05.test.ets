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

export default function canvasGameWaveForm05Test() {
  describe('CanvasGameWaveForm05Test', () => {

    /**
     * @tc.name   testCanvasWaveForm050001
     * @tc.number SUB_CANVAS_WAVE_FORM_05_0001
     * @tc.desc   Wave form case 5-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm050001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(260); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(260);
    })

    /**
     * @tc.name   testCanvasWaveForm050002
     * @tc.number SUB_CANVAS_WAVE_FORM_05_0002
     * @tc.desc   Wave form case 5-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm050002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(528); expect(a.onFormEvent('f-66', m) === undefined).assertTrue(); expect(m.length).assertEqual(528);
    })

    /**
     * @tc.name   testCanvasWaveForm050003
     * @tc.number SUB_CANVAS_WAVE_FORM_05_0003
     * @tc.desc   Wave form case 5-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm050003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(268); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(268);
    })

    /**
     * @tc.name   testCanvasWaveForm050004
     * @tc.number SUB_CANVAS_WAVE_FORM_05_0004
     * @tc.desc   Wave form case 5-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm050004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(544); expect(a.onFormEvent('f-68', m) === undefined).assertTrue(); expect(m.length).assertEqual(544);
    })

    /**
     * @tc.name   testCanvasWaveForm050005
     * @tc.number SUB_CANVAS_WAVE_FORM_05_0005
     * @tc.desc   Wave form case 5-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm050005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(276); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(276);
    })

    /**
     * @tc.name   testCanvasWaveForm050006
     * @tc.number SUB_CANVAS_WAVE_FORM_05_0006
     * @tc.desc   Wave form case 5-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm050006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(560); expect(a.onFormEvent('f-70', m) === undefined).assertTrue(); expect(m.length).assertEqual(560);
    })

    /**
     * @tc.name   testCanvasWaveForm050007
     * @tc.number SUB_CANVAS_WAVE_FORM_05_0007
     * @tc.desc   Wave form case 5-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm050007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(284); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(284);
    })

    /**
     * @tc.name   testCanvasWaveForm050008
     * @tc.number SUB_CANVAS_WAVE_FORM_05_0008
     * @tc.desc   Wave form case 5-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm050008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(576); expect(a.onFormEvent('f-72', m) === undefined).assertTrue(); expect(m.length).assertEqual(576);
    })

    /**
     * @tc.name   testCanvasWaveForm050009
     * @tc.number SUB_CANVAS_WAVE_FORM_05_0009
     * @tc.desc   Wave form case 5-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm050009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(292); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(292);
    })

    /**
     * @tc.name   testCanvasWaveForm050010
     * @tc.number SUB_CANVAS_WAVE_FORM_05_0010
     * @tc.desc   Wave form case 5-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm050010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(592); expect(a.onFormEvent('f-74', m) === undefined).assertTrue(); expect(m.length).assertEqual(592);
    })

    /**
     * @tc.name   testCanvasWaveForm050011
     * @tc.number SUB_CANVAS_WAVE_FORM_05_0011
     * @tc.desc   Wave form case 5-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm050011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(300); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(300);
    })

    /**
     * @tc.name   testCanvasWaveForm050012
     * @tc.number SUB_CANVAS_WAVE_FORM_05_0012
     * @tc.desc   Wave form case 5-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm050012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(608); expect(a.onFormEvent('f-76', m) === undefined).assertTrue(); expect(m.length).assertEqual(608);
    })

    /**
     * @tc.name   testCanvasWaveForm050013
     * @tc.number SUB_CANVAS_WAVE_FORM_05_0013
     * @tc.desc   Wave form case 5-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm050013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(308); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(308);
    })

    /**
     * @tc.name   testCanvasWaveForm050014
     * @tc.number SUB_CANVAS_WAVE_FORM_05_0014
     * @tc.desc   Wave form case 5-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm050014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(624); expect(a.onFormEvent('f-78', m) === undefined).assertTrue(); expect(m.length).assertEqual(624);
    })

    /**
     * @tc.name   testCanvasWaveForm050015
     * @tc.number SUB_CANVAS_WAVE_FORM_05_0015
     * @tc.desc   Wave form case 5-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm050015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(316); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(316);
    })

    /**
     * @tc.name   testCanvasWaveForm050016
     * @tc.number SUB_CANVAS_WAVE_FORM_05_0016
     * @tc.desc   Wave form case 5-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm050016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(640); expect(a.onFormEvent('f-80', m) === undefined).assertTrue(); expect(m.length).assertEqual(640);
    })
  })
}
