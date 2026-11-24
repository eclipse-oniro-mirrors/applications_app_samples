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
import { TaskData } from '../../../../main/ets/bridge/PhotomodifyBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Image]';
const BUNDLE: string = 'Image_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new TaskData (8 cases). */
export default function taskDataCtorTest(): void {
  describe('TaskDataCtorTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMAGE_TASK_DATA_CTOR_0001
     * @tc.name      Image_TaskDataCtor_0001
     * @tc.desc      new TaskData(0) initialises 1 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Image_TaskDataCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TaskDataCtor_0001 begin`);
      const subject: TaskData = new TaskData(0);
      logInfo(`new TaskData(0): subject.task=${subject.task}`);
      expect(subject.task).assertEqual(0);
      logInfo(`${BUNDLE}TaskDataCtor_0001 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TASK_DATA_CTOR_0002
     * @tc.name      Image_TaskDataCtor_0002
     * @tc.desc      new TaskData(1) initialises 1 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Image_TaskDataCtor_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TaskDataCtor_0002 begin`);
      const subject: TaskData = new TaskData(1);
      logInfo(`new TaskData(1): subject.task=${subject.task}`);
      expect(subject.task).assertEqual(1);
      logInfo(`${BUNDLE}TaskDataCtor_0002 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TASK_DATA_CTOR_0003
     * @tc.name      Image_TaskDataCtor_0003
     * @tc.desc      new TaskData(-1) initialises 1 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TaskDataCtor_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TaskDataCtor_0003 begin`);
      const subject: TaskData = new TaskData(-1);
      logInfo(`new TaskData(-1): subject.task=${subject.task}`);
      expect(subject.task).assertEqual(-1);
      logInfo(`${BUNDLE}TaskDataCtor_0003 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TASK_DATA_CTOR_0004
     * @tc.name      Image_TaskDataCtor_0004
     * @tc.desc      new TaskData(2) initialises 1 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TaskDataCtor_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TaskDataCtor_0004 begin`);
      const subject: TaskData = new TaskData(2);
      logInfo(`new TaskData(2): subject.task=${subject.task}`);
      expect(subject.task).assertEqual(2);
      logInfo(`${BUNDLE}TaskDataCtor_0004 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TASK_DATA_CTOR_0005
     * @tc.name      Image_TaskDataCtor_0005
     * @tc.desc      new TaskData(3) initialises 1 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TaskDataCtor_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TaskDataCtor_0005 begin`);
      const subject: TaskData = new TaskData(3);
      logInfo(`new TaskData(3): subject.task=${subject.task}`);
      expect(subject.task).assertEqual(3);
      logInfo(`${BUNDLE}TaskDataCtor_0005 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TASK_DATA_CTOR_0006
     * @tc.name      Image_TaskDataCtor_0006
     * @tc.desc      new TaskData(10) initialises 1 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TaskDataCtor_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TaskDataCtor_0006 begin`);
      const subject: TaskData = new TaskData(10);
      logInfo(`new TaskData(10): subject.task=${subject.task}`);
      expect(subject.task).assertEqual(10);
      logInfo(`${BUNDLE}TaskDataCtor_0006 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TASK_DATA_CTOR_0007
     * @tc.name      Image_TaskDataCtor_0007
     * @tc.desc      new TaskData(100) initialises 1 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TaskDataCtor_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TaskDataCtor_0007 begin`);
      const subject: TaskData = new TaskData(100);
      logInfo(`new TaskData(100): subject.task=${subject.task}`);
      expect(subject.task).assertEqual(100);
      logInfo(`${BUNDLE}TaskDataCtor_0007 end`);
    });

    /**
     * @tc.number    SUB_IMAGE_TASK_DATA_CTOR_0008
     * @tc.name      Image_TaskDataCtor_0008
     * @tc.desc      new TaskData(5) initialises 1 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Image_TaskDataCtor_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TaskDataCtor_0008 begin`);
      const subject: TaskData = new TaskData(5);
      logInfo(`new TaskData(5): subject.task=${subject.task}`);
      expect(subject.task).assertEqual(5);
      logInfo(`${BUNDLE}TaskDataCtor_0008 end`);
    });
  });
}
