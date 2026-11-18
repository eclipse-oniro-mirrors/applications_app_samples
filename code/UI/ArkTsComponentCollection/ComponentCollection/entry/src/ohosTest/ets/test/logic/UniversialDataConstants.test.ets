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
import {
  PointerStyleName, hitTestModeNameData, hoverEffectNameData, placementsNameData, pointerStyleNameData
} from '../../../../main/ets/pages/universal/UniversialData';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentCollection]';
const BUNDLE: string = 'ComponentCollection_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for UniversialData (4 cases). */
export default function universialDataConstantsTest(): void {
  describe('UniversialDataConstantsTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_UNIVERSIAL_DATA_CONSTANTS_0001
     * @tc.name      ComponentCollection_UniversialDataConstants_0001
     * @tc.desc      placementsNameData keeps value ["BottomLeft","Bottom","BottomRight"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_UniversialDataConstants_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UniversialDataConstants_0001 begin`);
      const actual: string[] = placementsNameData;
      logInfo(`placementsNameData: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(12);
      logInfo(`placementsNameData: JSON.stringify(actual.slice(0, 5))=${JSON.stringify(actual.slice(0, 5))}`);
      expect(JSON.stringify(actual.slice(0, 5))).assertEqual('["TopLeft","Top","TopRight","RightTop","Right"]');
      logInfo(`placementsNameData: JSON.stringify(actual.slice(5, 9))=${JSON.stringify(actual.slice(5, 9))}`);
      expect(JSON.stringify(actual.slice(5, 9))).assertEqual('["RightBottom","LeftTop","Left","LeftBottom"]');
      logInfo(`placementsNameData: JSON.stringify(actual.slice(9, 12))=${JSON.stringify(actual.slice(9, 12))}`);
      expect(JSON.stringify(actual.slice(9, 12))).assertEqual('["BottomLeft","Bottom","BottomRight"]');
      logInfo(`${BUNDLE}UniversialDataConstants_0001 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_UNIVERSIAL_DATA_CONSTANTS_0002
     * @tc.name      ComponentCollection_UniversialDataConstants_0002
     * @tc.desc      hitTestModeNameData keeps value ["Default","Block","Transparent","None"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_UniversialDataConstants_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}UniversialDataConstants_0002 begin`);
      const actual: string[] = hitTestModeNameData;
      logInfo(`hitTestModeNameData: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`hitTestModeNameData: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["Default","Block","Transparent","None"]');
      logInfo(`${BUNDLE}UniversialDataConstants_0002 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_UNIVERSIAL_DATA_CONSTANTS_0003
     * @tc.name      ComponentCollection_UniversialDataConstants_0003
     * @tc.desc      hoverEffectNameData keeps value ["None","Highlight","Auto","Scale"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_UniversialDataConstants_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UniversialDataConstants_0003 begin`);
      const actual: string[] = hoverEffectNameData;
      logInfo(`hoverEffectNameData: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`hoverEffectNameData: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["None","Highlight","Auto","Scale"]');
      logInfo(`${BUNDLE}UniversialDataConstants_0003 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_UNIVERSIAL_DATA_CONSTANTS_0004
     * @tc.name      ComponentCollection_UniversialDataConstants_0004
     * @tc.desc      pointerStyleNameData keeps value "MIDDLE_BTN_NORTH_SOUTH_WEST_EAST"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_UniversialDataConstants_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}UniversialDataConstants_0004 begin`);
      const actual: PointerStyleName[] = pointerStyleNameData;
      logInfo(`pointerStyleNameData: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(39);
      logInfo(`pointerStyleNameData: actual[0].key=${actual[0].key}`);
      expect(actual[0].key).assertEqual('DEFAULT');
      logInfo(`pointerStyleNameData: actual[19].key=${actual[19].key}`);
      expect(actual[19].key).assertEqual('HAND_POINTING');
      logInfo(`pointerStyleNameData: actual[38].key=${actual[38].key}`);
      expect(actual[38].key).assertEqual('MIDDLE_BTN_NORTH_SOUTH_WEST_EAST');
      logInfo(`${BUNDLE}UniversialDataConstants_0004 end`);
    });
  });
}
