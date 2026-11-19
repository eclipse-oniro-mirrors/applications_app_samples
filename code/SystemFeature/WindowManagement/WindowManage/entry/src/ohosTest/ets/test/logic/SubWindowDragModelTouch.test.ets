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

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for SubWindowDragModel.touch (74 cases). */
export default function subWindowDragModelTouchTest(): void {
  describe('SubWindowDragModelTouchTest', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0001
     * @tc.name      WindowManage_SubWindowDragModelTouch_0001
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=-100, touchType=0) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowManage_SubWindowDragModelTouch_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0001 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(-100, -100, 0);
      logInfo(`touch(x=-100, y=-100, touchType=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=-100, touchType=0) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch(x=-100, y=-100, touchType=0) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0002
     * @tc.name      WindowManage_SubWindowDragModelTouch_0002
     * @tc.desc      SubWindowDragModel.touch(x=-1, y=-100, touchType=0) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowManage_SubWindowDragModelTouch_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0002 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(-1, -100, 0);
      logInfo(`touch(x=-1, y=-100, touchType=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-1, y=-100, touchType=0) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-1);
      logInfo(`touch(x=-1, y=-100, touchType=0) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0003
     * @tc.name      WindowManage_SubWindowDragModelTouch_0003
     * @tc.desc      SubWindowDragModel.touch(x=0, y=-100, touchType=0) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0003 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(0, -100, 0);
      logInfo(`touch(x=0, y=-100, touchType=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=0, y=-100, touchType=0) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0004
     * @tc.name      WindowManage_SubWindowDragModelTouch_0004
     * @tc.desc      SubWindowDragModel.touch(x=1, y=-100, touchType=0) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0004 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(1, -100, 0);
      logInfo(`touch(x=1, y=-100, touchType=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=1, y=-100, touchType=0) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`touch(x=1, y=-100, touchType=0) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0005
     * @tc.name      WindowManage_SubWindowDragModelTouch_0005
     * @tc.desc      SubWindowDragModel.touch(x=50, y=-100, touchType=0) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0005 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(50, -100, 0);
      logInfo(`touch(x=50, y=-100, touchType=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=50, y=-100, touchType=0) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(50);
      logInfo(`touch(x=50, y=-100, touchType=0) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0006
     * @tc.name      WindowManage_SubWindowDragModelTouch_0006
     * @tc.desc      SubWindowDragModel.touch(x=100, y=-100, touchType=0) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0006 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(100, -100, 0);
      logInfo(`touch(x=100, y=-100, touchType=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=100, y=-100, touchType=0) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(100);
      logInfo(`touch(x=100, y=-100, touchType=0) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0007
     * @tc.name      WindowManage_SubWindowDragModelTouch_0007
     * @tc.desc      SubWindowDragModel.touch(x=2, y=-100, touchType=0) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0007 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(2, -100, 0);
      logInfo(`touch(x=2, y=-100, touchType=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=2, y=-100, touchType=0) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(2);
      logInfo(`touch(x=2, y=-100, touchType=0) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0007 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0008
     * @tc.name      WindowManage_SubWindowDragModelTouch_0008
     * @tc.desc      SubWindowDragModel.touch(x=3, y=-100, touchType=0) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0008 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(3, -100, 0);
      logInfo(`touch(x=3, y=-100, touchType=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=3, y=-100, touchType=0) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(3);
      logInfo(`touch(x=3, y=-100, touchType=0) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0008 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0009
     * @tc.name      WindowManage_SubWindowDragModelTouch_0009
     * @tc.desc      SubWindowDragModel.touch(x=10, y=-100, touchType=0) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0009 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(10, -100, 0);
      logInfo(`touch(x=10, y=-100, touchType=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=10, y=-100, touchType=0) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(10);
      logInfo(`touch(x=10, y=-100, touchType=0) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0009 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0010
     * @tc.name      WindowManage_SubWindowDragModelTouch_0010
     * @tc.desc      SubWindowDragModel.touch(x=5, y=-100, touchType=0) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0010 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(5, -100, 0);
      logInfo(`touch(x=5, y=-100, touchType=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=5, y=-100, touchType=0) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(5);
      logInfo(`touch(x=5, y=-100, touchType=0) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0010 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0011
     * @tc.name      WindowManage_SubWindowDragModelTouch_0011
     * @tc.desc      SubWindowDragModel.touch(x=15, y=-100, touchType=0) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0011 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(15, -100, 0);
      logInfo(`touch(x=15, y=-100, touchType=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=15, y=-100, touchType=0) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(15);
      logInfo(`touch(x=15, y=-100, touchType=0) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0011 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0012
     * @tc.name      WindowManage_SubWindowDragModelTouch_0012
     * @tc.desc      SubWindowDragModel.touch(x=196, y=-100, touchType=0) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0012 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(196, -100, 0);
      logInfo(`touch(x=196, y=-100, touchType=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=196, y=-100, touchType=0) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(196);
      logInfo(`touch(x=196, y=-100, touchType=0) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0012 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0013
     * @tc.name      WindowManage_SubWindowDragModelTouch_0013
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=-1, touchType=0) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0013 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(-100, -1, 0);
      logInfo(`touch(x=-100, y=-1, touchType=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=-1, touchType=0) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch(x=-100, y=-1, touchType=0) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0013 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0014
     * @tc.name      WindowManage_SubWindowDragModelTouch_0014
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=0, touchType=0) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0014 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(-100, 0, 0);
      logInfo(`touch(x=-100, y=0, touchType=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=0, touchType=0) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0014 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0015
     * @tc.name      WindowManage_SubWindowDragModelTouch_0015
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=1, touchType=0) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0015 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(-100, 1, 0);
      logInfo(`touch(x=-100, y=1, touchType=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=1, touchType=0) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch(x=-100, y=1, touchType=0) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0015 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0016
     * @tc.name      WindowManage_SubWindowDragModelTouch_0016
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=50, touchType=0) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0016 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(-100, 50, 0);
      logInfo(`touch(x=-100, y=50, touchType=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=50, touchType=0) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch(x=-100, y=50, touchType=0) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(50);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0016 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0017
     * @tc.name      WindowManage_SubWindowDragModelTouch_0017
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=100, touchType=0) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0017 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(-100, 100, 0);
      logInfo(`touch(x=-100, y=100, touchType=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=100, touchType=0) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch(x=-100, y=100, touchType=0) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0017 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0018
     * @tc.name      WindowManage_SubWindowDragModelTouch_0018
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=2, touchType=0) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0018 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(-100, 2, 0);
      logInfo(`touch(x=-100, y=2, touchType=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=2, touchType=0) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch(x=-100, y=2, touchType=0) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(2);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0018 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0019
     * @tc.name      WindowManage_SubWindowDragModelTouch_0019
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=3, touchType=0) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0019 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(-100, 3, 0);
      logInfo(`touch(x=-100, y=3, touchType=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=3, touchType=0) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch(x=-100, y=3, touchType=0) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(3);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0019 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0020
     * @tc.name      WindowManage_SubWindowDragModelTouch_0020
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=10, touchType=0) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0020 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(-100, 10, 0);
      logInfo(`touch(x=-100, y=10, touchType=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=10, touchType=0) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch(x=-100, y=10, touchType=0) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0020 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0021
     * @tc.name      WindowManage_SubWindowDragModelTouch_0021
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=5, touchType=0) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0021 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(-100, 5, 0);
      logInfo(`touch(x=-100, y=5, touchType=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=5, touchType=0) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch(x=-100, y=5, touchType=0) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(5);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0021 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0022
     * @tc.name      WindowManage_SubWindowDragModelTouch_0022
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=15, touchType=0) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0022 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(-100, 15, 0);
      logInfo(`touch(x=-100, y=15, touchType=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=15, touchType=0) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch(x=-100, y=15, touchType=0) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(15);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0022 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0023
     * @tc.name      WindowManage_SubWindowDragModelTouch_0023
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=97, touchType=0) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0023 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(-100, 97, 0);
      logInfo(`touch(x=-100, y=97, touchType=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=97, touchType=0) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch(x=-100, y=97, touchType=0) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(97);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0023 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0024
     * @tc.name      WindowManage_SubWindowDragModelTouch_0024
     * @tc.desc      SubWindowDragModel.touch(x=1, y=10, touchType=-1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0024 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(1, 10, -1);
      logInfo(`touch(x=1, y=10, touchType=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=1, y=10, touchType=-1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`touch(x=1, y=10, touchType=-1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0024 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0025
     * @tc.name      WindowManage_SubWindowDragModelTouch_0025
     * @tc.desc      SubWindowDragModel.touch(x=1, y=50, touchType=-8) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0025 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(1, 50, -8);
      logInfo(`touch(x=1, y=50, touchType=-8): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=1, y=50, touchType=-8) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`touch(x=1, y=50, touchType=-8) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(50);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0025 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0026
     * @tc.name      WindowManage_SubWindowDragModelTouch_0026
     * @tc.desc      SubWindowDragModel.touch(x=196, y=50, touchType=2) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0026 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(196, 50, 2);
      logInfo(`touch(x=196, y=50, touchType=2): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=196, y=50, touchType=2) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(196);
      logInfo(`touch(x=196, y=50, touchType=2) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(50);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0026 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0027
     * @tc.name      WindowManage_SubWindowDragModelTouch_0027
     * @tc.desc      SubWindowDragModel.touch(x=3, y=5, touchType=1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0027 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(3, 5, 1);
      logInfo(`touch(x=3, y=5, touchType=1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=3, y=5, touchType=1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(3);
      logInfo(`touch(x=3, y=5, touchType=1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(5);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0027 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0028
     * @tc.name      WindowManage_SubWindowDragModelTouch_0028
     * @tc.desc      SubWindowDragModel.touch(x=3, y=2, touchType=-8) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0028 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(3, 2, -8);
      logInfo(`touch(x=3, y=2, touchType=-8): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=3, y=2, touchType=-8) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(3);
      logInfo(`touch(x=3, y=2, touchType=-8) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(2);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0028 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0029
     * @tc.name      WindowManage_SubWindowDragModelTouch_0029
     * @tc.desc      SubWindowDragModel.touch(x=50, y=5, touchType=-8) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0029 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(50, 5, -8);
      logInfo(`touch(x=50, y=5, touchType=-8): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=50, y=5, touchType=-8) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(50);
      logInfo(`touch(x=50, y=5, touchType=-8) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(5);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0029 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0030
     * @tc.name      WindowManage_SubWindowDragModelTouch_0030
     * @tc.desc      SubWindowDragModel.touch(x=5, y=3, touchType=2) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0030 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(5, 3, 2);
      logInfo(`touch(x=5, y=3, touchType=2): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=5, y=3, touchType=2) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(5);
      logInfo(`touch(x=5, y=3, touchType=2) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(3);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0030 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0031
     * @tc.name      WindowManage_SubWindowDragModelTouch_0031
     * @tc.desc      SubWindowDragModel.touch(x=15, y=-1, touchType=-8) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0031 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(15, -1, -8);
      logInfo(`touch(x=15, y=-1, touchType=-8): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=15, y=-1, touchType=-8) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(15);
      logInfo(`touch(x=15, y=-1, touchType=-8) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0031 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0032
     * @tc.name      WindowManage_SubWindowDragModelTouch_0032
     * @tc.desc      SubWindowDragModel.touch(x=2, y=2, touchType=5) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0032 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(2, 2, 5);
      logInfo(`touch(x=2, y=2, touchType=5): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=2, y=2, touchType=5) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(2);
      logInfo(`touch(x=2, y=2, touchType=5) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(2);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0032 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0033
     * @tc.name      WindowManage_SubWindowDragModelTouch_0033
     * @tc.desc      SubWindowDragModel.touch(x=196, y=-1, touchType=0) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0033 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(196, -1, 0);
      logInfo(`touch(x=196, y=-1, touchType=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=196, y=-1, touchType=0) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(196);
      logInfo(`touch(x=196, y=-1, touchType=0) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0033 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0034
     * @tc.name      WindowManage_SubWindowDragModelTouch_0034
     * @tc.desc      SubWindowDragModel.touch(x=50, y=10, touchType=10) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0034 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(50, 10, 10);
      logInfo(`touch(x=50, y=10, touchType=10): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=50, y=10, touchType=10) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(50);
      logInfo(`touch(x=50, y=10, touchType=10) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0034 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0035
     * @tc.name      WindowManage_SubWindowDragModelTouch_0035
     * @tc.desc      SubWindowDragModel.touch(x=-1, y=15, touchType=5) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0035 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(-1, 15, 5);
      logInfo(`touch(x=-1, y=15, touchType=5): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-1, y=15, touchType=5) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-1);
      logInfo(`touch(x=-1, y=15, touchType=5) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(15);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0035 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0036
     * @tc.name      WindowManage_SubWindowDragModelTouch_0036
     * @tc.desc      SubWindowDragModel.touch(x=2, y=10, touchType=1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0036 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(2, 10, 1);
      logInfo(`touch(x=2, y=10, touchType=1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=2, y=10, touchType=1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(2);
      logInfo(`touch(x=2, y=10, touchType=1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0036 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0037
     * @tc.name      WindowManage_SubWindowDragModelTouch_0037
     * @tc.desc      SubWindowDragModel.touch(x=15, y=97, touchType=20) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0037 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(15, 97, 20);
      logInfo(`touch(x=15, y=97, touchType=20): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=15, y=97, touchType=20) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(15);
      logInfo(`touch(x=15, y=97, touchType=20) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(97);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0037 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0038
     * @tc.name      WindowManage_SubWindowDragModelTouch_0038
     * @tc.desc      SubWindowDragModel.touch(x=15, y=0, touchType=3) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0038 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(15, 0, 3);
      logInfo(`touch(x=15, y=0, touchType=3): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=15, y=0, touchType=3) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(15);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0038 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0039
     * @tc.name      WindowManage_SubWindowDragModelTouch_0039
     * @tc.desc      SubWindowDragModel.touch(x=100, y=97, touchType=-8) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0039 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(100, 97, -8);
      logInfo(`touch(x=100, y=97, touchType=-8): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=100, y=97, touchType=-8) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(100);
      logInfo(`touch(x=100, y=97, touchType=-8) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(97);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0039 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0040
     * @tc.name      WindowManage_SubWindowDragModelTouch_0040
     * @tc.desc      SubWindowDragModel.touch(x=50, y=1, touchType=10) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0040 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(50, 1, 10);
      logInfo(`touch(x=50, y=1, touchType=10): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=50, y=1, touchType=10) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(50);
      logInfo(`touch(x=50, y=1, touchType=10) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0040 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0041
     * @tc.name      WindowManage_SubWindowDragModelTouch_0041
     * @tc.desc      SubWindowDragModel.touch(x=2, y=100, touchType=0) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0041 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(2, 100, 0);
      logInfo(`touch(x=2, y=100, touchType=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=2, y=100, touchType=0) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(2);
      logInfo(`touch(x=2, y=100, touchType=0) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0041 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0042
     * @tc.name      WindowManage_SubWindowDragModelTouch_0042
     * @tc.desc      SubWindowDragModel.touch(x=0, y=97, touchType=10) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0042 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(0, 97, 10);
      logInfo(`touch(x=0, y=97, touchType=10): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=0, y=97, touchType=10) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(97);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0042 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0043
     * @tc.name      WindowManage_SubWindowDragModelTouch_0043
     * @tc.desc      SubWindowDragModel.touch(x=2, y=1, touchType=25) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0043 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(2, 1, 25);
      logInfo(`touch(x=2, y=1, touchType=25): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=2, y=1, touchType=25) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(2);
      logInfo(`touch(x=2, y=1, touchType=25) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0043 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0044
     * @tc.name      WindowManage_SubWindowDragModelTouch_0044
     * @tc.desc      SubWindowDragModel.touch(x=5, y=2, touchType=25) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0044 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(5, 2, 25);
      logInfo(`touch(x=5, y=2, touchType=25): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=5, y=2, touchType=25) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(5);
      logInfo(`touch(x=5, y=2, touchType=25) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(2);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0044 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0045
     * @tc.name      WindowManage_SubWindowDragModelTouch_0045
     * @tc.desc      SubWindowDragModel.touch(x=3, y=0, touchType=10) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0045 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(3, 0, 10);
      logInfo(`touch(x=3, y=0, touchType=10): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=3, y=0, touchType=10) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(3);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0045 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0046
     * @tc.name      WindowManage_SubWindowDragModelTouch_0046
     * @tc.desc      SubWindowDragModel.touch(x=10, y=97, touchType=25) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0046 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(10, 97, 25);
      logInfo(`touch(x=10, y=97, touchType=25): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=10, y=97, touchType=25) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(10);
      logInfo(`touch(x=10, y=97, touchType=25) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(97);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0046 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0047
     * @tc.name      WindowManage_SubWindowDragModelTouch_0047
     * @tc.desc      SubWindowDragModel.touch(x=0, y=2, touchType=2) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0047 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(0, 2, 2);
      logInfo(`touch(x=0, y=2, touchType=2): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=0, y=2, touchType=2) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(2);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0047 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0048
     * @tc.name      WindowManage_SubWindowDragModelTouch_0048
     * @tc.desc      SubWindowDragModel.touch(x=0, y=0, touchType=-1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0048 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(0, 0, -1);
      logInfo(`touch(x=0, y=0, touchType=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0048 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0049
     * @tc.name      WindowManage_SubWindowDragModelTouch_0049
     * @tc.desc      SubWindowDragModel.touch(x=3, y=100, touchType=-8) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0049 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(3, 100, -8);
      logInfo(`touch(x=3, y=100, touchType=-8): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=3, y=100, touchType=-8) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(3);
      logInfo(`touch(x=3, y=100, touchType=-8) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0049 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0050
     * @tc.name      WindowManage_SubWindowDragModelTouch_0050
     * @tc.desc      SubWindowDragModel.touch(x=0, y=15, touchType=5) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0050 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(0, 15, 5);
      logInfo(`touch(x=0, y=15, touchType=5): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=0, y=15, touchType=5) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(15);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0050 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0051
     * @tc.name      WindowManage_SubWindowDragModelTouch_0051
     * @tc.desc      SubWindowDragModel.touch(x=196, y=97, touchType=-1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0051 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(196, 97, -1);
      logInfo(`touch(x=196, y=97, touchType=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=196, y=97, touchType=-1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(196);
      logInfo(`touch(x=196, y=97, touchType=-1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(97);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0051 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0052
     * @tc.name      WindowManage_SubWindowDragModelTouch_0052
     * @tc.desc      SubWindowDragModel.touch(x=196, y=2, touchType=2) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0052 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(196, 2, 2);
      logInfo(`touch(x=196, y=2, touchType=2): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=196, y=2, touchType=2) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(196);
      logInfo(`touch(x=196, y=2, touchType=2) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(2);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0052 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0053
     * @tc.name      WindowManage_SubWindowDragModelTouch_0053
     * @tc.desc      SubWindowDragModel.touch(x=2, y=3, touchType=100) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0053 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(2, 3, 100);
      logInfo(`touch(x=2, y=3, touchType=100): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=2, y=3, touchType=100) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(2);
      logInfo(`touch(x=2, y=3, touchType=100) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(3);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0053 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0054
     * @tc.name      WindowManage_SubWindowDragModelTouch_0054
     * @tc.desc      SubWindowDragModel.touch(x=5, y=15, touchType=3) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0054 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(5, 15, 3);
      logInfo(`touch(x=5, y=15, touchType=3): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=5, y=15, touchType=3) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(5);
      logInfo(`touch(x=5, y=15, touchType=3) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(15);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0054 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0055
     * @tc.name      WindowManage_SubWindowDragModelTouch_0055
     * @tc.desc      SubWindowDragModel.touch(x=10, y=5, touchType=-1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0055 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(10, 5, -1);
      logInfo(`touch(x=10, y=5, touchType=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=10, y=5, touchType=-1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(10);
      logInfo(`touch(x=10, y=5, touchType=-1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(5);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0055 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0056
     * @tc.name      WindowManage_SubWindowDragModelTouch_0056
     * @tc.desc      SubWindowDragModel.touch(x=15, y=10, touchType=-8) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0056 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(15, 10, -8);
      logInfo(`touch(x=15, y=10, touchType=-8): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=15, y=10, touchType=-8) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(15);
      logInfo(`touch(x=15, y=10, touchType=-8) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0056 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0057
     * @tc.name      WindowManage_SubWindowDragModelTouch_0057
     * @tc.desc      SubWindowDragModel.touch(x=50, y=50, touchType=25) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0057 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(50, 50, 25);
      logInfo(`touch(x=50, y=50, touchType=25): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=50, y=50, touchType=25) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(50);
      logInfo(`touch(x=50, y=50, touchType=25) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(50);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0057 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0058
     * @tc.name      WindowManage_SubWindowDragModelTouch_0058
     * @tc.desc      SubWindowDragModel.touch(x=-1, y=0, touchType=0) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0058 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(-1, 0, 0);
      logInfo(`touch(x=-1, y=0, touchType=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-1, y=0, touchType=0) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0058 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0059
     * @tc.name      WindowManage_SubWindowDragModelTouch_0059
     * @tc.desc      SubWindowDragModel.touch(x=2, y=0, touchType=25) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0059 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(2, 0, 25);
      logInfo(`touch(x=2, y=0, touchType=25): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=2, y=0, touchType=25) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(2);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0059 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0060
     * @tc.name      WindowManage_SubWindowDragModelTouch_0060
     * @tc.desc      SubWindowDragModel.touch(x=15, y=15, touchType=0) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0060 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(15, 15, 0);
      logInfo(`touch(x=15, y=15, touchType=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=15, y=15, touchType=0) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(15);
      logInfo(`touch(x=15, y=15, touchType=0) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(15);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0060 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0061
     * @tc.name      WindowManage_SubWindowDragModelTouch_0061
     * @tc.desc      SubWindowDragModel.touch(x=100, y=3, touchType=25) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0061 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(100, 3, 25);
      logInfo(`touch(x=100, y=3, touchType=25): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=100, y=3, touchType=25) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(100);
      logInfo(`touch(x=100, y=3, touchType=25) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(3);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0061 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0062
     * @tc.name      WindowManage_SubWindowDragModelTouch_0062
     * @tc.desc      SubWindowDragModel.touch(x=15, y=50, touchType=-8) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0062 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(15, 50, -8);
      logInfo(`touch(x=15, y=50, touchType=-8): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=15, y=50, touchType=-8) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(15);
      logInfo(`touch(x=15, y=50, touchType=-8) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(50);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0062 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0063
     * @tc.name      WindowManage_SubWindowDragModelTouch_0063
     * @tc.desc      SubWindowDragModel.touch(x=15, y=100, touchType=-1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0063 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(15, 100, -1);
      logInfo(`touch(x=15, y=100, touchType=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=15, y=100, touchType=-1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(15);
      logInfo(`touch(x=15, y=100, touchType=-1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0063 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0064
     * @tc.name      WindowManage_SubWindowDragModelTouch_0064
     * @tc.desc      SubWindowDragModel.touch(x=0, y=10, touchType=2) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0064 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(0, 10, 2);
      logInfo(`touch(x=0, y=10, touchType=2): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=0, y=10, touchType=2) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0064 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0065
     * @tc.name      WindowManage_SubWindowDragModelTouch_0065
     * @tc.desc      SubWindowDragModel.touch(x=3, y=1, touchType=100) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0065 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(3, 1, 100);
      logInfo(`touch(x=3, y=1, touchType=100): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=3, y=1, touchType=100) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(3);
      logInfo(`touch(x=3, y=1, touchType=100) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0065 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0066
     * @tc.name      WindowManage_SubWindowDragModelTouch_0066
     * @tc.desc      SubWindowDragModel.touch(x=3, y=3, touchType=25) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0066 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(3, 3, 25);
      logInfo(`touch(x=3, y=3, touchType=25): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=3, y=3, touchType=25) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(3);
      logInfo(`touch(x=3, y=3, touchType=25) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(3);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0066 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0067
     * @tc.name      WindowManage_SubWindowDragModelTouch_0067
     * @tc.desc      SubWindowDragModel.touch(x=0, y=5, touchType=1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0067 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(0, 5, 1);
      logInfo(`touch(x=0, y=5, touchType=1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=0, y=5, touchType=1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(5);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0067 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0068
     * @tc.name      WindowManage_SubWindowDragModelTouch_0068
     * @tc.desc      SubWindowDragModel.touch(x=196, y=0, touchType=10) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0068 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(196, 0, 10);
      logInfo(`touch(x=196, y=0, touchType=10): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=196, y=0, touchType=10) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(196);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0068 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0069
     * @tc.name      WindowManage_SubWindowDragModelTouch_0069
     * @tc.desc      SubWindowDragModel.touch(x=5, y=-1, touchType=10) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0069 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(5, -1, 10);
      logInfo(`touch(x=5, y=-1, touchType=10): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=5, y=-1, touchType=10) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(5);
      logInfo(`touch(x=5, y=-1, touchType=10) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0069 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0070
     * @tc.name      WindowManage_SubWindowDragModelTouch_0070
     * @tc.desc      SubWindowDragModel.touch(x=10, y=0, touchType=2) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0070 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(10, 0, 2);
      logInfo(`touch(x=10, y=0, touchType=2): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=10, y=0, touchType=2) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0070 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0071
     * @tc.name      WindowManage_SubWindowDragModelTouch_0071
     * @tc.desc      SubWindowDragModel.touch(x=196, y=15, touchType=3) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0071 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(196, 15, 3);
      logInfo(`touch(x=196, y=15, touchType=3): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=196, y=15, touchType=3) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(196);
      logInfo(`touch(x=196, y=15, touchType=3) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(15);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0071 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0072
     * @tc.name      WindowManage_SubWindowDragModelTouch_0072
     * @tc.desc      SubWindowDragModel.touch(x=100, y=15, touchType=15) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0072 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(100, 15, 15);
      logInfo(`touch(x=100, y=15, touchType=15): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=100, y=15, touchType=15) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(100);
      logInfo(`touch(x=100, y=15, touchType=15) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(15);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0072 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0073
     * @tc.name      WindowManage_SubWindowDragModelTouch_0073
     * @tc.desc      SubWindowDragModel.touch(x=0, y=-1, touchType=20) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0073 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(0, -1, 20);
      logInfo(`touch(x=0, y=-1, touchType=20): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=0, y=-1, touchType=20) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0073 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0074
     * @tc.name      WindowManage_SubWindowDragModelTouch_0074
     * @tc.desc      SubWindowDragModel.touch(x=1, y=5, touchType=-1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0074 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(1, 5, -1);
      logInfo(`touch(x=1, y=5, touchType=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=1, y=5, touchType=-1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`touch(x=1, y=5, touchType=-1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(5);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0074 end`);
    });
  });
}
