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

export default function canvasGameWaveForm03Test() {
  describe('CanvasGameWaveForm03Test', () => {

    /**
     * @tc.name   testCanvasWaveForm030001
     * @tc.number SUB_CANVAS_WAVE_FORM_03_0001
     * @tc.desc   Wave form case 3-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm030001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(132); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(132);
    })

    /**
     * @tc.name   testCanvasWaveForm030002
     * @tc.number SUB_CANVAS_WAVE_FORM_03_0002
     * @tc.desc   Wave form case 3-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm030002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(272); expect(a.onFormEvent('f-34', m) === undefined).assertTrue(); expect(m.length).assertEqual(272);
    })

    /**
     * @tc.name   testCanvasWaveForm030003
     * @tc.number SUB_CANVAS_WAVE_FORM_03_0003
     * @tc.desc   Wave form case 3-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm030003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(140); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(140);
    })

    /**
     * @tc.name   testCanvasWaveForm030004
     * @tc.number SUB_CANVAS_WAVE_FORM_03_0004
     * @tc.desc   Wave form case 3-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm030004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(288); expect(a.onFormEvent('f-36', m) === undefined).assertTrue(); expect(m.length).assertEqual(288);
    })

    /**
     * @tc.name   testCanvasWaveForm030005
     * @tc.number SUB_CANVAS_WAVE_FORM_03_0005
     * @tc.desc   Wave form case 3-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm030005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(148); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(148);
    })

    /**
     * @tc.name   testCanvasWaveForm030006
     * @tc.number SUB_CANVAS_WAVE_FORM_03_0006
     * @tc.desc   Wave form case 3-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm030006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(304); expect(a.onFormEvent('f-38', m) === undefined).assertTrue(); expect(m.length).assertEqual(304);
    })

    /**
     * @tc.name   testCanvasWaveForm030007
     * @tc.number SUB_CANVAS_WAVE_FORM_03_0007
     * @tc.desc   Wave form case 3-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm030007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(156); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(156);
    })

    /**
     * @tc.name   testCanvasWaveForm030008
     * @tc.number SUB_CANVAS_WAVE_FORM_03_0008
     * @tc.desc   Wave form case 3-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm030008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(320); expect(a.onFormEvent('f-40', m) === undefined).assertTrue(); expect(m.length).assertEqual(320);
    })

    /**
     * @tc.name   testCanvasWaveForm030009
     * @tc.number SUB_CANVAS_WAVE_FORM_03_0009
     * @tc.desc   Wave form case 3-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm030009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(164); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(164);
    })

    /**
     * @tc.name   testCanvasWaveForm030010
     * @tc.number SUB_CANVAS_WAVE_FORM_03_0010
     * @tc.desc   Wave form case 3-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm030010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(336); expect(a.onFormEvent('f-42', m) === undefined).assertTrue(); expect(m.length).assertEqual(336);
    })

    /**
     * @tc.name   testCanvasWaveForm030011
     * @tc.number SUB_CANVAS_WAVE_FORM_03_0011
     * @tc.desc   Wave form case 3-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm030011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(172); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(172);
    })

    /**
     * @tc.name   testCanvasWaveForm030012
     * @tc.number SUB_CANVAS_WAVE_FORM_03_0012
     * @tc.desc   Wave form case 3-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm030012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(352); expect(a.onFormEvent('f-44', m) === undefined).assertTrue(); expect(m.length).assertEqual(352);
    })

    /**
     * @tc.name   testCanvasWaveForm030013
     * @tc.number SUB_CANVAS_WAVE_FORM_03_0013
     * @tc.desc   Wave form case 3-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm030013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(180); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(180);
    })

    /**
     * @tc.name   testCanvasWaveForm030014
     * @tc.number SUB_CANVAS_WAVE_FORM_03_0014
     * @tc.desc   Wave form case 3-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm030014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(368); expect(a.onFormEvent('f-46', m) === undefined).assertTrue(); expect(m.length).assertEqual(368);
    })

    /**
     * @tc.name   testCanvasWaveForm030015
     * @tc.number SUB_CANVAS_WAVE_FORM_03_0015
     * @tc.desc   Wave form case 3-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm030015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'w'.repeat(188); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(188);
    })

    /**
     * @tc.name   testCanvasWaveForm030016
     * @tc.number SUB_CANVAS_WAVE_FORM_03_0016
     * @tc.desc   Wave form case 3-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasWaveForm030016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'e'.repeat(384); expect(a.onFormEvent('f-48', m) === undefined).assertTrue(); expect(m.length).assertEqual(384);
    })
  })
}
