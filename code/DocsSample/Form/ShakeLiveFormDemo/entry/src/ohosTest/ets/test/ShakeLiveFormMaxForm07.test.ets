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

export default function shakeLiveFormMaxForm07Test() {
  describe('ShakeLiveFormMaxForm07Test', () => {

    /**
     * @tc.name   testShakeMaxForm070001
     * @tc.number SUB_SHAKE_MAX_FORM_07_0001
     * @tc.desc   Max form case 7-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm070001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-97') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-97') === undefined).assertTrue(); expect(a.onFormEvent('form-97', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm070002
     * @tc.number SUB_SHAKE_MAX_FORM_07_0002
     * @tc.desc   Max form case 7-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm070002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-98') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-98') === undefined).assertTrue(); expect(a.onFormEvent('form-98', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm070003
     * @tc.number SUB_SHAKE_MAX_FORM_07_0003
     * @tc.desc   Max form case 7-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm070003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-99') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-99') === undefined).assertTrue(); expect(a.onFormEvent('form-99', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm070004
     * @tc.number SUB_SHAKE_MAX_FORM_07_0004
     * @tc.desc   Max form case 7-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm070004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-100') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-100') === undefined).assertTrue(); expect(a.onFormEvent('form-100', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm070005
     * @tc.number SUB_SHAKE_MAX_FORM_07_0005
     * @tc.desc   Max form case 7-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm070005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-101') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-101') === undefined).assertTrue(); expect(a.onFormEvent('form-101', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm070006
     * @tc.number SUB_SHAKE_MAX_FORM_07_0006
     * @tc.desc   Max form case 7-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm070006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-102') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-102') === undefined).assertTrue(); expect(a.onFormEvent('form-102', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm070007
     * @tc.number SUB_SHAKE_MAX_FORM_07_0007
     * @tc.desc   Max form case 7-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm070007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-103') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-103') === undefined).assertTrue(); expect(a.onFormEvent('form-103', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm070008
     * @tc.number SUB_SHAKE_MAX_FORM_07_0008
     * @tc.desc   Max form case 7-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm070008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-104') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-104') === undefined).assertTrue(); expect(a.onFormEvent('form-104', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm070009
     * @tc.number SUB_SHAKE_MAX_FORM_07_0009
     * @tc.desc   Max form case 7-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm070009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-105') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-105') === undefined).assertTrue(); expect(a.onFormEvent('form-105', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm070010
     * @tc.number SUB_SHAKE_MAX_FORM_07_0010
     * @tc.desc   Max form case 7-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm070010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-106') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-106') === undefined).assertTrue(); expect(a.onFormEvent('form-106', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm070011
     * @tc.number SUB_SHAKE_MAX_FORM_07_0011
     * @tc.desc   Max form case 7-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm070011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-107') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-107') === undefined).assertTrue(); expect(a.onFormEvent('form-107', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm070012
     * @tc.number SUB_SHAKE_MAX_FORM_07_0012
     * @tc.desc   Max form case 7-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm070012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-108') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-108') === undefined).assertTrue(); expect(a.onFormEvent('form-108', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm070013
     * @tc.number SUB_SHAKE_MAX_FORM_07_0013
     * @tc.desc   Max form case 7-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm070013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-109') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-109') === undefined).assertTrue(); expect(a.onFormEvent('form-109', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm070014
     * @tc.number SUB_SHAKE_MAX_FORM_07_0014
     * @tc.desc   Max form case 7-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm070014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-110') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-110') === undefined).assertTrue(); expect(a.onFormEvent('form-110', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm070015
     * @tc.number SUB_SHAKE_MAX_FORM_07_0015
     * @tc.desc   Max form case 7-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm070015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-111') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-111') === undefined).assertTrue(); expect(a.onFormEvent('form-111', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm070016
     * @tc.number SUB_SHAKE_MAX_FORM_07_0016
     * @tc.desc   Max form case 7-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm070016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-112') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-112') === undefined).assertTrue(); expect(a.onFormEvent('form-112', '{"message":"other"}') !== undefined).assertTrue();
    })
  })
}
