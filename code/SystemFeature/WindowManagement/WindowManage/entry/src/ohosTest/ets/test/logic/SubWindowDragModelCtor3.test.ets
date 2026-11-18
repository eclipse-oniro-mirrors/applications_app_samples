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

/** Logic checks for new SubWindowDragModel (17 cases). */
export default function subWindowDragModelCtor3Test(): void {
  describe('SubWindowDragModelCtor3Test', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0097
     * @tc.name      WindowManage_SubWindowDragModelCtor_0097
     * @tc.desc      new SubWindowDragModel(360, -1, 10) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0097 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(360, -1, 10);
      logInfo(`new SubWindowDragModel(360, -1, 10): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(360, -1, 10): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(360, -1, 10): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(360, -1, 10): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(360, -1, 10): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`new SubWindowDragModel(360, -1, 10): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(-1);
      logInfo(`new SubWindowDragModel(360, -1, 10): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(360, -1, 10): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(10);
      logInfo(`new SubWindowDragModel(360, -1, 10): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0097 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0098
     * @tc.name      WindowManage_SubWindowDragModelCtor_0098
     * @tc.desc      new SubWindowDragModel(0, 1080, 25) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0098 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 1080, 25);
      logInfo(`new SubWindowDragModel(0, 1080, 25): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 1080, 25): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 1080, 25): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(0, 1080, 25): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(0, 1080, 25): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 1080, 25): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1080);
      logInfo(`new SubWindowDragModel(0, 1080, 25): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 1080, 25): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(25);
      logInfo(`new SubWindowDragModel(0, 1080, 25): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0098 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0099
     * @tc.name      WindowManage_SubWindowDragModelCtor_0099
     * @tc.desc      new SubWindowDragModel(96, 100, 1) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0099 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(96, 100, 1);
      logInfo(`new SubWindowDragModel(96, 100, 1): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(96, 100, 1): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(96, 100, 1): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(96, 100, 1): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(96, 100, 1): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(96);
      logInfo(`new SubWindowDragModel(96, 100, 1): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(100);
      logInfo(`new SubWindowDragModel(96, 100, 1): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(96, 100, 1): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(1);
      logInfo(`new SubWindowDragModel(96, 100, 1): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0099 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0100
     * @tc.name      WindowManage_SubWindowDragModelCtor_0100
     * @tc.desc      new SubWindowDragModel(3, -1, 25) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0100 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(3, -1, 25);
      logInfo(`new SubWindowDragModel(3, -1, 25): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(3, -1, 25): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(3, -1, 25): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(3, -1, 25): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(3, -1, 25): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(3);
      logInfo(`new SubWindowDragModel(3, -1, 25): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(-1);
      logInfo(`new SubWindowDragModel(3, -1, 25): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(3, -1, 25): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(25);
      logInfo(`new SubWindowDragModel(3, -1, 25): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0100 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0101
     * @tc.name      WindowManage_SubWindowDragModelCtor_0101
     * @tc.desc      new SubWindowDragModel(720, 10, 20) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0101 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(720, 10, 20);
      logInfo(`new SubWindowDragModel(720, 10, 20): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(720, 10, 20): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(720, 10, 20): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(720, 10, 20): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(720, 10, 20): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`new SubWindowDragModel(720, 10, 20): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(10);
      logInfo(`new SubWindowDragModel(720, 10, 20): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(720, 10, 20): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(20);
      logInfo(`new SubWindowDragModel(720, 10, 20): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0101 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0102
     * @tc.name      WindowManage_SubWindowDragModelCtor_0102
     * @tc.desc      new SubWindowDragModel(100, 3, -1) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0102 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 3, -1);
      logInfo(`new SubWindowDragModel(100, 3, -1): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(100, 3, -1): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(100, 3, -1): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(100, 3, -1): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(100, 3, -1): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(100);
      logInfo(`new SubWindowDragModel(100, 3, -1): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(3);
      logInfo(`new SubWindowDragModel(100, 3, -1): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(100, 3, -1): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(-1);
      logInfo(`new SubWindowDragModel(100, 3, -1): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0102 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0103
     * @tc.name      WindowManage_SubWindowDragModelCtor_0103
     * @tc.desc      new SubWindowDragModel(96, 3, 5) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0103 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(96, 3, 5);
      logInfo(`new SubWindowDragModel(96, 3, 5): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(96, 3, 5): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(96, 3, 5): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(96, 3, 5): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(96, 3, 5): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(96);
      logInfo(`new SubWindowDragModel(96, 3, 5): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(3);
      logInfo(`new SubWindowDragModel(96, 3, 5): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(96, 3, 5): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(5);
      logInfo(`new SubWindowDragModel(96, 3, 5): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0103 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0104
     * @tc.name      WindowManage_SubWindowDragModelCtor_0104
     * @tc.desc      new SubWindowDragModel(10, 3, 20) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0104 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(10, 3, 20);
      logInfo(`new SubWindowDragModel(10, 3, 20): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(10, 3, 20): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(10, 3, 20): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(10, 3, 20): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(10, 3, 20): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(10);
      logInfo(`new SubWindowDragModel(10, 3, 20): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(3);
      logInfo(`new SubWindowDragModel(10, 3, 20): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(10, 3, 20): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(20);
      logInfo(`new SubWindowDragModel(10, 3, 20): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0104 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0105
     * @tc.name      WindowManage_SubWindowDragModelCtor_0105
     * @tc.desc      new SubWindowDragModel(96, -1, 1) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0105 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(96, -1, 1);
      logInfo(`new SubWindowDragModel(96, -1, 1): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(96, -1, 1): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(96, -1, 1): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(96, -1, 1): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(96, -1, 1): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(96);
      logInfo(`new SubWindowDragModel(96, -1, 1): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(-1);
      logInfo(`new SubWindowDragModel(96, -1, 1): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(96, -1, 1): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(1);
      logInfo(`new SubWindowDragModel(96, -1, 1): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0105 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0106
     * @tc.name      WindowManage_SubWindowDragModelCtor_0106
     * @tc.desc      new SubWindowDragModel(100, 1, -1) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0106 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 1, -1);
      logInfo(`new SubWindowDragModel(100, 1, -1): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(100, 1, -1): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(100, 1, -1): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(100, 1, -1): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(100, 1, -1): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(100);
      logInfo(`new SubWindowDragModel(100, 1, -1): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1);
      logInfo(`new SubWindowDragModel(100, 1, -1): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(100, 1, -1): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(-1);
      logInfo(`new SubWindowDragModel(100, 1, -1): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0106 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0107
     * @tc.name      WindowManage_SubWindowDragModelCtor_0107
     * @tc.desc      new SubWindowDragModel(720, 1920, 8.5) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0107 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(720, 1920, 8.5);
      logInfo(`new SubWindowDragModel(720, 1920, 8.5): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(720, 1920, 8.5): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(720, 1920, 8.5): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(720, 1920, 8.5): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(720, 1920, 8.5): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`new SubWindowDragModel(720, 1920, 8.5): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1920);
      logInfo(`new SubWindowDragModel(720, 1920, 8.5): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(720, 1920, 8.5): subject.density=${subject.density}`);
      expect(subject.density).assertClose(8.5, PRECISION);
      logInfo(`new SubWindowDragModel(720, 1920, 8.5): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0107 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0108
     * @tc.name      WindowManage_SubWindowDragModelCtor_0108
     * @tc.desc      new SubWindowDragModel(1080, 2, 100) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0108 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1080, 2, 100);
      logInfo(`new SubWindowDragModel(1080, 2, 100): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(1080, 2, 100): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(1080, 2, 100): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(1080, 2, 100): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(1080, 2, 100): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`new SubWindowDragModel(1080, 2, 100): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(2);
      logInfo(`new SubWindowDragModel(1080, 2, 100): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(1080, 2, 100): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(100);
      logInfo(`new SubWindowDragModel(1080, 2, 100): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0108 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0109
     * @tc.name      WindowManage_SubWindowDragModelCtor_0109
     * @tc.desc      new SubWindowDragModel(96, 100, 10) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0109 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(96, 100, 10);
      logInfo(`new SubWindowDragModel(96, 100, 10): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(96, 100, 10): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(96, 100, 10): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(96, 100, 10): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(96, 100, 10): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(96);
      logInfo(`new SubWindowDragModel(96, 100, 10): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(100);
      logInfo(`new SubWindowDragModel(96, 100, 10): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(96, 100, 10): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(10);
      logInfo(`new SubWindowDragModel(96, 100, 10): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0109 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0110
     * @tc.name      WindowManage_SubWindowDragModelCtor_0110
     * @tc.desc      new SubWindowDragModel(0, 96, 8.5) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0110 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 96, 8.5);
      logInfo(`new SubWindowDragModel(0, 96, 8.5): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 96, 8.5): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 96, 8.5): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(0, 96, 8.5): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(0, 96, 8.5): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 96, 8.5): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(96);
      logInfo(`new SubWindowDragModel(0, 96, 8.5): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 96, 8.5): subject.density=${subject.density}`);
      expect(subject.density).assertClose(8.5, PRECISION);
      logInfo(`new SubWindowDragModel(0, 96, 8.5): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0110 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0111
     * @tc.name      WindowManage_SubWindowDragModelCtor_0111
     * @tc.desc      new SubWindowDragModel(100, 1080, 3) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0111 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 1080, 3);
      logInfo(`new SubWindowDragModel(100, 1080, 3): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(100, 1080, 3): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(100, 1080, 3): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(100, 1080, 3): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(100, 1080, 3): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(100);
      logInfo(`new SubWindowDragModel(100, 1080, 3): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1080);
      logInfo(`new SubWindowDragModel(100, 1080, 3): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(100, 1080, 3): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(3);
      logInfo(`new SubWindowDragModel(100, 1080, 3): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0111 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0112
     * @tc.name      WindowManage_SubWindowDragModelCtor_0112
     * @tc.desc      new SubWindowDragModel(1, 1, 5) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0112 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 1, 5);
      logInfo(`new SubWindowDragModel(1, 1, 5): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(1, 1, 5): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(1, 1, 5): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(1, 1, 5): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(1, 1, 5): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1);
      logInfo(`new SubWindowDragModel(1, 1, 5): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1);
      logInfo(`new SubWindowDragModel(1, 1, 5): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(1, 1, 5): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(5);
      logInfo(`new SubWindowDragModel(1, 1, 5): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0112 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0113
     * @tc.name      WindowManage_SubWindowDragModelCtor_0113
     * @tc.desc      new SubWindowDragModel(2, 10, 1) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0113 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(2, 10, 1);
      logInfo(`new SubWindowDragModel(2, 10, 1): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(2, 10, 1): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(2, 10, 1): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(2, 10, 1): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(2, 10, 1): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(2);
      logInfo(`new SubWindowDragModel(2, 10, 1): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(10);
      logInfo(`new SubWindowDragModel(2, 10, 1): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(2, 10, 1): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(1);
      logInfo(`new SubWindowDragModel(2, 10, 1): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0113 end`);
    });
  });
}
