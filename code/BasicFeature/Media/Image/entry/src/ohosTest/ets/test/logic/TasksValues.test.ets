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
import { Tasks } from '../../../../main/ets/bridge/PhotomodifyBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Image]';
const BUNDLE: string = 'Image_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for Tasks (15 cases). */
export default function tasksValuesTest(): void {
  describe('TasksValuesTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_TASKS_VALUES_0001
     * @tc.name      Image_TasksValues_0001
     * @tc.desc      Tasks.SCALE keeps value 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Image_TasksValues_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TasksValues_0001 begin`);
      const actual: number = Tasks.SCALE;
      logInfo(`Tasks.SCALE: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}TasksValues_0001 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TASKS_VALUES_0002
     * @tc.name      Image_TasksValues_0002
     * @tc.desc      Tasks.CROP keeps value 1
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Image_TasksValues_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TasksValues_0002 begin`);
      const actual: number = Tasks.CROP;
      logInfo(`Tasks.CROP: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}TasksValues_0002 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TASKS_VALUES_0003
     * @tc.name      Image_TasksValues_0003
     * @tc.desc      Tasks.ROTATE keeps value 2
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TasksValues_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TasksValues_0003 begin`);
      const actual: number = Tasks.ROTATE;
      logInfo(`Tasks.ROTATE: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}TasksValues_0003 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TASKS_VALUES_0004
     * @tc.name      Image_TasksValues_0004
     * @tc.desc      Tasks.TONING keeps value 3
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TasksValues_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TasksValues_0004 begin`);
      const actual: number = Tasks.TONING;
      logInfo(`Tasks.TONING: actual=${actual}`);
      expect(actual).assertEqual(3);
      logInfo(`${BUNDLE}TasksValues_0004 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TASKS_VALUES_0005
     * @tc.name      Image_TasksValues_0005
     * @tc.desc      Tasks.TEXT keeps value 4
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TasksValues_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TasksValues_0005 begin`);
      const actual: number = Tasks.TEXT;
      logInfo(`Tasks.TEXT: actual=${actual}`);
      expect(actual).assertEqual(4);
      logInfo(`${BUNDLE}TasksValues_0005 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TASKS_VALUES_0006
     * @tc.name      Image_TasksValues_0006
     * @tc.desc      Tasks.STICKER keeps value 5
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TasksValues_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TasksValues_0006 begin`);
      const actual: number = Tasks.STICKER;
      logInfo(`Tasks.STICKER: actual=${actual}`);
      expect(actual).assertEqual(5);
      logInfo(`${BUNDLE}TasksValues_0006 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TASKS_VALUES_0007
     * @tc.name      Image_TasksValues_0007
     * @tc.desc      Tasks.ADJUST keeps value 6
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TasksValues_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TasksValues_0007 begin`);
      const actual: number = Tasks.ADJUST;
      logInfo(`Tasks.ADJUST: actual=${actual}`);
      expect(actual).assertEqual(6);
      logInfo(`${BUNDLE}TasksValues_0007 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TASKS_VALUES_0008
     * @tc.name      Image_TasksValues_0008
     * @tc.desc      Tasks.MARK keeps value 7
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TasksValues_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TasksValues_0008 begin`);
      const actual: number = Tasks.MARK;
      logInfo(`Tasks.MARK: actual=${actual}`);
      expect(actual).assertEqual(7);
      logInfo(`${BUNDLE}TasksValues_0008 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TASKS_VALUES_0009
     * @tc.name      Image_TasksValues_0009
     * @tc.desc      Tasks.COLORSPACE keeps value 8
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TasksValues_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TasksValues_0009 begin`);
      const actual: number = Tasks.COLORSPACE;
      logInfo(`Tasks.COLORSPACE: actual=${actual}`);
      expect(actual).assertEqual(8);
      logInfo(`${BUNDLE}TasksValues_0009 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TASKS_VALUES_0010
     * @tc.name      Image_TasksValues_0010
     * @tc.desc      Tasks.HDR keeps value 9
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TasksValues_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TasksValues_0010 begin`);
      const actual: number = Tasks.HDR;
      logInfo(`Tasks.HDR: actual=${actual}`);
      expect(actual).assertEqual(9);
      logInfo(`${BUNDLE}TasksValues_0010 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TASKS_VALUES_0011
     * @tc.name      Image_TasksValues_0011
     * @tc.desc      Tasks.ENCODEJS keeps value 10
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TasksValues_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TasksValues_0011 begin`);
      const actual: number = Tasks.ENCODEJS;
      logInfo(`Tasks.ENCODEJS: actual=${actual}`);
      expect(actual).assertEqual(10);
      logInfo(`${BUNDLE}TasksValues_0011 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TASKS_VALUES_0012
     * @tc.name      Image_TasksValues_0012
     * @tc.desc      Tasks.DECODEJS keeps value 11
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TasksValues_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TasksValues_0012 begin`);
      const actual: number = Tasks.DECODEJS;
      logInfo(`Tasks.DECODEJS: actual=${actual}`);
      expect(actual).assertEqual(11);
      logInfo(`${BUNDLE}TasksValues_0012 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TASKS_VALUES_0013
     * @tc.name      Image_TasksValues_0013
     * @tc.desc      Tasks.ENCODENDK keeps value 12
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TasksValues_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TasksValues_0013 begin`);
      const actual: number = Tasks.ENCODENDK;
      logInfo(`Tasks.ENCODENDK: actual=${actual}`);
      expect(actual).assertEqual(12);
      logInfo(`${BUNDLE}TasksValues_0013 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TASKS_VALUES_0014
     * @tc.name      Image_TasksValues_0014
     * @tc.desc      Tasks.DECODENDK keeps value 13
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TasksValues_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TasksValues_0014 begin`);
      const actual: number = Tasks.DECODENDK;
      logInfo(`Tasks.DECODENDK: actual=${actual}`);
      expect(actual).assertEqual(13);
      logInfo(`${BUNDLE}TasksValues_0014 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TASKS_VALUES_0015
     * @tc.name      Image_TasksValues_0015
     * @tc.desc      Tasks.NONE keeps value 99
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TasksValues_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TasksValues_0015 begin`);
      const actual: number = Tasks.NONE;
      logInfo(`Tasks.NONE: actual=${actual}`);
      expect(actual).assertEqual(99);
      logInfo(`${BUNDLE}TasksValues_0015 end`);
    });
  });
}
