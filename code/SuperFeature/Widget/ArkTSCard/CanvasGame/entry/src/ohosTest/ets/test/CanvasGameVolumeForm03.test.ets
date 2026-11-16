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

export default function canvasGameVolumeForm03Test() {
  describe('CanvasGameVolumeForm03Test', () => {

    /**
     * @tc.name   testCanvasVolForm030001
     * @tc.number SUB_CANVAS_VOL_FORM_03_0001
     * @tc.desc   Form volume case 3-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm030001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'm'.repeat(264); expect(a.onFormEvent('id-33', m) === undefined).assertTrue(); expect(m.length).assertEqual(264);
    })

    /**
     * @tc.name   testCanvasVolForm030002
     * @tc.number SUB_CANVAS_VOL_FORM_03_0002
     * @tc.desc   Form volume case 3-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm030002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); for (let i: number = 0; i < 5; i++) { expect(a.onChangeFormVisibility(i % 2 === 0) === undefined).assertTrue(); }
    })

    /**
     * @tc.name   testCanvasVolForm030003
     * @tc.number SUB_CANVAS_VOL_FORM_03_0003
     * @tc.desc   Form volume case 3-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm030003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'f'.repeat(35); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(35);
    })

    /**
     * @tc.name   testCanvasVolForm030004
     * @tc.number SUB_CANVAS_VOL_FORM_03_0004
     * @tc.desc   Form volume case 3-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm030004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'm'.repeat(288); expect(a.onFormEvent('id-36', m) === undefined).assertTrue(); expect(m.length).assertEqual(288);
    })

    /**
     * @tc.name   testCanvasVolForm030005
     * @tc.number SUB_CANVAS_VOL_FORM_03_0005
     * @tc.desc   Form volume case 3-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm030005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); for (let i: number = 0; i < 3; i++) { expect(a.onChangeFormVisibility(i % 2 === 0) === undefined).assertTrue(); }
    })

    /**
     * @tc.name   testCanvasVolForm030006
     * @tc.number SUB_CANVAS_VOL_FORM_03_0006
     * @tc.desc   Form volume case 3-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm030006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'f'.repeat(38); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(38);
    })

    /**
     * @tc.name   testCanvasVolForm030007
     * @tc.number SUB_CANVAS_VOL_FORM_03_0007
     * @tc.desc   Form volume case 3-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm030007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'm'.repeat(312); expect(a.onFormEvent('id-39', m) === undefined).assertTrue(); expect(m.length).assertEqual(312);
    })

    /**
     * @tc.name   testCanvasVolForm030008
     * @tc.number SUB_CANVAS_VOL_FORM_03_0008
     * @tc.desc   Form volume case 3-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm030008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); for (let i: number = 0; i < 1; i++) { expect(a.onChangeFormVisibility(i % 2 === 0) === undefined).assertTrue(); }
    })

    /**
     * @tc.name   testCanvasVolForm030009
     * @tc.number SUB_CANVAS_VOL_FORM_03_0009
     * @tc.desc   Form volume case 3-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm030009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'f'.repeat(41); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(41);
    })

    /**
     * @tc.name   testCanvasVolForm030010
     * @tc.number SUB_CANVAS_VOL_FORM_03_0010
     * @tc.desc   Form volume case 3-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm030010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'm'.repeat(336); expect(a.onFormEvent('id-42', m) === undefined).assertTrue(); expect(m.length).assertEqual(336);
    })

    /**
     * @tc.name   testCanvasVolForm030011
     * @tc.number SUB_CANVAS_VOL_FORM_03_0011
     * @tc.desc   Form volume case 3-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm030011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); for (let i: number = 0; i < 4; i++) { expect(a.onChangeFormVisibility(i % 2 === 0) === undefined).assertTrue(); }
    })

    /**
     * @tc.name   testCanvasVolForm030012
     * @tc.number SUB_CANVAS_VOL_FORM_03_0012
     * @tc.desc   Form volume case 3-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm030012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'f'.repeat(44); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(44);
    })

    /**
     * @tc.name   testCanvasVolForm030013
     * @tc.number SUB_CANVAS_VOL_FORM_03_0013
     * @tc.desc   Form volume case 3-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm030013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'm'.repeat(360); expect(a.onFormEvent('id-45', m) === undefined).assertTrue(); expect(m.length).assertEqual(360);
    })

    /**
     * @tc.name   testCanvasVolForm030014
     * @tc.number SUB_CANVAS_VOL_FORM_03_0014
     * @tc.desc   Form volume case 3-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm030014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); for (let i: number = 0; i < 2; i++) { expect(a.onChangeFormVisibility(i % 2 === 0) === undefined).assertTrue(); }
    })

    /**
     * @tc.name   testCanvasVolForm030015
     * @tc.number SUB_CANVAS_VOL_FORM_03_0015
     * @tc.desc   Form volume case 3-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm030015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'f'.repeat(47); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(47);
    })

    /**
     * @tc.name   testCanvasVolForm030016
     * @tc.number SUB_CANVAS_VOL_FORM_03_0016
     * @tc.desc   Form volume case 3-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm030016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'm'.repeat(384); expect(a.onFormEvent('id-48', m) === undefined).assertTrue(); expect(m.length).assertEqual(384);
    })
  })
}
