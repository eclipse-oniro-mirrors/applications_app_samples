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

export default function shakeLiveFormMaxForm08Test() {
  describe('ShakeLiveFormMaxForm08Test', () => {

    /**
     * @tc.name   testShakeMaxForm080001
     * @tc.number SUB_SHAKE_MAX_FORM_08_0001
     * @tc.desc   Max form case 8-1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm080001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-113') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-113') === undefined).assertTrue(); expect(a.onFormEvent('form-113', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm080002
     * @tc.number SUB_SHAKE_MAX_FORM_08_0002
     * @tc.desc   Max form case 8-2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm080002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-114') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-114') === undefined).assertTrue(); expect(a.onFormEvent('form-114', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm080003
     * @tc.number SUB_SHAKE_MAX_FORM_08_0003
     * @tc.desc   Max form case 8-3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm080003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-115') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-115') === undefined).assertTrue(); expect(a.onFormEvent('form-115', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm080004
     * @tc.number SUB_SHAKE_MAX_FORM_08_0004
     * @tc.desc   Max form case 8-4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm080004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-116') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-116') === undefined).assertTrue(); expect(a.onFormEvent('form-116', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm080005
     * @tc.number SUB_SHAKE_MAX_FORM_08_0005
     * @tc.desc   Max form case 8-5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm080005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-117') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-117') === undefined).assertTrue(); expect(a.onFormEvent('form-117', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm080006
     * @tc.number SUB_SHAKE_MAX_FORM_08_0006
     * @tc.desc   Max form case 8-6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm080006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-118') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-118') === undefined).assertTrue(); expect(a.onFormEvent('form-118', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm080007
     * @tc.number SUB_SHAKE_MAX_FORM_08_0007
     * @tc.desc   Max form case 8-7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm080007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-119') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-119') === undefined).assertTrue(); expect(a.onFormEvent('form-119', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm080008
     * @tc.number SUB_SHAKE_MAX_FORM_08_0008
     * @tc.desc   Max form case 8-8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm080008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-120') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-120') === undefined).assertTrue(); expect(a.onFormEvent('form-120', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm080009
     * @tc.number SUB_SHAKE_MAX_FORM_08_0009
     * @tc.desc   Max form case 8-9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm080009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-121') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-121') === undefined).assertTrue(); expect(a.onFormEvent('form-121', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm080010
     * @tc.number SUB_SHAKE_MAX_FORM_08_0010
     * @tc.desc   Max form case 8-10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm080010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-122') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-122') === undefined).assertTrue(); expect(a.onFormEvent('form-122', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm080011
     * @tc.number SUB_SHAKE_MAX_FORM_08_0011
     * @tc.desc   Max form case 8-11.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm080011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-123') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-123') === undefined).assertTrue(); expect(a.onFormEvent('form-123', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm080012
     * @tc.number SUB_SHAKE_MAX_FORM_08_0012
     * @tc.desc   Max form case 8-12.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm080012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-124') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-124') === undefined).assertTrue(); expect(a.onFormEvent('form-124', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm080013
     * @tc.number SUB_SHAKE_MAX_FORM_08_0013
     * @tc.desc   Max form case 8-13.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm080013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-125') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-125') === undefined).assertTrue(); expect(a.onFormEvent('form-125', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm080014
     * @tc.number SUB_SHAKE_MAX_FORM_08_0014
     * @tc.desc   Max form case 8-14.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm080014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-126') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-126') === undefined).assertTrue(); expect(a.onFormEvent('form-126', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm080015
     * @tc.number SUB_SHAKE_MAX_FORM_08_0015
     * @tc.desc   Max form case 8-15.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm080015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-127') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-127') === undefined).assertTrue(); expect(a.onFormEvent('form-127', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeMaxForm080016
     * @tc.number SUB_SHAKE_MAX_FORM_08_0016
     * @tc.desc   Max form case 8-16.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeMaxForm080016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm({}) !== undefined).assertTrue(); expect(a.onRemoveForm('form-128') === undefined).assertTrue(); expect(a.onCastToNormalForm('form-128') === undefined).assertTrue(); expect(a.onFormEvent('form-128', '{"message":"other"}') !== undefined).assertTrue();
    })
  })
}
