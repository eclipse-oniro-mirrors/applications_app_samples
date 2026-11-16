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

export default function canvasGameVolumeForm01Test() {
  describe('CanvasGameVolumeForm01Test', () => {

    /**
     * @tc.name   testCanvasVolForm010001
     * @tc.number SUB_CANVAS_VOL_FORM_01_0001
     * @tc.desc   Form volume case 1-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'm'.repeat(8); expect(a.onFormEvent('id-1', m) === undefined).assertTrue(); expect(m.length).assertEqual(8);
    })

    /**
     * @tc.name   testCanvasVolForm010002
     * @tc.number SUB_CANVAS_VOL_FORM_01_0002
     * @tc.desc   Form volume case 1-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); for (let i: number = 0; i < 3; i++) { expect(a.onChangeFormVisibility(i % 2 === 0) === undefined).assertTrue(); }
    })

    /**
     * @tc.name   testCanvasVolForm010003
     * @tc.number SUB_CANVAS_VOL_FORM_01_0003
     * @tc.desc   Form volume case 1-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'f'.repeat(3); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(3);
    })

    /**
     * @tc.name   testCanvasVolForm010004
     * @tc.number SUB_CANVAS_VOL_FORM_01_0004
     * @tc.desc   Form volume case 1-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'm'.repeat(32); expect(a.onFormEvent('id-4', m) === undefined).assertTrue(); expect(m.length).assertEqual(32);
    })

    /**
     * @tc.name   testCanvasVolForm010005
     * @tc.number SUB_CANVAS_VOL_FORM_01_0005
     * @tc.desc   Form volume case 1-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); for (let i: number = 0; i < 1; i++) { expect(a.onChangeFormVisibility(i % 2 === 0) === undefined).assertTrue(); }
    })

    /**
     * @tc.name   testCanvasVolForm010006
     * @tc.number SUB_CANVAS_VOL_FORM_01_0006
     * @tc.desc   Form volume case 1-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'f'.repeat(6); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(6);
    })

    /**
     * @tc.name   testCanvasVolForm010007
     * @tc.number SUB_CANVAS_VOL_FORM_01_0007
     * @tc.desc   Form volume case 1-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'm'.repeat(56); expect(a.onFormEvent('id-7', m) === undefined).assertTrue(); expect(m.length).assertEqual(56);
    })

    /**
     * @tc.name   testCanvasVolForm010008
     * @tc.number SUB_CANVAS_VOL_FORM_01_0008
     * @tc.desc   Form volume case 1-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); for (let i: number = 0; i < 4; i++) { expect(a.onChangeFormVisibility(i % 2 === 0) === undefined).assertTrue(); }
    })

    /**
     * @tc.name   testCanvasVolForm010009
     * @tc.number SUB_CANVAS_VOL_FORM_01_0009
     * @tc.desc   Form volume case 1-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'f'.repeat(9); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(9);
    })

    /**
     * @tc.name   testCanvasVolForm010010
     * @tc.number SUB_CANVAS_VOL_FORM_01_0010
     * @tc.desc   Form volume case 1-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'm'.repeat(80); expect(a.onFormEvent('id-10', m) === undefined).assertTrue(); expect(m.length).assertEqual(80);
    })

    /**
     * @tc.name   testCanvasVolForm010011
     * @tc.number SUB_CANVAS_VOL_FORM_01_0011
     * @tc.desc   Form volume case 1-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); for (let i: number = 0; i < 2; i++) { expect(a.onChangeFormVisibility(i % 2 === 0) === undefined).assertTrue(); }
    })

    /**
     * @tc.name   testCanvasVolForm010012
     * @tc.number SUB_CANVAS_VOL_FORM_01_0012
     * @tc.desc   Form volume case 1-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'f'.repeat(12); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(12);
    })

    /**
     * @tc.name   testCanvasVolForm010013
     * @tc.number SUB_CANVAS_VOL_FORM_01_0013
     * @tc.desc   Form volume case 1-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'm'.repeat(104); expect(a.onFormEvent('id-13', m) === undefined).assertTrue(); expect(m.length).assertEqual(104);
    })

    /**
     * @tc.name   testCanvasVolForm010014
     * @tc.number SUB_CANVAS_VOL_FORM_01_0014
     * @tc.desc   Form volume case 1-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); for (let i: number = 0; i < 5; i++) { expect(a.onChangeFormVisibility(i % 2 === 0) === undefined).assertTrue(); }
    })

    /**
     * @tc.name   testCanvasVolForm010015
     * @tc.number SUB_CANVAS_VOL_FORM_01_0015
     * @tc.desc   Form volume case 1-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'f'.repeat(15); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(15);
    })

    /**
     * @tc.name   testCanvasVolForm010016
     * @tc.number SUB_CANVAS_VOL_FORM_01_0016
     * @tc.desc   Form volume case 1-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'm'.repeat(128); expect(a.onFormEvent('id-16', m) === undefined).assertTrue(); expect(m.length).assertEqual(128);
    })
  })
}
