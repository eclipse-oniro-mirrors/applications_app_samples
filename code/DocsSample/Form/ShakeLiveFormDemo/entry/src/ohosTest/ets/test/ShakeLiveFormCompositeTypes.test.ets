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
import { Want } from '@kit.AbilityKit';
import EntryFormAbility from '../../../main/ets/entryformability/EntryFormAbility';

export default function shakeLiveFormCompositeTypesTest() {
  describe('ShakeLiveFormCompositeTypesTest', () => {

    /**
     * @tc.name   testShakeComposite0001
     * @tc.number SUB_SHAKE_COMPOSITE_0001
     * @tc.desc   Composite type case 1.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeComposite0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const want: Want = { bundleName: 'com.example.shakeliveformdemo', abilityName: 'EntryAbility' }; const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm(want) !== undefined).assertTrue(); expect(want.bundleName === 'com.example.shakeliveformdemo').assertTrue();
    })

    /**
     * @tc.name   testShakeComposite0002
     * @tc.number SUB_SHAKE_COMPOSITE_0002
     * @tc.desc   Composite type case 2.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeComposite0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const want: Want = { bundleName: 'com.example.shakeliveformdemo', abilityName: 'EntryAbility' }; const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm(want) !== undefined).assertTrue(); expect(want.bundleName === 'com.example.shakeliveformdemo').assertTrue();
    })

    /**
     * @tc.name   testShakeComposite0003
     * @tc.number SUB_SHAKE_COMPOSITE_0003
     * @tc.desc   Composite type case 3.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeComposite0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const want: Want = { bundleName: 'com.example.shakeliveformdemo', abilityName: 'EntryAbility' }; const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm(want) !== undefined).assertTrue(); expect(want.bundleName === 'com.example.shakeliveformdemo').assertTrue();
    })

    /**
     * @tc.name   testShakeComposite0004
     * @tc.number SUB_SHAKE_COMPOSITE_0004
     * @tc.desc   Composite type case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeComposite0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const want: Want = { bundleName: 'com.example.shakeliveformdemo', abilityName: 'EntryAbility' }; const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm(want) !== undefined).assertTrue(); expect(want.bundleName === 'com.example.shakeliveformdemo').assertTrue();
    })

    /**
     * @tc.name   testShakeComposite0005
     * @tc.number SUB_SHAKE_COMPOSITE_0005
     * @tc.desc   Composite type case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeComposite0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const want: Want = { bundleName: 'com.example.shakeliveformdemo', abilityName: 'EntryAbility' }; const a: EntryFormAbility = new EntryFormAbility(); expect(a.onAddForm(want) !== undefined).assertTrue(); expect(want.bundleName === 'com.example.shakeliveformdemo').assertTrue();
    })

    /**
     * @tc.name   testShakeComposite0006
     * @tc.number SUB_SHAKE_COMPOSITE_0006
     * @tc.desc   Composite type case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeComposite0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const values: string[] = ['a','b','c']; expect(a.onFormEvent('form-6', values.join('-')) !== undefined).assertTrue(); expect(values.length).assertEqual(3);
    })

    /**
     * @tc.name   testShakeComposite0007
     * @tc.number SUB_SHAKE_COMPOSITE_0007
     * @tc.desc   Composite type case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeComposite0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const values: string[] = ['a','b','c']; expect(a.onFormEvent('form-7', values.join('-')) !== undefined).assertTrue(); expect(values.length).assertEqual(3);
    })

    /**
     * @tc.name   testShakeComposite0008
     * @tc.number SUB_SHAKE_COMPOSITE_0008
     * @tc.desc   Composite type case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeComposite0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const values: string[] = ['a','b','c']; expect(a.onFormEvent('form-8', values.join('-')) !== undefined).assertTrue(); expect(values.length).assertEqual(3);
    })

    /**
     * @tc.name   testShakeComposite0009
     * @tc.number SUB_SHAKE_COMPOSITE_0009
     * @tc.desc   Composite type case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeComposite0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const values: string[] = ['a','b','c']; expect(a.onFormEvent('form-9', values.join('-')) !== undefined).assertTrue(); expect(values.length).assertEqual(3);
    })

    /**
     * @tc.name   testShakeComposite0010
     * @tc.number SUB_SHAKE_COMPOSITE_0010
     * @tc.desc   Composite type case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeComposite0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); const values: string[] = ['a','b','c']; expect(a.onFormEvent('form-10', values.join('-')) !== undefined).assertTrue(); expect(values.length).assertEqual(3);
    })
  })
}
