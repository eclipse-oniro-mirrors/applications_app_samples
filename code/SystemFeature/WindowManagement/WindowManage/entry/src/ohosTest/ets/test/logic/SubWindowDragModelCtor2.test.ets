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
import { SubWindowDragModel } from '../model/WindowMoveLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowManage]';
const BUNDLE: string = 'WindowManage_';
const PRECISION: number = 0.000001;

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for new SubWindowDragModel (48 cases). */
export default function subWindowDragModelCtor2Test(): void {
  describe('SubWindowDragModelCtor2Test', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0049
     * @tc.name      WindowManage_SubWindowDragModelCtor_0049
     * @tc.desc      new SubWindowDragModel(1080, 96, 100) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0049 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1080, 96, 100);
      logInfo(`new SubWindowDragModel(1080, 96, 100): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(1080, 96, 100): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(1080, 96, 100): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(1080, 96, 100): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(1080, 96, 100): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`new SubWindowDragModel(1080, 96, 100): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(96);
      logInfo(`new SubWindowDragModel(1080, 96, 100): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(1080, 96, 100): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(100);
      logInfo(`new SubWindowDragModel(1080, 96, 100): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0049 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0050
     * @tc.name      WindowManage_SubWindowDragModelCtor_0050
     * @tc.desc      new SubWindowDragModel(3, 2, 2) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0050 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(3, 2, 2);
      logInfo(`new SubWindowDragModel(3, 2, 2): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(3, 2, 2): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(3, 2, 2): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(3, 2, 2): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(3, 2, 2): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(3);
      logInfo(`new SubWindowDragModel(3, 2, 2): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(2);
      logInfo(`new SubWindowDragModel(3, 2, 2): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(3, 2, 2): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(2);
      logInfo(`new SubWindowDragModel(3, 2, 2): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0050 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0051
     * @tc.name      WindowManage_SubWindowDragModelCtor_0051
     * @tc.desc      new SubWindowDragModel(1, 10, 8.5) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0051 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 10, 8.5);
      logInfo(`new SubWindowDragModel(1, 10, 8.5): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(1, 10, 8.5): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(1, 10, 8.5): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(1, 10, 8.5): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(1, 10, 8.5): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1);
      logInfo(`new SubWindowDragModel(1, 10, 8.5): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(10);
      logInfo(`new SubWindowDragModel(1, 10, 8.5): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(1, 10, 8.5): subject.density=${subject.density}`);
      expect(subject.density).assertClose(8.5, PRECISION);
      logInfo(`new SubWindowDragModel(1, 10, 8.5): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0051 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0052
     * @tc.name      WindowManage_SubWindowDragModelCtor_0052
     * @tc.desc      new SubWindowDragModel(3, 0, 3) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0052 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(3, 0, 3);
      logInfo(`new SubWindowDragModel(3, 0, 3): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(3, 0, 3): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(3, 0, 3): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(3, 0, 3): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(3, 0, 3): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(3);
      logInfo(`new SubWindowDragModel(3, 0, 3): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(3, 0, 3): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(3, 0, 3): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(3);
      logInfo(`new SubWindowDragModel(3, 0, 3): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0052 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0053
     * @tc.name      WindowManage_SubWindowDragModelCtor_0053
     * @tc.desc      new SubWindowDragModel(-1, 1920, 1) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0053 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(-1, 1920, 1);
      logInfo(`new SubWindowDragModel(-1, 1920, 1): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(-1, 1920, 1): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(-1, 1920, 1): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(-1, 1920, 1): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(-1, 1920, 1): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`new SubWindowDragModel(-1, 1920, 1): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1920);
      logInfo(`new SubWindowDragModel(-1, 1920, 1): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(-1, 1920, 1): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(1);
      logInfo(`new SubWindowDragModel(-1, 1920, 1): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0053 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0054
     * @tc.name      WindowManage_SubWindowDragModelCtor_0054
     * @tc.desc      new SubWindowDragModel(10, 0, 10) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0054 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(10, 0, 10);
      logInfo(`new SubWindowDragModel(10, 0, 10): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(10, 0, 10): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(10, 0, 10): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(10, 0, 10): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(10, 0, 10): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(10);
      logInfo(`new SubWindowDragModel(10, 0, 10): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(10, 0, 10): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(10, 0, 10): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(10);
      logInfo(`new SubWindowDragModel(10, 0, 10): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0054 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0055
     * @tc.name      WindowManage_SubWindowDragModelCtor_0055
     * @tc.desc      new SubWindowDragModel(1, 1920, 8.5) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0055 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 1920, 8.5);
      logInfo(`new SubWindowDragModel(1, 1920, 8.5): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(1, 1920, 8.5): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(1, 1920, 8.5): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(1, 1920, 8.5): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(1, 1920, 8.5): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1);
      logInfo(`new SubWindowDragModel(1, 1920, 8.5): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1920);
      logInfo(`new SubWindowDragModel(1, 1920, 8.5): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(1, 1920, 8.5): subject.density=${subject.density}`);
      expect(subject.density).assertClose(8.5, PRECISION);
      logInfo(`new SubWindowDragModel(1, 1920, 8.5): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0055 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0056
     * @tc.name      WindowManage_SubWindowDragModelCtor_0056
     * @tc.desc      new SubWindowDragModel(360, 720, 15) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0056 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(360, 720, 15);
      logInfo(`new SubWindowDragModel(360, 720, 15): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(360, 720, 15): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(360, 720, 15): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(360, 720, 15): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(360, 720, 15): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`new SubWindowDragModel(360, 720, 15): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(720);
      logInfo(`new SubWindowDragModel(360, 720, 15): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(360, 720, 15): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(15);
      logInfo(`new SubWindowDragModel(360, 720, 15): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0056 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0057
     * @tc.name      WindowManage_SubWindowDragModelCtor_0057
     * @tc.desc      new SubWindowDragModel(3, 2, 15) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0057 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(3, 2, 15);
      logInfo(`new SubWindowDragModel(3, 2, 15): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(3, 2, 15): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(3, 2, 15): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(3, 2, 15): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(3, 2, 15): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(3);
      logInfo(`new SubWindowDragModel(3, 2, 15): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(2);
      logInfo(`new SubWindowDragModel(3, 2, 15): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(3, 2, 15): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(15);
      logInfo(`new SubWindowDragModel(3, 2, 15): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0057 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0058
     * @tc.name      WindowManage_SubWindowDragModelCtor_0058
     * @tc.desc      new SubWindowDragModel(720, 1, -1) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0058 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(720, 1, -1);
      logInfo(`new SubWindowDragModel(720, 1, -1): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(720, 1, -1): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(720, 1, -1): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(720, 1, -1): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(720, 1, -1): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`new SubWindowDragModel(720, 1, -1): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1);
      logInfo(`new SubWindowDragModel(720, 1, -1): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(720, 1, -1): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(-1);
      logInfo(`new SubWindowDragModel(720, 1, -1): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0058 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0059
     * @tc.name      WindowManage_SubWindowDragModelCtor_0059
     * @tc.desc      new SubWindowDragModel(100, -1, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0059 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, -1, 0);
      logInfo(`new SubWindowDragModel(100, -1, 0): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(100, -1, 0): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(100, -1, 0): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(100, -1, 0): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(100, -1, 0): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(100);
      logInfo(`new SubWindowDragModel(100, -1, 0): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(-1);
      logInfo(`new SubWindowDragModel(100, -1, 0): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(100, -1, 0): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(0);
      logInfo(`new SubWindowDragModel(100, -1, 0): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0059 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0060
     * @tc.name      WindowManage_SubWindowDragModelCtor_0060
     * @tc.desc      new SubWindowDragModel(1, 360, 10) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0060 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 360, 10);
      logInfo(`new SubWindowDragModel(1, 360, 10): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(1, 360, 10): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(1, 360, 10): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(1, 360, 10): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(1, 360, 10): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1);
      logInfo(`new SubWindowDragModel(1, 360, 10): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(360);
      logInfo(`new SubWindowDragModel(1, 360, 10): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(1, 360, 10): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(10);
      logInfo(`new SubWindowDragModel(1, 360, 10): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0060 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0061
     * @tc.name      WindowManage_SubWindowDragModelCtor_0061
     * @tc.desc      new SubWindowDragModel(1, 96, 25) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0061 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 96, 25);
      logInfo(`new SubWindowDragModel(1, 96, 25): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(1, 96, 25): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(1, 96, 25): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(1, 96, 25): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(1, 96, 25): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1);
      logInfo(`new SubWindowDragModel(1, 96, 25): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(96);
      logInfo(`new SubWindowDragModel(1, 96, 25): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(1, 96, 25): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(25);
      logInfo(`new SubWindowDragModel(1, 96, 25): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0061 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0062
     * @tc.name      WindowManage_SubWindowDragModelCtor_0062
     * @tc.desc      new SubWindowDragModel(720, 1080, 20) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0062 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(720, 1080, 20);
      logInfo(`new SubWindowDragModel(720, 1080, 20): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(720, 1080, 20): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(720, 1080, 20): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(720, 1080, 20): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(720, 1080, 20): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`new SubWindowDragModel(720, 1080, 20): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1080);
      logInfo(`new SubWindowDragModel(720, 1080, 20): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(720, 1080, 20): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(20);
      logInfo(`new SubWindowDragModel(720, 1080, 20): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0062 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0063
     * @tc.name      WindowManage_SubWindowDragModelCtor_0063
     * @tc.desc      new SubWindowDragModel(-1, 360, 20) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0063 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(-1, 360, 20);
      logInfo(`new SubWindowDragModel(-1, 360, 20): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(-1, 360, 20): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(-1, 360, 20): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(-1, 360, 20): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(-1, 360, 20): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`new SubWindowDragModel(-1, 360, 20): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(360);
      logInfo(`new SubWindowDragModel(-1, 360, 20): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(-1, 360, 20): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(20);
      logInfo(`new SubWindowDragModel(-1, 360, 20): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0063 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0064
     * @tc.name      WindowManage_SubWindowDragModelCtor_0064
     * @tc.desc      new SubWindowDragModel(100, 3, 2) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0064 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 3, 2);
      logInfo(`new SubWindowDragModel(100, 3, 2): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(100, 3, 2): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(100, 3, 2): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(100, 3, 2): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(100, 3, 2): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(100);
      logInfo(`new SubWindowDragModel(100, 3, 2): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(3);
      logInfo(`new SubWindowDragModel(100, 3, 2): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(100, 3, 2): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(2);
      logInfo(`new SubWindowDragModel(100, 3, 2): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0064 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0065
     * @tc.name      WindowManage_SubWindowDragModelCtor_0065
     * @tc.desc      new SubWindowDragModel(100, 96, 25) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0065 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 96, 25);
      logInfo(`new SubWindowDragModel(100, 96, 25): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(100, 96, 25): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(100, 96, 25): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(100, 96, 25): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(100, 96, 25): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(100);
      logInfo(`new SubWindowDragModel(100, 96, 25): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(96);
      logInfo(`new SubWindowDragModel(100, 96, 25): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(100, 96, 25): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(25);
      logInfo(`new SubWindowDragModel(100, 96, 25): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0065 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0066
     * @tc.name      WindowManage_SubWindowDragModelCtor_0066
     * @tc.desc      new SubWindowDragModel(1080, 2, 25) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0066 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1080, 2, 25);
      logInfo(`new SubWindowDragModel(1080, 2, 25): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(1080, 2, 25): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(1080, 2, 25): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(1080, 2, 25): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(1080, 2, 25): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`new SubWindowDragModel(1080, 2, 25): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(2);
      logInfo(`new SubWindowDragModel(1080, 2, 25): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(1080, 2, 25): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(25);
      logInfo(`new SubWindowDragModel(1080, 2, 25): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0066 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0067
     * @tc.name      WindowManage_SubWindowDragModelCtor_0067
     * @tc.desc      new SubWindowDragModel(1, 96, 2) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0067 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 96, 2);
      logInfo(`new SubWindowDragModel(1, 96, 2): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(1, 96, 2): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(1, 96, 2): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(1, 96, 2): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(1, 96, 2): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1);
      logInfo(`new SubWindowDragModel(1, 96, 2): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(96);
      logInfo(`new SubWindowDragModel(1, 96, 2): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(1, 96, 2): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(2);
      logInfo(`new SubWindowDragModel(1, 96, 2): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0067 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0068
     * @tc.name      WindowManage_SubWindowDragModelCtor_0068
     * @tc.desc      new SubWindowDragModel(3, 10, 8.5) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0068 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(3, 10, 8.5);
      logInfo(`new SubWindowDragModel(3, 10, 8.5): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(3, 10, 8.5): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(3, 10, 8.5): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(3, 10, 8.5): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(3, 10, 8.5): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(3);
      logInfo(`new SubWindowDragModel(3, 10, 8.5): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(10);
      logInfo(`new SubWindowDragModel(3, 10, 8.5): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(3, 10, 8.5): subject.density=${subject.density}`);
      expect(subject.density).assertClose(8.5, PRECISION);
      logInfo(`new SubWindowDragModel(3, 10, 8.5): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0068 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0069
     * @tc.name      WindowManage_SubWindowDragModelCtor_0069
     * @tc.desc      new SubWindowDragModel(100, 10, 10) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0069 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 10, 10);
      logInfo(`new SubWindowDragModel(100, 10, 10): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(100, 10, 10): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(100, 10, 10): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(100, 10, 10): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(100, 10, 10): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(100);
      logInfo(`new SubWindowDragModel(100, 10, 10): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(10);
      logInfo(`new SubWindowDragModel(100, 10, 10): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(100, 10, 10): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(10);
      logInfo(`new SubWindowDragModel(100, 10, 10): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0069 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0070
     * @tc.name      WindowManage_SubWindowDragModelCtor_0070
     * @tc.desc      new SubWindowDragModel(10, 2, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0070 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(10, 2, 0);
      logInfo(`new SubWindowDragModel(10, 2, 0): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(10, 2, 0): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(10, 2, 0): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(10, 2, 0): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(10, 2, 0): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(10);
      logInfo(`new SubWindowDragModel(10, 2, 0): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(2);
      logInfo(`new SubWindowDragModel(10, 2, 0): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(10, 2, 0): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(0);
      logInfo(`new SubWindowDragModel(10, 2, 0): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0070 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0071
     * @tc.name      WindowManage_SubWindowDragModelCtor_0071
     * @tc.desc      new SubWindowDragModel(96, 10, 2) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0071 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(96, 10, 2);
      logInfo(`new SubWindowDragModel(96, 10, 2): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(96, 10, 2): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(96, 10, 2): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(96, 10, 2): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(96, 10, 2): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(96);
      logInfo(`new SubWindowDragModel(96, 10, 2): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(10);
      logInfo(`new SubWindowDragModel(96, 10, 2): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(96, 10, 2): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(2);
      logInfo(`new SubWindowDragModel(96, 10, 2): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0071 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0072
     * @tc.name      WindowManage_SubWindowDragModelCtor_0072
     * @tc.desc      new SubWindowDragModel(-1, 100, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0072 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(-1, 100, 0);
      logInfo(`new SubWindowDragModel(-1, 100, 0): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(-1, 100, 0): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(-1, 100, 0): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(-1, 100, 0): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(-1, 100, 0): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`new SubWindowDragModel(-1, 100, 0): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(100);
      logInfo(`new SubWindowDragModel(-1, 100, 0): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(-1, 100, 0): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(0);
      logInfo(`new SubWindowDragModel(-1, 100, 0): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0072 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0073
     * @tc.name      WindowManage_SubWindowDragModelCtor_0073
     * @tc.desc      new SubWindowDragModel(96, 100, 3) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0073 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(96, 100, 3);
      logInfo(`new SubWindowDragModel(96, 100, 3): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(96, 100, 3): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(96, 100, 3): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(96, 100, 3): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(96, 100, 3): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(96);
      logInfo(`new SubWindowDragModel(96, 100, 3): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(100);
      logInfo(`new SubWindowDragModel(96, 100, 3): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(96, 100, 3): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(3);
      logInfo(`new SubWindowDragModel(96, 100, 3): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0073 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0074
     * @tc.name      WindowManage_SubWindowDragModelCtor_0074
     * @tc.desc      new SubWindowDragModel(2, 360, 2) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0074 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(2, 360, 2);
      logInfo(`new SubWindowDragModel(2, 360, 2): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(2, 360, 2): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(2, 360, 2): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(2, 360, 2): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(2, 360, 2): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(2);
      logInfo(`new SubWindowDragModel(2, 360, 2): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(360);
      logInfo(`new SubWindowDragModel(2, 360, 2): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(2, 360, 2): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(2);
      logInfo(`new SubWindowDragModel(2, 360, 2): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0074 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0075
     * @tc.name      WindowManage_SubWindowDragModelCtor_0075
     * @tc.desc      new SubWindowDragModel(720, 720, 25) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0075 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(720, 720, 25);
      logInfo(`new SubWindowDragModel(720, 720, 25): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(720, 720, 25): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(720, 720, 25): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(720, 720, 25): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(720, 720, 25): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`new SubWindowDragModel(720, 720, 25): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(720);
      logInfo(`new SubWindowDragModel(720, 720, 25): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(720, 720, 25): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(25);
      logInfo(`new SubWindowDragModel(720, 720, 25): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0075 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0076
     * @tc.name      WindowManage_SubWindowDragModelCtor_0076
     * @tc.desc      new SubWindowDragModel(3, 10, 3) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0076 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(3, 10, 3);
      logInfo(`new SubWindowDragModel(3, 10, 3): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(3, 10, 3): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(3, 10, 3): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(3, 10, 3): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(3, 10, 3): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(3);
      logInfo(`new SubWindowDragModel(3, 10, 3): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(10);
      logInfo(`new SubWindowDragModel(3, 10, 3): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(3, 10, 3): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(3);
      logInfo(`new SubWindowDragModel(3, 10, 3): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0076 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0077
     * @tc.name      WindowManage_SubWindowDragModelCtor_0077
     * @tc.desc      new SubWindowDragModel(96, 360, 8.5) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0077 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(96, 360, 8.5);
      logInfo(`new SubWindowDragModel(96, 360, 8.5): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(96, 360, 8.5): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(96, 360, 8.5): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(96, 360, 8.5): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(96, 360, 8.5): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(96);
      logInfo(`new SubWindowDragModel(96, 360, 8.5): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(360);
      logInfo(`new SubWindowDragModel(96, 360, 8.5): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(96, 360, 8.5): subject.density=${subject.density}`);
      expect(subject.density).assertClose(8.5, PRECISION);
      logInfo(`new SubWindowDragModel(96, 360, 8.5): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0077 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0078
     * @tc.name      WindowManage_SubWindowDragModelCtor_0078
     * @tc.desc      new SubWindowDragModel(1920, 3, 8.5) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0078 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1920, 3, 8.5);
      logInfo(`new SubWindowDragModel(1920, 3, 8.5): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(1920, 3, 8.5): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(1920, 3, 8.5): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(1920, 3, 8.5): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(1920, 3, 8.5): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`new SubWindowDragModel(1920, 3, 8.5): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(3);
      logInfo(`new SubWindowDragModel(1920, 3, 8.5): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(1920, 3, 8.5): subject.density=${subject.density}`);
      expect(subject.density).assertClose(8.5, PRECISION);
      logInfo(`new SubWindowDragModel(1920, 3, 8.5): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0078 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0079
     * @tc.name      WindowManage_SubWindowDragModelCtor_0079
     * @tc.desc      new SubWindowDragModel(1, 720, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0079 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 720, 0);
      logInfo(`new SubWindowDragModel(1, 720, 0): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(1, 720, 0): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(1, 720, 0): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(1, 720, 0): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(1, 720, 0): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1);
      logInfo(`new SubWindowDragModel(1, 720, 0): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(720);
      logInfo(`new SubWindowDragModel(1, 720, 0): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(1, 720, 0): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(0);
      logInfo(`new SubWindowDragModel(1, 720, 0): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0079 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0080
     * @tc.name      WindowManage_SubWindowDragModelCtor_0080
     * @tc.desc      new SubWindowDragModel(1080, 1920, 2) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0080 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1080, 1920, 2);
      logInfo(`new SubWindowDragModel(1080, 1920, 2): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(1080, 1920, 2): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(1080, 1920, 2): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(1080, 1920, 2): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(1080, 1920, 2): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`new SubWindowDragModel(1080, 1920, 2): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1920);
      logInfo(`new SubWindowDragModel(1080, 1920, 2): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(1080, 1920, 2): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(2);
      logInfo(`new SubWindowDragModel(1080, 1920, 2): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0080 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0081
     * @tc.name      WindowManage_SubWindowDragModelCtor_0081
     * @tc.desc      new SubWindowDragModel(1, 96, 5) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0081 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 96, 5);
      logInfo(`new SubWindowDragModel(1, 96, 5): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(1, 96, 5): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(1, 96, 5): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(1, 96, 5): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(1, 96, 5): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1);
      logInfo(`new SubWindowDragModel(1, 96, 5): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(96);
      logInfo(`new SubWindowDragModel(1, 96, 5): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(1, 96, 5): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(5);
      logInfo(`new SubWindowDragModel(1, 96, 5): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0081 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0082
     * @tc.name      WindowManage_SubWindowDragModelCtor_0082
     * @tc.desc      new SubWindowDragModel(720, 3, 100) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0082 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(720, 3, 100);
      logInfo(`new SubWindowDragModel(720, 3, 100): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(720, 3, 100): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(720, 3, 100): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(720, 3, 100): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(720, 3, 100): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`new SubWindowDragModel(720, 3, 100): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(3);
      logInfo(`new SubWindowDragModel(720, 3, 100): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(720, 3, 100): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(100);
      logInfo(`new SubWindowDragModel(720, 3, 100): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0082 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0083
     * @tc.name      WindowManage_SubWindowDragModelCtor_0083
     * @tc.desc      new SubWindowDragModel(0, 96, 2) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0083 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 96, 2);
      logInfo(`new SubWindowDragModel(0, 96, 2): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 96, 2): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 96, 2): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(0, 96, 2): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(0, 96, 2): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 96, 2): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(96);
      logInfo(`new SubWindowDragModel(0, 96, 2): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 96, 2): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(2);
      logInfo(`new SubWindowDragModel(0, 96, 2): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0083 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0084
     * @tc.name      WindowManage_SubWindowDragModelCtor_0084
     * @tc.desc      new SubWindowDragModel(1920, 100, 2) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0084 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1920, 100, 2);
      logInfo(`new SubWindowDragModel(1920, 100, 2): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(1920, 100, 2): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(1920, 100, 2): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(1920, 100, 2): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(1920, 100, 2): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`new SubWindowDragModel(1920, 100, 2): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(100);
      logInfo(`new SubWindowDragModel(1920, 100, 2): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(1920, 100, 2): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(2);
      logInfo(`new SubWindowDragModel(1920, 100, 2): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0084 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0085
     * @tc.name      WindowManage_SubWindowDragModelCtor_0085
     * @tc.desc      new SubWindowDragModel(100, 10, 100) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0085 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 10, 100);
      logInfo(`new SubWindowDragModel(100, 10, 100): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(100, 10, 100): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(100, 10, 100): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(100, 10, 100): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(100, 10, 100): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(100);
      logInfo(`new SubWindowDragModel(100, 10, 100): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(10);
      logInfo(`new SubWindowDragModel(100, 10, 100): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(100, 10, 100): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(100);
      logInfo(`new SubWindowDragModel(100, 10, 100): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0085 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0086
     * @tc.name      WindowManage_SubWindowDragModelCtor_0086
     * @tc.desc      new SubWindowDragModel(2, 1920, 20) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0086 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(2, 1920, 20);
      logInfo(`new SubWindowDragModel(2, 1920, 20): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(2, 1920, 20): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(2, 1920, 20): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(2, 1920, 20): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(2, 1920, 20): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(2);
      logInfo(`new SubWindowDragModel(2, 1920, 20): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1920);
      logInfo(`new SubWindowDragModel(2, 1920, 20): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(2, 1920, 20): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(20);
      logInfo(`new SubWindowDragModel(2, 1920, 20): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0086 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0087
     * @tc.name      WindowManage_SubWindowDragModelCtor_0087
     * @tc.desc      new SubWindowDragModel(360, 96, 3) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0087 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(360, 96, 3);
      logInfo(`new SubWindowDragModel(360, 96, 3): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(360, 96, 3): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(360, 96, 3): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(360, 96, 3): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(360, 96, 3): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`new SubWindowDragModel(360, 96, 3): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(96);
      logInfo(`new SubWindowDragModel(360, 96, 3): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(360, 96, 3): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(3);
      logInfo(`new SubWindowDragModel(360, 96, 3): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0087 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0088
     * @tc.name      WindowManage_SubWindowDragModelCtor_0088
     * @tc.desc      new SubWindowDragModel(360, 1, 20) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0088 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(360, 1, 20);
      logInfo(`new SubWindowDragModel(360, 1, 20): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(360, 1, 20): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(360, 1, 20): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(360, 1, 20): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(360, 1, 20): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`new SubWindowDragModel(360, 1, 20): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1);
      logInfo(`new SubWindowDragModel(360, 1, 20): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(360, 1, 20): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(20);
      logInfo(`new SubWindowDragModel(360, 1, 20): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0088 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0089
     * @tc.name      WindowManage_SubWindowDragModelCtor_0089
     * @tc.desc      new SubWindowDragModel(720, 96, -1) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0089 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(720, 96, -1);
      logInfo(`new SubWindowDragModel(720, 96, -1): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(720, 96, -1): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(720, 96, -1): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(720, 96, -1): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(720, 96, -1): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`new SubWindowDragModel(720, 96, -1): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(96);
      logInfo(`new SubWindowDragModel(720, 96, -1): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(720, 96, -1): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(-1);
      logInfo(`new SubWindowDragModel(720, 96, -1): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0089 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0090
     * @tc.name      WindowManage_SubWindowDragModelCtor_0090
     * @tc.desc      new SubWindowDragModel(100, 3, 1) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0090 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 3, 1);
      logInfo(`new SubWindowDragModel(100, 3, 1): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(100, 3, 1): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(100, 3, 1): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(100, 3, 1): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(100, 3, 1): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(100);
      logInfo(`new SubWindowDragModel(100, 3, 1): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(3);
      logInfo(`new SubWindowDragModel(100, 3, 1): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(100, 3, 1): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(1);
      logInfo(`new SubWindowDragModel(100, 3, 1): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0090 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0091
     * @tc.name      WindowManage_SubWindowDragModelCtor_0091
     * @tc.desc      new SubWindowDragModel(720, 0, 20) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0091 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(720, 0, 20);
      logInfo(`new SubWindowDragModel(720, 0, 20): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(720, 0, 20): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(720, 0, 20): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(720, 0, 20): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(720, 0, 20): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`new SubWindowDragModel(720, 0, 20): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(720, 0, 20): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(720, 0, 20): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(20);
      logInfo(`new SubWindowDragModel(720, 0, 20): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0091 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0092
     * @tc.name      WindowManage_SubWindowDragModelCtor_0092
     * @tc.desc      new SubWindowDragModel(0, 1, 3) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0092 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 1, 3);
      logInfo(`new SubWindowDragModel(0, 1, 3): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 1, 3): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 1, 3): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(0, 1, 3): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(0, 1, 3): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 1, 3): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1);
      logInfo(`new SubWindowDragModel(0, 1, 3): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 1, 3): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(3);
      logInfo(`new SubWindowDragModel(0, 1, 3): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0092 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0093
     * @tc.name      WindowManage_SubWindowDragModelCtor_0093
     * @tc.desc      new SubWindowDragModel(360, 100, 25) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0093 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(360, 100, 25);
      logInfo(`new SubWindowDragModel(360, 100, 25): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(360, 100, 25): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(360, 100, 25): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(360, 100, 25): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(360, 100, 25): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`new SubWindowDragModel(360, 100, 25): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(100);
      logInfo(`new SubWindowDragModel(360, 100, 25): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(360, 100, 25): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(25);
      logInfo(`new SubWindowDragModel(360, 100, 25): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0093 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0094
     * @tc.name      WindowManage_SubWindowDragModelCtor_0094
     * @tc.desc      new SubWindowDragModel(3, -1, 10) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0094 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(3, -1, 10);
      logInfo(`new SubWindowDragModel(3, -1, 10): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(3, -1, 10): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(3, -1, 10): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(3, -1, 10): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(3, -1, 10): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(3);
      logInfo(`new SubWindowDragModel(3, -1, 10): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(-1);
      logInfo(`new SubWindowDragModel(3, -1, 10): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(3, -1, 10): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(10);
      logInfo(`new SubWindowDragModel(3, -1, 10): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0094 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0095
     * @tc.name      WindowManage_SubWindowDragModelCtor_0095
     * @tc.desc      new SubWindowDragModel(1080, 10, 25) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0095 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1080, 10, 25);
      logInfo(`new SubWindowDragModel(1080, 10, 25): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(1080, 10, 25): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(1080, 10, 25): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(1080, 10, 25): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(1080, 10, 25): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`new SubWindowDragModel(1080, 10, 25): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(10);
      logInfo(`new SubWindowDragModel(1080, 10, 25): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(1080, 10, 25): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(25);
      logInfo(`new SubWindowDragModel(1080, 10, 25): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0095 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0096
     * @tc.name      WindowManage_SubWindowDragModelCtor_0096
     * @tc.desc      new SubWindowDragModel(96, 1920, 15) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0096 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(96, 1920, 15);
      logInfo(`new SubWindowDragModel(96, 1920, 15): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(96, 1920, 15): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(96, 1920, 15): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(96, 1920, 15): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(96, 1920, 15): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(96);
      logInfo(`new SubWindowDragModel(96, 1920, 15): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1920);
      logInfo(`new SubWindowDragModel(96, 1920, 15): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(96, 1920, 15): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(15);
      logInfo(`new SubWindowDragModel(96, 1920, 15): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0096 end`);
    });
  });
}
