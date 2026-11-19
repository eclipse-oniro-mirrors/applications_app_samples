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

/** Logic checks for SubWindowDragModel.touch (21 cases). */
export default function subWindowDragModelTouch4Test(): void {
  describe('SubWindowDragModelTouch4Test', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0223
     * @tc.name      WindowManage_SubWindowDragModelTouch_0223
     * @tc.desc      SubWindowDragModel.touch(x=3, y=-1, touchType=0) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0223 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(3, -1, 0);
      logInfo(`touch(x=3, y=-1, touchType=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=3, y=-1, touchType=0) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(3);
      logInfo(`touch(x=3, y=-1, touchType=0) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0223 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0224
     * @tc.name      WindowManage_SubWindowDragModelTouch_0224
     * @tc.desc      SubWindowDragModel.touch(x=10, y=-100, touchType=3) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0224 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(10, -100, 3);
      logInfo(`touch(x=10, y=-100, touchType=3): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=10, y=-100, touchType=3) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(10);
      logInfo(`touch(x=10, y=-100, touchType=3) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0224 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0225
     * @tc.name      WindowManage_SubWindowDragModelTouch_0225
     * @tc.desc      SubWindowDragModel.touch(x=5, y=15, touchType=-1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0225 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(5, 15, -1);
      logInfo(`touch(x=5, y=15, touchType=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=5, y=15, touchType=-1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(5);
      logInfo(`touch(x=5, y=15, touchType=-1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(15);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0225 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0226
     * @tc.name      WindowManage_SubWindowDragModelTouch_0226
     * @tc.desc      SubWindowDragModel.touch(x=50, y=2, touchType=2) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0226 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(50, 2, 2);
      logInfo(`touch(x=50, y=2, touchType=2): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=50, y=2, touchType=2) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(50);
      logInfo(`touch(x=50, y=2, touchType=2) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(2);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0226 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0227
     * @tc.name      WindowManage_SubWindowDragModelTouch_0227
     * @tc.desc      SubWindowDragModel.touch(x=1, y=-1, touchType=3) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0227 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(1, -1, 3);
      logInfo(`touch(x=1, y=-1, touchType=3): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=1, y=-1, touchType=3) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`touch(x=1, y=-1, touchType=3) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0227 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0228
     * @tc.name      WindowManage_SubWindowDragModelTouch_0228
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=100, touchType=25) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0228 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(-100, 100, 25);
      logInfo(`touch(x=-100, y=100, touchType=25): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=100, touchType=25) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch(x=-100, y=100, touchType=25) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0228 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0229
     * @tc.name      WindowManage_SubWindowDragModelTouch_0229
     * @tc.desc      SubWindowDragModel.touch(x=15, y=0, touchType=0) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0229 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(15, 0, 0);
      logInfo(`touch(x=15, y=0, touchType=0): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=15, y=0, touchType=0) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(15);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0229 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0230
     * @tc.name      WindowManage_SubWindowDragModelTouch_0230
     * @tc.desc      SubWindowDragModel.touch(x=-1, y=0, touchType=-8) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0230 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(-1, 0, -8);
      logInfo(`touch(x=-1, y=0, touchType=-8): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-1, y=0, touchType=-8) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0230 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0231
     * @tc.name      WindowManage_SubWindowDragModelTouch_0231
     * @tc.desc      SubWindowDragModel.touch(x=10, y=97, touchType=3) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0231 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(10, 97, 3);
      logInfo(`touch(x=10, y=97, touchType=3): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=10, y=97, touchType=3) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(10);
      logInfo(`touch(x=10, y=97, touchType=3) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(97);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0231 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0232
     * @tc.name      WindowManage_SubWindowDragModelTouch_0232
     * @tc.desc      SubWindowDragModel.touch(x=-1, y=15, touchType=3) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0232 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(-1, 15, 3);
      logInfo(`touch(x=-1, y=15, touchType=3): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-1, y=15, touchType=3) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-1);
      logInfo(`touch(x=-1, y=15, touchType=3) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(15);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0232 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0233
     * @tc.name      WindowManage_SubWindowDragModelTouch_0233
     * @tc.desc      SubWindowDragModel.touch(x=2, y=3, touchType=15) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0233 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(2, 3, 15);
      logInfo(`touch(x=2, y=3, touchType=15): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=2, y=3, touchType=15) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(2);
      logInfo(`touch(x=2, y=3, touchType=15) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(3);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0233 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0234
     * @tc.name      WindowManage_SubWindowDragModelTouch_0234
     * @tc.desc      SubWindowDragModel.touch(x=3, y=50, touchType=100) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0234 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(3, 50, 100);
      logInfo(`touch(x=3, y=50, touchType=100): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=3, y=50, touchType=100) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(3);
      logInfo(`touch(x=3, y=50, touchType=100) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(50);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0234 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0235
     * @tc.name      WindowManage_SubWindowDragModelTouch_0235
     * @tc.desc      SubWindowDragModel.touch(x=-1, y=3, touchType=10) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0235 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(-1, 3, 10);
      logInfo(`touch(x=-1, y=3, touchType=10): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-1, y=3, touchType=10) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-1);
      logInfo(`touch(x=-1, y=3, touchType=10) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(3);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0235 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0236
     * @tc.name      WindowManage_SubWindowDragModelTouch_0236
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=0, touchType=-8) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0236 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(-100, 0, -8);
      logInfo(`touch(x=-100, y=0, touchType=-8): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=0, touchType=-8) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0236 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0237
     * @tc.name      WindowManage_SubWindowDragModelTouch_0237
     * @tc.desc      SubWindowDragModel.touch(x=100, y=3, touchType=10) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0237 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(100, 3, 10);
      logInfo(`touch(x=100, y=3, touchType=10): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=100, y=3, touchType=10) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(100);
      logInfo(`touch(x=100, y=3, touchType=10) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(3);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0237 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0238
     * @tc.name      WindowManage_SubWindowDragModelTouch_0238
     * @tc.desc      SubWindowDragModel.touch(x=3, y=-100, touchType=2) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0238 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(3, -100, 2);
      logInfo(`touch(x=3, y=-100, touchType=2): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=3, y=-100, touchType=2) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(3);
      logInfo(`touch(x=3, y=-100, touchType=2) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0238 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0239
     * @tc.name      WindowManage_SubWindowDragModelTouch_0239
     * @tc.desc      SubWindowDragModel.touch(x=-1, y=-1, touchType=3) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0239 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(1, 0, 0);
      const actual: boolean = subject.touch(-1, -1, 3);
      logInfo(`touch(x=-1, y=-1, touchType=3): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-1, y=-1, touchType=3) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-1);
      logInfo(`touch(x=-1, y=-1, touchType=3) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0239 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0240
     * @tc.name      WindowManage_SubWindowDragModelTouch_0240
     * @tc.desc      SubWindowDragModel.touch(x=-100, y=1, touchType=-8) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0240 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(-100, 1, -8);
      logInfo(`touch(x=-100, y=1, touchType=-8): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=-100, y=1, touchType=-8) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(-100);
      logInfo(`touch(x=-100, y=1, touchType=-8) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(1);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0240 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0241
     * @tc.name      WindowManage_SubWindowDragModelTouch_0241
     * @tc.desc      SubWindowDragModel.touch(x=50, y=5, touchType=-1) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0241 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(0, 0, 0);
      const actual: boolean = subject.touch(50, 5, -1);
      logInfo(`touch(x=50, y=5, touchType=-1): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=50, y=5, touchType=-1) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(50);
      logInfo(`touch(x=50, y=5, touchType=-1) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(5);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0241 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0242
     * @tc.name      WindowManage_SubWindowDragModelTouch_0242
     * @tc.desc      SubWindowDragModel.touch(x=10, y=-100, touchType=-8) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('WindowManage_SubWindowDragModelTouch_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0242 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(10, -100, -8);
      logInfo(`touch(x=10, y=-100, touchType=-8): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=10, y=-100, touchType=-8) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(10);
      logInfo(`touch(x=10, y=-100, touchType=-8) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(-100);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0242 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_SUB_WINDOW_DRAG_MODEL_TOUCH_0243
     * @tc.name      WindowManage_SubWindowDragModelTouch_0243
     * @tc.desc      SubWindowDragModel.touch(x=1, y=10, touchType=5) yields false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_SubWindowDragModelTouch_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0243 begin`);
      const subject: SubWindowDragModel = new SubWindowDragModel(100, 0, 0);
      const actual: boolean = subject.touch(1, 10, 5);
      logInfo(`touch(x=1, y=10, touchType=5): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`touch(x=1, y=10, touchType=5) state: subject.startX=${subject.startX}`);
      expect(subject.startX).assertEqual(1);
      logInfo(`touch(x=1, y=10, touchType=5) state: subject.startY=${subject.startY}`);
      expect(subject.startY).assertEqual(10);
      logInfo(`${BUNDLE}SubWindowDragModelTouch_0243 end`);
    });
  });
}
