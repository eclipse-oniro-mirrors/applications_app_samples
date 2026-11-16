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

export default function shakeLiveFormMaxForm03Test() {
  describe('ShakeLiveFormMaxForm03Test', () => {

    /**
     * @tc.name   testShakeMaxForm030001
     * @tc.number SUB_SHAKE_MAX_FORM_03_0001
     * @tc.desc   Max form case 3-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm030001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-33') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-33') === undefined).assertTrue(); expect(a.onFormEvent('form-33', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm030002
     * @tc.number SUB_SHAKE_MAX_FORM_03_0002
     * @tc.desc   Max form case 3-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm030002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-34') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-34') === undefined).assertTrue(); expect(a.onFormEvent('form-34', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm030003
     * @tc.number SUB_SHAKE_MAX_FORM_03_0003
     * @tc.desc   Max form case 3-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm030003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-35') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-35') === undefined).assertTrue(); expect(a.onFormEvent('form-35', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm030004
     * @tc.number SUB_SHAKE_MAX_FORM_03_0004
     * @tc.desc   Max form case 3-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm030004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-36') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-36') === undefined).assertTrue(); expect(a.onFormEvent('form-36', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm030005
     * @tc.number SUB_SHAKE_MAX_FORM_03_0005
     * @tc.desc   Max form case 3-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm030005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-37') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-37') === undefined).assertTrue(); expect(a.onFormEvent('form-37', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm030006
     * @tc.number SUB_SHAKE_MAX_FORM_03_0006
     * @tc.desc   Max form case 3-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm030006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-38') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-38') === undefined).assertTrue(); expect(a.onFormEvent('form-38', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm030007
     * @tc.number SUB_SHAKE_MAX_FORM_03_0007
     * @tc.desc   Max form case 3-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm030007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-39') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-39') === undefined).assertTrue(); expect(a.onFormEvent('form-39', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm030008
     * @tc.number SUB_SHAKE_MAX_FORM_03_0008
     * @tc.desc   Max form case 3-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm030008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-40') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-40') === undefined).assertTrue(); expect(a.onFormEvent('form-40', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm030009
     * @tc.number SUB_SHAKE_MAX_FORM_03_0009
     * @tc.desc   Max form case 3-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm030009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-41') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-41') === undefined).assertTrue(); expect(a.onFormEvent('form-41', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm030010
     * @tc.number SUB_SHAKE_MAX_FORM_03_0010
     * @tc.desc   Max form case 3-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm030010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-42') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-42') === undefined).assertTrue(); expect(a.onFormEvent('form-42', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm030011
     * @tc.number SUB_SHAKE_MAX_FORM_03_0011
     * @tc.desc   Max form case 3-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm030011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-43') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-43') === undefined).assertTrue(); expect(a.onFormEvent('form-43', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm030012
     * @tc.number SUB_SHAKE_MAX_FORM_03_0012
     * @tc.desc   Max form case 3-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm030012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-44') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-44') === undefined).assertTrue(); expect(a.onFormEvent('form-44', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm030013
     * @tc.number SUB_SHAKE_MAX_FORM_03_0013
     * @tc.desc   Max form case 3-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm030013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-45') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-45') === undefined).assertTrue(); expect(a.onFormEvent('form-45', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm030014
     * @tc.number SUB_SHAKE_MAX_FORM_03_0014
     * @tc.desc   Max form case 3-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm030014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-46') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-46') === undefined).assertTrue(); expect(a.onFormEvent('form-46', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm030015
     * @tc.number SUB_SHAKE_MAX_FORM_03_0015
     * @tc.desc   Max form case 3-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm030015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-47') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-47') === undefined).assertTrue(); expect(a.onFormEvent('form-47', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm030016
     * @tc.number SUB_SHAKE_MAX_FORM_03_0016
     * @tc.desc   Max form case 3-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm030016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-48') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-48') === undefined).assertTrue(); expect(a.onFormEvent('form-48', '{"message":"other"}') !== undefined).assertTrue();
    })
  })
}
