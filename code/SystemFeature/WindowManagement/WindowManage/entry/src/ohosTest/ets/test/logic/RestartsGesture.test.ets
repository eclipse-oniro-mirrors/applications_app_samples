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
import { restartsGesture } from '../model/WindowMoveLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowManage]';
const BUNDLE: string = 'WindowManage_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for restartsGesture (50 cases). */
export default function restartsGestureTest(): void {
  describe('RestartsGestureTest', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0001
     * @tc.name      WindowManage_RestartsGesture_0001
     * @tc.desc      restartsGesture(startX=0, startY=0, touchType=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowManage_RestartsGesture_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0001 begin`);
      const actual: boolean = restartsGesture(0, 0, 0);
      logInfo(`restartsGesture(startX=0, startY=0, touch...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0002
     * @tc.name      WindowManage_RestartsGesture_0002
     * @tc.desc      restartsGesture(startX=4, startY=10, touchType=-1) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowManage_RestartsGesture_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0002 begin`);
      const actual: boolean = restartsGesture(4, 10, -1);
      logInfo(`restartsGesture(startX=4, startY=10, touc...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}RestartsGesture_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0003
     * @tc.name      WindowManage_RestartsGesture_0003
     * @tc.desc      restartsGesture(startX=-1, startY=0, touchType=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0003 begin`);
      const actual: boolean = restartsGesture(-1, 0, 0);
      logInfo(`restartsGesture(startX=-1, startY=0, touc...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0004
     * @tc.name      WindowManage_RestartsGesture_0004
     * @tc.desc      restartsGesture(startX=1, startY=0, touchType=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0004 begin`);
      const actual: boolean = restartsGesture(1, 0, 0);
      logInfo(`restartsGesture(startX=1, startY=0, touch...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0005
     * @tc.name      WindowManage_RestartsGesture_0005
     * @tc.desc      restartsGesture(startX=2, startY=0, touchType=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0005 begin`);
      const actual: boolean = restartsGesture(2, 0, 0);
      logInfo(`restartsGesture(startX=2, startY=0, touch...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0006
     * @tc.name      WindowManage_RestartsGesture_0006
     * @tc.desc      restartsGesture(startX=3, startY=0, touchType=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0006 begin`);
      const actual: boolean = restartsGesture(3, 0, 0);
      logInfo(`restartsGesture(startX=3, startY=0, touch...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0007
     * @tc.name      WindowManage_RestartsGesture_0007
     * @tc.desc      restartsGesture(startX=10, startY=0, touchType=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0007 begin`);
      const actual: boolean = restartsGesture(10, 0, 0);
      logInfo(`restartsGesture(startX=10, startY=0, touc...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0007 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0008
     * @tc.name      WindowManage_RestartsGesture_0008
     * @tc.desc      restartsGesture(startX=100, startY=0, touchType=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0008 begin`);
      const actual: boolean = restartsGesture(100, 0, 0);
      logInfo(`restartsGesture(startX=100, startY=0, tou...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0008 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0009
     * @tc.name      WindowManage_RestartsGesture_0009
     * @tc.desc      restartsGesture(startX=5, startY=0, touchType=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0009 begin`);
      const actual: boolean = restartsGesture(5, 0, 0);
      logInfo(`restartsGesture(startX=5, startY=0, touch...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0009 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0010
     * @tc.name      WindowManage_RestartsGesture_0010
     * @tc.desc      restartsGesture(startX=15, startY=0, touchType=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0010 begin`);
      const actual: boolean = restartsGesture(15, 0, 0);
      logInfo(`restartsGesture(startX=15, startY=0, touc...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0010 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0011
     * @tc.name      WindowManage_RestartsGesture_0011
     * @tc.desc      restartsGesture(startX=20, startY=0, touchType=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0011 begin`);
      const actual: boolean = restartsGesture(20, 0, 0);
      logInfo(`restartsGesture(startX=20, startY=0, touc...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0011 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0012
     * @tc.name      WindowManage_RestartsGesture_0012
     * @tc.desc      restartsGesture(startX=25, startY=0, touchType=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0012 begin`);
      const actual: boolean = restartsGesture(25, 0, 0);
      logInfo(`restartsGesture(startX=25, startY=0, touc...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0012 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0013
     * @tc.name      WindowManage_RestartsGesture_0013
     * @tc.desc      restartsGesture(startX=4, startY=0, touchType=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0013 begin`);
      const actual: boolean = restartsGesture(4, 0, 0);
      logInfo(`restartsGesture(startX=4, startY=0, touch...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0013 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0014
     * @tc.name      WindowManage_RestartsGesture_0014
     * @tc.desc      restartsGesture(startX=0, startY=-1, touchType=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0014 begin`);
      const actual: boolean = restartsGesture(0, -1, 0);
      logInfo(`restartsGesture(startX=0, startY=-1, touc...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0014 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0015
     * @tc.name      WindowManage_RestartsGesture_0015
     * @tc.desc      restartsGesture(startX=0, startY=1, touchType=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0015 begin`);
      const actual: boolean = restartsGesture(0, 1, 0);
      logInfo(`restartsGesture(startX=0, startY=1, touch...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0015 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0016
     * @tc.name      WindowManage_RestartsGesture_0016
     * @tc.desc      restartsGesture(startX=0, startY=2, touchType=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0016 begin`);
      const actual: boolean = restartsGesture(0, 2, 0);
      logInfo(`restartsGesture(startX=0, startY=2, touch...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0016 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0017
     * @tc.name      WindowManage_RestartsGesture_0017
     * @tc.desc      restartsGesture(startX=0, startY=3, touchType=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0017 begin`);
      const actual: boolean = restartsGesture(0, 3, 0);
      logInfo(`restartsGesture(startX=0, startY=3, touch...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0017 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0018
     * @tc.name      WindowManage_RestartsGesture_0018
     * @tc.desc      restartsGesture(startX=0, startY=10, touchType=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0018 begin`);
      const actual: boolean = restartsGesture(0, 10, 0);
      logInfo(`restartsGesture(startX=0, startY=10, touc...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0018 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0019
     * @tc.name      WindowManage_RestartsGesture_0019
     * @tc.desc      restartsGesture(startX=0, startY=100, touchType=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0019 begin`);
      const actual: boolean = restartsGesture(0, 100, 0);
      logInfo(`restartsGesture(startX=0, startY=100, tou...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0019 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0020
     * @tc.name      WindowManage_RestartsGesture_0020
     * @tc.desc      restartsGesture(startX=0, startY=5, touchType=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0020 begin`);
      const actual: boolean = restartsGesture(0, 5, 0);
      logInfo(`restartsGesture(startX=0, startY=5, touch...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0020 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0021
     * @tc.name      WindowManage_RestartsGesture_0021
     * @tc.desc      restartsGesture(startX=0, startY=15, touchType=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0021 begin`);
      const actual: boolean = restartsGesture(0, 15, 0);
      logInfo(`restartsGesture(startX=0, startY=15, touc...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0021 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0022
     * @tc.name      WindowManage_RestartsGesture_0022
     * @tc.desc      restartsGesture(startX=0, startY=20, touchType=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0022 begin`);
      const actual: boolean = restartsGesture(0, 20, 0);
      logInfo(`restartsGesture(startX=0, startY=20, touc...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0022 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0023
     * @tc.name      WindowManage_RestartsGesture_0023
     * @tc.desc      restartsGesture(startX=0, startY=25, touchType=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0023 begin`);
      const actual: boolean = restartsGesture(0, 25, 0);
      logInfo(`restartsGesture(startX=0, startY=25, touc...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0023 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0024
     * @tc.name      WindowManage_RestartsGesture_0024
     * @tc.desc      restartsGesture(startX=0, startY=75, touchType=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0024 begin`);
      const actual: boolean = restartsGesture(0, 75, 0);
      logInfo(`restartsGesture(startX=0, startY=75, touc...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0024 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0025
     * @tc.name      WindowManage_RestartsGesture_0025
     * @tc.desc      restartsGesture(startX=0, startY=0, touchType=-1) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0025 begin`);
      const actual: boolean = restartsGesture(0, 0, -1);
      logInfo(`restartsGesture(startX=0, startY=0, touch...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0025 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0026
     * @tc.name      WindowManage_RestartsGesture_0026
     * @tc.desc      restartsGesture(startX=0, startY=0, touchType=1) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0026 begin`);
      const actual: boolean = restartsGesture(0, 0, 1);
      logInfo(`restartsGesture(startX=0, startY=0, touch...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0026 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0027
     * @tc.name      WindowManage_RestartsGesture_0027
     * @tc.desc      restartsGesture(startX=0, startY=0, touchType=2) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0027 begin`);
      const actual: boolean = restartsGesture(0, 0, 2);
      logInfo(`restartsGesture(startX=0, startY=0, touch...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0027 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0028
     * @tc.name      WindowManage_RestartsGesture_0028
     * @tc.desc      restartsGesture(startX=0, startY=0, touchType=3) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0028 begin`);
      const actual: boolean = restartsGesture(0, 0, 3);
      logInfo(`restartsGesture(startX=0, startY=0, touch...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0028 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0029
     * @tc.name      WindowManage_RestartsGesture_0029
     * @tc.desc      restartsGesture(startX=0, startY=0, touchType=10) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0029 begin`);
      const actual: boolean = restartsGesture(0, 0, 10);
      logInfo(`restartsGesture(startX=0, startY=0, touch...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0029 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0030
     * @tc.name      WindowManage_RestartsGesture_0030
     * @tc.desc      restartsGesture(startX=0, startY=0, touchType=100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0030 begin`);
      const actual: boolean = restartsGesture(0, 0, 100);
      logInfo(`restartsGesture(startX=0, startY=0, touch...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0030 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0031
     * @tc.name      WindowManage_RestartsGesture_0031
     * @tc.desc      restartsGesture(startX=0, startY=0, touchType=5) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0031 begin`);
      const actual: boolean = restartsGesture(0, 0, 5);
      logInfo(`restartsGesture(startX=0, startY=0, touch...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0031 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0032
     * @tc.name      WindowManage_RestartsGesture_0032
     * @tc.desc      restartsGesture(startX=0, startY=0, touchType=15) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0032 begin`);
      const actual: boolean = restartsGesture(0, 0, 15);
      logInfo(`restartsGesture(startX=0, startY=0, touch...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0032 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0033
     * @tc.name      WindowManage_RestartsGesture_0033
     * @tc.desc      restartsGesture(startX=0, startY=0, touchType=20) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0033 begin`);
      const actual: boolean = restartsGesture(0, 0, 20);
      logInfo(`restartsGesture(startX=0, startY=0, touch...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0033 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0034
     * @tc.name      WindowManage_RestartsGesture_0034
     * @tc.desc      restartsGesture(startX=0, startY=0, touchType=25) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0034 begin`);
      const actual: boolean = restartsGesture(0, 0, 25);
      logInfo(`restartsGesture(startX=0, startY=0, touch...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0034 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0035
     * @tc.name      WindowManage_RestartsGesture_0035
     * @tc.desc      restartsGesture(startX=0, startY=0, touchType=9) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0035 begin`);
      const actual: boolean = restartsGesture(0, 0, 9);
      logInfo(`restartsGesture(startX=0, startY=0, touch...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0035 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0036
     * @tc.name      WindowManage_RestartsGesture_0036
     * @tc.desc      restartsGesture(startX=4, startY=75, touchType=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0036 begin`);
      const actual: boolean = restartsGesture(4, 75, 0);
      logInfo(`restartsGesture(startX=4, startY=75, touc...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0036 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0037
     * @tc.name      WindowManage_RestartsGesture_0037
     * @tc.desc      restartsGesture(startX=15, startY=-1, touchType=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0037 begin`);
      const actual: boolean = restartsGesture(15, -1, 0);
      logInfo(`restartsGesture(startX=15, startY=-1, tou...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0037 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0038
     * @tc.name      WindowManage_RestartsGesture_0038
     * @tc.desc      restartsGesture(startX=10, startY=-1, touchType=-1) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0038 begin`);
      const actual: boolean = restartsGesture(10, -1, -1);
      logInfo(`restartsGesture(startX=10, startY=-1, tou...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}RestartsGesture_0038 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0039
     * @tc.name      WindowManage_RestartsGesture_0039
     * @tc.desc      restartsGesture(startX=15, startY=25, touchType=10) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_RestartsGesture_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0039 begin`);
      const actual: boolean = restartsGesture(15, 25, 10);
      logInfo(`restartsGesture(startX=15, startY=25, tou...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}RestartsGesture_0039 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0040
     * @tc.name      WindowManage_RestartsGesture_0040
     * @tc.desc      restartsGesture(startX=-1, startY=15, touchType=3) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0040 begin`);
      const actual: boolean = restartsGesture(-1, 15, 3);
      logInfo(`restartsGesture(startX=-1, startY=15, tou...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}RestartsGesture_0040 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0041
     * @tc.name      WindowManage_RestartsGesture_0041
     * @tc.desc      restartsGesture(startX=0, startY=25, touchType=100) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0041 begin`);
      const actual: boolean = restartsGesture(0, 25, 100);
      logInfo(`restartsGesture(startX=0, startY=25, touc...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0041 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0042
     * @tc.name      WindowManage_RestartsGesture_0042
     * @tc.desc      restartsGesture(startX=3, startY=15, touchType=5) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_RestartsGesture_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0042 begin`);
      const actual: boolean = restartsGesture(3, 15, 5);
      logInfo(`restartsGesture(startX=3, startY=15, touc...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}RestartsGesture_0042 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0043
     * @tc.name      WindowManage_RestartsGesture_0043
     * @tc.desc      restartsGesture(startX=10, startY=3, touchType=100) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_RestartsGesture_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0043 begin`);
      const actual: boolean = restartsGesture(10, 3, 100);
      logInfo(`restartsGesture(startX=10, startY=3, touc...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}RestartsGesture_0043 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0044
     * @tc.name      WindowManage_RestartsGesture_0044
     * @tc.desc      restartsGesture(startX=25, startY=100, touchType=0) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0044 begin`);
      const actual: boolean = restartsGesture(25, 100, 0);
      logInfo(`restartsGesture(startX=25, startY=100, to...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0044 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0045
     * @tc.name      WindowManage_RestartsGesture_0045
     * @tc.desc      restartsGesture(startX=1, startY=20, touchType=5) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0045 begin`);
      const actual: boolean = restartsGesture(1, 20, 5);
      logInfo(`restartsGesture(startX=1, startY=20, touc...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}RestartsGesture_0045 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0046
     * @tc.name      WindowManage_RestartsGesture_0046
     * @tc.desc      restartsGesture(startX=2, startY=0, touchType=10) returns true
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0046 begin`);
      const actual: boolean = restartsGesture(2, 0, 10);
      logInfo(`restartsGesture(startX=2, startY=0, touch...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}RestartsGesture_0046 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0047
     * @tc.name      WindowManage_RestartsGesture_0047
     * @tc.desc      restartsGesture(startX=1, startY=20, touchType=10) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0047 begin`);
      const actual: boolean = restartsGesture(1, 20, 10);
      logInfo(`restartsGesture(startX=1, startY=20, touc...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}RestartsGesture_0047 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0048
     * @tc.name      WindowManage_RestartsGesture_0048
     * @tc.desc      restartsGesture(startX=4, startY=-1, touchType=15) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_RestartsGesture_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0048 begin`);
      const actual: boolean = restartsGesture(4, -1, 15);
      logInfo(`restartsGesture(startX=4, startY=-1, touc...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}RestartsGesture_0048 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0049
     * @tc.name      WindowManage_RestartsGesture_0049
     * @tc.desc      restartsGesture(startX=25, startY=100, touchType=2) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_RestartsGesture_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0049 begin`);
      const actual: boolean = restartsGesture(25, 100, 2);
      logInfo(`restartsGesture(startX=25, startY=100, to...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}RestartsGesture_0049 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_RESTARTS_GESTURE_0050
     * @tc.name      WindowManage_RestartsGesture_0050
     * @tc.desc      restartsGesture(startX=4, startY=10, touchType=9) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_RestartsGesture_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}RestartsGesture_0050 begin`);
      const actual: boolean = restartsGesture(4, 10, 9);
      logInfo(`restartsGesture(startX=4, startY=10, touc...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}RestartsGesture_0050 end`);
    });
  });
}
