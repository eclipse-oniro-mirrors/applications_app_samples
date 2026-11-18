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
  CURRENT_RATE, LEFT_PADDING, RIGHT_PADDING, letterValue, panelData
} from '../../../../main/ets/pages/components/ComponentData';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentCollection]';
const BUNDLE: string = 'ComponentCollection_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for ComponentData (5 cases). */
export default function componentDataConstantsTest(): void {
  describe('ComponentDataConstantsTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_COMPONENT_DATA_CONSTANTS_0001
     * @tc.name      ComponentCollection_ComponentDataConstants_0001
     * @tc.desc      letterValue keeps value ["Z"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_ComponentDataConstants_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ComponentDataConstants_0001 begin`);
      const actual: string[] = letterValue;
      logInfo(`letterValue: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(27);
      logInfo(`letterValue: JSON.stringify(actual.slice(0, 13))=${JSON.stringify(actual.slice(0, 13))}`);
      expect(JSON.stringify(actual.slice(0, 13))).assertEqual('["#","A","B","C","D","E","F","G","H","I","J","K","L"]');
      logInfo(`letterValue: JSON.stringify(actual.slice(13, 26))=${JSON.stringify(actual.slice(13, 26))}`);
      expect(JSON.stringify(actual.slice(13, 26))).assertEqual('["M","N","O","P","Q","R","S","T","U","V","W","X","Y"]');
      logInfo(`letterValue: JSON.stringify(actual.slice(26, 27))=${JSON.stringify(actual.slice(26, 27))}`);
      expect(JSON.stringify(actual.slice(26, 27))).assertEqual('["Z"]');
      logInfo(`${BUNDLE}ComponentDataConstants_0001 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_COMPONENT_DATA_CONSTANTS_0002
     * @tc.name      ComponentCollection_ComponentDataConstants_0002
     * @tc.desc      panelData keeps value [10,10,30,10,10,20]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_ComponentDataConstants_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ComponentDataConstants_0002 begin`);
      const actual: number[] = panelData;
      logInfo(`panelData: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(6);
      logInfo(`panelData: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[10,10,30,10,10,20]');
      logInfo(`${BUNDLE}ComponentDataConstants_0002 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_COMPONENT_DATA_CONSTANTS_0003
     * @tc.name      ComponentCollection_ComponentDataConstants_0003
     * @tc.desc      LEFT_PADDING keeps value 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ComponentDataConstants_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentDataConstants_0003 begin`);
      const actual: number = LEFT_PADDING;
      logInfo(`LEFT_PADDING: actual=${actual}`);
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}ComponentDataConstants_0003 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_COMPONENT_DATA_CONSTANTS_0004
     * @tc.name      ComponentCollection_ComponentDataConstants_0004
     * @tc.desc      CURRENT_RATE keeps value ["0.75X","1X","1.25X","1.75X","2X"]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ComponentDataConstants_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentDataConstants_0004 begin`);
      const actual: string[] = CURRENT_RATE;
      logInfo(`CURRENT_RATE: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(5);
      logInfo(`CURRENT_RATE: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('["0.75X","1X","1.25X","1.75X","2X"]');
      logInfo(`${BUNDLE}ComponentDataConstants_0004 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_COMPONENT_DATA_CONSTANTS_0005
     * @tc.name      ComponentCollection_ComponentDataConstants_0005
     * @tc.desc      RIGHT_PADDING keeps value 16
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ComponentDataConstants_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentDataConstants_0005 begin`);
      const actual: number = RIGHT_PADDING;
      logInfo(`RIGHT_PADDING: actual=${actual}`);
      expect(actual).assertEqual(16);
      logInfo(`${BUNDLE}ComponentDataConstants_0005 end`);
    });
  });
}
