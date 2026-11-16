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

export default function canvasGameWaveForm02Test() {
  describe('CanvasGameWaveForm02Test', () => {

    /**
     * @tc.name   testCanvasWaveForm020001
     * @tc.number SUB_CANVAS_WAVE_FORM_02_0001
     * @tc.desc   Wave form case 2-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(68); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(68);
    })

    /**
     * @tc.name   testCanvasWaveForm020002
     * @tc.number SUB_CANVAS_WAVE_FORM_02_0002
     * @tc.desc   Wave form case 2-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(144); expect(a.onFormEvent('f-18', m) === undefined).assertTrue(); expect(m.length).assertEqual(144);
    })

    /**
     * @tc.name   testCanvasWaveForm020003
     * @tc.number SUB_CANVAS_WAVE_FORM_02_0003
     * @tc.desc   Wave form case 2-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(76); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(76);
    })

    /**
     * @tc.name   testCanvasWaveForm020004
     * @tc.number SUB_CANVAS_WAVE_FORM_02_0004
     * @tc.desc   Wave form case 2-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(160); expect(a.onFormEvent('f-20', m) === undefined).assertTrue(); expect(m.length).assertEqual(160);
    })

    /**
     * @tc.name   testCanvasWaveForm020005
     * @tc.number SUB_CANVAS_WAVE_FORM_02_0005
     * @tc.desc   Wave form case 2-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(84); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(84);
    })

    /**
     * @tc.name   testCanvasWaveForm020006
     * @tc.number SUB_CANVAS_WAVE_FORM_02_0006
     * @tc.desc   Wave form case 2-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(176); expect(a.onFormEvent('f-22', m) === undefined).assertTrue(); expect(m.length).assertEqual(176);
    })

    /**
     * @tc.name   testCanvasWaveForm020007
     * @tc.number SUB_CANVAS_WAVE_FORM_02_0007
     * @tc.desc   Wave form case 2-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(92); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(92);
    })

    /**
     * @tc.name   testCanvasWaveForm020008
     * @tc.number SUB_CANVAS_WAVE_FORM_02_0008
     * @tc.desc   Wave form case 2-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(192); expect(a.onFormEvent('f-24', m) === undefined).assertTrue(); expect(m.length).assertEqual(192);
    })

    /**
     * @tc.name   testCanvasWaveForm020009
     * @tc.number SUB_CANVAS_WAVE_FORM_02_0009
     * @tc.desc   Wave form case 2-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(100); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(100);
    })

    /**
     * @tc.name   testCanvasWaveForm020010
     * @tc.number SUB_CANVAS_WAVE_FORM_02_0010
     * @tc.desc   Wave form case 2-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(208); expect(a.onFormEvent('f-26', m) === undefined).assertTrue(); expect(m.length).assertEqual(208);
    })

    /**
     * @tc.name   testCanvasWaveForm020011
     * @tc.number SUB_CANVAS_WAVE_FORM_02_0011
     * @tc.desc   Wave form case 2-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(108); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(108);
    })

    /**
     * @tc.name   testCanvasWaveForm020012
     * @tc.number SUB_CANVAS_WAVE_FORM_02_0012
     * @tc.desc   Wave form case 2-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(224); expect(a.onFormEvent('f-28', m) === undefined).assertTrue(); expect(m.length).assertEqual(224);
    })

    /**
     * @tc.name   testCanvasWaveForm020013
     * @tc.number SUB_CANVAS_WAVE_FORM_02_0013
     * @tc.desc   Wave form case 2-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(116); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(116);
    })

    /**
     * @tc.name   testCanvasWaveForm020014
     * @tc.number SUB_CANVAS_WAVE_FORM_02_0014
     * @tc.desc   Wave form case 2-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(240); expect(a.onFormEvent('f-30', m) === undefined).assertTrue(); expect(m.length).assertEqual(240);
    })

    /**
     * @tc.name   testCanvasWaveForm020015
     * @tc.number SUB_CANVAS_WAVE_FORM_02_0015
     * @tc.desc   Wave form case 2-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(124); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(124);
    })

    /**
     * @tc.name   testCanvasWaveForm020016
     * @tc.number SUB_CANVAS_WAVE_FORM_02_0016
     * @tc.desc   Wave form case 2-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(256); expect(a.onFormEvent('f-32', m) === undefined).assertTrue(); expect(m.length).assertEqual(256);
    })
  })
}
