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
export default function subWindowDragModelTouch3Test(): void {
  describe('SubWindowDragModelTouch3Test', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0149
     * @tc.name      WindowManage_SubWindowDragModelTouch_0149
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=-100, touchType=10) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0149 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(-100, -100, 10);
      logInfo(`touch(x=-100, y=-100, touchType=10): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=-100, touchType=10) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch(x=-100, y=-100, touchType=10) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0149 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0150
     * @tc.name      WindowManage_SubWindowDragModelTouch_0150
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=-100, touchType=100) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0150 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(-100, -100, 100);
      logInfo(`touch(x=-100, y=-100, touchType=100): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=-100, touchType=100) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch(x=-100, y=-100, touchType=100) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0150 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0151
     * @tc.name      WindowManage_SubWindowDragModelTouch_0151
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=-100, touchType=5) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0151 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(-100, -100, 5);
      logInfo(`touch(x=-100, y=-100, touchType=5): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=-100, touchType=5) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch(x=-100, y=-100, touchType=5) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0151 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0152
     * @tc.name      WindowManage_SubWindowDragModelTouch_0152
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=-100, touchType=15) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0152 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(-100, -100, 15);
      logInfo(`touch(x=-100, y=-100, touchType=15): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=-100, touchType=15) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch(x=-100, y=-100, touchType=15) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0152 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0153
     * @tc.name      WindowManage_SubWindowDragModelTouch_0153
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=-100, touchType=20) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0153 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(-100, -100, 20);
      logInfo(`touch(x=-100, y=-100, touchType=20): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=-100, touchType=20) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch(x=-100, y=-100, touchType=20) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0153 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0154
     * @tc.name      WindowManage_SubWindowDragModelTouch_0154
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=-100, touchType=25) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0154 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(-100, -100, 25);
      logInfo(`touch(x=-100, y=-100, touchType=25): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=-100, touchType=25) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch(x=-100, y=-100, touchType=25) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0154 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0155
     * @tc.name      WindowManage_SubWindowDragModelTouch_0155
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=-100, touchType=-8) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0155 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(-100, -100, -8);
      logInfo(`touch(x=-100, y=-100, touchType=-8): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=-100, touchType=-8) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch(x=-100, y=-100, touchType=-8) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0155 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0156
     * @tc.name      WindowManage_SubWindowDragModelTouch_0156
     * @tc.desc      SubWindowDragModel.touch(x=1, y=10, touchType=15) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0156 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(1, 10, 15);
      logInfo(`touch(x=1, y=10, touchType=15): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=1, y=10, touchType=15) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`touch(x=1, y=10, touchType=15) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0156 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0157
     * @tc.name      WindowManage_SubWindowDragModelTouch_0157
     * @tc.desc      SubWindowDragModel.touch(x=50, y=1, touchType=2) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0157 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(50, 1, 2);
      logInfo(`touch(x=50, y=1, touchType=2): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=50, y=1, touchType=2) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(50);
      logInfo(`touch(x=50, y=1, touchType=2) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0157 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0158
     * @tc.name      WindowManage_SubWindowDragModelTouch_0158
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=-1, touchType=-8) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0158 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(-100, -1, -8);
      logInfo(`touch(x=-100, y=-1, touchType=-8): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=-1, touchType=-8) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch(x=-100, y=-1, touchType=-8) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0158 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0159
     * @tc.name      WindowManage_SubWindowDragModelTouch_0159
     * @tc.desc      SubWindowDragModel.touch(x=15, y=-100, touchType=-8) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0159 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(15, -100, -8);
      logInfo(`touch(x=15, y=-100, touchType=-8): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=15, y=-100, touchType=-8) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(15);
      logInfo(`touch(x=15, y=-100, touchType=-8) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0159 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0160
     * @tc.name      WindowManage_SubWindowDragModelTouch_0160
     * @tc.desc      SubWindowDragModel.touch(x=5, y=3, touchType=5) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0160 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(5, 3, 5);
      logInfo(`touch(x=5, y=3, touchType=5): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=5, y=3, touchType=5) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(5);
      logInfo(`touch(x=5, y=3, touchType=5) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(3);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0160 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0161
     * @tc.name      WindowManage_SubWindowDragModelTouch_0161
     * @tc.desc      SubWindowDragModel.touch(x=100, y=97, touchType=-1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0161 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(100, 97, -1);
      logInfo(`touch(x=100, y=97, touchType=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=100, y=97, touchType=-1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(100);
      logInfo(`touch(x=100, y=97, touchType=-1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(97);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0161 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0162
     * @tc.name      WindowManage_SubWindowDragModelTouch_0162
     * @tc.desc      SubWindowDragModel.touch(x=2, y=-100, touchType=2) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0162 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(2, -100, 2);
      logInfo(`touch(x=2, y=-100, touchType=2): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=2, y=-100, touchType=2) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(2);
      logInfo(`touch(x=2, y=-100, touchType=2) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0162 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0163
     * @tc.name      WindowManage_SubWindowDragModelTouch_0163
     * @tc.desc      SubWindowDragModel.touch(x=-1, y=15, touchType=20) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0163 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(-1, 15, 20);
      logInfo(`touch(x=-1, y=15, touchType=20): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-1, y=15, touchType=20) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-1);
      logInfo(`touch(x=-1, y=15, touchType=20) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(15);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0163 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0164
     * @tc.name      WindowManage_SubWindowDragModelTouch_0164
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=10, touchType=15) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0164 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(-100, 10, 15);
      logInfo(`touch(x=-100, y=10, touchType=15): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=10, touchType=15) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch(x=-100, y=10, touchType=15) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0164 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0165
     * @tc.name      WindowManage_SubWindowDragModelTouch_0165
     * @tc.desc      SubWindowDragModel.touch(x=2, y=1, touchType=10) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0165 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(2, 1, 10);
      logInfo(`touch(x=2, y=1, touchType=10): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=2, y=1, touchType=10) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(2);
      logInfo(`touch(x=2, y=1, touchType=10) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0165 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0166
     * @tc.name      WindowManage_SubWindowDragModelTouch_0166
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=2, touchType=-1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0166 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(-100, 2, -1);
      logInfo(`touch(x=-100, y=2, touchType=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=2, touchType=-1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch(x=-100, y=2, touchType=-1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(2);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0166 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0167
     * @tc.name      WindowManage_SubWindowDragModelTouch_0167
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=50, touchType=5) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0167 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(-100, 50, 5);
      logInfo(`touch(x=-100, y=50, touchType=5): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=50, touchType=5) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch(x=-100, y=50, touchType=5) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(50);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0167 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0168
     * @tc.name      WindowManage_SubWindowDragModelTouch_0168
     * @tc.desc      SubWindowDragModel.touch(x=3, y=5, touchType=20) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0168 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(3, 5, 20);
      logInfo(`touch(x=3, y=5, touchType=20): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=3, y=5, touchType=20) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(3);
      logInfo(`touch(x=3, y=5, touchType=20) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(5);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0168 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0169
     * @tc.name      WindowManage_SubWindowDragModelTouch_0169
     * @tc.desc      SubWindowDragModel.touch(x=196, y=-1, touchType=15) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0169 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(196, -1, 15);
      logInfo(`touch(x=196, y=-1, touchType=15): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=196, y=-1, touchType=15) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(196);
      logInfo(`touch(x=196, y=-1, touchType=15) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0169 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0170
     * @tc.name      WindowManage_SubWindowDragModelTouch_0170
     * @tc.desc      SubWindowDragModel.touch(x=196, y=50, touchType=3) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0170 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(196, 50, 3);
      logInfo(`touch(x=196, y=50, touchType=3): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=196, y=50, touchType=3) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(196);
      logInfo(`touch(x=196, y=50, touchType=3) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(50);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0170 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0171
     * @tc.name      WindowManage_SubWindowDragModelTouch_0171
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=3, touchType=-8) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0171 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(-100, 3, -8);
      logInfo(`touch(x=-100, y=3, touchType=-8): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=3, touchType=-8) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch(x=-100, y=3, touchType=-8) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(3);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0171 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0172
     * @tc.name      WindowManage_SubWindowDragModelTouch_0172
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=0, touchType=5) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0172 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(-100, 0, 5);
      logInfo(`touch(x=-100, y=0, touchType=5): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=0, touchType=5) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0172 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0173
     * @tc.name      WindowManage_SubWindowDragModelTouch_0173
     * @tc.desc      SubWindowDragModel.touch(x=5, y=-100, touchType=15) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0173 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(5, -100, 15);
      logInfo(`touch(x=5, y=-100, touchType=15): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=5, y=-100, touchType=15) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(5);
      logInfo(`touch(x=5, y=-100, touchType=15) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0173 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0174
     * @tc.name      WindowManage_SubWindowDragModelTouch_0174
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=1, touchType=2) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0174 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(-100, 1, 2);
      logInfo(`touch(x=-100, y=1, touchType=2): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=1, touchType=2) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch(x=-100, y=1, touchType=2) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0174 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0175
     * @tc.name      WindowManage_SubWindowDragModelTouch_0175
     * @tc.desc      SubWindowDragModel.touch(x=2, y=-100, touchType=100) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0175 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(2, -100, 100);
      logInfo(`touch(x=2, y=-100, touchType=100): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=2, y=-100, touchType=100) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(2);
      logInfo(`touch(x=2, y=-100, touchType=100) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0175 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0176
     * @tc.name      WindowManage_SubWindowDragModelTouch_0176
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=97, touchType=20) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0176 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(-100, 97, 20);
      logInfo(`touch(x=-100, y=97, touchType=20): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=97, touchType=20) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch(x=-100, y=97, touchType=20) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(97);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0176 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0177
     * @tc.name      WindowManage_SubWindowDragModelTouch_0177
     * @tc.desc      SubWindowDragModel.touch(x=0, y=-100, touchType=25) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0177 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(0, -100, 25);
      logInfo(`touch(x=0, y=-100, touchType=25): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=0, y=-100, touchType=25) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0177 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0178
     * @tc.name      WindowManage_SubWindowDragModelTouch_0178
     * @tc.desc      SubWindowDragModel.touch(x=2, y=-100, touchType=15) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0178 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(2, -100, 15);
      logInfo(`touch(x=2, y=-100, touchType=15): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=2, y=-100, touchType=15) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(2);
      logInfo(`touch(x=2, y=-100, touchType=15) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0178 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0179
     * @tc.name      WindowManage_SubWindowDragModelTouch_0179
     * @tc.desc      SubWindowDragModel.touch(x=15, y=0, touchType=-1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0179 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(15, 0, -1);
      logInfo(`touch(x=15, y=0, touchType=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=15, y=0, touchType=-1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(15);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0179 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0180
     * @tc.name      WindowManage_SubWindowDragModelTouch_0180
     * @tc.desc      SubWindowDragModel.touch(x=3, y=3, touchType=1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0180 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(3, 3, 1);
      logInfo(`touch(x=3, y=3, touchType=1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=3, y=3, touchType=1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(3);
      logInfo(`touch(x=3, y=3, touchType=1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(3);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0180 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0181
     * @tc.name      WindowManage_SubWindowDragModelTouch_0181
     * @tc.desc      SubWindowDragModel.touch(x=0, y=10, touchType=1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0181 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(0, 10, 1);
      logInfo(`touch(x=0, y=10, touchType=1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=0, y=10, touchType=1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0181 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0182
     * @tc.name      WindowManage_SubWindowDragModelTouch_0182
     * @tc.desc      SubWindowDragModel.touch(x=-1, y=15, touchType=1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0182 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(-1, 15, 1);
      logInfo(`touch(x=-1, y=15, touchType=1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-1, y=15, touchType=1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-1);
      logInfo(`touch(x=-1, y=15, touchType=1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(15);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0182 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0183
     * @tc.name      WindowManage_SubWindowDragModelTouch_0183
     * @tc.desc      SubWindowDragModel.touch(x=5, y=15, touchType=15) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0183 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(5, 15, 15);
      logInfo(`touch(x=5, y=15, touchType=15): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=5, y=15, touchType=15) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(5);
      logInfo(`touch(x=5, y=15, touchType=15) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(15);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0183 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0184
     * @tc.name      WindowManage_SubWindowDragModelTouch_0184
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=15, touchType=3) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0184 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(-100, 15, 3);
      logInfo(`touch(x=-100, y=15, touchType=3): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=15, touchType=3) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch(x=-100, y=15, touchType=3) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(15);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0184 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0185
     * @tc.name      WindowManage_SubWindowDragModelTouch_0185
     * @tc.desc      SubWindowDragModel.touch(x=3, y=100, touchType=100) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0185 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(3, 100, 100);
      logInfo(`touch(x=3, y=100, touchType=100): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=3, y=100, touchType=100) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(3);
      logInfo(`touch(x=3, y=100, touchType=100) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0185 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0186
     * @tc.name      WindowManage_SubWindowDragModelTouch_0186
     * @tc.desc      SubWindowDragModel.touch(x=15, y=-100, touchType=100) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0186 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(15, -100, 100);
      logInfo(`touch(x=15, y=-100, touchType=100): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=15, y=-100, touchType=100) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(15);
      logInfo(`touch(x=15, y=-100, touchType=100) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0186 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0187
     * @tc.name      WindowManage_SubWindowDragModelTouch_0187
     * @tc.desc      SubWindowDragModel.touch(x=1, y=3, touchType=3) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0187 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(1, 3, 3);
      logInfo(`touch(x=1, y=3, touchType=3): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=1, y=3, touchType=3) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`touch(x=1, y=3, touchType=3) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(3);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0187 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0188
     * @tc.name      WindowManage_SubWindowDragModelTouch_0188
     * @tc.desc      SubWindowDragModel.touch(x=0, y=5, touchType=-1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0188 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(0, 5, -1);
      logInfo(`touch(x=0, y=5, touchType=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=0, y=5, touchType=-1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(5);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0188 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0189
     * @tc.name      WindowManage_SubWindowDragModelTouch_0189
     * @tc.desc      SubWindowDragModel.touch(x=50, y=5, touchType=5) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0189 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(50, 5, 5);
      logInfo(`touch(x=50, y=5, touchType=5): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=50, y=5, touchType=5) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(50);
      logInfo(`touch(x=50, y=5, touchType=5) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(5);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0189 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0190
     * @tc.name      WindowManage_SubWindowDragModelTouch_0190
     * @tc.desc      SubWindowDragModel.touch(x=100, y=0, touchType=-8) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0190 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(100, 0, -8);
      logInfo(`touch(x=100, y=0, touchType=-8): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=100, y=0, touchType=-8) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0190 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0191
     * @tc.name      WindowManage_SubWindowDragModelTouch_0191
     * @tc.desc      SubWindowDragModel.touch(x=5, y=50, touchType=1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0191 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(5, 50, 1);
      logInfo(`touch(x=5, y=50, touchType=1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=5, y=50, touchType=1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(5);
      logInfo(`touch(x=5, y=50, touchType=1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(50);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0191 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0192
     * @tc.name      WindowManage_SubWindowDragModelTouch_0192
     * @tc.desc      SubWindowDragModel.touch(x=100, y=0, touchType=20) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0192 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(100, 0, 20);
      logInfo(`touch(x=100, y=0, touchType=20): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=100, y=0, touchType=20) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0192 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0193
     * @tc.name      WindowManage_SubWindowDragModelTouch_0193
     * @tc.desc      SubWindowDragModel.touch(x=15, y=97, touchType=-8) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0193 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(15, 97, -8);
      logInfo(`touch(x=15, y=97, touchType=-8): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=15, y=97, touchType=-8) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(15);
      logInfo(`touch(x=15, y=97, touchType=-8) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(97);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0193 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0194
     * @tc.name      WindowManage_SubWindowDragModelTouch_0194
     * @tc.desc      SubWindowDragModel.touch(x=196, y=97, touchType=-8) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0194 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(196, 97, -8);
      logInfo(`touch(x=196, y=97, touchType=-8): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=196, y=97, touchType=-8) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(196);
      logInfo(`touch(x=196, y=97, touchType=-8) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(97);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0194 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0195
     * @tc.name      WindowManage_SubWindowDragModelTouch_0195
     * @tc.desc      SubWindowDragModel.touch(x=1, y=5, touchType=15) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0195 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(1, 5, 15);
      logInfo(`touch(x=1, y=5, touchType=15): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=1, y=5, touchType=15) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`touch(x=1, y=5, touchType=15) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(5);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0195 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0196
     * @tc.name      WindowManage_SubWindowDragModelTouch_0196
     * @tc.desc      SubWindowDragModel.touch(x=3, y=2, touchType=3) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0196 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(3, 2, 3);
      logInfo(`touch(x=3, y=2, touchType=3): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=3, y=2, touchType=3) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(3);
      logInfo(`touch(x=3, y=2, touchType=3) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(2);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0196 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0197
     * @tc.name      WindowManage_SubWindowDragModelTouch_0197
     * @tc.desc      SubWindowDragModel.touch(x=5, y=-100, touchType=5) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0197 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(5, -100, 5);
      logInfo(`touch(x=5, y=-100, touchType=5): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=5, y=-100, touchType=5) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(5);
      logInfo(`touch(x=5, y=-100, touchType=5) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0197 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0198
     * @tc.name      WindowManage_SubWindowDragModelTouch_0198
     * @tc.desc      SubWindowDragModel.touch(x=-1, y=0, touchType=-1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0198 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(-1, 0, -1);
      logInfo(`touch(x=-1, y=0, touchType=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-1, y=0, touchType=-1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0198 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0199
     * @tc.name      WindowManage_SubWindowDragModelTouch_0199
     * @tc.desc      SubWindowDragModel.touch(x=1, y=0, touchType=-1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0199 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(1, 0, -1);
      logInfo(`touch(x=1, y=0, touchType=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=1, y=0, touchType=-1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0199 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0200
     * @tc.name      WindowManage_SubWindowDragModelTouch_0200
     * @tc.desc      SubWindowDragModel.touch(x=5, y=2, touchType=1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0200 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(5, 2, 1);
      logInfo(`touch(x=5, y=2, touchType=1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=5, y=2, touchType=1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(5);
      logInfo(`touch(x=5, y=2, touchType=1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(2);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0200 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0201
     * @tc.name      WindowManage_SubWindowDragModelTouch_0201
     * @tc.desc      SubWindowDragModel.touch(x=50, y=50, touchType=0) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0201 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(50, 50, 0);
      logInfo(`touch(x=50, y=50, touchType=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=50, y=50, touchType=0) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(50);
      logInfo(`touch(x=50, y=50, touchType=0) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(50);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0201 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0202
     * @tc.name      WindowManage_SubWindowDragModelTouch_0202
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=50, touchType=-1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0202 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(-100, 50, -1);
      logInfo(`touch(x=-100, y=50, touchType=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=50, touchType=-1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch(x=-100, y=50, touchType=-1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(50);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0202 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0203
     * @tc.name      WindowManage_SubWindowDragModelTouch_0203
     * @tc.desc      SubWindowDragModel.touch(x=2, y=3, touchType=10) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0203 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(2, 3, 10);
      logInfo(`touch(x=2, y=3, touchType=10): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=2, y=3, touchType=10) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(2);
      logInfo(`touch(x=2, y=3, touchType=10) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(3);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0203 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0204
     * @tc.name      WindowManage_SubWindowDragModelTouch_0204
     * @tc.desc      SubWindowDragModel.touch(x=-1, y=10, touchType=10) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0204 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(-1, 10, 10);
      logInfo(`touch(x=-1, y=10, touchType=10): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-1, y=10, touchType=10) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-1);
      logInfo(`touch(x=-1, y=10, touchType=10) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0204 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0205
     * @tc.name      WindowManage_SubWindowDragModelTouch_0205
     * @tc.desc      SubWindowDragModel.touch(x=196, y=5, touchType=100) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0205 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(196, 5, 100);
      logInfo(`touch(x=196, y=5, touchType=100): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=196, y=5, touchType=100) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(196);
      logInfo(`touch(x=196, y=5, touchType=100) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(5);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0205 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0206
     * @tc.name      WindowManage_SubWindowDragModelTouch_0206
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=10, touchType=5) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0206 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(-100, 10, 5);
      logInfo(`touch(x=-100, y=10, touchType=5): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=10, touchType=5) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch(x=-100, y=10, touchType=5) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0206 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0207
     * @tc.name      WindowManage_SubWindowDragModelTouch_0207
     * @tc.desc      SubWindowDragModel.touch(x=15, y=97, touchType=100) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0207 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(15, 97, 100);
      logInfo(`touch(x=15, y=97, touchType=100): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=15, y=97, touchType=100) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(15);
      logInfo(`touch(x=15, y=97, touchType=100) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(97);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0207 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0208
     * @tc.name      WindowManage_SubWindowDragModelTouch_0208
     * @tc.desc      SubWindowDragModel.touch(x=3, y=1, touchType=20) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0208 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(3, 1, 20);
      logInfo(`touch(x=3, y=1, touchType=20): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=3, y=1, touchType=20) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(3);
      logInfo(`touch(x=3, y=1, touchType=20) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0208 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0209
     * @tc.name      WindowManage_SubWindowDragModelTouch_0209
     * @tc.desc      SubWindowDragModel.touch(x=10, y=10, touchType=1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0209 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(10, 10, 1);
      logInfo(`touch(x=10, y=10, touchType=1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=10, y=10, touchType=1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(10);
      logInfo(`touch(x=10, y=10, touchType=1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0209 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0210
     * @tc.name      WindowManage_SubWindowDragModelTouch_0210
     * @tc.desc      SubWindowDragModel.touch(x=2, y=10, touchType=3) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0210 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(2, 10, 3);
      logInfo(`touch(x=2, y=10, touchType=3): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=2, y=10, touchType=3) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(2);
      logInfo(`touch(x=2, y=10, touchType=3) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0210 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0211
     * @tc.name      WindowManage_SubWindowDragModelTouch_0211
     * @tc.desc      SubWindowDragModel.touch(x=2, y=2, touchType=10) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0211 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(2, 2, 10);
      logInfo(`touch(x=2, y=2, touchType=10): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=2, y=2, touchType=10) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(2);
      logInfo(`touch(x=2, y=2, touchType=10) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(2);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0211 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0212
     * @tc.name      WindowManage_SubWindowDragModelTouch_0212
     * @tc.desc      SubWindowDragModel.touch(x=196, y=0, touchType=20) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0212 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(196, 0, 20);
      logInfo(`touch(x=196, y=0, touchType=20): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=196, y=0, touchType=20) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(196);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0212 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0213
     * @tc.name      WindowManage_SubWindowDragModelTouch_0213
     * @tc.desc      SubWindowDragModel.touch(x=15, y=97, touchType=1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0213 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(15, 97, 1);
      logInfo(`touch(x=15, y=97, touchType=1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=15, y=97, touchType=1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(15);
      logInfo(`touch(x=15, y=97, touchType=1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(97);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0213 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0214
     * @tc.name      WindowManage_SubWindowDragModelTouch_0214
     * @tc.desc      SubWindowDragModel.touch(x=0, y=50, touchType=-8) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0214 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(0, 50, -8);
      logInfo(`touch(x=0, y=50, touchType=-8): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=0, y=50, touchType=-8) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(50);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0214 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0215
     * @tc.name      WindowManage_SubWindowDragModelTouch_0215
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=2, touchType=1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0215 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(-100, 2, 1);
      logInfo(`touch(x=-100, y=2, touchType=1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=2, touchType=1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch(x=-100, y=2, touchType=1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(2);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0215 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0216
     * @tc.name      WindowManage_SubWindowDragModelTouch_0216
     * @tc.desc      SubWindowDragModel.touch(x=0, y=-1, touchType=5) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0216 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(0, -1, 5);
      logInfo(`touch(x=0, y=-1, touchType=5): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=0, y=-1, touchType=5) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0216 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0217
     * @tc.name      WindowManage_SubWindowDragModelTouch_0217
     * @tc.desc      SubWindowDragModel.touch(x=3, y=-1, touchType=1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0217 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(3, -1, 1);
      logInfo(`touch(x=3, y=-1, touchType=1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=3, y=-1, touchType=1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(3);
      logInfo(`touch(x=3, y=-1, touchType=1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0217 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0218
     * @tc.name      WindowManage_SubWindowDragModelTouch_0218
     * @tc.desc      SubWindowDragModel.touch(x=2, y=10, touchType=2) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0218 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(2, 10, 2);
      logInfo(`touch(x=2, y=10, touchType=2): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=2, y=10, touchType=2) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(2);
      logInfo(`touch(x=2, y=10, touchType=2) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0218 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0219
     * @tc.name      WindowManage_SubWindowDragModelTouch_0219
     * @tc.desc      SubWindowDragModel.touch(x=196, y=50, touchType=15) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0219 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(196, 50, 15);
      logInfo(`touch(x=196, y=50, touchType=15): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=196, y=50, touchType=15) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(196);
      logInfo(`touch(x=196, y=50, touchType=15) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(50);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0219 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0220
     * @tc.name      WindowManage_SubWindowDragModelTouch_0220
     * @tc.desc      SubWindowDragModel.touch(x=3, y=1, touchType=25) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0220 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(3, 1, 25);
      logInfo(`touch(x=3, y=1, touchType=25): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=3, y=1, touchType=25) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(3);
      logInfo(`touch(x=3, y=1, touchType=25) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0220 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0221
     * @tc.name      WindowManage_SubWindowDragModelTouch_0221
     * @tc.desc      SubWindowDragModel.touch(x=3, y=-100, touchType=-1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0221 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(3, -100, -1);
      logInfo(`touch(x=3, y=-100, touchType=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=3, y=-100, touchType=-1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(3);
      logInfo(`touch(x=3, y=-100, touchType=-1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0221 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0222
     * @tc.name      WindowManage_SubWindowDragModelTouch_0222
     * @tc.desc      SubWindowDragModel.touch(x=10, y=10, touchType=-1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0222 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(10, 10, -1);
      logInfo(`touch(x=10, y=10, touchType=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=10, y=10, touchType=-1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(10);
      logInfo(`touch(x=10, y=10, touchType=-1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0222 end`);
    });
  });
}
