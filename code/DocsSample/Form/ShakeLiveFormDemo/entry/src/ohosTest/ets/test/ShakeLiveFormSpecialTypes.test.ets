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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { image } from '@kit.ImageKit';
import { SegmentationUtil } from '../../../main/ets/common/SegmentationUtil';
import EntryFormAbility from '../../../main/ets/entryformability/EntryFormAbility';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeSpecial001 begin');
      const a: SegmentationUtil = SegmentationUtil.getInstance();
        const b: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a === b).assertTrue();');
        expect(a === b).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a !== undefined).assertTrue();');
        expect(a !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeSpecial001 end');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeSpecial002 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onRemoveForm(\'\') === undefined).assertTrue();');
        expect(a.onRemoveForm('') === undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onCastToNormalForm(\'\') === undefined).assertTrue();');
        expect(a.onCastToNormalForm('') === undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeSpecial002 end');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeSpecial003 begin');
      const a: EntryFormAbility = new EntryFormAbility();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(a.onFormEvent(\'f\', \'{"message":"other"}\') !== undefined).assertTrue();');
        expect(a.onFormEvent('f', '{"message":"other"}') !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeSpecial003 end');
    })

    /**
     * @tc.name   testShakeSpecial004
     * @tc.number SUB_SHAKE_SPECIAL_004
     * @tc.desc   Verify s is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeSpecial004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeSpecial004 begin');
      const s: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s !== undefined).assertTrue();');
        expect(s !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof s.SegmentationImage === \'function\').assertTrue();');
        expect(typeof s.SegmentationImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeSpecial004 end');
    })

    /**
     * @tc.name   testShakeSpecial005
     * @tc.number SUB_SHAKE_SPECIAL_005
     * @tc.desc   Verify s is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeSpecial005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeSpecial005 begin');
      const s: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s !== undefined).assertTrue();');
        expect(s !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof s.SegmentationImage === \'function\').assertTrue();');
        expect(typeof s.SegmentationImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeSpecial005 end');
    })

    /**
     * @tc.name   testShakeSpecial006
     * @tc.number SUB_SHAKE_SPECIAL_006
     * @tc.desc   Verify s is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeSpecial006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeSpecial006 begin');
      const s: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s !== undefined).assertTrue();');
        expect(s !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof s.SegmentationImage === \'function\').assertTrue();');
        expect(typeof s.SegmentationImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeSpecial006 end');
    })

    /**
     * @tc.name   testShakeSpecial007
     * @tc.number SUB_SHAKE_SPECIAL_007
     * @tc.desc   Verify s is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeSpecial007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeSpecial007 begin');
      const s: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s !== undefined).assertTrue();');
        expect(s !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof s.SegmentationImage === \'function\').assertTrue();');
        expect(typeof s.SegmentationImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeSpecial007 end');
    })

    /**
     * @tc.name   testShakeSpecial008
     * @tc.number SUB_SHAKE_SPECIAL_008
     * @tc.desc   Verify s is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeSpecial008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeSpecial008 begin');
      const s: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s !== undefined).assertTrue();');
        expect(s !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof s.SegmentationImage === \'function\').assertTrue();');
        expect(typeof s.SegmentationImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeSpecial008 end');
    })

    /**
     * @tc.name   testShakeSpecial009
     * @tc.number SUB_SHAKE_SPECIAL_009
     * @tc.desc   Verify s is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeSpecial009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeSpecial009 begin');
      const s: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s !== undefined).assertTrue();');
        expect(s !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof s.SegmentationImage === \'function\').assertTrue();');
        expect(typeof s.SegmentationImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeSpecial009 end');
    })

    /**
     * @tc.name   testShakeSpecial010
     * @tc.number SUB_SHAKE_SPECIAL_010
     * @tc.desc   Verify s is defined.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testShakeSpecial010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeSpecial010 begin');
      const s: SegmentationUtil = SegmentationUtil.getInstance();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(s !== undefined).assertTrue();');
        expect(s !== undefined).assertTrue();
        hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'assert: expect(typeof s.SegmentationImage === \'function\').assertTrue();');
        expect(typeof s.SegmentationImage === 'function').assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testShakeSpecial010 end');
    })
  })
}
