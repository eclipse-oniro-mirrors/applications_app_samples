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
import { yieldToEventLoop } from '../TestEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { RectBox } from '../model/DrawingGeometryLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_TsDrawingSample]';
const BUNDLE: string = 'TsDrawingSample_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new RectBox (5 cases). */
export default function rectBoxCtor2Test(): void {
  describe('RectBoxCtor2Test', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0071
     * @tc.name      TsDrawingSample_RectBoxCtor_0071
     * @tc.desc      new RectBox(3, 50, 100, 3) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0071 begin`);
      const subject: RectBox = new RectBox(3, 50, 100, 3);
      logInfo(`new RectBox(3, 50, 100, 3): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(3);
      logInfo(`new RectBox(3, 50, 100, 3): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(50);
      logInfo(`new RectBox(3, 50, 100, 3): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(100);
      logInfo(`new RectBox(3, 50, 100, 3): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(3);
      logInfo(`${BUNDLE}RectBoxCtor_0071 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0072
     * @tc.name      TsDrawingSample_RectBoxCtor_0072
     * @tc.desc      new RectBox(0, -1, 100, 0) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0072 begin`);
      const subject: RectBox = new RectBox(0, -1, 100, 0);
      logInfo(`new RectBox(0, -1, 100, 0): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(0);
      logInfo(`new RectBox(0, -1, 100, 0): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(-1);
      logInfo(`new RectBox(0, -1, 100, 0): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(100);
      logInfo(`new RectBox(0, -1, 100, 0): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(0);
      logInfo(`${BUNDLE}RectBoxCtor_0072 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0073
     * @tc.name      TsDrawingSample_RectBoxCtor_0073
     * @tc.desc      new RectBox(3, 0, 1, 100) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0073 begin`);
      const subject: RectBox = new RectBox(3, 0, 1, 100);
      logInfo(`new RectBox(3, 0, 1, 100): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(3);
      logInfo(`new RectBox(3, 0, 1, 100): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(0);
      logInfo(`new RectBox(3, 0, 1, 100): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(1);
      logInfo(`new RectBox(3, 0, 1, 100): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(100);
      logInfo(`${BUNDLE}RectBoxCtor_0073 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0074
     * @tc.name      TsDrawingSample_RectBoxCtor_0074
     * @tc.desc      new RectBox(1, -100, 100, 1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0074 begin`);
      const subject: RectBox = new RectBox(1, -100, 100, 1);
      logInfo(`new RectBox(1, -100, 100, 1): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(1);
      logInfo(`new RectBox(1, -100, 100, 1): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(-100);
      logInfo(`new RectBox(1, -100, 100, 1): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(100);
      logInfo(`new RectBox(1, -100, 100, 1): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(1);
      logInfo(`${BUNDLE}RectBoxCtor_0074 end`);
    });

    /**
     * @tc.number    SUB_TSDRAWINGSAMPLE_RECT_BOX_CTOR_0075
     * @tc.name      TsDrawingSample_RectBoxCtor_0075
     * @tc.desc      new RectBox(0, 1, -100, 1) initialises 4 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TsDrawingSample_RectBoxCtor_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RectBoxCtor_0075 begin`);
      const subject: RectBox = new RectBox(0, 1, -100, 1);
      logInfo(`new RectBox(0, 1, -100, 1): subject.left=${subject.left}`);
      expect(subject.left).assertEqual(0);
      logInfo(`new RectBox(0, 1, -100, 1): subject.top=${subject.top}`);
      expect(subject.top).assertEqual(1);
      logInfo(`new RectBox(0, 1, -100, 1): subject.right=${subject.right}`);
      expect(subject.right).assertEqual(-100);
      logInfo(`new RectBox(0, 1, -100, 1): subject.bottom=${subject.bottom}`);
      expect(subject.bottom).assertEqual(1);
      logInfo(`${BUNDLE}RectBoxCtor_0075 end`);
    });
  });
}
