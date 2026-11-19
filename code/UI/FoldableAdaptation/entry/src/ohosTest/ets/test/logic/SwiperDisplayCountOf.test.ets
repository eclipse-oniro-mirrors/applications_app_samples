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
import { swiperDisplayCountOf } from '../model/FoldLayoutLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FoldableAdaptation]';
const BUNDLE: string = 'FoldableAdaptation_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for swiperDisplayCountOf (75 cases). */
export default function swiperDisplayCountOfTest(): void {
  describe('SwiperDisplayCountOfTest', () => {
    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0001
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0001
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="sm", breakpoint="sm", stackSize=0) r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SwiperDisplayCountOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0001 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 'sm', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0001 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0002
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0002
     * @tc.desc      swiperDisplayCountOf(navMode=1, lastRoute="sm", enterRoute="sm", breakpoint="sm", stackSize=0) r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('SwiperDisplayCountOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0002 begin`);
      const actual: number = swiperDisplayCountOf(1, 'sm', 'sm', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=1, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0002 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0003
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0003
     * @tc.desc      swiperDisplayCountOf(navMode=3, lastRoute="Sample Title 123", enterRoute="smsm", breakpoint="abc...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0003 begin`);
      const actual: number = swiperDisplayCountOf(3, 'Sample Title 123', 'smsm', 'abc', -1);
      logInfo(`swiperDisplayCountOf(navMode=3, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(2);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0003 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0004
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0004
     * @tc.desc      swiperDisplayCountOf(navMode=-1, lastRoute="sm", enterRoute="sm", breakpoint="sm", stackSize=0) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0004 begin`);
      const actual: number = swiperDisplayCountOf(-1, 'sm', 'sm', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=-1, lastRout...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0004 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0005
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0005
     * @tc.desc      swiperDisplayCountOf(navMode=2, lastRoute="sm", enterRoute="sm", breakpoint="sm", stackSize=0) r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0005 begin`);
      const actual: number = swiperDisplayCountOf(2, 'sm', 'sm', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=2, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0005 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0006
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0006
     * @tc.desc      swiperDisplayCountOf(navMode=3, lastRoute="sm", enterRoute="sm", breakpoint="sm", stackSize=0) r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0006 begin`);
      const actual: number = swiperDisplayCountOf(3, 'sm', 'sm', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=3, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0006 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0007
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0007
     * @tc.desc      swiperDisplayCountOf(navMode=4, lastRoute="sm", enterRoute="sm", breakpoint="sm", stackSize=0) r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0007 begin`);
      const actual: number = swiperDisplayCountOf(4, 'sm', 'sm', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=4, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0007 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0008
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0008
     * @tc.desc      swiperDisplayCountOf(navMode=10, lastRoute="sm", enterRoute="sm", breakpoint="sm", stackSize=0) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0008 begin`);
      const actual: number = swiperDisplayCountOf(10, 'sm', 'sm', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=10, lastRout...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0008 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0009
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0009
     * @tc.desc      swiperDisplayCountOf(navMode=100, lastRoute="sm", enterRoute="sm", breakpoint="sm", stackSize=0)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0009 begin`);
      const actual: number = swiperDisplayCountOf(100, 'sm', 'sm', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=100, lastRou...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0009 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0010
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0010
     * @tc.desc      swiperDisplayCountOf(navMode=5, lastRoute="sm", enterRoute="sm", breakpoint="sm", stackSize=0) r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0010 begin`);
      const actual: number = swiperDisplayCountOf(5, 'sm', 'sm', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=5, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0010 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0011
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0011
     * @tc.desc      swiperDisplayCountOf(navMode=15, lastRoute="sm", enterRoute="sm", breakpoint="sm", stackSize=0) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0011 begin`);
      const actual: number = swiperDisplayCountOf(15, 'sm', 'sm', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=15, lastRout...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0011 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0012
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0012
     * @tc.desc      swiperDisplayCountOf(navMode=20, lastRoute="sm", enterRoute="sm", breakpoint="sm", stackSize=0) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0012 begin`);
      const actual: number = swiperDisplayCountOf(20, 'sm', 'sm', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=20, lastRout...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0012 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0013
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0013
     * @tc.desc      swiperDisplayCountOf(navMode=25, lastRoute="sm", enterRoute="sm", breakpoint="sm", stackSize=0) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0013 begin`);
      const actual: number = swiperDisplayCountOf(25, 'sm', 'sm', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=25, lastRout...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0013 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0014
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0014
     * @tc.desc      swiperDisplayCountOf(navMode=30, lastRoute="sm", enterRoute="sm", breakpoint="sm", stackSize=0) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0014 begin`);
      const actual: number = swiperDisplayCountOf(30, 'sm', 'sm', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=30, lastRout...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0014 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0015
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0015
     * @tc.desc      swiperDisplayCountOf(navMode=35, lastRoute="sm", enterRoute="sm", breakpoint="sm", stackSize=0) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0015 begin`);
      const actual: number = swiperDisplayCountOf(35, 'sm', 'sm', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=35, lastRout...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0015 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0016
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0016
     * @tc.desc      swiperDisplayCountOf(navMode=40, lastRoute="sm", enterRoute="sm", breakpoint="sm", stackSize=0) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0016 begin`);
      const actual: number = swiperDisplayCountOf(40, 'sm', 'sm', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=40, lastRout...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0016 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0017
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0017
     * @tc.desc      swiperDisplayCountOf(navMode=70, lastRoute="sm", enterRoute="sm", breakpoint="sm", stackSize=0) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0017 begin`);
      const actual: number = swiperDisplayCountOf(70, 'sm', 'sm', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=70, lastRout...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0017 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0018
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0018
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="SM", enterRoute="sm", breakpoint="sm", stackSize=0) r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SwiperDisplayCountOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0018 begin`);
      const actual: number = swiperDisplayCountOf(0, 'SM', 'sm', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0018 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0019
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0019
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="s", enterRoute="sm", breakpoint="sm", stackSize=0) re...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SwiperDisplayCountOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0019 begin`);
      const actual: number = swiperDisplayCountOf(0, 's', 'sm', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0019 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0020
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0020
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="smx", enterRoute="sm", breakpoint="sm", stackSize=0) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SwiperDisplayCountOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0020 begin`);
      const actual: number = swiperDisplayCountOf(0, 'smx', 'sm', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0020 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0021
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0021
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="Hello", enterRoute="sm", breakpoint="sm", stackSize=0...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0021 begin`);
      const actual: number = swiperDisplayCountOf(0, 'Hello', 'sm', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0021 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0022
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0022
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="hello world", enterRoute="sm", breakpoint="sm", stack...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0022 begin`);
      const actual: number = swiperDisplayCountOf(0, 'hello world', 'sm', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0022 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0023
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0023
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="", enterRoute="sm", breakpoint="sm", stackSize=0) ret...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SwiperDisplayCountOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0023 begin`);
      const actual: number = swiperDisplayCountOf(0, '', 'sm', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0023 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0024
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0024
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute=" ", enterRoute="sm", breakpoint="sm", stackSize=0) re...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0024 begin`);
      const actual: number = swiperDisplayCountOf(0, ' ', 'sm', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0024 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0025
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0025
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="A", enterRoute="sm", breakpoint="sm", stackSize=0) re...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0025 begin`);
      const actual: number = swiperDisplayCountOf(0, 'A', 'sm', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0025 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0026
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0026
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="Sample Title 123", enterRoute="sm", breakpoint="sm", ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0026 begin`);
      const actual: number = swiperDisplayCountOf(0, 'Sample Title 123', 'sm', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0026 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0027
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0027
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="??", enterRoute="sm", breakpoint="sm", stackSize=0) r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0027 begin`);
      const actual: number = swiperDisplayCountOf(0, '\u4e2d\u6587', 'sm', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0027 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0028
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0028
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="a", enterRoute="sm", breakpoint="sm", stackSize=0) re...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0028 begin`);
      const actual: number = swiperDisplayCountOf(0, 'a', 'sm', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0028 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0029
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0029
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="abc", enterRoute="sm", breakpoint="sm", stackSize=0) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0029 begin`);
      const actual: number = swiperDisplayCountOf(0, 'abc', 'sm', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0029 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0030
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0030
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="Hello World", enterRoute="sm", breakpoint="sm", stack...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0030 begin`);
      const actual: number = swiperDisplayCountOf(0, 'Hello World', 'sm', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0030 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0031
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0031
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="SM", breakpoint="sm", stackSize=0) r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SwiperDisplayCountOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0031 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 'SM', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0031 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0032
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0032
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="s", breakpoint="sm", stackSize=0) re...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SwiperDisplayCountOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0032 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 's', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0032 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0033
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0033
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="smx", breakpoint="sm", stackSize=0) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SwiperDisplayCountOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0033 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 'smx', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0033 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0034
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0034
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="", breakpoint="sm", stackSize=0) ret...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SwiperDisplayCountOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0034 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', '', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0034 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0035
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0035
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="a", breakpoint="sm", stackSize=0) re...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0035 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 'a', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0035 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0036
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0036
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="abc", breakpoint="sm", stackSize=0) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0036 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 'abc', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0036 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0037
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0037
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="Hello World", breakpoint="sm", stack...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0037 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 'Hello World', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0037 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0038
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0038
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute=" ", breakpoint="sm", stackSize=0) re...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0038 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', ' ', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0038 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0039
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0039
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="123", breakpoint="sm", stackSize=0) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0039 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', '123', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0039 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0040
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0040
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute=" sm ", breakpoint="sm", stackSize=0)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SwiperDisplayCountOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0040 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', ' sm ', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0040 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0041
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0041
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="smsm", breakpoint="sm", stackSize=0)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0041 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 'smsm', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0041 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0042
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0042
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="sm_1", breakpoint="sm", stackSize=0)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0042 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 'sm_1', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0042 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0043
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0043
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="xsm", breakpoint="sm", stackSize=0) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SwiperDisplayCountOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0043 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 'xsm', 'sm', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0043 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0044
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0044
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="sm", breakpoint="SM", stackSize=0) r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SwiperDisplayCountOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0044 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 'sm', 'SM', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0044 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0045
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0045
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="sm", breakpoint="s", stackSize=0) re...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SwiperDisplayCountOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0045 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 'sm', 's', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0045 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0046
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0046
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="sm", breakpoint="smx", stackSize=0) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SwiperDisplayCountOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0046 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 'sm', 'smx', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0046 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0047
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0047
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="sm", breakpoint="", stackSize=0) ret...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SwiperDisplayCountOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0047 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 'sm', '', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0047 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0048
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0048
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="sm", breakpoint="a", stackSize=0) re...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0048 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 'sm', 'a', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0048 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0049
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0049
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="sm", breakpoint="abc", stackSize=0) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0049 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 'sm', 'abc', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0049 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0050
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0050
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="sm", breakpoint="Hello World", stack...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0050 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 'sm', 'Hello World', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0050 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0051
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0051
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="sm", breakpoint=" ", stackSize=0) re...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0051 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 'sm', ' ', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0051 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0052
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0052
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="sm", breakpoint="123", stackSize=0) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0052 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 'sm', '123', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0052 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0053
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0053
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="sm", breakpoint=" sm ", stackSize=0)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SwiperDisplayCountOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0053 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 'sm', ' sm ', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0053 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0054
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0054
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="sm", breakpoint="smsm", stackSize=0)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0054 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 'sm', 'smsm', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0054 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0055
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0055
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="sm", breakpoint="sm_1", stackSize=0)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0055 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 'sm', 'sm_1', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0055 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0056
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0056
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="sm", breakpoint="xsm", stackSize=0) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SwiperDisplayCountOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0056 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 'sm', 'xsm', 0);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0056 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0057
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0057
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="sm", breakpoint="sm", stackSize=1) r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0057 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 'sm', 'sm', 1);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0057 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0058
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0058
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="sm", breakpoint="sm", stackSize=-1) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0058 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 'sm', 'sm', -1);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0058 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0059
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0059
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="sm", breakpoint="sm", stackSize=2) r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0059 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 'sm', 'sm', 2);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0059 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0060
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0060
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="sm", breakpoint="sm", stackSize=3) r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0060 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 'sm', 'sm', 3);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0060 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0061
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0061
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="sm", breakpoint="sm", stackSize=4) r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0061 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 'sm', 'sm', 4);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0061 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0062
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0062
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="sm", breakpoint="sm", stackSize=5) r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0062 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 'sm', 'sm', 5);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0062 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0063
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0063
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="sm", breakpoint="sm", stackSize=10) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0063 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 'sm', 'sm', 10);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0063 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0064
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0064
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="sm", breakpoint="sm", stackSize=100)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0064 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 'sm', 'sm', 100);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0064 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0065
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0065
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="sm", breakpoint="sm", stackSize=15) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0065 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 'sm', 'sm', 15);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0065 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0066
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0066
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="sm", breakpoint="sm", stackSize=20) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0066 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 'sm', 'sm', 20);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0066 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0067
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0067
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="sm", breakpoint="sm", stackSize=25) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0067 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 'sm', 'sm', 25);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0067 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0068
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0068
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="sm", breakpoint="sm", stackSize=30) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0068 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 'sm', 'sm', 30);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0068 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0069
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0069
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="sm", breakpoint="sm", stackSize=35) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0069 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 'sm', 'sm', 35);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0069 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0070
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0070
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="sm", breakpoint="sm", stackSize=159)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0070 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 'sm', 'sm', 159);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0070 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0071
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0071
     * @tc.desc      swiperDisplayCountOf(navMode=0, lastRoute="sm", enterRoute="sm", breakpoint="sm", stackSize=-18)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SwiperDisplayCountOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0071 begin`);
      const actual: number = swiperDisplayCountOf(0, 'sm', 'sm', 'sm', -18);
      logInfo(`swiperDisplayCountOf(navMode=0, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0071 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0072
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0072
     * @tc.desc      swiperDisplayCountOf(navMode=30, lastRoute="sm", enterRoute="sm", breakpoint="abc", stackSize=10...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('SwiperDisplayCountOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0072 begin`);
      const actual: number = swiperDisplayCountOf(30, 'sm', 'sm', 'abc', 100);
      logInfo(`swiperDisplayCountOf(navMode=30, lastRout...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0072 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0073
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0073
     * @tc.desc      swiperDisplayCountOf(navMode=35, lastRoute="a", enterRoute=" ", breakpoint="smsm", stackSize=0) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('SwiperDisplayCountOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0073 begin`);
      const actual: number = swiperDisplayCountOf(35, 'a', ' ', 'smsm', 0);
      logInfo(`swiperDisplayCountOf(navMode=35, lastRout...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0073 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0074
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0074
     * @tc.desc      swiperDisplayCountOf(navMode=30, lastRoute="??", enterRoute="", breakpoint="", stackSize=100) re...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SwiperDisplayCountOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0074 begin`);
      const actual: number = swiperDisplayCountOf(30, '\u4e2d\u6587', '', '', 100);
      logInfo(`swiperDisplayCountOf(navMode=30, lastRout...: actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0074 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_SWIPER_DISPLAY_COUNT_OF_0075
     * @tc.name      FoldableAdaptation_SwiperDisplayCountOf_0075
     * @tc.desc      swiperDisplayCountOf(navMode=1, lastRoute="Hello", enterRoute="s", breakpoint="smx", stackSize=4...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('SwiperDisplayCountOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0075 begin`);
      const actual: number = swiperDisplayCountOf(1, 'Hello', 's', 'smx', 4);
      logInfo(`swiperDisplayCountOf(navMode=1, lastRoute...: actual=${actual}`);
      expect(actual).assertEqual(1);
      logInfo(`${BUNDLE}SwiperDisplayCountOf_0075 end`);
    });
  });
}
