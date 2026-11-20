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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../YieldToEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ColorSpaceTasks } from '../../../../main/ets/bridge/PhotomodifyBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Image]';
const BUNDLE: string = 'Image_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for ColorSpaceTasks (5 cases). */
export default function colorSpaceTasksValuesTest(): void {
  describe('ColorSpaceTasksValuesTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_COLOR_SPACE_TASKS_VALUES_0001
     * @tc.name      Image_ColorSpaceTasksValues_0001
     * @tc.desc      ColorSpaceTasks.ADOBERGB keeps value 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Image_ColorSpaceTasksValues_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ColorSpaceTasksValues_0001 begin`);
      const actual: number = ColorSpaceTasks.ADOBERGB;
      logInfo(`ColorSpaceTasks.ADOBERGB: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ColorSpaceTasksValues_0001 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COLOR_SPACE_TASKS_VALUES_0002
     * @tc.name      Image_ColorSpaceTasksValues_0002
     * @tc.desc      ColorSpaceTasks.SRGB keeps value 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Image_ColorSpaceTasksValues_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ColorSpaceTasksValues_0002 begin`);
      const actual: number = ColorSpaceTasks.SRGB;
      logInfo(`ColorSpaceTasks.SRGB: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ColorSpaceTasksValues_0002 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COLOR_SPACE_TASKS_VALUES_0003
     * @tc.name      Image_ColorSpaceTasksValues_0003
     * @tc.desc      ColorSpaceTasks.DCIP3 keeps value 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ColorSpaceTasksValues_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColorSpaceTasksValues_0003 begin`);
      const actual: number = ColorSpaceTasks.DCIP3;
      logInfo(`ColorSpaceTasks.DCIP3: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}ColorSpaceTasksValues_0003 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COLOR_SPACE_TASKS_VALUES_0004
     * @tc.name      Image_ColorSpaceTasksValues_0004
     * @tc.desc      ColorSpaceTasks.DISPLAYP3 keeps value 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ColorSpaceTasksValues_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColorSpaceTasksValues_0004 begin`);
      const actual: number = ColorSpaceTasks.DISPLAYP3;
      logInfo(`ColorSpaceTasks.DISPLAYP3: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}ColorSpaceTasksValues_0004 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_COLOR_SPACE_TASKS_VALUES_0005
     * @tc.name      Image_ColorSpaceTasksValues_0005
     * @tc.desc      ColorSpaceTasks.NONE keeps value 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ColorSpaceTasksValues_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ColorSpaceTasksValues_0005 begin`);
      const actual: number = ColorSpaceTasks.NONE;
      logInfo(`ColorSpaceTasks.NONE: actual=${actual}`);
      expect(actual).assertEqual(99);
      logInfo(`${BUNDLE}ColorSpaceTasksValues_0005 end`);
    });
  });
}
