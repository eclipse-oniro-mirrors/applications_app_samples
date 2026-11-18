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
  DEFAULT_WINDOW_HEIGHT, DELETE_SCALE, DISPLAY_COUNT, MIN_SCALE, WATER_FLOW_HEIGHTS
} from '../model/ComponentSampleLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ComponentCollection]';
const BUNDLE: string = 'ComponentCollection_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for ComponentSampleLogic (5 cases). */
export default function componentSampleLogicConstantsTest(): void {
  describe('ComponentSampleLogicConstantsTest', () => {
    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_COMPONENT_SAMPLE_LOGIC_CONSTANTS_0001
     * @tc.name      ComponentCollection_ComponentSampleLogicConstants_0001
     * @tc.desc      DISPLAY_COUNT keeps value 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_ComponentSampleLogicConstants_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ComponentSampleLogicConstants_0001 begin`);
      const actual: number = DISPLAY_COUNT;
      logInfo(`DISPLAY_COUNT: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ComponentSampleLogicConstants_0001 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_COMPONENT_SAMPLE_LOGIC_CONSTANTS_0002
     * @tc.name      ComponentCollection_ComponentSampleLogicConstants_0002
     * @tc.desc      MIN_SCALE keeps value 0.75
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ComponentCollection_ComponentSampleLogicConstants_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ComponentSampleLogicConstants_0002 begin`);
      const actual: number = MIN_SCALE;
      logInfo(`MIN_SCALE: actual=${actual}`);
      expect(actual).assertClose(0.75, PRECISION);
      logInfo(`${BUNDLE}ComponentSampleLogicConstants_0002 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_COMPONENT_SAMPLE_LOGIC_CONSTANTS_0003
     * @tc.name      ComponentCollection_ComponentSampleLogicConstants_0003
     * @tc.desc      DELETE_SCALE keeps value 0.15
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ComponentSampleLogicConstants_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentSampleLogicConstants_0003 begin`);
      const actual: number = DELETE_SCALE;
      logInfo(`DELETE_SCALE: actual=${actual}`);
      expect(actual).assertClose(0.15, PRECISION);
      logInfo(`${BUNDLE}ComponentSampleLogicConstants_0003 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_COMPONENT_SAMPLE_LOGIC_CONSTANTS_0004
     * @tc.name      ComponentCollection_ComponentSampleLogicConstants_0004
     * @tc.desc      DEFAULT_WINDOW_HEIGHT keeps value 720
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ComponentSampleLogicConstants_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentSampleLogicConstants_0004 begin`);
      const actual: number = DEFAULT_WINDOW_HEIGHT;
      logInfo(`DEFAULT_WINDOW_HEIGHT: actual=${actual}`);
      expect(actual).assertEqual(720);
      logInfo(`${BUNDLE}ComponentSampleLogicConstants_0004 end`);
    });

    /**
     * @tc.number    SUB_COMPONENTCOLLECTION_COMPONENT_SAMPLE_LOGIC_CONSTANTS_0005
     * @tc.name      ComponentCollection_ComponentSampleLogicConstants_0005
     * @tc.desc      WATER_FLOW_HEIGHTS keeps value [102,136,136,102]
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ComponentCollection_ComponentSampleLogicConstants_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentSampleLogicConstants_0005 begin`);
      const actual: number[] = WATER_FLOW_HEIGHTS;
      logInfo(`WATER_FLOW_HEIGHTS: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(4);
      logInfo(`WATER_FLOW_HEIGHTS: JSON.stringify(actual)=${JSON.stringify(actual)}`);
      expect(JSON.stringify(actual)).assertEqual('[102,136,136,102]');
      logInfo(`${BUNDLE}ComponentSampleLogicConstants_0005 end`);
    });
  });
}
