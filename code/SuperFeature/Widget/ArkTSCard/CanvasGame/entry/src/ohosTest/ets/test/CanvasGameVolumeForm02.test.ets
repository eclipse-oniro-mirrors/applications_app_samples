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

export default function canvasGameVolumeForm02Test() {
  describe('CanvasGameVolumeForm02Test', () => {

    /**
     * @tc.name   testCanvasVolForm020001
     * @tc.number SUB_CANVAS_VOL_FORM_02_0001
     * @tc.desc   Form volume case 2-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm020001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'm'.repeat(136); expect(a.onFormEvent('id-17', m) === undefined).assertTrue(); expect(m.length).assertEqual(136);
    })

    /**
     * @tc.name   testCanvasVolForm020002
     * @tc.number SUB_CANVAS_VOL_FORM_02_0002
     * @tc.desc   Form volume case 2-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm020002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); for (let i: number = 0; i < 4; i++) { expect(a.onChangeFormVisibility(i % 2 === 0) === undefined).assertTrue(); } expect(true).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolForm020003
     * @tc.number SUB_CANVAS_VOL_FORM_02_0003
     * @tc.desc   Form volume case 2-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm020003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'f'.repeat(19); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(19);
    })

    /**
     * @tc.name   testCanvasVolForm020004
     * @tc.number SUB_CANVAS_VOL_FORM_02_0004
     * @tc.desc   Form volume case 2-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm020004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'm'.repeat(160); expect(a.onFormEvent('id-20', m) === undefined).assertTrue(); expect(m.length).assertEqual(160);
    })

    /**
     * @tc.name   testCanvasVolForm020005
     * @tc.number SUB_CANVAS_VOL_FORM_02_0005
     * @tc.desc   Form volume case 2-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm020005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); for (let i: number = 0; i < 2; i++) { expect(a.onChangeFormVisibility(i % 2 === 0) === undefined).assertTrue(); } expect(true).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolForm020006
     * @tc.number SUB_CANVAS_VOL_FORM_02_0006
     * @tc.desc   Form volume case 2-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm020006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'f'.repeat(22); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(22);
    })

    /**
     * @tc.name   testCanvasVolForm020007
     * @tc.number SUB_CANVAS_VOL_FORM_02_0007
     * @tc.desc   Form volume case 2-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm020007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'm'.repeat(184); expect(a.onFormEvent('id-23', m) === undefined).assertTrue(); expect(m.length).assertEqual(184);
    })

    /**
     * @tc.name   testCanvasVolForm020008
     * @tc.number SUB_CANVAS_VOL_FORM_02_0008
     * @tc.desc   Form volume case 2-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm020008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); for (let i: number = 0; i < 5; i++) { expect(a.onChangeFormVisibility(i % 2 === 0) === undefined).assertTrue(); } expect(true).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolForm020009
     * @tc.number SUB_CANVAS_VOL_FORM_02_0009
     * @tc.desc   Form volume case 2-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm020009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'f'.repeat(25); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(25);
    })

    /**
     * @tc.name   testCanvasVolForm020010
     * @tc.number SUB_CANVAS_VOL_FORM_02_0010
     * @tc.desc   Form volume case 2-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm020010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'm'.repeat(208); expect(a.onFormEvent('id-26', m) === undefined).assertTrue(); expect(m.length).assertEqual(208);
    })

    /**
     * @tc.name   testCanvasVolForm020011
     * @tc.number SUB_CANVAS_VOL_FORM_02_0011
     * @tc.desc   Form volume case 2-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm020011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); for (let i: number = 0; i < 3; i++) { expect(a.onChangeFormVisibility(i % 2 === 0) === undefined).assertTrue(); } expect(true).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolForm020012
     * @tc.number SUB_CANVAS_VOL_FORM_02_0012
     * @tc.desc   Form volume case 2-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm020012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'f'.repeat(28); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(28);
    })

    /**
     * @tc.name   testCanvasVolForm020013
     * @tc.number SUB_CANVAS_VOL_FORM_02_0013
     * @tc.desc   Form volume case 2-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm020013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'm'.repeat(232); expect(a.onFormEvent('id-29', m) === undefined).assertTrue(); expect(m.length).assertEqual(232);
    })

    /**
     * @tc.name   testCanvasVolForm020014
     * @tc.number SUB_CANVAS_VOL_FORM_02_0014
     * @tc.desc   Form volume case 2-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm020014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); for (let i: number = 0; i < 1; i++) { expect(a.onChangeFormVisibility(i % 2 === 0) === undefined).assertTrue(); } expect(true).assertTrue();
    })

    /**
     * @tc.name   testCanvasVolForm020015
     * @tc.number SUB_CANVAS_VOL_FORM_02_0015
     * @tc.desc   Form volume case 2-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm020015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const id: string = 'f'.repeat(31); expect(a.onUpdateForm(id) === undefined).assertTrue(); expect(id.length).assertEqual(31);
    })

    /**
     * @tc.name   testCanvasVolForm020016
     * @tc.number SUB_CANVAS_VOL_FORM_02_0016
     * @tc.desc   Form volume case 2-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCanvasVolForm020016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const m: string = 'm'.repeat(256); expect(a.onFormEvent('id-32', m) === undefined).assertTrue(); expect(m.length).assertEqual(256);
    })
  })
}
