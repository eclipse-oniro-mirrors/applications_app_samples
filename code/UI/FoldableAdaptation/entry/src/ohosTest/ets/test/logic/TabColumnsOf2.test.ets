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
import { tabColumnsOf } from '../model/FoldLayoutLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FoldableAdaptation]';
const BUNDLE: string = 'FoldableAdaptation_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for tabColumnsOf (16 cases). */
export default function tabColumnsOf2Test(): void {
  describe('TabColumnsOf2Test', () => {
    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0090
     * @tc.name      FoldableAdaptation_TabColumnsOf_0090
     * @tc.desc      tabColumnsOf(width=3744, isFoldable=false) returns " 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0090 begin`);
      const actual: string = tabColumnsOf(3744, false);
      logInfo(`tabColumnsOf(width=3744, isFoldable=false): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(83);
      logInfo(`tabColumnsOf(width=3744, isFoldable=false): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr ');
      logInfo(`tabColumnsOf(width=3744, isFoldable=false): actual.substring(51)=${actual.substring(51)}`);
      expect(actual.substring(51)).assertEqual(' 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0090 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0091
     * @tc.name      FoldableAdaptation_TabColumnsOf_0091
     * @tc.desc      tabColumnsOf(width=3840, isFoldable=false) returns " 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0091 begin`);
      const actual: string = tabColumnsOf(3840, false);
      logInfo(`tabColumnsOf(width=3840, isFoldable=false): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(83);
      logInfo(`tabColumnsOf(width=3840, isFoldable=false): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr ');
      logInfo(`tabColumnsOf(width=3840, isFoldable=false): actual.substring(51)=${actual.substring(51)}`);
      expect(actual.substring(51)).assertEqual(' 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0091 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0092
     * @tc.name      FoldableAdaptation_TabColumnsOf_0092
     * @tc.desc      tabColumnsOf(width=2800, isFoldable=true) returns " 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0092 begin`);
      const actual: string = tabColumnsOf(2800, true);
      logInfo(`tabColumnsOf(width=2800, isFoldable=true): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`tabColumnsOf(width=2800, isFoldable=true): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr ');
      logInfo(`tabColumnsOf(width=2800, isFoldable=true): actual.substring(35)=${actual.substring(35)}`);
      expect(actual.substring(35)).assertEqual(' 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0092 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0093
     * @tc.name      FoldableAdaptation_TabColumnsOf_0093
     * @tc.desc      tabColumnsOf(width=2800, isFoldable=false) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0093 begin`);
      const actual: string = tabColumnsOf(2800, false);
      logInfo(`tabColumnsOf(width=2800, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0093 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0094
     * @tc.name      FoldableAdaptation_TabColumnsOf_0094
     * @tc.desc      tabColumnsOf(width=528.08, isFoldable=true) returns "1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0094 begin`);
      const actual: string = tabColumnsOf(528.08, true);
      logInfo(`tabColumnsOf(width=528.08, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0094 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0095
     * @tc.name      FoldableAdaptation_TabColumnsOf_0095
     * @tc.desc      tabColumnsOf(width=528.08, isFoldable=false) returns "1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0095 begin`);
      const actual: string = tabColumnsOf(528.08, false);
      logInfo(`tabColumnsOf(width=528.08, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0095 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0096
     * @tc.name      FoldableAdaptation_TabColumnsOf_0096
     * @tc.desc      tabColumnsOf(width=428, isFoldable=true) returns "1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0096 begin`);
      const actual: string = tabColumnsOf(428, true);
      logInfo(`tabColumnsOf(width=428, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0096 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0097
     * @tc.name      FoldableAdaptation_TabColumnsOf_0097
     * @tc.desc      tabColumnsOf(width=428, isFoldable=false) returns "1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0097 begin`);
      const actual: string = tabColumnsOf(428, false);
      logInfo(`tabColumnsOf(width=428, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0097 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0098
     * @tc.name      FoldableAdaptation_TabColumnsOf_0098
     * @tc.desc      tabColumnsOf(width=798, isFoldable=true) returns "1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0098 begin`);
      const actual: string = tabColumnsOf(798, true);
      logInfo(`tabColumnsOf(width=798, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0098 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0099
     * @tc.name      FoldableAdaptation_TabColumnsOf_0099
     * @tc.desc      tabColumnsOf(width=798, isFoldable=false) returns "1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0099 begin`);
      const actual: string = tabColumnsOf(798, false);
      logInfo(`tabColumnsOf(width=798, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0099 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0100
     * @tc.name      FoldableAdaptation_TabColumnsOf_0100
     * @tc.desc      tabColumnsOf(width=1405, isFoldable=true) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0100 begin`);
      const actual: string = tabColumnsOf(1405, true);
      logInfo(`tabColumnsOf(width=1405, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0100 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0101
     * @tc.name      FoldableAdaptation_TabColumnsOf_0101
     * @tc.desc      tabColumnsOf(width=1405, isFoldable=false) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0101 begin`);
      const actual: string = tabColumnsOf(1405, false);
      logInfo(`tabColumnsOf(width=1405, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0101 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0102
     * @tc.name      FoldableAdaptation_TabColumnsOf_0102
     * @tc.desc      tabColumnsOf(width=2511, isFoldable=true) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0102 begin`);
      const actual: string = tabColumnsOf(2511, true);
      logInfo(`tabColumnsOf(width=2511, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0102 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0103
     * @tc.name      FoldableAdaptation_TabColumnsOf_0103
     * @tc.desc      tabColumnsOf(width=2511, isFoldable=false) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0103 begin`);
      const actual: string = tabColumnsOf(2511, false);
      logInfo(`tabColumnsOf(width=2511, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0103 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0104
     * @tc.name      FoldableAdaptation_TabColumnsOf_0104
     * @tc.desc      tabColumnsOf(width=1246, isFoldable=true) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0104 begin`);
      const actual: string = tabColumnsOf(1246, true);
      logInfo(`tabColumnsOf(width=1246, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0104 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0105
     * @tc.name      FoldableAdaptation_TabColumnsOf_0105
     * @tc.desc      tabColumnsOf(width=1246, isFoldable=false) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0105 begin`);
      const actual: string = tabColumnsOf(1246, false);
      logInfo(`tabColumnsOf(width=1246, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0105 end`);
    });
  });
}
