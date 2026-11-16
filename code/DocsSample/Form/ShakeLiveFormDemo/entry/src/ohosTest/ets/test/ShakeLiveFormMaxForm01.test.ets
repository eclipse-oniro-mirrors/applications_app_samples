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

export default function shakeLiveFormMaxForm01Test() {
  describe('ShakeLiveFormMaxForm01Test', () => {

    /**
     * @tc.name   testShakeMaxForm010001
     * @tc.number SUB_SHAKE_MAX_FORM_01_0001
     * @tc.desc   Max form case 1-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-1') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-1') === undefined).assertTrue(); expect(a.onFormEvent('form-1', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm010002
     * @tc.number SUB_SHAKE_MAX_FORM_01_0002
     * @tc.desc   Max form case 1-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-2') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-2') === undefined).assertTrue(); expect(a.onFormEvent('form-2', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm010003
     * @tc.number SUB_SHAKE_MAX_FORM_01_0003
     * @tc.desc   Max form case 1-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-3') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-3') === undefined).assertTrue(); expect(a.onFormEvent('form-3', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm010004
     * @tc.number SUB_SHAKE_MAX_FORM_01_0004
     * @tc.desc   Max form case 1-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-4') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-4') === undefined).assertTrue(); expect(a.onFormEvent('form-4', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm010005
     * @tc.number SUB_SHAKE_MAX_FORM_01_0005
     * @tc.desc   Max form case 1-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-5') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-5') === undefined).assertTrue(); expect(a.onFormEvent('form-5', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm010006
     * @tc.number SUB_SHAKE_MAX_FORM_01_0006
     * @tc.desc   Max form case 1-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-6') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-6') === undefined).assertTrue(); expect(a.onFormEvent('form-6', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm010007
     * @tc.number SUB_SHAKE_MAX_FORM_01_0007
     * @tc.desc   Max form case 1-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-7') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-7') === undefined).assertTrue(); expect(a.onFormEvent('form-7', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm010008
     * @tc.number SUB_SHAKE_MAX_FORM_01_0008
     * @tc.desc   Max form case 1-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-8') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-8') === undefined).assertTrue(); expect(a.onFormEvent('form-8', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm010009
     * @tc.number SUB_SHAKE_MAX_FORM_01_0009
     * @tc.desc   Max form case 1-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-9') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-9') === undefined).assertTrue(); expect(a.onFormEvent('form-9', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm010010
     * @tc.number SUB_SHAKE_MAX_FORM_01_0010
     * @tc.desc   Max form case 1-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-10') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-10') === undefined).assertTrue(); expect(a.onFormEvent('form-10', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm010011
     * @tc.number SUB_SHAKE_MAX_FORM_01_0011
     * @tc.desc   Max form case 1-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-11') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-11') === undefined).assertTrue(); expect(a.onFormEvent('form-11', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm010012
     * @tc.number SUB_SHAKE_MAX_FORM_01_0012
     * @tc.desc   Max form case 1-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-12') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-12') === undefined).assertTrue(); expect(a.onFormEvent('form-12', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm010013
     * @tc.number SUB_SHAKE_MAX_FORM_01_0013
     * @tc.desc   Max form case 1-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-13') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-13') === undefined).assertTrue(); expect(a.onFormEvent('form-13', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm010014
     * @tc.number SUB_SHAKE_MAX_FORM_01_0014
     * @tc.desc   Max form case 1-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-14') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-14') === undefined).assertTrue(); expect(a.onFormEvent('form-14', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm010015
     * @tc.number SUB_SHAKE_MAX_FORM_01_0015
     * @tc.desc   Max form case 1-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-15') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-15') === undefined).assertTrue(); expect(a.onFormEvent('form-15', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm010016
     * @tc.number SUB_SHAKE_MAX_FORM_01_0016
     * @tc.desc   Max form case 1-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-16') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-16') === undefined).assertTrue(); expect(a.onFormEvent('form-16', '{"message":"other"}') !== undefined).assertTrue();
    })
  })
}
