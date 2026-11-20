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
import { insideBounds } from '../model/WindowMoveLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_WindowManage]';
const BUNDLE: string = 'WindowManage_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for insideBounds (50 cases). */
export default function insideBoundsTest(): void {
  describe('InsideBoundsTest', (): void => {
    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0001
     * @tc.name      WindowManage_InsideBounds_0001
     * @tc.desc      insideBounds(endX=0, endY=0, windowWidth=0, windowHeight=0, topHeight=0, density=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowManage_InsideBounds_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0001 begin`);
      const actual: boolean = insideBounds(0, 0, 0, 0, 0, 0);
      logInfo(`insideBounds(endX=0, endY=0, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0001 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0002
     * @tc.name      WindowManage_InsideBounds_0002
     * @tc.desc      insideBounds(endX=2, endY=0, windowWidth=0, windowHeight=100, topHeight=-1, density=-1) returns ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('WindowManage_InsideBounds_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0002 begin`);
      const actual: boolean = insideBounds(2, 0, 0, 100, -1, -1);
      logInfo(`insideBounds(endX=2, endY=0, windowWidth=...: actual=${actual}`);
      expect(actual).assertTrue();
      logInfo(`${BUNDLE}InsideBounds_0002 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0003
     * @tc.name      WindowManage_InsideBounds_0003
     * @tc.desc      insideBounds(endX=-1, endY=0, windowWidth=0, windowHeight=0, topHeight=0, density=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0003 begin`);
      const actual: boolean = insideBounds(-1, 0, 0, 0, 0, 0);
      logInfo(`insideBounds(endX=-1, endY=0, windowWidth...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0003 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0004
     * @tc.name      WindowManage_InsideBounds_0004
     * @tc.desc      insideBounds(endX=1, endY=0, windowWidth=0, windowHeight=0, topHeight=0, density=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0004 begin`);
      const actual: boolean = insideBounds(1, 0, 0, 0, 0, 0);
      logInfo(`insideBounds(endX=1, endY=0, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0004 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0005
     * @tc.name      WindowManage_InsideBounds_0005
     * @tc.desc      insideBounds(endX=2, endY=0, windowWidth=0, windowHeight=0, topHeight=0, density=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0005 begin`);
      const actual: boolean = insideBounds(2, 0, 0, 0, 0, 0);
      logInfo(`insideBounds(endX=2, endY=0, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0005 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0006
     * @tc.name      WindowManage_InsideBounds_0006
     * @tc.desc      insideBounds(endX=3, endY=0, windowWidth=0, windowHeight=0, topHeight=0, density=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0006 begin`);
      const actual: boolean = insideBounds(3, 0, 0, 0, 0, 0);
      logInfo(`insideBounds(endX=3, endY=0, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0006 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0007
     * @tc.name      WindowManage_InsideBounds_0007
     * @tc.desc      insideBounds(endX=10, endY=0, windowWidth=0, windowHeight=0, topHeight=0, density=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0007 begin`);
      const actual: boolean = insideBounds(10, 0, 0, 0, 0, 0);
      logInfo(`insideBounds(endX=10, endY=0, windowWidth...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0007 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0008
     * @tc.name      WindowManage_InsideBounds_0008
     * @tc.desc      insideBounds(endX=100, endY=0, windowWidth=0, windowHeight=0, topHeight=0, density=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0008 begin`);
      const actual: boolean = insideBounds(100, 0, 0, 0, 0, 0);
      logInfo(`insideBounds(endX=100, endY=0, windowWidt...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0008 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0009
     * @tc.name      WindowManage_InsideBounds_0009
     * @tc.desc      insideBounds(endX=5, endY=0, windowWidth=0, windowHeight=0, topHeight=0, density=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0009 begin`);
      const actual: boolean = insideBounds(5, 0, 0, 0, 0, 0);
      logInfo(`insideBounds(endX=5, endY=0, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0009 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0010
     * @tc.name      WindowManage_InsideBounds_0010
     * @tc.desc      insideBounds(endX=0, endY=-1, windowWidth=0, windowHeight=0, topHeight=0, density=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0010 begin`);
      const actual: boolean = insideBounds(0, -1, 0, 0, 0, 0);
      logInfo(`insideBounds(endX=0, endY=-1, windowWidth...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0010 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0011
     * @tc.name      WindowManage_InsideBounds_0011
     * @tc.desc      insideBounds(endX=0, endY=1, windowWidth=0, windowHeight=0, topHeight=0, density=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0011 begin`);
      const actual: boolean = insideBounds(0, 1, 0, 0, 0, 0);
      logInfo(`insideBounds(endX=0, endY=1, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0011 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0012
     * @tc.name      WindowManage_InsideBounds_0012
     * @tc.desc      insideBounds(endX=0, endY=2, windowWidth=0, windowHeight=0, topHeight=0, density=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0012 begin`);
      const actual: boolean = insideBounds(0, 2, 0, 0, 0, 0);
      logInfo(`insideBounds(endX=0, endY=2, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0012 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0013
     * @tc.name      WindowManage_InsideBounds_0013
     * @tc.desc      insideBounds(endX=0, endY=3, windowWidth=0, windowHeight=0, topHeight=0, density=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0013 begin`);
      const actual: boolean = insideBounds(0, 3, 0, 0, 0, 0);
      logInfo(`insideBounds(endX=0, endY=3, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0013 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0014
     * @tc.name      WindowManage_InsideBounds_0014
     * @tc.desc      insideBounds(endX=0, endY=10, windowWidth=0, windowHeight=0, topHeight=0, density=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0014 begin`);
      const actual: boolean = insideBounds(0, 10, 0, 0, 0, 0);
      logInfo(`insideBounds(endX=0, endY=10, windowWidth...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0014 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0015
     * @tc.name      WindowManage_InsideBounds_0015
     * @tc.desc      insideBounds(endX=0, endY=100, windowWidth=0, windowHeight=0, topHeight=0, density=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0015 begin`);
      const actual: boolean = insideBounds(0, 100, 0, 0, 0, 0);
      logInfo(`insideBounds(endX=0, endY=100, windowWidt...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0015 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0016
     * @tc.name      WindowManage_InsideBounds_0016
     * @tc.desc      insideBounds(endX=0, endY=5, windowWidth=0, windowHeight=0, topHeight=0, density=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0016 begin`);
      const actual: boolean = insideBounds(0, 5, 0, 0, 0, 0);
      logInfo(`insideBounds(endX=0, endY=5, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0016 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0017
     * @tc.name      WindowManage_InsideBounds_0017
     * @tc.desc      insideBounds(endX=0, endY=0, windowWidth=1, windowHeight=0, topHeight=0, density=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0017 begin`);
      const actual: boolean = insideBounds(0, 0, 1, 0, 0, 0);
      logInfo(`insideBounds(endX=0, endY=0, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0017 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0018
     * @tc.name      WindowManage_InsideBounds_0018
     * @tc.desc      insideBounds(endX=0, endY=0, windowWidth=-1, windowHeight=0, topHeight=0, density=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0018 begin`);
      const actual: boolean = insideBounds(0, 0, -1, 0, 0, 0);
      logInfo(`insideBounds(endX=0, endY=0, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0018 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0019
     * @tc.name      WindowManage_InsideBounds_0019
     * @tc.desc      insideBounds(endX=0, endY=0, windowWidth=100, windowHeight=0, topHeight=0, density=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0019 begin`);
      const actual: boolean = insideBounds(0, 0, 100, 0, 0, 0);
      logInfo(`insideBounds(endX=0, endY=0, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0019 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0020
     * @tc.name      WindowManage_InsideBounds_0020
     * @tc.desc      insideBounds(endX=0, endY=0, windowWidth=360, windowHeight=0, topHeight=0, density=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0020 begin`);
      const actual: boolean = insideBounds(0, 0, 360, 0, 0, 0);
      logInfo(`insideBounds(endX=0, endY=0, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0020 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0021
     * @tc.name      WindowManage_InsideBounds_0021
     * @tc.desc      insideBounds(endX=0, endY=0, windowWidth=720, windowHeight=0, topHeight=0, density=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0021 begin`);
      const actual: boolean = insideBounds(0, 0, 720, 0, 0, 0);
      logInfo(`insideBounds(endX=0, endY=0, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0021 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0022
     * @tc.name      WindowManage_InsideBounds_0022
     * @tc.desc      insideBounds(endX=0, endY=0, windowWidth=1080, windowHeight=0, topHeight=0, density=0) returns f...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0022 begin`);
      const actual: boolean = insideBounds(0, 0, 1080, 0, 0, 0);
      logInfo(`insideBounds(endX=0, endY=0, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0022 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0023
     * @tc.name      WindowManage_InsideBounds_0023
     * @tc.desc      insideBounds(endX=0, endY=0, windowWidth=1920, windowHeight=0, topHeight=0, density=0) returns f...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0023 begin`);
      const actual: boolean = insideBounds(0, 0, 1920, 0, 0, 0);
      logInfo(`insideBounds(endX=0, endY=0, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0023 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0024
     * @tc.name      WindowManage_InsideBounds_0024
     * @tc.desc      insideBounds(endX=0, endY=0, windowWidth=0, windowHeight=1, topHeight=0, density=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0024 begin`);
      const actual: boolean = insideBounds(0, 0, 0, 1, 0, 0);
      logInfo(`insideBounds(endX=0, endY=0, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0024 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0025
     * @tc.name      WindowManage_InsideBounds_0025
     * @tc.desc      insideBounds(endX=0, endY=0, windowWidth=0, windowHeight=-1, topHeight=0, density=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0025 begin`);
      const actual: boolean = insideBounds(0, 0, 0, -1, 0, 0);
      logInfo(`insideBounds(endX=0, endY=0, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0025 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0026
     * @tc.name      WindowManage_InsideBounds_0026
     * @tc.desc      insideBounds(endX=0, endY=0, windowWidth=0, windowHeight=100, topHeight=0, density=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0026 begin`);
      const actual: boolean = insideBounds(0, 0, 0, 100, 0, 0);
      logInfo(`insideBounds(endX=0, endY=0, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0026 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0027
     * @tc.name      WindowManage_InsideBounds_0027
     * @tc.desc      insideBounds(endX=0, endY=0, windowWidth=0, windowHeight=360, topHeight=0, density=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0027 begin`);
      const actual: boolean = insideBounds(0, 0, 0, 360, 0, 0);
      logInfo(`insideBounds(endX=0, endY=0, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0027 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0028
     * @tc.name      WindowManage_InsideBounds_0028
     * @tc.desc      insideBounds(endX=0, endY=0, windowWidth=0, windowHeight=720, topHeight=0, density=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0028 begin`);
      const actual: boolean = insideBounds(0, 0, 0, 720, 0, 0);
      logInfo(`insideBounds(endX=0, endY=0, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0028 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0029
     * @tc.name      WindowManage_InsideBounds_0029
     * @tc.desc      insideBounds(endX=0, endY=0, windowWidth=0, windowHeight=1080, topHeight=0, density=0) returns f...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0029 begin`);
      const actual: boolean = insideBounds(0, 0, 0, 1080, 0, 0);
      logInfo(`insideBounds(endX=0, endY=0, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0029 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0030
     * @tc.name      WindowManage_InsideBounds_0030
     * @tc.desc      insideBounds(endX=0, endY=0, windowWidth=0, windowHeight=1920, topHeight=0, density=0) returns f...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0030 begin`);
      const actual: boolean = insideBounds(0, 0, 0, 1920, 0, 0);
      logInfo(`insideBounds(endX=0, endY=0, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0030 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0031
     * @tc.name      WindowManage_InsideBounds_0031
     * @tc.desc      insideBounds(endX=0, endY=0, windowWidth=0, windowHeight=0, topHeight=1, density=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0031 begin`);
      const actual: boolean = insideBounds(0, 0, 0, 0, 1, 0);
      logInfo(`insideBounds(endX=0, endY=0, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0031 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0032
     * @tc.name      WindowManage_InsideBounds_0032
     * @tc.desc      insideBounds(endX=0, endY=0, windowWidth=0, windowHeight=0, topHeight=-1, density=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0032 begin`);
      const actual: boolean = insideBounds(0, 0, 0, 0, -1, 0);
      logInfo(`insideBounds(endX=0, endY=0, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0032 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0033
     * @tc.name      WindowManage_InsideBounds_0033
     * @tc.desc      insideBounds(endX=0, endY=0, windowWidth=0, windowHeight=0, topHeight=100, density=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0033 begin`);
      const actual: boolean = insideBounds(0, 0, 0, 0, 100, 0);
      logInfo(`insideBounds(endX=0, endY=0, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0033 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0034
     * @tc.name      WindowManage_InsideBounds_0034
     * @tc.desc      insideBounds(endX=0, endY=0, windowWidth=0, windowHeight=0, topHeight=360, density=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0034 begin`);
      const actual: boolean = insideBounds(0, 0, 0, 0, 360, 0);
      logInfo(`insideBounds(endX=0, endY=0, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0034 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0035
     * @tc.name      WindowManage_InsideBounds_0035
     * @tc.desc      insideBounds(endX=0, endY=0, windowWidth=0, windowHeight=0, topHeight=720, density=0) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0035 begin`);
      const actual: boolean = insideBounds(0, 0, 0, 0, 720, 0);
      logInfo(`insideBounds(endX=0, endY=0, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0035 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0036
     * @tc.name      WindowManage_InsideBounds_0036
     * @tc.desc      insideBounds(endX=0, endY=0, windowWidth=0, windowHeight=0, topHeight=1080, density=0) returns f...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0036 begin`);
      const actual: boolean = insideBounds(0, 0, 0, 0, 1080, 0);
      logInfo(`insideBounds(endX=0, endY=0, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0036 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0037
     * @tc.name      WindowManage_InsideBounds_0037
     * @tc.desc      insideBounds(endX=0, endY=0, windowWidth=0, windowHeight=0, topHeight=1920, density=0) returns f...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0037 begin`);
      const actual: boolean = insideBounds(0, 0, 0, 0, 1920, 0);
      logInfo(`insideBounds(endX=0, endY=0, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0037 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0038
     * @tc.name      WindowManage_InsideBounds_0038
     * @tc.desc      insideBounds(endX=0, endY=0, windowWidth=0, windowHeight=0, topHeight=0, density=-1) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0038 begin`);
      const actual: boolean = insideBounds(0, 0, 0, 0, 0, -1);
      logInfo(`insideBounds(endX=0, endY=0, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0038 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0039
     * @tc.name      WindowManage_InsideBounds_0039
     * @tc.desc      insideBounds(endX=0, endY=0, windowWidth=0, windowHeight=0, topHeight=0, density=1) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0039 begin`);
      const actual: boolean = insideBounds(0, 0, 0, 0, 0, 1);
      logInfo(`insideBounds(endX=0, endY=0, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0039 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0040
     * @tc.name      WindowManage_InsideBounds_0040
     * @tc.desc      insideBounds(endX=0, endY=0, windowWidth=0, windowHeight=0, topHeight=0, density=2) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0040 begin`);
      const actual: boolean = insideBounds(0, 0, 0, 0, 0, 2);
      logInfo(`insideBounds(endX=0, endY=0, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0040 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0041
     * @tc.name      WindowManage_InsideBounds_0041
     * @tc.desc      insideBounds(endX=0, endY=0, windowWidth=0, windowHeight=0, topHeight=0, density=3) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0041 begin`);
      const actual: boolean = insideBounds(0, 0, 0, 0, 0, 3);
      logInfo(`insideBounds(endX=0, endY=0, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0041 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0042
     * @tc.name      WindowManage_InsideBounds_0042
     * @tc.desc      insideBounds(endX=0, endY=0, windowWidth=0, windowHeight=0, topHeight=0, density=10) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0042 begin`);
      const actual: boolean = insideBounds(0, 0, 0, 0, 0, 10);
      logInfo(`insideBounds(endX=0, endY=0, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0042 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0043
     * @tc.name      WindowManage_InsideBounds_0043
     * @tc.desc      insideBounds(endX=0, endY=0, windowWidth=0, windowHeight=0, topHeight=0, density=100) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0043 begin`);
      const actual: boolean = insideBounds(0, 0, 0, 0, 0, 100);
      logInfo(`insideBounds(endX=0, endY=0, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0043 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0044
     * @tc.name      WindowManage_InsideBounds_0044
     * @tc.desc      insideBounds(endX=0, endY=0, windowWidth=0, windowHeight=0, topHeight=0, density=5) returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0044 begin`);
      const actual: boolean = insideBounds(0, 0, 0, 0, 0, 5);
      logInfo(`insideBounds(endX=0, endY=0, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0044 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0045
     * @tc.name      WindowManage_InsideBounds_0045
     * @tc.desc      insideBounds(endX=0, endY=3, windowWidth=-1, windowHeight=1080, topHeight=-1, density=100) retur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0045 begin`);
      const actual: boolean = insideBounds(0, 3, -1, 1080, -1, 100);
      logInfo(`insideBounds(endX=0, endY=3, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0045 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0046
     * @tc.name      WindowManage_InsideBounds_0046
     * @tc.desc      insideBounds(endX=1, endY=3, windowWidth=720, windowHeight=100, topHeight=1920, density=3) retur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0046 begin`);
      const actual: boolean = insideBounds(1, 3, 720, 100, 1920, 3);
      logInfo(`insideBounds(endX=1, endY=3, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0046 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0047
     * @tc.name      WindowManage_InsideBounds_0047
     * @tc.desc      insideBounds(endX=1, endY=5, windowWidth=1920, windowHeight=100, topHeight=1080, density=3) retu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0047 begin`);
      const actual: boolean = insideBounds(1, 5, 1920, 100, 1080, 3);
      logInfo(`insideBounds(endX=1, endY=5, windowWidth=...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0047 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0048
     * @tc.name      WindowManage_InsideBounds_0048
     * @tc.desc      insideBounds(endX=100, endY=10, windowWidth=100, windowHeight=0, topHeight=360, density=10) retu...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('WindowManage_InsideBounds_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0048 begin`);
      const actual: boolean = insideBounds(100, 10, 100, 0, 360, 10);
      logInfo(`insideBounds(endX=100, endY=10, windowWid...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0048 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0049
     * @tc.name      WindowManage_InsideBounds_0049
     * @tc.desc      insideBounds(endX=-1, endY=3, windowWidth=100, windowHeight=1080, topHeight=-1, density=1) retur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0049 begin`);
      const actual: boolean = insideBounds(-1, 3, 100, 1080, -1, 1);
      logInfo(`insideBounds(endX=-1, endY=3, windowWidth...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0049 end`);
    });

    /**
     * @tc.number    SUB_WINDOWMANAGE_INSIDE_BOUNDS_0050
     * @tc.name      WindowManage_InsideBounds_0050
     * @tc.desc      insideBounds(endX=0, endY=-1, windowWidth=360, windowHeight=360, topHeight=0, density=0) returns...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('WindowManage_InsideBounds_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, (): void => {
      logInfo(`${BUNDLE}InsideBounds_0050 begin`);
      const actual: boolean = insideBounds(0, -1, 360, 360, 0, 0);
      logInfo(`insideBounds(endX=0, endY=-1, windowWidth...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}InsideBounds_0050 end`);
    });
  });
}
