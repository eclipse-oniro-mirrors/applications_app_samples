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

export default function shakeLiveFormMaxForm04Test() {
  describe('ShakeLiveFormMaxForm04Test', () => {

    /**
     * @tc.name   testShakeMaxForm040001
     * @tc.number SUB_SHAKE_MAX_FORM_04_0001
     * @tc.desc   Max form case 4-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm040001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-49') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-49') === undefined).assertTrue(); expect(a.onFormEvent('form-49', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm040002
     * @tc.number SUB_SHAKE_MAX_FORM_04_0002
     * @tc.desc   Max form case 4-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm040002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-50') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-50') === undefined).assertTrue(); expect(a.onFormEvent('form-50', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm040003
     * @tc.number SUB_SHAKE_MAX_FORM_04_0003
     * @tc.desc   Max form case 4-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm040003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-51') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-51') === undefined).assertTrue(); expect(a.onFormEvent('form-51', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm040004
     * @tc.number SUB_SHAKE_MAX_FORM_04_0004
     * @tc.desc   Max form case 4-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm040004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-52') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-52') === undefined).assertTrue(); expect(a.onFormEvent('form-52', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm040005
     * @tc.number SUB_SHAKE_MAX_FORM_04_0005
     * @tc.desc   Max form case 4-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm040005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-53') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-53') === undefined).assertTrue(); expect(a.onFormEvent('form-53', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm040006
     * @tc.number SUB_SHAKE_MAX_FORM_04_0006
     * @tc.desc   Max form case 4-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm040006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-54') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-54') === undefined).assertTrue(); expect(a.onFormEvent('form-54', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm040007
     * @tc.number SUB_SHAKE_MAX_FORM_04_0007
     * @tc.desc   Max form case 4-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm040007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-55') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-55') === undefined).assertTrue(); expect(a.onFormEvent('form-55', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm040008
     * @tc.number SUB_SHAKE_MAX_FORM_04_0008
     * @tc.desc   Max form case 4-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm040008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-56') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-56') === undefined).assertTrue(); expect(a.onFormEvent('form-56', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm040009
     * @tc.number SUB_SHAKE_MAX_FORM_04_0009
     * @tc.desc   Max form case 4-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm040009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-57') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-57') === undefined).assertTrue(); expect(a.onFormEvent('form-57', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm040010
     * @tc.number SUB_SHAKE_MAX_FORM_04_0010
     * @tc.desc   Max form case 4-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm040010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-58') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-58') === undefined).assertTrue(); expect(a.onFormEvent('form-58', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm040011
     * @tc.number SUB_SHAKE_MAX_FORM_04_0011
     * @tc.desc   Max form case 4-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm040011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-59') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-59') === undefined).assertTrue(); expect(a.onFormEvent('form-59', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm040012
     * @tc.number SUB_SHAKE_MAX_FORM_04_0012
     * @tc.desc   Max form case 4-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm040012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-60') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-60') === undefined).assertTrue(); expect(a.onFormEvent('form-60', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm040013
     * @tc.number SUB_SHAKE_MAX_FORM_04_0013
     * @tc.desc   Max form case 4-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm040013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-61') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-61') === undefined).assertTrue(); expect(a.onFormEvent('form-61', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm040014
     * @tc.number SUB_SHAKE_MAX_FORM_04_0014
     * @tc.desc   Max form case 4-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm040014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-62') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-62') === undefined).assertTrue(); expect(a.onFormEvent('form-62', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm040015
     * @tc.number SUB_SHAKE_MAX_FORM_04_0015
     * @tc.desc   Max form case 4-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm040015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-63') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-63') === undefined).assertTrue(); expect(a.onFormEvent('form-63', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm040016
     * @tc.number SUB_SHAKE_MAX_FORM_04_0016
     * @tc.desc   Max form case 4-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm040016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-64') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-64') === undefined).assertTrue(); expect(a.onFormEvent('form-64', '{"message":"other"}') !== undefined).assertTrue();
    })
  })
}
