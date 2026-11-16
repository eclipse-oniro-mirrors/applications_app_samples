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

export default function shakeLiveFormMoreForm01Test() {
  describe('ShakeLiveFormMoreForm01Test', () => {

    /**
     * @tc.name   testShakeMoreForm010001
     * @tc.number SUB_SHAKE_MORE_FORM_01_0001
     * @tc.desc   More form case 1-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onRemoveForm('r-1') === undefined).assertTrue(); expect(a.onCastToNormalForm('c-1') === undefined).assertTrue(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onFormEvent('e-1', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMoreForm010002
     * @tc.number SUB_SHAKE_MORE_FORM_01_0002
     * @tc.desc   More form case 1-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onRemoveForm('r-2') === undefined).assertTrue(); expect(a.onCastToNormalForm('c-2') === undefined).assertTrue(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onFormEvent('e-2', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMoreForm010003
     * @tc.number SUB_SHAKE_MORE_FORM_01_0003
     * @tc.desc   More form case 1-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onRemoveForm('r-3') === undefined).assertTrue(); expect(a.onCastToNormalForm('c-3') === undefined).assertTrue(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onFormEvent('e-3', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMoreForm010004
     * @tc.number SUB_SHAKE_MORE_FORM_01_0004
     * @tc.desc   More form case 1-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onRemoveForm('r-4') === undefined).assertTrue(); expect(a.onCastToNormalForm('c-4') === undefined).assertTrue(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onFormEvent('e-4', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMoreForm010005
     * @tc.number SUB_SHAKE_MORE_FORM_01_0005
     * @tc.desc   More form case 1-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onRemoveForm('r-5') === undefined).assertTrue(); expect(a.onCastToNormalForm('c-5') === undefined).assertTrue(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onFormEvent('e-5', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMoreForm010006
     * @tc.number SUB_SHAKE_MORE_FORM_01_0006
     * @tc.desc   More form case 1-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onRemoveForm('r-6') === undefined).assertTrue(); expect(a.onCastToNormalForm('c-6') === undefined).assertTrue(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onFormEvent('e-6', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMoreForm010007
     * @tc.number SUB_SHAKE_MORE_FORM_01_0007
     * @tc.desc   More form case 1-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onRemoveForm('r-7') === undefined).assertTrue(); expect(a.onCastToNormalForm('c-7') === undefined).assertTrue(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onFormEvent('e-7', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMoreForm010008
     * @tc.number SUB_SHAKE_MORE_FORM_01_0008
     * @tc.desc   More form case 1-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onRemoveForm('r-8') === undefined).assertTrue(); expect(a.onCastToNormalForm('c-8') === undefined).assertTrue(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onFormEvent('e-8', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMoreForm010009
     * @tc.number SUB_SHAKE_MORE_FORM_01_0009
     * @tc.desc   More form case 1-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onRemoveForm('r-9') === undefined).assertTrue(); expect(a.onCastToNormalForm('c-9') === undefined).assertTrue(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onFormEvent('e-9', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMoreForm010010
     * @tc.number SUB_SHAKE_MORE_FORM_01_0010
     * @tc.desc   More form case 1-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onRemoveForm('r-10') === undefined).assertTrue(); expect(a.onCastToNormalForm('c-10') === undefined).assertTrue(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onFormEvent('e-10', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMoreForm010011
     * @tc.number SUB_SHAKE_MORE_FORM_01_0011
     * @tc.desc   More form case 1-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onRemoveForm('r-11') === undefined).assertTrue(); expect(a.onCastToNormalForm('c-11') === undefined).assertTrue(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onFormEvent('e-11', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMoreForm010012
     * @tc.number SUB_SHAKE_MORE_FORM_01_0012
     * @tc.desc   More form case 1-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onRemoveForm('r-12') === undefined).assertTrue(); expect(a.onCastToNormalForm('c-12') === undefined).assertTrue(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onFormEvent('e-12', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMoreForm010013
     * @tc.number SUB_SHAKE_MORE_FORM_01_0013
     * @tc.desc   More form case 1-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onRemoveForm('r-13') === undefined).assertTrue(); expect(a.onCastToNormalForm('c-13') === undefined).assertTrue(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onFormEvent('e-13', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMoreForm010014
     * @tc.number SUB_SHAKE_MORE_FORM_01_0014
     * @tc.desc   More form case 1-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onRemoveForm('r-14') === undefined).assertTrue(); expect(a.onCastToNormalForm('c-14') === undefined).assertTrue(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onFormEvent('e-14', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMoreForm010015
     * @tc.number SUB_SHAKE_MORE_FORM_01_0015
     * @tc.desc   More form case 1-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onRemoveForm('r-15') === undefined).assertTrue(); expect(a.onCastToNormalForm('c-15') === undefined).assertTrue(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onFormEvent('e-15', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMoreForm010016
     * @tc.number SUB_SHAKE_MORE_FORM_01_0016
     * @tc.desc   More form case 1-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMoreForm010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onRemoveForm('r-16') === undefined).assertTrue(); expect(a.onCastToNormalForm('c-16') === undefined).assertTrue(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onFormEvent('e-16', '{"message":"other"}') !== undefined).assertTrue();
    })
  })
}
