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
export default function subWindowDragModelCtorTest(): void {
  describe('SubWindowDragModelCtorTest', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0001
     * @tc.name      WindowManage_SubWindowDragModelCtor_0001
     * @tc.desc      new SubWindowDragModel(0, 0, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowManage_SubWindowDragModelCtor_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0001 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      logInfo(`new SubWindowDragModel(0, 0, 0): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 0): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 0): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(0, 0, 0): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(0, 0, 0): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 0): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 0): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 0): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 0): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0002
     * @tc.name      WindowManage_SubWindowDragModelCtor_0002
     * @tc.desc      new SubWindowDragModel(1, 0, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowManage_SubWindowDragModelCtor_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0002 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      logInfo(`new SubWindowDragModel(1, 0, 0): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(1, 0, 0): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(1, 0, 0): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(1, 0, 0): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(1, 0, 0): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1);
      logInfo(`new SubWindowDragModel(1, 0, 0): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(1, 0, 0): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(1, 0, 0): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(0);
      logInfo(`new SubWindowDragModel(1, 0, 0): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0003
     * @tc.name      WindowManage_SubWindowDragModelCtor_0003
     * @tc.desc      new SubWindowDragModel(100, 0, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0003 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      logInfo(`new SubWindowDragModel(100, 0, 0): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(100, 0, 0): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(100, 0, 0): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(100, 0, 0): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(100, 0, 0): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(100);
      logInfo(`new SubWindowDragModel(100, 0, 0): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(100, 0, 0): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(100, 0, 0): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(0);
      logInfo(`new SubWindowDragModel(100, 0, 0): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0004
     * @tc.name      WindowManage_SubWindowDragModelCtor_0004
     * @tc.desc      new SubWindowDragModel(360, 0, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0004 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(360, 0, 0);
      logInfo(`new SubWindowDragModel(360, 0, 0): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(360, 0, 0): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(360, 0, 0): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(360, 0, 0): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(360, 0, 0): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`new SubWindowDragModel(360, 0, 0): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(360, 0, 0): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(360, 0, 0): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(0);
      logInfo(`new SubWindowDragModel(360, 0, 0): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0005
     * @tc.name      WindowManage_SubWindowDragModelCtor_0005
     * @tc.desc      new SubWindowDragModel(720, 0, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0005 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(720, 0, 0);
      logInfo(`new SubWindowDragModel(720, 0, 0): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(720, 0, 0): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(720, 0, 0): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(720, 0, 0): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(720, 0, 0): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`new SubWindowDragModel(720, 0, 0): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(720, 0, 0): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(720, 0, 0): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(0);
      logInfo(`new SubWindowDragModel(720, 0, 0): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0006
     * @tc.name      WindowManage_SubWindowDragModelCtor_0006
     * @tc.desc      new SubWindowDragModel(1080, 0, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0006 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1080, 0, 0);
      logInfo(`new SubWindowDragModel(1080, 0, 0): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(1080, 0, 0): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(1080, 0, 0): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(1080, 0, 0): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(1080, 0, 0): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`new SubWindowDragModel(1080, 0, 0): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(1080, 0, 0): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(1080, 0, 0): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(0);
      logInfo(`new SubWindowDragModel(1080, 0, 0): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0007
     * @tc.name      WindowManage_SubWindowDragModelCtor_0007
     * @tc.desc      new SubWindowDragModel(1920, 0, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0007 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1920, 0, 0);
      logInfo(`new SubWindowDragModel(1920, 0, 0): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(1920, 0, 0): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(1920, 0, 0): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(1920, 0, 0): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(1920, 0, 0): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`new SubWindowDragModel(1920, 0, 0): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(1920, 0, 0): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(1920, 0, 0): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(0);
      logInfo(`new SubWindowDragModel(1920, 0, 0): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0007 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0008
     * @tc.name      WindowManage_SubWindowDragModelCtor_0008
     * @tc.desc      new SubWindowDragModel(-1, 0, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0008 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(-1, 0, 0);
      logInfo(`new SubWindowDragModel(-1, 0, 0): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(-1, 0, 0): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(-1, 0, 0): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(-1, 0, 0): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(-1, 0, 0): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`new SubWindowDragModel(-1, 0, 0): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(-1, 0, 0): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(-1, 0, 0): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(0);
      logInfo(`new SubWindowDragModel(-1, 0, 0): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0008 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0009
     * @tc.name      WindowManage_SubWindowDragModelCtor_0009
     * @tc.desc      new SubWindowDragModel(2, 0, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0009 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(2, 0, 0);
      logInfo(`new SubWindowDragModel(2, 0, 0): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(2, 0, 0): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(2, 0, 0): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(2, 0, 0): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(2, 0, 0): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(2);
      logInfo(`new SubWindowDragModel(2, 0, 0): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(2, 0, 0): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(2, 0, 0): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(0);
      logInfo(`new SubWindowDragModel(2, 0, 0): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0009 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0010
     * @tc.name      WindowManage_SubWindowDragModelCtor_0010
     * @tc.desc      new SubWindowDragModel(3, 0, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0010 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(3, 0, 0);
      logInfo(`new SubWindowDragModel(3, 0, 0): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(3, 0, 0): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(3, 0, 0): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(3, 0, 0): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(3, 0, 0): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(3);
      logInfo(`new SubWindowDragModel(3, 0, 0): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(3, 0, 0): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(3, 0, 0): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(0);
      logInfo(`new SubWindowDragModel(3, 0, 0): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0010 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0011
     * @tc.name      WindowManage_SubWindowDragModelCtor_0011
     * @tc.desc      new SubWindowDragModel(10, 0, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0011 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(10, 0, 0);
      logInfo(`new SubWindowDragModel(10, 0, 0): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(10, 0, 0): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(10, 0, 0): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(10, 0, 0): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(10, 0, 0): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(10);
      logInfo(`new SubWindowDragModel(10, 0, 0): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(10, 0, 0): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(10, 0, 0): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(0);
      logInfo(`new SubWindowDragModel(10, 0, 0): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0011 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0012
     * @tc.name      WindowManage_SubWindowDragModelCtor_0012
     * @tc.desc      new SubWindowDragModel(96, 0, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0012 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(96, 0, 0);
      logInfo(`new SubWindowDragModel(96, 0, 0): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(96, 0, 0): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(96, 0, 0): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(96, 0, 0): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(96, 0, 0): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(96);
      logInfo(`new SubWindowDragModel(96, 0, 0): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(96, 0, 0): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(96, 0, 0): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(0);
      logInfo(`new SubWindowDragModel(96, 0, 0): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0012 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0013
     * @tc.name      WindowManage_SubWindowDragModelCtor_0013
     * @tc.desc      new SubWindowDragModel(0, 1, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0013 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 1, 0);
      logInfo(`new SubWindowDragModel(0, 1, 0): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 1, 0): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 1, 0): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(0, 1, 0): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(0, 1, 0): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 1, 0): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1);
      logInfo(`new SubWindowDragModel(0, 1, 0): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 1, 0): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 1, 0): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0013 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0014
     * @tc.name      WindowManage_SubWindowDragModelCtor_0014
     * @tc.desc      new SubWindowDragModel(0, 100, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0014 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 100, 0);
      logInfo(`new SubWindowDragModel(0, 100, 0): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 100, 0): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 100, 0): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(0, 100, 0): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(0, 100, 0): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 100, 0): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(100);
      logInfo(`new SubWindowDragModel(0, 100, 0): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 100, 0): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 100, 0): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0014 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0015
     * @tc.name      WindowManage_SubWindowDragModelCtor_0015
     * @tc.desc      new SubWindowDragModel(0, 360, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0015 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 360, 0);
      logInfo(`new SubWindowDragModel(0, 360, 0): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 360, 0): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 360, 0): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(0, 360, 0): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(0, 360, 0): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 360, 0): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(360);
      logInfo(`new SubWindowDragModel(0, 360, 0): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 360, 0): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 360, 0): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0015 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0016
     * @tc.name      WindowManage_SubWindowDragModelCtor_0016
     * @tc.desc      new SubWindowDragModel(0, 720, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0016 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 720, 0);
      logInfo(`new SubWindowDragModel(0, 720, 0): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 720, 0): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 720, 0): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(0, 720, 0): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(0, 720, 0): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 720, 0): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(720);
      logInfo(`new SubWindowDragModel(0, 720, 0): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 720, 0): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 720, 0): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0016 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0017
     * @tc.name      WindowManage_SubWindowDragModelCtor_0017
     * @tc.desc      new SubWindowDragModel(0, 1080, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0017 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 1080, 0);
      logInfo(`new SubWindowDragModel(0, 1080, 0): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 1080, 0): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 1080, 0): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(0, 1080, 0): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(0, 1080, 0): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 1080, 0): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1080);
      logInfo(`new SubWindowDragModel(0, 1080, 0): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 1080, 0): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 1080, 0): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0017 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0018
     * @tc.name      WindowManage_SubWindowDragModelCtor_0018
     * @tc.desc      new SubWindowDragModel(0, 1920, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0018 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 1920, 0);
      logInfo(`new SubWindowDragModel(0, 1920, 0): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 1920, 0): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 1920, 0): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(0, 1920, 0): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(0, 1920, 0): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 1920, 0): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1920);
      logInfo(`new SubWindowDragModel(0, 1920, 0): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 1920, 0): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 1920, 0): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0018 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0019
     * @tc.name      WindowManage_SubWindowDragModelCtor_0019
     * @tc.desc      new SubWindowDragModel(0, -1, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0019 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, -1, 0);
      logInfo(`new SubWindowDragModel(0, -1, 0): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, -1, 0): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, -1, 0): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(0, -1, 0): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(0, -1, 0): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, -1, 0): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(-1);
      logInfo(`new SubWindowDragModel(0, -1, 0): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, -1, 0): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, -1, 0): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0019 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0020
     * @tc.name      WindowManage_SubWindowDragModelCtor_0020
     * @tc.desc      new SubWindowDragModel(0, 2, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0020 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 2, 0);
      logInfo(`new SubWindowDragModel(0, 2, 0): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 2, 0): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 2, 0): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(0, 2, 0): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(0, 2, 0): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 2, 0): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(2);
      logInfo(`new SubWindowDragModel(0, 2, 0): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 2, 0): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 2, 0): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0020 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0021
     * @tc.name      WindowManage_SubWindowDragModelCtor_0021
     * @tc.desc      new SubWindowDragModel(0, 3, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0021 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 3, 0);
      logInfo(`new SubWindowDragModel(0, 3, 0): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 3, 0): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 3, 0): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(0, 3, 0): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(0, 3, 0): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 3, 0): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(3);
      logInfo(`new SubWindowDragModel(0, 3, 0): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 3, 0): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 3, 0): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0021 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0022
     * @tc.name      WindowManage_SubWindowDragModelCtor_0022
     * @tc.desc      new SubWindowDragModel(0, 10, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0022 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 10, 0);
      logInfo(`new SubWindowDragModel(0, 10, 0): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 10, 0): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 10, 0): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(0, 10, 0): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(0, 10, 0): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 10, 0): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(10);
      logInfo(`new SubWindowDragModel(0, 10, 0): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 10, 0): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 10, 0): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0022 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0023
     * @tc.name      WindowManage_SubWindowDragModelCtor_0023
     * @tc.desc      new SubWindowDragModel(0, 96, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0023 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 96, 0);
      logInfo(`new SubWindowDragModel(0, 96, 0): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 96, 0): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 96, 0): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(0, 96, 0): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(0, 96, 0): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 96, 0): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(96);
      logInfo(`new SubWindowDragModel(0, 96, 0): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 96, 0): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 96, 0): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0023 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0024
     * @tc.name      WindowManage_SubWindowDragModelCtor_0024
     * @tc.desc      new SubWindowDragModel(0, 0, 1) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0024 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 1);
      logInfo(`new SubWindowDragModel(0, 0, 1): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 1): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 1): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(0, 0, 1): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(0, 0, 1): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 1): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 1): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 1): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(1);
      logInfo(`new SubWindowDragModel(0, 0, 1): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0024 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0025
     * @tc.name      WindowManage_SubWindowDragModelCtor_0025
     * @tc.desc      new SubWindowDragModel(0, 0, -1) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0025 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, -1);
      logInfo(`new SubWindowDragModel(0, 0, -1): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, -1): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, -1): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(0, 0, -1): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(0, 0, -1): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, -1): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, -1): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, -1): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(-1);
      logInfo(`new SubWindowDragModel(0, 0, -1): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0025 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0026
     * @tc.name      WindowManage_SubWindowDragModelCtor_0026
     * @tc.desc      new SubWindowDragModel(0, 0, 2) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0026 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 2);
      logInfo(`new SubWindowDragModel(0, 0, 2): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 2): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 2): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(0, 0, 2): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(0, 0, 2): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 2): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 2): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 2): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(2);
      logInfo(`new SubWindowDragModel(0, 0, 2): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0026 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0027
     * @tc.name      WindowManage_SubWindowDragModelCtor_0027
     * @tc.desc      new SubWindowDragModel(0, 0, 3) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0027 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 3);
      logInfo(`new SubWindowDragModel(0, 0, 3): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 3): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 3): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(0, 0, 3): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(0, 0, 3): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 3): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 3): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 3): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(3);
      logInfo(`new SubWindowDragModel(0, 0, 3): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0027 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0028
     * @tc.name      WindowManage_SubWindowDragModelCtor_0028
     * @tc.desc      new SubWindowDragModel(0, 0, 10) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0028 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 10);
      logInfo(`new SubWindowDragModel(0, 0, 10): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 10): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 10): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(0, 0, 10): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(0, 0, 10): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 10): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 10): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 10): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(10);
      logInfo(`new SubWindowDragModel(0, 0, 10): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0028 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0029
     * @tc.name      WindowManage_SubWindowDragModelCtor_0029
     * @tc.desc      new SubWindowDragModel(0, 0, 100) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0029 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 100);
      logInfo(`new SubWindowDragModel(0, 0, 100): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 100): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 100): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(0, 0, 100): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(0, 0, 100): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 100): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 100): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 100): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(100);
      logInfo(`new SubWindowDragModel(0, 0, 100): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0029 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0030
     * @tc.name      WindowManage_SubWindowDragModelCtor_0030
     * @tc.desc      new SubWindowDragModel(0, 0, 5) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0030 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 5);
      logInfo(`new SubWindowDragModel(0, 0, 5): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 5): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 5): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(0, 0, 5): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(0, 0, 5): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 5): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 5): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 5): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(5);
      logInfo(`new SubWindowDragModel(0, 0, 5): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0030 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0031
     * @tc.name      WindowManage_SubWindowDragModelCtor_0031
     * @tc.desc      new SubWindowDragModel(0, 0, 15) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0031 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 15);
      logInfo(`new SubWindowDragModel(0, 0, 15): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 15): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 15): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(0, 0, 15): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(0, 0, 15): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 15): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 15): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 15): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(15);
      logInfo(`new SubWindowDragModel(0, 0, 15): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0031 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0032
     * @tc.name      WindowManage_SubWindowDragModelCtor_0032
     * @tc.desc      new SubWindowDragModel(0, 0, 20) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0032 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 20);
      logInfo(`new SubWindowDragModel(0, 0, 20): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 20): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 20): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(0, 0, 20): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(0, 0, 20): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 20): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 20): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 20): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(20);
      logInfo(`new SubWindowDragModel(0, 0, 20): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0032 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0033
     * @tc.name      WindowManage_SubWindowDragModelCtor_0033
     * @tc.desc      new SubWindowDragModel(0, 0, 25) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0033 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 25);
      logInfo(`new SubWindowDragModel(0, 0, 25): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 25): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 25): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(0, 0, 25): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(0, 0, 25): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 25): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 25): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 25): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(25);
      logInfo(`new SubWindowDragModel(0, 0, 25): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0033 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0034
     * @tc.name      WindowManage_SubWindowDragModelCtor_0034
     * @tc.desc      new SubWindowDragModel(0, 0, 8.5) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0034 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 8.5);
      logInfo(`new SubWindowDragModel(0, 0, 8.5): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 8.5): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 8.5): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(0, 0, 8.5): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(0, 0, 8.5): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 8.5): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 8.5): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(0, 0, 8.5): subject.density=${subject.density}`);
      expect(subject.density).assertClose(8.5, PRECISION);
      logInfo(`new SubWindowDragModel(0, 0, 8.5): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0034 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0035
     * @tc.name      WindowManage_SubWindowDragModelCtor_0035
     * @tc.desc      new SubWindowDragModel(1920, 720, 20) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0035 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1920, 720, 20);
      logInfo(`new SubWindowDragModel(1920, 720, 20): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(1920, 720, 20): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(1920, 720, 20): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(1920, 720, 20): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(1920, 720, 20): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`new SubWindowDragModel(1920, 720, 20): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(720);
      logInfo(`new SubWindowDragModel(1920, 720, 20): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(1920, 720, 20): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(20);
      logInfo(`new SubWindowDragModel(1920, 720, 20): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0035 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0036
     * @tc.name      WindowManage_SubWindowDragModelCtor_0036
     * @tc.desc      new SubWindowDragModel(-1, 96, 8.5) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0036 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(-1, 96, 8.5);
      logInfo(`new SubWindowDragModel(-1, 96, 8.5): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(-1, 96, 8.5): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(-1, 96, 8.5): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(-1, 96, 8.5): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(-1, 96, 8.5): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`new SubWindowDragModel(-1, 96, 8.5): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(96);
      logInfo(`new SubWindowDragModel(-1, 96, 8.5): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(-1, 96, 8.5): subject.density=${subject.density}`);
      expect(subject.density).assertClose(8.5, PRECISION);
      logInfo(`new SubWindowDragModel(-1, 96, 8.5): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0036 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0037
     * @tc.name      WindowManage_SubWindowDragModelCtor_0037
     * @tc.desc      new SubWindowDragModel(720, 100, 10) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0037 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(720, 100, 10);
      logInfo(`new SubWindowDragModel(720, 100, 10): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(720, 100, 10): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(720, 100, 10): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(720, 100, 10): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(720, 100, 10): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`new SubWindowDragModel(720, 100, 10): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(100);
      logInfo(`new SubWindowDragModel(720, 100, 10): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(720, 100, 10): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(10);
      logInfo(`new SubWindowDragModel(720, 100, 10): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0037 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0038
     * @tc.name      WindowManage_SubWindowDragModelCtor_0038
     * @tc.desc      new SubWindowDragModel(96, 0, 25) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0038 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(96, 0, 25);
      logInfo(`new SubWindowDragModel(96, 0, 25): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(96, 0, 25): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(96, 0, 25): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(96, 0, 25): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(96, 0, 25): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(96);
      logInfo(`new SubWindowDragModel(96, 0, 25): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(96, 0, 25): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(96, 0, 25): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(25);
      logInfo(`new SubWindowDragModel(96, 0, 25): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0038 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0039
     * @tc.name      WindowManage_SubWindowDragModelCtor_0039
     * @tc.desc      new SubWindowDragModel(360, 360, 5) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0039 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(360, 360, 5);
      logInfo(`new SubWindowDragModel(360, 360, 5): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(360, 360, 5): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(360, 360, 5): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(360, 360, 5): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(360, 360, 5): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`new SubWindowDragModel(360, 360, 5): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(360);
      logInfo(`new SubWindowDragModel(360, 360, 5): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(360, 360, 5): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(5);
      logInfo(`new SubWindowDragModel(360, 360, 5): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0039 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0040
     * @tc.name      WindowManage_SubWindowDragModelCtor_0040
     * @tc.desc      new SubWindowDragModel(1, 2, 25) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0040 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 2, 25);
      logInfo(`new SubWindowDragModel(1, 2, 25): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(1, 2, 25): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(1, 2, 25): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(1, 2, 25): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(1, 2, 25): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1);
      logInfo(`new SubWindowDragModel(1, 2, 25): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(2);
      logInfo(`new SubWindowDragModel(1, 2, 25): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(1, 2, 25): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(25);
      logInfo(`new SubWindowDragModel(1, 2, 25): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0040 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0041
     * @tc.name      WindowManage_SubWindowDragModelCtor_0041
     * @tc.desc      new SubWindowDragModel(-1, 3, -1) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0041 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(-1, 3, -1);
      logInfo(`new SubWindowDragModel(-1, 3, -1): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(-1, 3, -1): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(-1, 3, -1): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(-1, 3, -1): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(-1, 3, -1): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(-1);
      logInfo(`new SubWindowDragModel(-1, 3, -1): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(3);
      logInfo(`new SubWindowDragModel(-1, 3, -1): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(-1, 3, -1): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(-1);
      logInfo(`new SubWindowDragModel(-1, 3, -1): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0041 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0042
     * @tc.name      WindowManage_SubWindowDragModelCtor_0042
     * @tc.desc      new SubWindowDragModel(1080, 2, 3) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0042 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1080, 2, 3);
      logInfo(`new SubWindowDragModel(1080, 2, 3): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(1080, 2, 3): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(1080, 2, 3): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(1080, 2, 3): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(1080, 2, 3): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1080);
      logInfo(`new SubWindowDragModel(1080, 2, 3): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(2);
      logInfo(`new SubWindowDragModel(1080, 2, 3): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(1080, 2, 3): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(3);
      logInfo(`new SubWindowDragModel(1080, 2, 3): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0042 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0043
     * @tc.name      WindowManage_SubWindowDragModelCtor_0043
     * @tc.desc      new SubWindowDragModel(1920, 1080, 0) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0043 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1920, 1080, 0);
      logInfo(`new SubWindowDragModel(1920, 1080, 0): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(1920, 1080, 0): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(1920, 1080, 0): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(1920, 1080, 0): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(1920, 1080, 0): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`new SubWindowDragModel(1920, 1080, 0): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1080);
      logInfo(`new SubWindowDragModel(1920, 1080, 0): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(1920, 1080, 0): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(0);
      logInfo(`new SubWindowDragModel(1920, 1080, 0): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0043 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0044
     * @tc.name      WindowManage_SubWindowDragModelCtor_0044
     * @tc.desc      new SubWindowDragModel(360, 0, 2) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0044 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(360, 0, 2);
      logInfo(`new SubWindowDragModel(360, 0, 2): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(360, 0, 2): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(360, 0, 2): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(360, 0, 2): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(360, 0, 2): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(360);
      logInfo(`new SubWindowDragModel(360, 0, 2): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(360, 0, 2): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(360, 0, 2): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(2);
      logInfo(`new SubWindowDragModel(360, 0, 2): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0044 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0045
     * @tc.name      WindowManage_SubWindowDragModelCtor_0045
     * @tc.desc      new SubWindowDragModel(1920, 96, 2) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0045 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1920, 96, 2);
      logInfo(`new SubWindowDragModel(1920, 96, 2): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(1920, 96, 2): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(1920, 96, 2): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(1920, 96, 2): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(1920, 96, 2): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1920);
      logInfo(`new SubWindowDragModel(1920, 96, 2): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(96);
      logInfo(`new SubWindowDragModel(1920, 96, 2): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(1920, 96, 2): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(2);
      logInfo(`new SubWindowDragModel(1920, 96, 2): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0045 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0046
     * @tc.name      WindowManage_SubWindowDragModelCtor_0046
     * @tc.desc      new SubWindowDragModel(10, 3, 5) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0046 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(10, 3, 5);
      logInfo(`new SubWindowDragModel(10, 3, 5): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(10, 3, 5): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(10, 3, 5): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(10, 3, 5): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(10, 3, 5): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(10);
      logInfo(`new SubWindowDragModel(10, 3, 5): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(3);
      logInfo(`new SubWindowDragModel(10, 3, 5): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(10, 3, 5): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(5);
      logInfo(`new SubWindowDragModel(10, 3, 5): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0046 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0047
     * @tc.name      WindowManage_SubWindowDragModelCtor_0047
     * @tc.desc      new SubWindowDragModel(720, 1920, 15) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0047 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(720, 1920, 15);
      logInfo(`new SubWindowDragModel(720, 1920, 15): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(720, 1920, 15): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(720, 1920, 15): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(720, 1920, 15): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(720, 1920, 15): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(720);
      logInfo(`new SubWindowDragModel(720, 1920, 15): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(1920);
      logInfo(`new SubWindowDragModel(720, 1920, 15): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(720, 1920, 15): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(15);
      logInfo(`new SubWindowDragModel(720, 1920, 15): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0047 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_CTOR_0048
     * @tc.name      WindowManage_SubWindowDragModelCtor_0048
     * @tc.desc      new SubWindowDragModel(1, 720, 10) initialises 9 public members
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelCtor_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0048 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 720, 10);
      logInfo(`new SubWindowDragModel(1, 720, 10): subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(0);
      logInfo(`new SubWindowDragModel(1, 720, 10): subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(0);
      logInfo(`new SubWindowDragModel(1, 720, 10): subject.endX=${subject.endX}`);
      expect(subject.endX).assertEqual(10);
      logInfo(`new SubWindowDragModel(1, 720, 10): subject.endY=${subject.endY}`);
      expect(subject.endY).assertEqual(500);
      logInfo(`new SubWindowDragModel(1, 720, 10): subject.windowWidth=${subject.windowWidth}`);
      expect(subject.windowWidth).assertEqual(1);
      logInfo(`new SubWindowDragModel(1, 720, 10): subject.windowHeight=${subject.windowHeight}`);
      expect(subject.windowHeight).assertEqual(720);
      logInfo(`new SubWindowDragModel(1, 720, 10): subject.topHeight=${subject.topHeight}`);
      expect(subject.topHeight).assertEqual(0);
      logInfo(`new SubWindowDragModel(1, 720, 10): subject.density=${subject.density}`);
      expect(subject.density).assertEqual(10);
      logInfo(`new SubWindowDragModel(1, 720, 10): subject.moves=${subject.moves}`);
      expect(subject.moves).assertEqual(0);
      logInfo(`${BUNDLE}SubWindowDragModelCtor_0048 end`);
    });
  });
}
