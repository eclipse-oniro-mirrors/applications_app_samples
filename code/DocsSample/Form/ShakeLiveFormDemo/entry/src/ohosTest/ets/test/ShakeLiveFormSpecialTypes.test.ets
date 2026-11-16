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
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { image } from '@kit.ImageKit';
import { SegmentationUtil } from '../../../main/ets/common/SegmentationUtil';
import EntryFormAbility from '../../../main/ets/entryformability/EntryFormAbility';

export default function shakeLiveFormSpecialTypesTest() {
  describe('ShakeLiveFormSpecialTypesTest', () => {

    /**
     * @tc.name   testShakeSpecial001
     * @tc.number SUB_SHAKE_SPECIAL_001
     * @tc.desc   Verify segmentation singleton.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeSpecial001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: SegmentationUtil = SegmentationUtil.getInstance(); const b: SegmentationUtil = SegmentationUtil.getInstance(); expect(a === b).assertTrue(); expect(a !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeSpecial002
     * @tc.number SUB_SHAKE_SPECIAL_002
     * @tc.desc   Verify form no-op lifecycle methods.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeSpecial002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onRemoveForm('') === undefined).assertTrue(); expect(a.onCastToNormalForm('') === undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeSpecial003
     * @tc.number SUB_SHAKE_SPECIAL_003
     * @tc.desc   Verify form event dispatch.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeSpecial003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const a: EntryFormAbility = new EntryFormAbility(); expect(a.onFormEvent('f', '{"message":"other"}') !== undefined).assertTrue();
    })

    /**
     * @tc.name   testShakeSpecial004
     * @tc.number SUB_SHAKE_SPECIAL_004
     * @tc.desc   Special type case 4.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeSpecial004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: SegmentationUtil = SegmentationUtil.getInstance(); expect(s !== undefined).assertTrue(); expect(typeof s.SegmentationImage === 'function').assertTrue();
    })

    /**
     * @tc.name   testShakeSpecial005
     * @tc.number SUB_SHAKE_SPECIAL_005
     * @tc.desc   Special type case 5.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeSpecial005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: SegmentationUtil = SegmentationUtil.getInstance(); expect(s !== undefined).assertTrue(); expect(typeof s.SegmentationImage === 'function').assertTrue();
    })

    /**
     * @tc.name   testShakeSpecial006
     * @tc.number SUB_SHAKE_SPECIAL_006
     * @tc.desc   Special type case 6.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeSpecial006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: SegmentationUtil = SegmentationUtil.getInstance(); expect(s !== undefined).assertTrue(); expect(typeof s.SegmentationImage === 'function').assertTrue();
    })

    /**
     * @tc.name   testShakeSpecial007
     * @tc.number SUB_SHAKE_SPECIAL_007
     * @tc.desc   Special type case 7.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeSpecial007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: SegmentationUtil = SegmentationUtil.getInstance(); expect(s !== undefined).assertTrue(); expect(typeof s.SegmentationImage === 'function').assertTrue();
    })

    /**
     * @tc.name   testShakeSpecial008
     * @tc.number SUB_SHAKE_SPECIAL_008
     * @tc.desc   Special type case 8.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeSpecial008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: SegmentationUtil = SegmentationUtil.getInstance(); expect(s !== undefined).assertTrue(); expect(typeof s.SegmentationImage === 'function').assertTrue();
    })

    /**
     * @tc.name   testShakeSpecial009
     * @tc.number SUB_SHAKE_SPECIAL_009
     * @tc.desc   Special type case 9.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeSpecial009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: SegmentationUtil = SegmentationUtil.getInstance(); expect(s !== undefined).assertTrue(); expect(typeof s.SegmentationImage === 'function').assertTrue();
    })

    /**
     * @tc.name   testShakeSpecial010
     * @tc.number SUB_SHAKE_SPECIAL_010
     * @tc.desc   Special type case 10.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeSpecial010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const s: SegmentationUtil = SegmentationUtil.getInstance(); expect(s !== undefined).assertTrue(); expect(typeof s.SegmentationImage === 'function').assertTrue();
    })
  })
}
