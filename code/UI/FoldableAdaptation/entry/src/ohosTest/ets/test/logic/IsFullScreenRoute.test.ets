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
import { isFullScreenRoute } from '../model/FoldLayoutLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FoldableAdaptation]';
const BUNDLE: string = 'FoldableAdaptation_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for isFullScreenRoute (30 cases). */
export default function isFullScreenRouteTest(): void {
  describe('IsFullScreenRouteTest', () => {
    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_IS_FULL_SCREEN_ROUTE_0001
     * @tc.name      FoldableAdaptation_IsFullScreenRoute_0001
     * @tc.desc      isFullScreenRoute(routeName="Hello") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('IsFullScreenRoute_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IsFullScreenRoute_0001 begin`);
      const actual: boolean = isFullScreenRoute('Hello');
      logInfo(`isFullScreenRoute(routeName="Hello"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFullScreenRoute_0001 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_IS_FULL_SCREEN_ROUTE_0002
     * @tc.name      FoldableAdaptation_IsFullScreenRoute_0002
     * @tc.desc      isFullScreenRoute(routeName="hello world") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('IsFullScreenRoute_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}IsFullScreenRoute_0002 begin`);
      const actual: boolean = isFullScreenRoute('hello world');
      logInfo(`isFullScreenRoute(routeName="hello world"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFullScreenRoute_0002 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_IS_FULL_SCREEN_ROUTE_0003
     * @tc.name      FoldableAdaptation_IsFullScreenRoute_0003
     * @tc.desc      isFullScreenRoute(routeName="") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('IsFullScreenRoute_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsFullScreenRoute_0003 begin`);
      const actual: boolean = isFullScreenRoute('');
      logInfo(`isFullScreenRoute(routeName=""): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFullScreenRoute_0003 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_IS_FULL_SCREEN_ROUTE_0004
     * @tc.name      FoldableAdaptation_IsFullScreenRoute_0004
     * @tc.desc      isFullScreenRoute(routeName=" ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('IsFullScreenRoute_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFullScreenRoute_0004 begin`);
      const actual: boolean = isFullScreenRoute(' ');
      logInfo(`isFullScreenRoute(routeName=" "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFullScreenRoute_0004 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_IS_FULL_SCREEN_ROUTE_0005
     * @tc.name      FoldableAdaptation_IsFullScreenRoute_0005
     * @tc.desc      isFullScreenRoute(routeName="A") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('IsFullScreenRoute_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFullScreenRoute_0005 begin`);
      const actual: boolean = isFullScreenRoute('A');
      logInfo(`isFullScreenRoute(routeName="A"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFullScreenRoute_0005 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_IS_FULL_SCREEN_ROUTE_0006
     * @tc.name      FoldableAdaptation_IsFullScreenRoute_0006
     * @tc.desc      isFullScreenRoute(routeName="Sample Title 123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('IsFullScreenRoute_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFullScreenRoute_0006 begin`);
      const actual: boolean = isFullScreenRoute('Sample Title 123');
      logInfo(`isFullScreenRoute(routeName="Sample Title...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFullScreenRoute_0006 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_IS_FULL_SCREEN_ROUTE_0007
     * @tc.name      FoldableAdaptation_IsFullScreenRoute_0007
     * @tc.desc      isFullScreenRoute(routeName="??") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('IsFullScreenRoute_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFullScreenRoute_0007 begin`);
      const actual: boolean = isFullScreenRoute('\u4e2d\u6587');
      logInfo(`isFullScreenRoute(routeName="??"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFullScreenRoute_0007 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_IS_FULL_SCREEN_ROUTE_0008
     * @tc.name      FoldableAdaptation_IsFullScreenRoute_0008
     * @tc.desc      isFullScreenRoute(routeName="a") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('IsFullScreenRoute_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFullScreenRoute_0008 begin`);
      const actual: boolean = isFullScreenRoute('a');
      logInfo(`isFullScreenRoute(routeName="a"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFullScreenRoute_0008 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_IS_FULL_SCREEN_ROUTE_0009
     * @tc.name      FoldableAdaptation_IsFullScreenRoute_0009
     * @tc.desc      isFullScreenRoute(routeName="abc") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('IsFullScreenRoute_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFullScreenRoute_0009 begin`);
      const actual: boolean = isFullScreenRoute('abc');
      logInfo(`isFullScreenRoute(routeName="abc"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFullScreenRoute_0009 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_IS_FULL_SCREEN_ROUTE_0010
     * @tc.name      FoldableAdaptation_IsFullScreenRoute_0010
     * @tc.desc      isFullScreenRoute(routeName="Hello World") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('IsFullScreenRoute_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFullScreenRoute_0010 begin`);
      const actual: boolean = isFullScreenRoute('Hello World');
      logInfo(`isFullScreenRoute(routeName="Hello World"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFullScreenRoute_0010 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_IS_FULL_SCREEN_ROUTE_0011
     * @tc.name      FoldableAdaptation_IsFullScreenRoute_0011
     * @tc.desc      isFullScreenRoute(routeName="123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('IsFullScreenRoute_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFullScreenRoute_0011 begin`);
      const actual: boolean = isFullScreenRoute('123');
      logInfo(`isFullScreenRoute(routeName="123"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFullScreenRoute_0011 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_IS_FULL_SCREEN_ROUTE_0012
     * @tc.name      FoldableAdaptation_IsFullScreenRoute_0012
     * @tc.desc      isFullScreenRoute(routeName=" Hello ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('IsFullScreenRoute_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsFullScreenRoute_0012 begin`);
      const actual: boolean = isFullScreenRoute(' Hello ');
      logInfo(`isFullScreenRoute(routeName=" Hello "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFullScreenRoute_0012 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_IS_FULL_SCREEN_ROUTE_0013
     * @tc.name      FoldableAdaptation_IsFullScreenRoute_0013
     * @tc.desc      isFullScreenRoute(routeName="HelloHello") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('IsFullScreenRoute_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFullScreenRoute_0013 begin`);
      const actual: boolean = isFullScreenRoute('HelloHello');
      logInfo(`isFullScreenRoute(routeName="HelloHello"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFullScreenRoute_0013 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_IS_FULL_SCREEN_ROUTE_0014
     * @tc.name      FoldableAdaptation_IsFullScreenRoute_0014
     * @tc.desc      isFullScreenRoute(routeName="Hello_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('IsFullScreenRoute_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFullScreenRoute_0014 begin`);
      const actual: boolean = isFullScreenRoute('Hello_1');
      logInfo(`isFullScreenRoute(routeName="Hello_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFullScreenRoute_0014 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_IS_FULL_SCREEN_ROUTE_0015
     * @tc.name      FoldableAdaptation_IsFullScreenRoute_0015
     * @tc.desc      isFullScreenRoute(routeName="xHello") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('IsFullScreenRoute_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsFullScreenRoute_0015 begin`);
      const actual: boolean = isFullScreenRoute('xHello');
      logInfo(`isFullScreenRoute(routeName="xHello"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFullScreenRoute_0015 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_IS_FULL_SCREEN_ROUTE_0016
     * @tc.name      FoldableAdaptation_IsFullScreenRoute_0016
     * @tc.desc      isFullScreenRoute(routeName=" hello world ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('IsFullScreenRoute_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsFullScreenRoute_0016 begin`);
      const actual: boolean = isFullScreenRoute(' hello world ');
      logInfo(`isFullScreenRoute(routeName=" hello world "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFullScreenRoute_0016 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_IS_FULL_SCREEN_ROUTE_0017
     * @tc.name      FoldableAdaptation_IsFullScreenRoute_0017
     * @tc.desc      isFullScreenRoute(routeName="hello worldhello world") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('IsFullScreenRoute_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFullScreenRoute_0017 begin`);
      const actual: boolean = isFullScreenRoute('hello worldhello world');
      logInfo(`isFullScreenRoute(routeName="hello worldh...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFullScreenRoute_0017 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_IS_FULL_SCREEN_ROUTE_0018
     * @tc.name      FoldableAdaptation_IsFullScreenRoute_0018
     * @tc.desc      isFullScreenRoute(routeName="hello world_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('IsFullScreenRoute_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFullScreenRoute_0018 begin`);
      const actual: boolean = isFullScreenRoute('hello world_1');
      logInfo(`isFullScreenRoute(routeName="hello world_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFullScreenRoute_0018 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_IS_FULL_SCREEN_ROUTE_0019
     * @tc.name      FoldableAdaptation_IsFullScreenRoute_0019
     * @tc.desc      isFullScreenRoute(routeName="xhello world") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('IsFullScreenRoute_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsFullScreenRoute_0019 begin`);
      const actual: boolean = isFullScreenRoute('xhello world');
      logInfo(`isFullScreenRoute(routeName="xhello world"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFullScreenRoute_0019 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_IS_FULL_SCREEN_ROUTE_0020
     * @tc.name      FoldableAdaptation_IsFullScreenRoute_0020
     * @tc.desc      isFullScreenRoute(routeName="   ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('IsFullScreenRoute_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsFullScreenRoute_0020 begin`);
      const actual: boolean = isFullScreenRoute('   ');
      logInfo(`isFullScreenRoute(routeName="   "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFullScreenRoute_0020 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_IS_FULL_SCREEN_ROUTE_0021
     * @tc.name      FoldableAdaptation_IsFullScreenRoute_0021
     * @tc.desc      isFullScreenRoute(routeName="  ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('IsFullScreenRoute_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFullScreenRoute_0021 begin`);
      const actual: boolean = isFullScreenRoute('  ');
      logInfo(`isFullScreenRoute(routeName="  "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFullScreenRoute_0021 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_IS_FULL_SCREEN_ROUTE_0022
     * @tc.name      FoldableAdaptation_IsFullScreenRoute_0022
     * @tc.desc      isFullScreenRoute(routeName=" _1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('IsFullScreenRoute_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFullScreenRoute_0022 begin`);
      const actual: boolean = isFullScreenRoute(' _1');
      logInfo(`isFullScreenRoute(routeName=" _1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFullScreenRoute_0022 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_IS_FULL_SCREEN_ROUTE_0023
     * @tc.name      FoldableAdaptation_IsFullScreenRoute_0023
     * @tc.desc      isFullScreenRoute(routeName="x ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('IsFullScreenRoute_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsFullScreenRoute_0023 begin`);
      const actual: boolean = isFullScreenRoute('x ');
      logInfo(`isFullScreenRoute(routeName="x "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFullScreenRoute_0023 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_IS_FULL_SCREEN_ROUTE_0024
     * @tc.name      FoldableAdaptation_IsFullScreenRoute_0024
     * @tc.desc      isFullScreenRoute(routeName=" A ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('IsFullScreenRoute_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsFullScreenRoute_0024 begin`);
      const actual: boolean = isFullScreenRoute(' A ');
      logInfo(`isFullScreenRoute(routeName=" A "): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFullScreenRoute_0024 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_IS_FULL_SCREEN_ROUTE_0025
     * @tc.name      FoldableAdaptation_IsFullScreenRoute_0025
     * @tc.desc      isFullScreenRoute(routeName="AA") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('IsFullScreenRoute_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFullScreenRoute_0025 begin`);
      const actual: boolean = isFullScreenRoute('AA');
      logInfo(`isFullScreenRoute(routeName="AA"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFullScreenRoute_0025 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_IS_FULL_SCREEN_ROUTE_0026
     * @tc.name      FoldableAdaptation_IsFullScreenRoute_0026
     * @tc.desc      isFullScreenRoute(routeName="A_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('IsFullScreenRoute_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFullScreenRoute_0026 begin`);
      const actual: boolean = isFullScreenRoute('A_1');
      logInfo(`isFullScreenRoute(routeName="A_1"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFullScreenRoute_0026 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_IS_FULL_SCREEN_ROUTE_0027
     * @tc.name      FoldableAdaptation_IsFullScreenRoute_0027
     * @tc.desc      isFullScreenRoute(routeName="xA") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('IsFullScreenRoute_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsFullScreenRoute_0027 begin`);
      const actual: boolean = isFullScreenRoute('xA');
      logInfo(`isFullScreenRoute(routeName="xA"): actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFullScreenRoute_0027 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_IS_FULL_SCREEN_ROUTE_0028
     * @tc.name      FoldableAdaptation_IsFullScreenRoute_0028
     * @tc.desc      isFullScreenRoute(routeName=" Sample Title 123 ") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('IsFullScreenRoute_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}IsFullScreenRoute_0028 begin`);
      const actual: boolean = isFullScreenRoute(' Sample Title 123 ');
      logInfo(`isFullScreenRoute(routeName=" Sample Titl...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFullScreenRoute_0028 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_IS_FULL_SCREEN_ROUTE_0029
     * @tc.name      FoldableAdaptation_IsFullScreenRoute_0029
     * @tc.desc      isFullScreenRoute(routeName="Sample Title 123Sample Title 123") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('IsFullScreenRoute_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFullScreenRoute_0029 begin`);
      const actual: boolean = isFullScreenRoute('Sample Title 123Sample Title 123');
      logInfo(`isFullScreenRoute(routeName="Sample Title...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFullScreenRoute_0029 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_IS_FULL_SCREEN_ROUTE_0030
     * @tc.name      FoldableAdaptation_IsFullScreenRoute_0030
     * @tc.desc      isFullScreenRoute(routeName="Sample Title 123_1") returns false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('IsFullScreenRoute_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}IsFullScreenRoute_0030 begin`);
      const actual: boolean = isFullScreenRoute('Sample Title 123_1');
      logInfo(`isFullScreenRoute(routeName="Sample Title...: actual=${actual}`);
      expect(actual).assertFalse();
      logInfo(`${BUNDLE}IsFullScreenRoute_0030 end`);
    });
  });
}
