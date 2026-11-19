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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { common } from '@kit.AbilityKit';
import { image } from '@kit.ImageKit';
import { Constants } from '../../../main/ets/common/Constants';
import { SegmentationUtil } from '../../../main/ets/common/SegmentationUtil';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[SampleTest]';

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
     * @tc.name   com.example.shakeliveformdemo_InteractionForm_0001
     * @tc.number SUB_FORM_SHAKE_INTERACTIONFORM_0100
     * @tc.desc   Test that the overflow ratio constants keep the documented left, top, width and height values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('com.example.shakeliveformdemo_InteractionForm_0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_InteractionForm_0001 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_LEFT_RATIO), String(0.1));
      expect(Constants.OVERFLOW_LEFT_RATIO).assertEqual(0.1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_TOP_RATIO), String(0.15));
      expect(Constants.OVERFLOW_TOP_RATIO).assertEqual(0.15);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_WIDTH_RATIO), String(1.2));
      expect(Constants.OVERFLOW_WIDTH_RATIO).assertEqual(1.2);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_HEIGHT_RATIO), String(1.3));
      expect(Constants.OVERFLOW_HEIGHT_RATIO).assertEqual(1.3);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_InteractionForm_0001 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_InteractionForm_0002
     * @tc.number SUB_FORM_SHAKE_INTERACTIONFORM_0200
     * @tc.desc   Test that the overflow animation duration constant equals the documented 3500 milliseconds.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('com.example.shakeliveformdemo_InteractionForm_0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_InteractionForm_0002 begin');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(Constants.OVERFLOW_DURATION), String(EXPECTED_OVERFLOW_DURATION));
      expect(Constants.OVERFLOW_DURATION).assertEqual(EXPECTED_OVERFLOW_DURATION);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(Constants.OVERFLOW_DURATION > 0));
      expect(Constants.OVERFLOW_DURATION > 0).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_InteractionForm_0002 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_InteractionForm_0003
     * @tc.number SUB_FORM_SHAKE_INTERACTIONFORM_0300
     * @tc.desc   Test the overflow area of a 200x200 form against the ratios used by requestOverflow.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('com.example.shakeliveformdemo_InteractionForm_0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_InteractionForm_0003 begin');
      const left: number = -Constants.OVERFLOW_LEFT_RATIO * FORM_WIDTH;
      const top: number = -Constants.OVERFLOW_TOP_RATIO * FORM_HEIGHT;
      const width: number = Constants.OVERFLOW_WIDTH_RATIO * FORM_WIDTH;
      const height: number = Constants.OVERFLOW_HEIGHT_RATIO * FORM_HEIGHT;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(left), String(-20));
      expect(left).assertEqual(-20);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(top), String(-30));
      expect(top).assertEqual(-30);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(width), String(240));
      expect(width).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(height), String(260));
      expect(height).assertEqual(260);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_InteractionForm_0003 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_InteractionForm_0004
     * @tc.number SUB_FORM_SHAKE_INTERACTIONFORM_0400
     * @tc.desc   Test that the overflow area scales linearly, so half the form size gives half the area.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('com.example.shakeliveformdemo_InteractionForm_0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_InteractionForm_0004 begin');
      const fullOverflowWidth: number = Constants.OVERFLOW_WIDTH_RATIO * FORM_WIDTH;
      const halfOverflowWidth: number = Constants.OVERFLOW_WIDTH_RATIO * HALF_FORM_WIDTH;
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(fullOverflowWidth), String(240));
      expect(fullOverflowWidth).assertEqual(240);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(halfOverflowWidth), String(120));
      expect(halfOverflowWidth).assertEqual(120);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(fullOverflowWidth / FORM_WIDTH), String(Constants.OVERFLOW_WIDTH_RATIO));
      expect(fullOverflowWidth / FORM_WIDTH).assertEqual(Constants.OVERFLOW_WIDTH_RATIO);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(halfOverflowWidth / HALF_FORM_WIDTH), String(Constants.OVERFLOW_WIDTH_RATIO));
      expect(halfOverflowWidth / HALF_FORM_WIDTH).assertEqual(Constants.OVERFLOW_WIDTH_RATIO);
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_InteractionForm_0004 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_InteractionForm_0005
     * @tc.number SUB_FORM_SHAKE_INTERACTIONFORM_0500
     * @tc.desc   Test that SegmentationUtil.getInstance returns the same singleton instance for every caller.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('com.example.shakeliveformdemo_InteractionForm_0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_InteractionForm_0005 begin');
      const firstInstance: SegmentationUtil = SegmentationUtil.getInstance();
      const secondInstance: SegmentationUtil = SegmentationUtil.getInstance();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(firstInstance !== undefined));
      expect(firstInstance !== undefined).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(firstInstance === secondInstance));
      expect(firstInstance === secondInstance).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_InteractionForm_0005 end');
    })

    /**
     * @tc.name   com.example.shakeliveformdemo_InteractionForm_0006
     * @tc.number SUB_FORM_SHAKE_INTERACTIONFORM_0600
     * @tc.desc   Test that SegmentationImage returns undefined when the resource cannot be read.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('com.example.shakeliveformdemo_InteractionForm_0006',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_InteractionForm_0006 begin');
      const segmentationUtil: SegmentationUtil = SegmentationUtil.getInstance();
      const invalidResource: Resource = {
        bundleName: 'com.example.shakeliveformdemo',
        moduleName: 'entry',
        id: 0x7FFFFFFF
      }
        ;
      const result: image.PixelMap | undefined =
        await segmentationUtil.SegmentationImage(invalidResource, appContext);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result === undefined));
      expect(result === undefined).assertTrue();
      done();
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'com.example.shakeliveformdemo_InteractionForm_0006 end');
    })
  })
}
