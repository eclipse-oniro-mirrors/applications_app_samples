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

import { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { IndicatorBarAttribute, SizeMode } from '../../../../main/ets/bridge/CustomAnimationTabBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomAnimationTab]';
const BUNDLE: string = 'CustomAnimationTab_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for IndicatorBarAttribute (2 cases). */
export default function indicatorBarAttributeValuesTest(): void {
  describe('IndicatorBarAttributeValuesTest', () => {
    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_INDICATOR_BAR_ATTRIBUTE_VALUES_0001
     * @tc.name      CustomAnimationTab_IndicatorBarAttributeValues_0001
     * @tc.desc      IndicatorBarAttribute.BACKGROUNDBAR keeps value 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CustomAnimationTab_IndicatorBarAttributeValues_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndicatorBarAttributeValues_0001 begin`);
      const actual: IndicatorBarAttribute = IndicatorBarAttribute.BACKGROUNDBAR;
      logInfo(`IndicatorBarAttribute.BACKGROUNDBAR: actual.maxIndicatorBarLeft=${actual.maxIndicatorBarLeft}`);
      expect(actual.maxIndicatorBarLeft).assertEqual(0);
      logInfo(`IndicatorBarAttribute.BACKGROUNDBAR: actual.barAlign=${actual.barAlign}`);
      expect(actual.barAlign).assertEqual(VerticalAlign.Center);
      logInfo(`IndicatorBarAttribute.BACKGROUNDBAR: actual.indicatorExpand=${actual.indicatorExpand}`);
      expect(actual.indicatorExpand).assertEqual(1);
      logInfo(`IndicatorBarAttribute.BACKGROUNDBAR: actual.sizeMode=${actual.sizeMode}`);
      expect(actual.sizeMode).assertEqual(SizeMode.Padding);
      logInfo(`IndicatorBarAttribute.BACKGROUNDBAR: actual.indicatorWidth=${actual.indicatorWidth}`);
      expect(actual.indicatorWidth).assertEqual(20);
      logInfo(`IndicatorBarAttribute.BACKGROUNDBAR: actual.indicatorHeight=${actual.indicatorHeight}`);
      expect(actual.indicatorHeight).assertEqual(10);
      logInfo(`${BUNDLE}IndicatorBarAttributeValues_0001 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_INDICATOR_BAR_ATTRIBUTE_VALUES_0002
     * @tc.name      CustomAnimationTab_IndicatorBarAttributeValues_0002
     * @tc.desc      IndicatorBarAttribute.THINSTRIP keeps value 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CustomAnimationTab_IndicatorBarAttributeValues_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IndicatorBarAttributeValues_0002 begin`);
      const actual: IndicatorBarAttribute = IndicatorBarAttribute.THINSTRIP;
      logInfo(`IndicatorBarAttribute.THINSTRIP: actual.maxIndicatorBarLeft=${actual.maxIndicatorBarLeft}`);
      expect(actual.maxIndicatorBarLeft).assertEqual(0);
      logInfo(`IndicatorBarAttribute.THINSTRIP: actual.barAlign=${actual.barAlign}`);
      expect(actual.barAlign).assertEqual(VerticalAlign.Bottom);
      logInfo(`IndicatorBarAttribute.THINSTRIP: actual.indicatorExpand=${actual.indicatorExpand}`);
      expect(actual.indicatorExpand).assertEqual(1);
      logInfo(`IndicatorBarAttribute.THINSTRIP: actual.sizeMode=${actual.sizeMode}`);
      expect(actual.sizeMode).assertEqual(SizeMode.Normal);
      logInfo(`IndicatorBarAttribute.THINSTRIP: actual.indicatorWidth=${actual.indicatorWidth}`);
      expect(actual.indicatorWidth).assertEqual(0);
      logInfo(`IndicatorBarAttribute.THINSTRIP: actual.indicatorHeight=${actual.indicatorHeight}`);
      expect(actual.indicatorHeight).assertEqual(3);
      logInfo(`${BUNDLE}IndicatorBarAttributeValues_0002 end`);
    });
  });
}
