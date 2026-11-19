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
import { navigationModeOf } from '../model/FoldLayoutLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FoldableAdaptation]';
const BUNDLE: string = 'FoldableAdaptation_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for navigationModeOf (75 cases). */
export default function navigationModeOfTest(): void {
  describe('NavigationModeOfTest', () => {
    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0001
     * @tc.name      FoldableAdaptation_NavigationModeOf_0001
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="Stack", breakpoint="Stack", stackSize...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NavigationModeOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0001 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'Stack', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0001 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0002
     * @tc.name      FoldableAdaptation_NavigationModeOf_0002
     * @tc.desc      navigationModeOf(navMode=1, lastRoute="Stack", enterRoute="Stack", breakpoint="Stack", stackSize...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('NavigationModeOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0002 begin`);
      const actual: string = navigationModeOf(1, 'Stack', 'Stack', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=1, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`${BUNDLE}NavigationModeOf_0002 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0003
     * @tc.name      FoldableAdaptation_NavigationModeOf_0003
     * @tc.desc      navigationModeOf(navMode=2, lastRoute="Stack", enterRoute="Stack", breakpoint="Stack", stackSize...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0003 begin`);
      const actual: string = navigationModeOf(2, 'Stack', 'Stack', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=2, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('Split');
      logInfo(`${BUNDLE}NavigationModeOf_0003 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0004
     * @tc.name      FoldableAdaptation_NavigationModeOf_0004
     * @tc.desc      navigationModeOf(navMode=-1, lastRoute="Stack", enterRoute="Stack", breakpoint="Stack", stackSiz...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0004 begin`);
      const actual: string = navigationModeOf(-1, 'Stack', 'Stack', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=-1, lastRoute="S...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0004 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0005
     * @tc.name      FoldableAdaptation_NavigationModeOf_0005
     * @tc.desc      navigationModeOf(navMode=3, lastRoute="Stack", enterRoute="Stack", breakpoint="Stack", stackSize...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0005 begin`);
      const actual: string = navigationModeOf(3, 'Stack', 'Stack', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=3, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('Stack');
      logInfo(`${BUNDLE}NavigationModeOf_0005 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0006
     * @tc.name      FoldableAdaptation_NavigationModeOf_0006
     * @tc.desc      navigationModeOf(navMode=4, lastRoute="Stack", enterRoute="Stack", breakpoint="Stack", stackSize...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0006 begin`);
      const actual: string = navigationModeOf(4, 'Stack', 'Stack', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=4, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0006 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0007
     * @tc.name      FoldableAdaptation_NavigationModeOf_0007
     * @tc.desc      navigationModeOf(navMode=10, lastRoute="Stack", enterRoute="Stack", breakpoint="Stack", stackSiz...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0007 begin`);
      const actual: string = navigationModeOf(10, 'Stack', 'Stack', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=10, lastRoute="S...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0007 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0008
     * @tc.name      FoldableAdaptation_NavigationModeOf_0008
     * @tc.desc      navigationModeOf(navMode=100, lastRoute="Stack", enterRoute="Stack", breakpoint="Stack", stackSi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0008 begin`);
      const actual: string = navigationModeOf(100, 'Stack', 'Stack', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=100, lastRoute="...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0008 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0009
     * @tc.name      FoldableAdaptation_NavigationModeOf_0009
     * @tc.desc      navigationModeOf(navMode=5, lastRoute="Stack", enterRoute="Stack", breakpoint="Stack", stackSize...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0009 begin`);
      const actual: string = navigationModeOf(5, 'Stack', 'Stack', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=5, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0009 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0010
     * @tc.name      FoldableAdaptation_NavigationModeOf_0010
     * @tc.desc      navigationModeOf(navMode=15, lastRoute="Stack", enterRoute="Stack", breakpoint="Stack", stackSiz...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0010 begin`);
      const actual: string = navigationModeOf(15, 'Stack', 'Stack', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=15, lastRoute="S...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0010 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0011
     * @tc.name      FoldableAdaptation_NavigationModeOf_0011
     * @tc.desc      navigationModeOf(navMode=20, lastRoute="Stack", enterRoute="Stack", breakpoint="Stack", stackSiz...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0011 begin`);
      const actual: string = navigationModeOf(20, 'Stack', 'Stack', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=20, lastRoute="S...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0011 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0012
     * @tc.name      FoldableAdaptation_NavigationModeOf_0012
     * @tc.desc      navigationModeOf(navMode=25, lastRoute="Stack", enterRoute="Stack", breakpoint="Stack", stackSiz...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0012 begin`);
      const actual: string = navigationModeOf(25, 'Stack', 'Stack', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=25, lastRoute="S...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0012 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0013
     * @tc.name      FoldableAdaptation_NavigationModeOf_0013
     * @tc.desc      navigationModeOf(navMode=30, lastRoute="Stack", enterRoute="Stack", breakpoint="Stack", stackSiz...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0013 begin`);
      const actual: string = navigationModeOf(30, 'Stack', 'Stack', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=30, lastRoute="S...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0013 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0014
     * @tc.name      FoldableAdaptation_NavigationModeOf_0014
     * @tc.desc      navigationModeOf(navMode=35, lastRoute="Stack", enterRoute="Stack", breakpoint="Stack", stackSiz...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0014 begin`);
      const actual: string = navigationModeOf(35, 'Stack', 'Stack', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=35, lastRoute="S...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0014 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0015
     * @tc.name      FoldableAdaptation_NavigationModeOf_0015
     * @tc.desc      navigationModeOf(navMode=40, lastRoute="Stack", enterRoute="Stack", breakpoint="Stack", stackSiz...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0015 begin`);
      const actual: string = navigationModeOf(40, 'Stack', 'Stack', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=40, lastRoute="S...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0015 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0016
     * @tc.name      FoldableAdaptation_NavigationModeOf_0016
     * @tc.desc      navigationModeOf(navMode=-65, lastRoute="Stack", enterRoute="Stack", breakpoint="Stack", stackSi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavigationModeOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0016 begin`);
      const actual: string = navigationModeOf(-65, 'Stack', 'Stack', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=-65, lastRoute="...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0016 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0017
     * @tc.name      FoldableAdaptation_NavigationModeOf_0017
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Split", enterRoute="Stack", breakpoint="Stack", stackSize...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0017 begin`);
      const actual: string = navigationModeOf(0, 'Split', 'Stack', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="Sp...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0017 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0018
     * @tc.name      FoldableAdaptation_NavigationModeOf_0018
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="", enterRoute="Stack", breakpoint="Stack", stackSize=0) r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0018 begin`);
      const actual: string = navigationModeOf(0, '', 'Stack', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="",...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0018 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0019
     * @tc.name      FoldableAdaptation_NavigationModeOf_0019
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="sm", enterRoute="Stack", breakpoint="Stack", stackSize=0)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0019 begin`);
      const actual: string = navigationModeOf(0, 'sm', 'Stack', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="sm...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0019 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0020
     * @tc.name      FoldableAdaptation_NavigationModeOf_0020
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="STACK", enterRoute="Stack", breakpoint="Stack", stackSize...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavigationModeOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0020 begin`);
      const actual: string = navigationModeOf(0, 'STACK', 'Stack', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="ST...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0020 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0021
     * @tc.name      FoldableAdaptation_NavigationModeOf_0021
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stac", enterRoute="Stack", breakpoint="Stack", stackSize=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavigationModeOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0021 begin`);
      const actual: string = navigationModeOf(0, 'Stac', 'Stack', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0021 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0022
     * @tc.name      FoldableAdaptation_NavigationModeOf_0022
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stackx", enterRoute="Stack", breakpoint="Stack", stackSiz...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavigationModeOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0022 begin`);
      const actual: string = navigationModeOf(0, 'Stackx', 'Stack', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0022 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0023
     * @tc.name      FoldableAdaptation_NavigationModeOf_0023
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="SPLIT", enterRoute="Stack", breakpoint="Stack", stackSize...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavigationModeOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0023 begin`);
      const actual: string = navigationModeOf(0, 'SPLIT', 'Stack', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="SP...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0023 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0024
     * @tc.name      FoldableAdaptation_NavigationModeOf_0024
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Spli", enterRoute="Stack", breakpoint="Stack", stackSize=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavigationModeOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0024 begin`);
      const actual: string = navigationModeOf(0, 'Spli', 'Stack', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="Sp...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0024 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0025
     * @tc.name      FoldableAdaptation_NavigationModeOf_0025
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Splitx", enterRoute="Stack", breakpoint="Stack", stackSiz...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavigationModeOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0025 begin`);
      const actual: string = navigationModeOf(0, 'Splitx', 'Stack', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="Sp...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0025 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0026
     * @tc.name      FoldableAdaptation_NavigationModeOf_0026
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Hello", enterRoute="Stack", breakpoint="Stack", stackSize...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0026 begin`);
      const actual: string = navigationModeOf(0, 'Hello', 'Stack', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="He...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0026 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0027
     * @tc.name      FoldableAdaptation_NavigationModeOf_0027
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="hello world", enterRoute="Stack", breakpoint="Stack", sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0027 begin`);
      const actual: string = navigationModeOf(0, 'hello world', 'Stack', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="he...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0027 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0028
     * @tc.name      FoldableAdaptation_NavigationModeOf_0028
     * @tc.desc      navigationModeOf(navMode=0, lastRoute=" ", enterRoute="Stack", breakpoint="Stack", stackSize=0) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0028 begin`);
      const actual: string = navigationModeOf(0, ' ', 'Stack', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute=" "...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0028 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0029
     * @tc.name      FoldableAdaptation_NavigationModeOf_0029
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="A", enterRoute="Stack", breakpoint="Stack", stackSize=0) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0029 begin`);
      const actual: string = navigationModeOf(0, 'A', 'Stack', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="A"...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0029 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0030
     * @tc.name      FoldableAdaptation_NavigationModeOf_0030
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="Split", breakpoint="Stack", stackSize...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0030 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'Split', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0030 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0031
     * @tc.name      FoldableAdaptation_NavigationModeOf_0031
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="", breakpoint="Stack", stackSize=0) r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0031 begin`);
      const actual: string = navigationModeOf(0, 'Stack', '', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0031 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0032
     * @tc.name      FoldableAdaptation_NavigationModeOf_0032
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="sm", breakpoint="Stack", stackSize=0)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0032 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'sm', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0032 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0033
     * @tc.name      FoldableAdaptation_NavigationModeOf_0033
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="STACK", breakpoint="Stack", stackSize...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavigationModeOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0033 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'STACK', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0033 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0034
     * @tc.name      FoldableAdaptation_NavigationModeOf_0034
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="Stac", breakpoint="Stack", stackSize=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavigationModeOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0034 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'Stac', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0034 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0035
     * @tc.name      FoldableAdaptation_NavigationModeOf_0035
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="Stackx", breakpoint="Stack", stackSiz...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavigationModeOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0035 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'Stackx', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0035 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0036
     * @tc.name      FoldableAdaptation_NavigationModeOf_0036
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="SPLIT", breakpoint="Stack", stackSize...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavigationModeOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0036 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'SPLIT', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0036 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0037
     * @tc.name      FoldableAdaptation_NavigationModeOf_0037
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="Spli", breakpoint="Stack", stackSize=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavigationModeOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0037 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'Spli', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0037 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0038
     * @tc.name      FoldableAdaptation_NavigationModeOf_0038
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="Splitx", breakpoint="Stack", stackSiz...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavigationModeOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0038 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'Splitx', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0038 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0039
     * @tc.name      FoldableAdaptation_NavigationModeOf_0039
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="a", breakpoint="Stack", stackSize=0) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0039 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'a', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0039 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0040
     * @tc.name      FoldableAdaptation_NavigationModeOf_0040
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="abc", breakpoint="Stack", stackSize=0...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0040 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'abc', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0040 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0041
     * @tc.name      FoldableAdaptation_NavigationModeOf_0041
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="Hello World", breakpoint="Stack", sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0041 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'Hello World', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0041 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0042
     * @tc.name      FoldableAdaptation_NavigationModeOf_0042
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute=" ", breakpoint="Stack", stackSize=0) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0042 begin`);
      const actual: string = navigationModeOf(0, 'Stack', ' ', 'Stack', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0042 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0043
     * @tc.name      FoldableAdaptation_NavigationModeOf_0043
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="Stack", breakpoint="Split", stackSize...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0043 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'Stack', 'Split', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0043 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0044
     * @tc.name      FoldableAdaptation_NavigationModeOf_0044
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="Stack", breakpoint="", stackSize=0) r...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0044 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'Stack', '', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0044 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0045
     * @tc.name      FoldableAdaptation_NavigationModeOf_0045
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="Stack", breakpoint="sm", stackSize=0)...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0045 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'Stack', 'sm', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0045 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0046
     * @tc.name      FoldableAdaptation_NavigationModeOf_0046
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="Stack", breakpoint="STACK", stackSize...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavigationModeOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0046 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'Stack', 'STACK', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0046 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0047
     * @tc.name      FoldableAdaptation_NavigationModeOf_0047
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="Stack", breakpoint="Stac", stackSize=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavigationModeOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0047 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'Stack', 'Stac', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0047 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0048
     * @tc.name      FoldableAdaptation_NavigationModeOf_0048
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="Stack", breakpoint="Stackx", stackSiz...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavigationModeOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0048 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'Stack', 'Stackx', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0048 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0049
     * @tc.name      FoldableAdaptation_NavigationModeOf_0049
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="Stack", breakpoint="SPLIT", stackSize...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavigationModeOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0049 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'Stack', 'SPLIT', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0049 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0050
     * @tc.name      FoldableAdaptation_NavigationModeOf_0050
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="Stack", breakpoint="Spli", stackSize=...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavigationModeOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0050 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'Stack', 'Spli', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0050 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0051
     * @tc.name      FoldableAdaptation_NavigationModeOf_0051
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="Stack", breakpoint="Splitx", stackSiz...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavigationModeOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0051 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'Stack', 'Splitx', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0051 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0052
     * @tc.name      FoldableAdaptation_NavigationModeOf_0052
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="Stack", breakpoint="a", stackSize=0) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0052 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'Stack', 'a', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0052 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0053
     * @tc.name      FoldableAdaptation_NavigationModeOf_0053
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="Stack", breakpoint="abc", stackSize=0...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0053 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'Stack', 'abc', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0053 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0054
     * @tc.name      FoldableAdaptation_NavigationModeOf_0054
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="Stack", breakpoint="Hello World", sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0054 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'Stack', 'Hello World', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0054 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0055
     * @tc.name      FoldableAdaptation_NavigationModeOf_0055
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="Stack", breakpoint=" ", stackSize=0) ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0055 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'Stack', ' ', 0);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0055 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0056
     * @tc.name      FoldableAdaptation_NavigationModeOf_0056
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="Stack", breakpoint="Stack", stackSize...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0056 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'Stack', 'Stack', 1);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0056 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0057
     * @tc.name      FoldableAdaptation_NavigationModeOf_0057
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="Stack", breakpoint="Stack", stackSize...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0057 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'Stack', 'Stack', -1);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0057 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0058
     * @tc.name      FoldableAdaptation_NavigationModeOf_0058
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="Stack", breakpoint="Stack", stackSize...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0058 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'Stack', 'Stack', 2);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0058 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0059
     * @tc.name      FoldableAdaptation_NavigationModeOf_0059
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="Stack", breakpoint="Stack", stackSize...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0059 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'Stack', 'Stack', 3);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0059 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0060
     * @tc.name      FoldableAdaptation_NavigationModeOf_0060
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="Stack", breakpoint="Stack", stackSize...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0060 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'Stack', 'Stack', 4);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0060 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0061
     * @tc.name      FoldableAdaptation_NavigationModeOf_0061
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="Stack", breakpoint="Stack", stackSize...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0061 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'Stack', 'Stack', 5);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0061 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0062
     * @tc.name      FoldableAdaptation_NavigationModeOf_0062
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="Stack", breakpoint="Stack", stackSize...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0062 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'Stack', 'Stack', 10);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0062 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0063
     * @tc.name      FoldableAdaptation_NavigationModeOf_0063
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="Stack", breakpoint="Stack", stackSize...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0063 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'Stack', 'Stack', 100);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0063 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0064
     * @tc.name      FoldableAdaptation_NavigationModeOf_0064
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="Stack", breakpoint="Stack", stackSize...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0064 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'Stack', 'Stack', 15);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0064 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0065
     * @tc.name      FoldableAdaptation_NavigationModeOf_0065
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="Stack", breakpoint="Stack", stackSize...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0065 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'Stack', 'Stack', 20);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0065 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0066
     * @tc.name      FoldableAdaptation_NavigationModeOf_0066
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="Stack", breakpoint="Stack", stackSize...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0066 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'Stack', 'Stack', 25);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0066 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0067
     * @tc.name      FoldableAdaptation_NavigationModeOf_0067
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="Stack", breakpoint="Stack", stackSize...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0067 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'Stack', 'Stack', 30);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0067 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0068
     * @tc.name      FoldableAdaptation_NavigationModeOf_0068
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="Stack", breakpoint="Stack", stackSize...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0068 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'Stack', 'Stack', 35);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0068 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0069
     * @tc.name      FoldableAdaptation_NavigationModeOf_0069
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="Stack", breakpoint="Stack", stackSize...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0069 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'Stack', 'Stack', 11.38);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0069 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0070
     * @tc.name      FoldableAdaptation_NavigationModeOf_0070
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stack", enterRoute="Stack", breakpoint="Stack", stackSize...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0070 begin`);
      const actual: string = navigationModeOf(0, 'Stack', 'Stack', 'Stack', 89);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0070 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0071
     * @tc.name      FoldableAdaptation_NavigationModeOf_0071
     * @tc.desc      navigationModeOf(navMode=-65, lastRoute="SPLIT", enterRoute="a", breakpoint="a", stackSize=0) re...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavigationModeOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0071 begin`);
      const actual: string = navigationModeOf(-65, 'SPLIT', 'a', 'a', 0);
      logInfo(`navigationModeOf(navMode=-65, lastRoute="...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0071 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0072
     * @tc.name      FoldableAdaptation_NavigationModeOf_0072
     * @tc.desc      navigationModeOf(navMode=0, lastRoute="Stac", enterRoute="a", breakpoint="", stackSize=15) retur...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavigationModeOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0072 begin`);
      const actual: string = navigationModeOf(0, 'Stac', 'a', '', 15);
      logInfo(`navigationModeOf(navMode=0, lastRoute="St...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0072 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0073
     * @tc.name      FoldableAdaptation_NavigationModeOf_0073
     * @tc.desc      navigationModeOf(navMode=35, lastRoute="hello world", enterRoute="abc", breakpoint="abc", stackS...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('NavigationModeOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0073 begin`);
      const actual: string = navigationModeOf(35, 'hello world', 'abc', 'abc', 3);
      logInfo(`navigationModeOf(navMode=35, lastRoute="h...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0073 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0074
     * @tc.name      FoldableAdaptation_NavigationModeOf_0074
     * @tc.desc      navigationModeOf(navMode=15, lastRoute="Stack", enterRoute="SPLIT", breakpoint="Stackx", stackSi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavigationModeOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0074 begin`);
      const actual: string = navigationModeOf(15, 'Stack', 'SPLIT', 'Stackx', 20);
      logInfo(`navigationModeOf(navMode=15, lastRoute="S...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0074 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_NAVIGATION_MODE_OF_0075
     * @tc.name      FoldableAdaptation_NavigationModeOf_0075
     * @tc.desc      navigationModeOf(navMode=100, lastRoute="Splitx", enterRoute="abc", breakpoint="STACK", stackSiz...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('NavigationModeOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NavigationModeOf_0075 begin`);
      const actual: string = navigationModeOf(100, 'Splitx', 'abc', 'STACK', 100);
      logInfo(`navigationModeOf(navMode=100, lastRoute="...: actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}NavigationModeOf_0075 end`);
    });
  });
}
