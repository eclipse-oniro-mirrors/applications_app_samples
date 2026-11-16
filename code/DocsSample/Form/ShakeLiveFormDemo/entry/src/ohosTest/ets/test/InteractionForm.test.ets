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

import { describe, it, expect, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { common } from '@kit.AbilityKit';
import { image } from '@kit.ImageKit';
import { Constants } from '../../../main/ets/common/Constants';
import { SegmentationUtil } from '../../../main/ets/common/SegmentationUtil';

const FORM_WIDTH: number = 200;
const FORM_HEIGHT: number = 200;
const HALF_FORM_WIDTH: number = 100;
const HALF_FORM_HEIGHT: number = 100;
const EXPECTED_OVERFLOW_DURATION: number = 3500;

export default function interactionFormTest() {
  describe('InteractionFormTest', () => {
    let appContext: common.Context;

    beforeAll(() => {
      appContext = abilityDelegatorRegistry.getAbilityDelegator().getAppContext();
    })

    /**
     * @tc.name   testOverflowRatioConstants0001
     * @tc.number SUB_FORM_SHAKE_INTERACTIONFORM_0100
     * @tc.desc   Test that the overflow ratio constants keep the documented left, top, width and height values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOverflowRatioConstants0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1);
      expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15);
      expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2);
      expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3);
    })

    /**
     * @tc.name   testOverflowDurationConstant0001
     * @tc.number SUB_FORM_SHAKE_INTERACTIONFORM_0200
     * @tc.desc   Test that the overflow animation duration constant equals the documented 3500 milliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOverflowDurationConstant0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(Constants.OVERFLOW_DURATION).assertEqual(EXPECTED_OVERFLOW_DURATION);
      expect(Constants.OVERFLOW_DURATION > 0).assertTrue();
    })

    /**
     * @tc.name   testOverflowAreaCalculation0001
     * @tc.number SUB_FORM_SHAKE_INTERACTIONFORM_0300
     * @tc.desc   Test the overflow area of a 200x200 form against the ratios used by requestOverflow.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOverflowAreaCalculation0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const left: number = -Constants.OVERFLOW_LEFT_RATIO * FORM_WIDTH;
      const top: number = -Constants.OVERFLOW_TOP_RATIO * FORM_HEIGHT;
      const width: number = Constants.OVERFLOW_WIDTH_RATIO * FORM_WIDTH;
      const height: number = Constants.OVERFLOW_HEIGHT_RATIO * FORM_HEIGHT;
      expect(left).assertEqual(-20);
      expect(top).assertEqual(-30);
      expect(width).assertEqual(240);
      expect(height).assertEqual(260);
    })

    /**
     * @tc.name   testOverflowAreaScaling0001
     * @tc.number SUB_FORM_SHAKE_INTERACTIONFORM_0400
     * @tc.desc   Test that the overflow area scales linearly, so half the form size gives half the area.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testOverflowAreaScaling0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const fullOverflowWidth: number = Constants.OVERFLOW_WIDTH_RATIO * FORM_WIDTH;
      const halfOverflowWidth: number = Constants.OVERFLOW_WIDTH_RATIO * HALF_FORM_WIDTH;
      expect(fullOverflowWidth).assertEqual(240);
      expect(halfOverflowWidth).assertEqual(120);
      expect(fullOverflowWidth / FORM_WIDTH).assertEqual(Constants.OVERFLOW_WIDTH_RATIO);
      expect(halfOverflowWidth / HALF_FORM_WIDTH).assertEqual(Constants.OVERFLOW_WIDTH_RATIO);
    })

    /**
     * @tc.name   testSegmentationUtilSingleton0001
     * @tc.number SUB_FORM_SHAKE_INTERACTIONFORM_0500
     * @tc.desc   Test that SegmentationUtil.getInstance returns the same singleton instance for every caller.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSegmentationUtilSingleton0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const firstInstance: SegmentationUtil = SegmentationUtil.getInstance();
      const secondInstance: SegmentationUtil = SegmentationUtil.getInstance();
      expect(firstInstance !== undefined).assertTrue();
      expect(firstInstance === secondInstance).assertTrue();
    })

    /**
     * @tc.name   testSegmentationWithInvalidResource0001
     * @tc.number SUB_FORM_SHAKE_INTERACTIONFORM_0600
     * @tc.desc   Test that SegmentationImage returns undefined when the resource cannot be read.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSegmentationWithInvalidResource0001',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      const segmentationUtil: SegmentationUtil = SegmentationUtil.getInstance();
      const invalidResource: Resource = {
        bundleName: 'com.example.shakeliveformdemo',
        moduleName: 'entry',
        id: 0x7FFFFFFF
      };
      const result: image.PixelMap | undefined =
        await segmentationUtil.SegmentationImage(invalidResource, appContext);
      expect(result === undefined).assertTrue();
      done();
    })
  })
}
