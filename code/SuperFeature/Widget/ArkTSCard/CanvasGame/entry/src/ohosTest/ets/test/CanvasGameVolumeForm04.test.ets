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

export default function canvasGameVolumeForm04Test() {
  describe('CanvasGameVolumeForm04Test', () => {

    /**
     * @tc.name   testCanvasVolForm040001
     * @tc.number SUB_CANVAS_VOL_FORM_04_0001
     * @tc.desc   Form volume case 4-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm040001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'm'.repeat(392); expect(a.onFormEvent('id-49', m) === undefined).assertTrue(); expect(m.length).assertEqual(392);
    })

    /**
     * @tc.name   testCanvasVolForm040002
     * @tc.number SUB_CANVAS_VOL_FORM_04_0002
     * @tc.desc   Form volume case 4-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm040002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); for (let i: number = 0; i < 1; i++) { expect(a.onChangeFormVisibility(i % 2 === 0) === undefined).assertTrue(); }
    })

    /**
     * @tc.name   testCanvasVolForm040003
     * @tc.number SUB_CANVAS_VOL_FORM_04_0003
     * @tc.desc   Form volume case 4-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm040003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'f'.repeat(51); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(51);
    })

    /**
     * @tc.name   testCanvasVolForm040004
     * @tc.number SUB_CANVAS_VOL_FORM_04_0004
     * @tc.desc   Form volume case 4-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm040004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'm'.repeat(416); expect(a.onFormEvent('id-52', m) === undefined).assertTrue(); expect(m.length).assertEqual(416);
    })

    /**
     * @tc.name   testCanvasVolForm040005
     * @tc.number SUB_CANVAS_VOL_FORM_04_0005
     * @tc.desc   Form volume case 4-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm040005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); for (let i: number = 0; i < 4; i++) { expect(a.onChangeFormVisibility(i % 2 === 0) === undefined).assertTrue(); }
    })

    /**
     * @tc.name   testCanvasVolForm040006
     * @tc.number SUB_CANVAS_VOL_FORM_04_0006
     * @tc.desc   Form volume case 4-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm040006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'f'.repeat(54); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(54);
    })

    /**
     * @tc.name   testCanvasVolForm040007
     * @tc.number SUB_CANVAS_VOL_FORM_04_0007
     * @tc.desc   Form volume case 4-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm040007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'm'.repeat(440); expect(a.onFormEvent('id-55', m) === undefined).assertTrue(); expect(m.length).assertEqual(440);
    })

    /**
     * @tc.name   testCanvasVolForm040008
     * @tc.number SUB_CANVAS_VOL_FORM_04_0008
     * @tc.desc   Form volume case 4-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm040008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); for (let i: number = 0; i < 2; i++) { expect(a.onChangeFormVisibility(i % 2 === 0) === undefined).assertTrue(); }
    })

    /**
     * @tc.name   testCanvasVolForm040009
     * @tc.number SUB_CANVAS_VOL_FORM_04_0009
     * @tc.desc   Form volume case 4-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm040009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'f'.repeat(57); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(57);
    })

    /**
     * @tc.name   testCanvasVolForm040010
     * @tc.number SUB_CANVAS_VOL_FORM_04_0010
     * @tc.desc   Form volume case 4-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm040010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'm'.repeat(464); expect(a.onFormEvent('id-58', m) === undefined).assertTrue(); expect(m.length).assertEqual(464);
    })

    /**
     * @tc.name   testCanvasVolForm040011
     * @tc.number SUB_CANVAS_VOL_FORM_04_0011
     * @tc.desc   Form volume case 4-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm040011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); for (let i: number = 0; i < 5; i++) { expect(a.onChangeFormVisibility(i % 2 === 0) === undefined).assertTrue(); }
    })

    /**
     * @tc.name   testCanvasVolForm040012
     * @tc.number SUB_CANVAS_VOL_FORM_04_0012
     * @tc.desc   Form volume case 4-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm040012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'f'.repeat(60); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(60);
    })

    /**
     * @tc.name   testCanvasVolForm040013
     * @tc.number SUB_CANVAS_VOL_FORM_04_0013
     * @tc.desc   Form volume case 4-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm040013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'm'.repeat(488); expect(a.onFormEvent('id-61', m) === undefined).assertTrue(); expect(m.length).assertEqual(488);
    })

    /**
     * @tc.name   testCanvasVolForm040014
     * @tc.number SUB_CANVAS_VOL_FORM_04_0014
     * @tc.desc   Form volume case 4-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm040014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); for (let i: number = 0; i < 3; i++) { expect(a.onChangeFormVisibility(i % 2 === 0) === undefined).assertTrue(); }
    })

    /**
     * @tc.name   testCanvasVolForm040015
     * @tc.number SUB_CANVAS_VOL_FORM_04_0015
     * @tc.desc   Form volume case 4-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm040015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'f'.repeat(63); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(63);
    })

    /**
     * @tc.name   testCanvasVolForm040016
     * @tc.number SUB_CANVAS_VOL_FORM_04_0016
     * @tc.desc   Form volume case 4-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm040016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'm'.repeat(512); expect(a.onFormEvent('id-64', m) === undefined).assertTrue(); expect(m.length).assertEqual(512);
    })
  })
}
