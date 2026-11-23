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
import { ScaleTasks } from '../../../../main/ets/bridge/PhotomodifyBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Image]';
const BUNDLE: string = 'Image_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for ScaleTasks (3 cases). */
export default function scaleTasksValuesTest(): void {
  describe('ScaleTasksValuesTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_SCALE_TASKS_VALUES_0001
     * @tc.name      Image_ScaleTasksValues_0001
     * @tc.desc      ScaleTasks.AMPLIFICARION keeps value 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Image_ScaleTasksValues_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ScaleTasksValues_0001 begin`);
      const actual: number = ScaleTasks.AMPLIFICARION;
      logInfo(`ScaleTasks.AMPLIFICARION: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}ScaleTasksValues_0001 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_SCALE_TASKS_VALUES_0002
     * @tc.name      Image_ScaleTasksValues_0002
     * @tc.desc      ScaleTasks.NARROW keeps value 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Image_ScaleTasksValues_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ScaleTasksValues_0002 begin`);
      const actual: number = ScaleTasks.NARROW;
      logInfo(`ScaleTasks.NARROW: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}ScaleTasksValues_0002 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_SCALE_TASKS_VALUES_0003
     * @tc.name      Image_ScaleTasksValues_0003
     * @tc.desc      ScaleTasks.NONE keeps value 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_ScaleTasksValues_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ScaleTasksValues_0003 begin`);
      const actual: number = ScaleTasks.NONE;
      logInfo(`ScaleTasks.NONE: actual=${actual}`);
      expect(actual).assertEqual(99);
      logInfo(`${BUNDLE}ScaleTasksValues_0003 end`);
    });
  });
}
