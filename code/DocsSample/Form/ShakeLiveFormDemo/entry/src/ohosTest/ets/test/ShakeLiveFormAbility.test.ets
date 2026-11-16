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

export default function shakeLiveFormAbilityTest() {
  describe('ShakeLiveFormAbilityContractTest', () => {

    /**
     * @tc.name   testShakeFormAbility0001
     * @tc.number SUB_SHAKE_FORM_ABILITY_0001
     * @tc.desc   Form ability case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeFormAbility0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const d = a.onAddForm({}); expect(d !== undefined).assertTrue(); expect(typeof d === 'object').assertTrue();
    })

    /**
     * @tc.name   testShakeFormAbility0002
     * @tc.number SUB_SHAKE_FORM_ABILITY_0002
     * @tc.desc   Form ability case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeFormAbility0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const d = a.onAddForm({}); expect(d !== undefined).assertTrue(); expect(typeof d === 'object').assertTrue();
    })

    /**
     * @tc.name   testShakeFormAbility0003
     * @tc.number SUB_SHAKE_FORM_ABILITY_0003
     * @tc.desc   Form ability case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeFormAbility0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const d = a.onAddForm({}); expect(d !== undefined).assertTrue(); expect(typeof d === 'object').assertTrue();
    })

    /**
     * @tc.name   testShakeFormAbility0004
     * @tc.number SUB_SHAKE_FORM_ABILITY_0004
     * @tc.desc   Form ability case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeFormAbility0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onRemoveForm('form-4') === undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeFormAbility0005
     * @tc.number SUB_SHAKE_FORM_ABILITY_0005
     * @tc.desc   Form ability case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeFormAbility0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onRemoveForm('form-5') === undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeFormAbility0006
     * @tc.number SUB_SHAKE_FORM_ABILITY_0006
     * @tc.desc   Form ability case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeFormAbility0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onRemoveForm('form-6') === undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeFormAbility0007
     * @tc.number SUB_SHAKE_FORM_ABILITY_0007
     * @tc.desc   Form ability case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeFormAbility0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onCastToNormalForm('form-7') === undefined).assertTrue(); expect(a.onChangeFormVisibility({}) === undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeFormAbility0008
     * @tc.number SUB_SHAKE_FORM_ABILITY_0008
     * @tc.desc   Form ability case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeFormAbility0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onCastToNormalForm('form-8') === undefined).assertTrue(); expect(a.onChangeFormVisibility({}) === undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeFormAbility0009
     * @tc.number SUB_SHAKE_FORM_ABILITY_0009
     * @tc.desc   Form ability case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeFormAbility0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onCastToNormalForm('form-9') === undefined).assertTrue(); expect(a.onChangeFormVisibility({}) === undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeFormAbility0010
     * @tc.number SUB_SHAKE_FORM_ABILITY_0010
     * @tc.desc   Form ability case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeFormAbility0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onFormEvent('form-10', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeFormAbility0011
     * @tc.number SUB_SHAKE_FORM_ABILITY_0011
     * @tc.desc   Form ability case 11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeFormAbility0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onFormEvent('form-11', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeFormAbility0012
     * @tc.number SUB_SHAKE_FORM_ABILITY_0012
     * @tc.desc   Form ability case 12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeFormAbility0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onFormEvent('form-12', '{"message":"other"}') !== undefined).assertTrue();
    })
  })
}
