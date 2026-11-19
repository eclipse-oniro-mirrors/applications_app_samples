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
import { tabColumnsOf } from '../model/FoldLayoutLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FoldableAdaptation]';
const BUNDLE: string = 'FoldableAdaptation_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for tabColumnsOf (89 cases). */
export default function tabColumnsOfTest(): void {
  describe('TabColumnsOfTest', () => {
    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0001
     * @tc.name      FoldableAdaptation_TabColumnsOf_0001
     * @tc.desc      tabColumnsOf(width=0, isFoldable=true) throws an error
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabColumnsOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0001 begin`);
      let thrown: boolean = false;
      try {
        tabColumnsOf(0, true);
      } catch (error) {
        thrown = true;
      }
      logInfo(`tabColumnsOf(width=0, isFoldable=true): thrown=${thrown}`);
      expect(thrown).assertTrue();
      logInfo(`${BUNDLE}TabColumnsOf_0001 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0002
     * @tc.name      FoldableAdaptation_TabColumnsOf_0002
     * @tc.desc      tabColumnsOf(width=360, isFoldable=true) returns "1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('TabColumnsOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0002 begin`);
      const actual: string = tabColumnsOf(360, true);
      logInfo(`tabColumnsOf(width=360, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0002 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0003
     * @tc.name      FoldableAdaptation_TabColumnsOf_0003
     * @tc.desc      tabColumnsOf(width=720, isFoldable=true) returns "1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0003 begin`);
      const actual: string = tabColumnsOf(720, true);
      logInfo(`tabColumnsOf(width=720, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0003 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0004
     * @tc.name      FoldableAdaptation_TabColumnsOf_0004
     * @tc.desc      tabColumnsOf(width=1080, isFoldable=true) returns "1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0004 begin`);
      const actual: string = tabColumnsOf(1080, true);
      logInfo(`tabColumnsOf(width=1080, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0004 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0005
     * @tc.name      FoldableAdaptation_TabColumnsOf_0005
     * @tc.desc      tabColumnsOf(width=1920, isFoldable=true) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0005 begin`);
      const actual: string = tabColumnsOf(1920, true);
      logInfo(`tabColumnsOf(width=1920, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0005 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0006
     * @tc.name      FoldableAdaptation_TabColumnsOf_0006
     * @tc.desc      tabColumnsOf(width=1920, isFoldable=false) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0006 begin`);
      const actual: string = tabColumnsOf(1920, false);
      logInfo(`tabColumnsOf(width=1920, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0006 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0007
     * @tc.name      FoldableAdaptation_TabColumnsOf_0007
     * @tc.desc      tabColumnsOf(width=192, isFoldable=true) returns "1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0007 begin`);
      const actual: string = tabColumnsOf(192, true);
      logInfo(`tabColumnsOf(width=192, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual('1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0007 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0008
     * @tc.name      FoldableAdaptation_TabColumnsOf_0008
     * @tc.desc      tabColumnsOf(width=480, isFoldable=true) returns "1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0008 begin`);
      const actual: string = tabColumnsOf(480, true);
      logInfo(`tabColumnsOf(width=480, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0008 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0009
     * @tc.name      FoldableAdaptation_TabColumnsOf_0009
     * @tc.desc      tabColumnsOf(width=864, isFoldable=true) returns "1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0009 begin`);
      const actual: string = tabColumnsOf(864, true);
      logInfo(`tabColumnsOf(width=864, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0009 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0010
     * @tc.name      FoldableAdaptation_TabColumnsOf_0010
     * @tc.desc      tabColumnsOf(width=1152, isFoldable=true) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0010 begin`);
      const actual: string = tabColumnsOf(1152, true);
      logInfo(`tabColumnsOf(width=1152, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0010 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0011
     * @tc.name      FoldableAdaptation_TabColumnsOf_0011
     * @tc.desc      tabColumnsOf(width=1344, isFoldable=true) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0011 begin`);
      const actual: string = tabColumnsOf(1344, true);
      logInfo(`tabColumnsOf(width=1344, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0011 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0012
     * @tc.name      FoldableAdaptation_TabColumnsOf_0012
     * @tc.desc      tabColumnsOf(width=1440, isFoldable=true) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0012 begin`);
      const actual: string = tabColumnsOf(1440, true);
      logInfo(`tabColumnsOf(width=1440, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0012 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0013
     * @tc.name      FoldableAdaptation_TabColumnsOf_0013
     * @tc.desc      tabColumnsOf(width=1824, isFoldable=true) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0013 begin`);
      const actual: string = tabColumnsOf(1824, true);
      logInfo(`tabColumnsOf(width=1824, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0013 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0014
     * @tc.name      FoldableAdaptation_TabColumnsOf_0014
     * @tc.desc      tabColumnsOf(width=2112, isFoldable=true) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0014 begin`);
      const actual: string = tabColumnsOf(2112, true);
      logInfo(`tabColumnsOf(width=2112, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0014 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0015
     * @tc.name      FoldableAdaptation_TabColumnsOf_0015
     * @tc.desc      tabColumnsOf(width=2304, isFoldable=true) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0015 begin`);
      const actual: string = tabColumnsOf(2304, true);
      logInfo(`tabColumnsOf(width=2304, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0015 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0016
     * @tc.name      FoldableAdaptation_TabColumnsOf_0016
     * @tc.desc      tabColumnsOf(width=2400, isFoldable=true) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0016 begin`);
      const actual: string = tabColumnsOf(2400, true);
      logInfo(`tabColumnsOf(width=2400, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0016 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0017
     * @tc.name      FoldableAdaptation_TabColumnsOf_0017
     * @tc.desc      tabColumnsOf(width=2592, isFoldable=true) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0017 begin`);
      const actual: string = tabColumnsOf(2592, true);
      logInfo(`tabColumnsOf(width=2592, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0017 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0018
     * @tc.name      FoldableAdaptation_TabColumnsOf_0018
     * @tc.desc      tabColumnsOf(width=2688, isFoldable=true) returns " 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0018 begin`);
      const actual: string = tabColumnsOf(2688, true);
      logInfo(`tabColumnsOf(width=2688, isFoldable=true): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`tabColumnsOf(width=2688, isFoldable=true): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr ');
      logInfo(`tabColumnsOf(width=2688, isFoldable=true): actual.substring(35)=${actual.substring(35)}`);
      expect(actual.substring(35)).assertEqual(' 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0018 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0019
     * @tc.name      FoldableAdaptation_TabColumnsOf_0019
     * @tc.desc      tabColumnsOf(width=2880, isFoldable=true) returns " 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0019 begin`);
      const actual: string = tabColumnsOf(2880, true);
      logInfo(`tabColumnsOf(width=2880, isFoldable=true): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`tabColumnsOf(width=2880, isFoldable=true): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr ');
      logInfo(`tabColumnsOf(width=2880, isFoldable=true): actual.substring(39)=${actual.substring(39)}`);
      expect(actual.substring(39)).assertEqual(' 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0019 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0020
     * @tc.name      FoldableAdaptation_TabColumnsOf_0020
     * @tc.desc      tabColumnsOf(width=3072, isFoldable=true) returns " 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0020 begin`);
      const actual: string = tabColumnsOf(3072, true);
      logInfo(`tabColumnsOf(width=3072, isFoldable=true): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(75);
      logInfo(`tabColumnsOf(width=3072, isFoldable=true): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr ');
      logInfo(`tabColumnsOf(width=3072, isFoldable=true): actual.substring(43)=${actual.substring(43)}`);
      expect(actual.substring(43)).assertEqual(' 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0020 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0021
     * @tc.name      FoldableAdaptation_TabColumnsOf_0021
     * @tc.desc      tabColumnsOf(width=3168, isFoldable=true) returns " 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0021 begin`);
      const actual: string = tabColumnsOf(3168, true);
      logInfo(`tabColumnsOf(width=3168, isFoldable=true): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(79);
      logInfo(`tabColumnsOf(width=3168, isFoldable=true): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr ');
      logInfo(`tabColumnsOf(width=3168, isFoldable=true): actual.substring(47)=${actual.substring(47)}`);
      expect(actual.substring(47)).assertEqual(' 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0021 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0022
     * @tc.name      FoldableAdaptation_TabColumnsOf_0022
     * @tc.desc      tabColumnsOf(width=3360, isFoldable=true) returns " 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0022 begin`);
      const actual: string = tabColumnsOf(3360, true);
      logInfo(`tabColumnsOf(width=3360, isFoldable=true): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(83);
      logInfo(`tabColumnsOf(width=3360, isFoldable=true): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr ');
      logInfo(`tabColumnsOf(width=3360, isFoldable=true): actual.substring(51)=${actual.substring(51)}`);
      expect(actual.substring(51)).assertEqual(' 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0022 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0023
     * @tc.name      FoldableAdaptation_TabColumnsOf_0023
     * @tc.desc      tabColumnsOf(width=3552, isFoldable=true) returns " 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0023 begin`);
      const actual: string = tabColumnsOf(3552, true);
      logInfo(`tabColumnsOf(width=3552, isFoldable=true): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(87);
      logInfo(`tabColumnsOf(width=3552, isFoldable=true): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr ');
      logInfo(`tabColumnsOf(width=3552, isFoldable=true): actual.substring(55)=${actual.substring(55)}`);
      expect(actual.substring(55)).assertEqual(' 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0023 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0024
     * @tc.name      FoldableAdaptation_TabColumnsOf_0024
     * @tc.desc      tabColumnsOf(width=3648, isFoldable=true) returns " 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0024 begin`);
      const actual: string = tabColumnsOf(3648, true);
      logInfo(`tabColumnsOf(width=3648, isFoldable=true): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(91);
      logInfo(`tabColumnsOf(width=3648, isFoldable=true): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr ');
      logInfo(`tabColumnsOf(width=3648, isFoldable=true): actual.substring(59)=${actual.substring(59)}`);
      expect(actual.substring(59)).assertEqual(' 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0024 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0025
     * @tc.name      FoldableAdaptation_TabColumnsOf_0025
     * @tc.desc      tabColumnsOf(width=3840, isFoldable=true) returns " 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0025 begin`);
      const actual: string = tabColumnsOf(3840, true);
      logInfo(`tabColumnsOf(width=3840, isFoldable=true): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(95);
      logInfo(`tabColumnsOf(width=3840, isFoldable=true): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr ');
      logInfo(`tabColumnsOf(width=3840, isFoldable=true): actual.substring(63)=${actual.substring(63)}`);
      expect(actual.substring(63)).assertEqual(' 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0025 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0026
     * @tc.name      FoldableAdaptation_TabColumnsOf_0026
     * @tc.desc      tabColumnsOf(width=0, isFoldable=false) throws an error
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabColumnsOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0026 begin`);
      let thrown: boolean = false;
      try {
        tabColumnsOf(0, false);
      } catch (error) {
        thrown = true;
      }
      logInfo(`tabColumnsOf(width=0, isFoldable=false): thrown=${thrown}`);
      expect(thrown).assertTrue();
      logInfo(`${BUNDLE}TabColumnsOf_0026 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0027
     * @tc.name      FoldableAdaptation_TabColumnsOf_0027
     * @tc.desc      tabColumnsOf(width=1, isFoldable=true) throws an error
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabColumnsOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0027 begin`);
      let thrown: boolean = false;
      try {
        tabColumnsOf(1, true);
      } catch (error) {
        thrown = true;
      }
      logInfo(`tabColumnsOf(width=1, isFoldable=true): thrown=${thrown}`);
      expect(thrown).assertTrue();
      logInfo(`${BUNDLE}TabColumnsOf_0027 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0028
     * @tc.name      FoldableAdaptation_TabColumnsOf_0028
     * @tc.desc      tabColumnsOf(width=1, isFoldable=false) throws an error
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabColumnsOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0028 begin`);
      let thrown: boolean = false;
      try {
        tabColumnsOf(1, false);
      } catch (error) {
        thrown = true;
      }
      logInfo(`tabColumnsOf(width=1, isFoldable=false): thrown=${thrown}`);
      expect(thrown).assertTrue();
      logInfo(`${BUNDLE}TabColumnsOf_0028 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0029
     * @tc.name      FoldableAdaptation_TabColumnsOf_0029
     * @tc.desc      tabColumnsOf(width=2, isFoldable=true) throws an error
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabColumnsOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0029 begin`);
      let thrown: boolean = false;
      try {
        tabColumnsOf(2, true);
      } catch (error) {
        thrown = true;
      }
      logInfo(`tabColumnsOf(width=2, isFoldable=true): thrown=${thrown}`);
      expect(thrown).assertTrue();
      logInfo(`${BUNDLE}TabColumnsOf_0029 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0030
     * @tc.name      FoldableAdaptation_TabColumnsOf_0030
     * @tc.desc      tabColumnsOf(width=2, isFoldable=false) throws an error
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabColumnsOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0030 begin`);
      let thrown: boolean = false;
      try {
        tabColumnsOf(2, false);
      } catch (error) {
        thrown = true;
      }
      logInfo(`tabColumnsOf(width=2, isFoldable=false): thrown=${thrown}`);
      expect(thrown).assertTrue();
      logInfo(`${BUNDLE}TabColumnsOf_0030 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0031
     * @tc.name      FoldableAdaptation_TabColumnsOf_0031
     * @tc.desc      tabColumnsOf(width=100, isFoldable=true) throws an error
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('TabColumnsOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0031 begin`);
      let thrown: boolean = false;
      try {
        tabColumnsOf(100, true);
      } catch (error) {
        thrown = true;
      }
      logInfo(`tabColumnsOf(width=100, isFoldable=true): thrown=${thrown}`);
      expect(thrown).assertTrue();
      logInfo(`${BUNDLE}TabColumnsOf_0031 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0032
     * @tc.name      FoldableAdaptation_TabColumnsOf_0032
     * @tc.desc      tabColumnsOf(width=360, isFoldable=false) returns "1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0032 begin`);
      const actual: string = tabColumnsOf(360, false);
      logInfo(`tabColumnsOf(width=360, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0032 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0033
     * @tc.name      FoldableAdaptation_TabColumnsOf_0033
     * @tc.desc      tabColumnsOf(width=720, isFoldable=false) returns "1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0033 begin`);
      const actual: string = tabColumnsOf(720, false);
      logInfo(`tabColumnsOf(width=720, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0033 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0034
     * @tc.name      FoldableAdaptation_TabColumnsOf_0034
     * @tc.desc      tabColumnsOf(width=1080, isFoldable=false) returns "1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0034 begin`);
      const actual: string = tabColumnsOf(1080, false);
      logInfo(`tabColumnsOf(width=1080, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0034 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0035
     * @tc.name      FoldableAdaptation_TabColumnsOf_0035
     * @tc.desc      tabColumnsOf(width=192, isFoldable=false) returns "1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0035 begin`);
      const actual: string = tabColumnsOf(192, false);
      logInfo(`tabColumnsOf(width=192, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0035 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0036
     * @tc.name      FoldableAdaptation_TabColumnsOf_0036
     * @tc.desc      tabColumnsOf(width=288, isFoldable=true) returns "1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0036 begin`);
      const actual: string = tabColumnsOf(288, true);
      logInfo(`tabColumnsOf(width=288, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual('1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0036 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0037
     * @tc.name      FoldableAdaptation_TabColumnsOf_0037
     * @tc.desc      tabColumnsOf(width=288, isFoldable=false) returns "1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0037 begin`);
      const actual: string = tabColumnsOf(288, false);
      logInfo(`tabColumnsOf(width=288, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0037 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0038
     * @tc.name      FoldableAdaptation_TabColumnsOf_0038
     * @tc.desc      tabColumnsOf(width=384, isFoldable=true) returns "1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0038 begin`);
      const actual: string = tabColumnsOf(384, true);
      logInfo(`tabColumnsOf(width=384, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0038 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0039
     * @tc.name      FoldableAdaptation_TabColumnsOf_0039
     * @tc.desc      tabColumnsOf(width=384, isFoldable=false) returns "1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0039 begin`);
      const actual: string = tabColumnsOf(384, false);
      logInfo(`tabColumnsOf(width=384, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0039 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0040
     * @tc.name      FoldableAdaptation_TabColumnsOf_0040
     * @tc.desc      tabColumnsOf(width=480, isFoldable=false) returns "1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0040 begin`);
      const actual: string = tabColumnsOf(480, false);
      logInfo(`tabColumnsOf(width=480, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0040 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0041
     * @tc.name      FoldableAdaptation_TabColumnsOf_0041
     * @tc.desc      tabColumnsOf(width=576, isFoldable=true) returns "1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0041 begin`);
      const actual: string = tabColumnsOf(576, true);
      logInfo(`tabColumnsOf(width=576, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0041 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0042
     * @tc.name      FoldableAdaptation_TabColumnsOf_0042
     * @tc.desc      tabColumnsOf(width=576, isFoldable=false) returns "1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0042 begin`);
      const actual: string = tabColumnsOf(576, false);
      logInfo(`tabColumnsOf(width=576, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0042 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0043
     * @tc.name      FoldableAdaptation_TabColumnsOf_0043
     * @tc.desc      tabColumnsOf(width=672, isFoldable=true) returns "1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0043 begin`);
      const actual: string = tabColumnsOf(672, true);
      logInfo(`tabColumnsOf(width=672, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0043 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0044
     * @tc.name      FoldableAdaptation_TabColumnsOf_0044
     * @tc.desc      tabColumnsOf(width=672, isFoldable=false) returns "1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0044 begin`);
      const actual: string = tabColumnsOf(672, false);
      logInfo(`tabColumnsOf(width=672, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0044 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0045
     * @tc.name      FoldableAdaptation_TabColumnsOf_0045
     * @tc.desc      tabColumnsOf(width=768, isFoldable=true) returns "1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0045 begin`);
      const actual: string = tabColumnsOf(768, true);
      logInfo(`tabColumnsOf(width=768, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0045 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0046
     * @tc.name      FoldableAdaptation_TabColumnsOf_0046
     * @tc.desc      tabColumnsOf(width=768, isFoldable=false) returns "1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0046 begin`);
      const actual: string = tabColumnsOf(768, false);
      logInfo(`tabColumnsOf(width=768, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0046 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0047
     * @tc.name      FoldableAdaptation_TabColumnsOf_0047
     * @tc.desc      tabColumnsOf(width=864, isFoldable=false) returns "1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0047 begin`);
      const actual: string = tabColumnsOf(864, false);
      logInfo(`tabColumnsOf(width=864, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0047 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0048
     * @tc.name      FoldableAdaptation_TabColumnsOf_0048
     * @tc.desc      tabColumnsOf(width=960, isFoldable=true) returns "1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0048 begin`);
      const actual: string = tabColumnsOf(960, true);
      logInfo(`tabColumnsOf(width=960, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0048 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0049
     * @tc.name      FoldableAdaptation_TabColumnsOf_0049
     * @tc.desc      tabColumnsOf(width=960, isFoldable=false) returns "1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0049 begin`);
      const actual: string = tabColumnsOf(960, false);
      logInfo(`tabColumnsOf(width=960, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0049 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0050
     * @tc.name      FoldableAdaptation_TabColumnsOf_0050
     * @tc.desc      tabColumnsOf(width=1056, isFoldable=true) returns "1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0050 begin`);
      const actual: string = tabColumnsOf(1056, true);
      logInfo(`tabColumnsOf(width=1056, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0050 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0051
     * @tc.name      FoldableAdaptation_TabColumnsOf_0051
     * @tc.desc      tabColumnsOf(width=1056, isFoldable=false) returns "1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0051 begin`);
      const actual: string = tabColumnsOf(1056, false);
      logInfo(`tabColumnsOf(width=1056, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0051 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0052
     * @tc.name      FoldableAdaptation_TabColumnsOf_0052
     * @tc.desc      tabColumnsOf(width=1152, isFoldable=false) returns "1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0052 begin`);
      const actual: string = tabColumnsOf(1152, false);
      logInfo(`tabColumnsOf(width=1152, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0052 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0053
     * @tc.name      FoldableAdaptation_TabColumnsOf_0053
     * @tc.desc      tabColumnsOf(width=1248, isFoldable=true) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0053 begin`);
      const actual: string = tabColumnsOf(1248, true);
      logInfo(`tabColumnsOf(width=1248, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0053 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0054
     * @tc.name      FoldableAdaptation_TabColumnsOf_0054
     * @tc.desc      tabColumnsOf(width=1248, isFoldable=false) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0054 begin`);
      const actual: string = tabColumnsOf(1248, false);
      logInfo(`tabColumnsOf(width=1248, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0054 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0055
     * @tc.name      FoldableAdaptation_TabColumnsOf_0055
     * @tc.desc      tabColumnsOf(width=1344, isFoldable=false) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0055 begin`);
      const actual: string = tabColumnsOf(1344, false);
      logInfo(`tabColumnsOf(width=1344, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0055 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0056
     * @tc.name      FoldableAdaptation_TabColumnsOf_0056
     * @tc.desc      tabColumnsOf(width=1440, isFoldable=false) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0056 begin`);
      const actual: string = tabColumnsOf(1440, false);
      logInfo(`tabColumnsOf(width=1440, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0056 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0057
     * @tc.name      FoldableAdaptation_TabColumnsOf_0057
     * @tc.desc      tabColumnsOf(width=1536, isFoldable=true) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0057 begin`);
      const actual: string = tabColumnsOf(1536, true);
      logInfo(`tabColumnsOf(width=1536, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0057 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0058
     * @tc.name      FoldableAdaptation_TabColumnsOf_0058
     * @tc.desc      tabColumnsOf(width=1536, isFoldable=false) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0058 begin`);
      const actual: string = tabColumnsOf(1536, false);
      logInfo(`tabColumnsOf(width=1536, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0058 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0059
     * @tc.name      FoldableAdaptation_TabColumnsOf_0059
     * @tc.desc      tabColumnsOf(width=1632, isFoldable=true) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0059 begin`);
      const actual: string = tabColumnsOf(1632, true);
      logInfo(`tabColumnsOf(width=1632, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0059 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0060
     * @tc.name      FoldableAdaptation_TabColumnsOf_0060
     * @tc.desc      tabColumnsOf(width=1632, isFoldable=false) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0060 begin`);
      const actual: string = tabColumnsOf(1632, false);
      logInfo(`tabColumnsOf(width=1632, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0060 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0061
     * @tc.name      FoldableAdaptation_TabColumnsOf_0061
     * @tc.desc      tabColumnsOf(width=1728, isFoldable=true) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0061 begin`);
      const actual: string = tabColumnsOf(1728, true);
      logInfo(`tabColumnsOf(width=1728, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0061 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0062
     * @tc.name      FoldableAdaptation_TabColumnsOf_0062
     * @tc.desc      tabColumnsOf(width=1728, isFoldable=false) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0062 begin`);
      const actual: string = tabColumnsOf(1728, false);
      logInfo(`tabColumnsOf(width=1728, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0062 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0063
     * @tc.name      FoldableAdaptation_TabColumnsOf_0063
     * @tc.desc      tabColumnsOf(width=1824, isFoldable=false) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0063 begin`);
      const actual: string = tabColumnsOf(1824, false);
      logInfo(`tabColumnsOf(width=1824, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0063 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0064
     * @tc.name      FoldableAdaptation_TabColumnsOf_0064
     * @tc.desc      tabColumnsOf(width=2016, isFoldable=true) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0064 begin`);
      const actual: string = tabColumnsOf(2016, true);
      logInfo(`tabColumnsOf(width=2016, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0064 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0065
     * @tc.name      FoldableAdaptation_TabColumnsOf_0065
     * @tc.desc      tabColumnsOf(width=2016, isFoldable=false) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0065 begin`);
      const actual: string = tabColumnsOf(2016, false);
      logInfo(`tabColumnsOf(width=2016, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0065 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0066
     * @tc.name      FoldableAdaptation_TabColumnsOf_0066
     * @tc.desc      tabColumnsOf(width=2112, isFoldable=false) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0066 begin`);
      const actual: string = tabColumnsOf(2112, false);
      logInfo(`tabColumnsOf(width=2112, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0066 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0067
     * @tc.name      FoldableAdaptation_TabColumnsOf_0067
     * @tc.desc      tabColumnsOf(width=2208, isFoldable=true) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0067 begin`);
      const actual: string = tabColumnsOf(2208, true);
      logInfo(`tabColumnsOf(width=2208, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0067 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0068
     * @tc.name      FoldableAdaptation_TabColumnsOf_0068
     * @tc.desc      tabColumnsOf(width=2208, isFoldable=false) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0068 begin`);
      const actual: string = tabColumnsOf(2208, false);
      logInfo(`tabColumnsOf(width=2208, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0068 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0069
     * @tc.name      FoldableAdaptation_TabColumnsOf_0069
     * @tc.desc      tabColumnsOf(width=2304, isFoldable=false) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0069 begin`);
      const actual: string = tabColumnsOf(2304, false);
      logInfo(`tabColumnsOf(width=2304, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0069 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0070
     * @tc.name      FoldableAdaptation_TabColumnsOf_0070
     * @tc.desc      tabColumnsOf(width=2400, isFoldable=false) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0070 begin`);
      const actual: string = tabColumnsOf(2400, false);
      logInfo(`tabColumnsOf(width=2400, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0070 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0071
     * @tc.name      FoldableAdaptation_TabColumnsOf_0071
     * @tc.desc      tabColumnsOf(width=2496, isFoldable=true) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0071 begin`);
      const actual: string = tabColumnsOf(2496, true);
      logInfo(`tabColumnsOf(width=2496, isFoldable=true): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0071 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0072
     * @tc.name      FoldableAdaptation_TabColumnsOf_0072
     * @tc.desc      tabColumnsOf(width=2496, isFoldable=false) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0072 begin`);
      const actual: string = tabColumnsOf(2496, false);
      logInfo(`tabColumnsOf(width=2496, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0072 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0073
     * @tc.name      FoldableAdaptation_TabColumnsOf_0073
     * @tc.desc      tabColumnsOf(width=2592, isFoldable=false) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0073 begin`);
      const actual: string = tabColumnsOf(2592, false);
      logInfo(`tabColumnsOf(width=2592, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0073 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0074
     * @tc.name      FoldableAdaptation_TabColumnsOf_0074
     * @tc.desc      tabColumnsOf(width=2688, isFoldable=false) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0074 begin`);
      const actual: string = tabColumnsOf(2688, false);
      logInfo(`tabColumnsOf(width=2688, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0074 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0075
     * @tc.name      FoldableAdaptation_TabColumnsOf_0075
     * @tc.desc      tabColumnsOf(width=2784, isFoldable=true) returns " 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0075 begin`);
      const actual: string = tabColumnsOf(2784, true);
      logInfo(`tabColumnsOf(width=2784, isFoldable=true): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`tabColumnsOf(width=2784, isFoldable=true): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr ');
      logInfo(`tabColumnsOf(width=2784, isFoldable=true): actual.substring(35)=${actual.substring(35)}`);
      expect(actual.substring(35)).assertEqual(' 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0075 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0076
     * @tc.name      FoldableAdaptation_TabColumnsOf_0076
     * @tc.desc      tabColumnsOf(width=2784, isFoldable=false) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0076 begin`);
      const actual: string = tabColumnsOf(2784, false);
      logInfo(`tabColumnsOf(width=2784, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0076 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0077
     * @tc.name      FoldableAdaptation_TabColumnsOf_0077
     * @tc.desc      tabColumnsOf(width=2880, isFoldable=false) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0077 begin`);
      const actual: string = tabColumnsOf(2880, false);
      logInfo(`tabColumnsOf(width=2880, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0077 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0078
     * @tc.name      FoldableAdaptation_TabColumnsOf_0078
     * @tc.desc      tabColumnsOf(width=2976, isFoldable=true) returns " 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0078 begin`);
      const actual: string = tabColumnsOf(2976, true);
      logInfo(`tabColumnsOf(width=2976, isFoldable=true): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`tabColumnsOf(width=2976, isFoldable=true): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr ');
      logInfo(`tabColumnsOf(width=2976, isFoldable=true): actual.substring(39)=${actual.substring(39)}`);
      expect(actual.substring(39)).assertEqual(' 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0078 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0079
     * @tc.name      FoldableAdaptation_TabColumnsOf_0079
     * @tc.desc      tabColumnsOf(width=2976, isFoldable=false) returns "1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0079 begin`);
      const actual: string = tabColumnsOf(2976, false);
      logInfo(`tabColumnsOf(width=2976, isFoldable=false): actual=${actual}`);
      expect(actual).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0079 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0080
     * @tc.name      FoldableAdaptation_TabColumnsOf_0080
     * @tc.desc      tabColumnsOf(width=3072, isFoldable=false) returns " 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0080 begin`);
      const actual: string = tabColumnsOf(3072, false);
      logInfo(`tabColumnsOf(width=3072, isFoldable=false): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`tabColumnsOf(width=3072, isFoldable=false): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr ');
      logInfo(`tabColumnsOf(width=3072, isFoldable=false): actual.substring(35)=${actual.substring(35)}`);
      expect(actual.substring(35)).assertEqual(' 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0080 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0081
     * @tc.name      FoldableAdaptation_TabColumnsOf_0081
     * @tc.desc      tabColumnsOf(width=3168, isFoldable=false) returns " 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0081 begin`);
      const actual: string = tabColumnsOf(3168, false);
      logInfo(`tabColumnsOf(width=3168, isFoldable=false): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(67);
      logInfo(`tabColumnsOf(width=3168, isFoldable=false): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr ');
      logInfo(`tabColumnsOf(width=3168, isFoldable=false): actual.substring(35)=${actual.substring(35)}`);
      expect(actual.substring(35)).assertEqual(' 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0081 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0082
     * @tc.name      FoldableAdaptation_TabColumnsOf_0082
     * @tc.desc      tabColumnsOf(width=3264, isFoldable=true) returns " 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0082 begin`);
      const actual: string = tabColumnsOf(3264, true);
      logInfo(`tabColumnsOf(width=3264, isFoldable=true): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(79);
      logInfo(`tabColumnsOf(width=3264, isFoldable=true): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr ');
      logInfo(`tabColumnsOf(width=3264, isFoldable=true): actual.substring(47)=${actual.substring(47)}`);
      expect(actual.substring(47)).assertEqual(' 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0082 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0083
     * @tc.name      FoldableAdaptation_TabColumnsOf_0083
     * @tc.desc      tabColumnsOf(width=3264, isFoldable=false) returns " 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0083 begin`);
      const actual: string = tabColumnsOf(3264, false);
      logInfo(`tabColumnsOf(width=3264, isFoldable=false): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`tabColumnsOf(width=3264, isFoldable=false): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr ');
      logInfo(`tabColumnsOf(width=3264, isFoldable=false): actual.substring(39)=${actual.substring(39)}`);
      expect(actual.substring(39)).assertEqual(' 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0083 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0084
     * @tc.name      FoldableAdaptation_TabColumnsOf_0084
     * @tc.desc      tabColumnsOf(width=3360, isFoldable=false) returns " 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0084 begin`);
      const actual: string = tabColumnsOf(3360, false);
      logInfo(`tabColumnsOf(width=3360, isFoldable=false): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(71);
      logInfo(`tabColumnsOf(width=3360, isFoldable=false): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr ');
      logInfo(`tabColumnsOf(width=3360, isFoldable=false): actual.substring(39)=${actual.substring(39)}`);
      expect(actual.substring(39)).assertEqual(' 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0084 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0085
     * @tc.name      FoldableAdaptation_TabColumnsOf_0085
     * @tc.desc      tabColumnsOf(width=3456, isFoldable=true) returns " 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0085 begin`);
      const actual: string = tabColumnsOf(3456, true);
      logInfo(`tabColumnsOf(width=3456, isFoldable=true): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(83);
      logInfo(`tabColumnsOf(width=3456, isFoldable=true): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr ');
      logInfo(`tabColumnsOf(width=3456, isFoldable=true): actual.substring(51)=${actual.substring(51)}`);
      expect(actual.substring(51)).assertEqual(' 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0085 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0086
     * @tc.name      FoldableAdaptation_TabColumnsOf_0086
     * @tc.desc      tabColumnsOf(width=3456, isFoldable=false) returns " 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0086 begin`);
      const actual: string = tabColumnsOf(3456, false);
      logInfo(`tabColumnsOf(width=3456, isFoldable=false): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(75);
      logInfo(`tabColumnsOf(width=3456, isFoldable=false): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr ');
      logInfo(`tabColumnsOf(width=3456, isFoldable=false): actual.substring(43)=${actual.substring(43)}`);
      expect(actual.substring(43)).assertEqual(' 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0086 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0087
     * @tc.name      FoldableAdaptation_TabColumnsOf_0087
     * @tc.desc      tabColumnsOf(width=3552, isFoldable=false) returns " 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0087 begin`);
      const actual: string = tabColumnsOf(3552, false);
      logInfo(`tabColumnsOf(width=3552, isFoldable=false): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(79);
      logInfo(`tabColumnsOf(width=3552, isFoldable=false): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr ');
      logInfo(`tabColumnsOf(width=3552, isFoldable=false): actual.substring(47)=${actual.substring(47)}`);
      expect(actual.substring(47)).assertEqual(' 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0087 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0088
     * @tc.name      FoldableAdaptation_TabColumnsOf_0088
     * @tc.desc      tabColumnsOf(width=3648, isFoldable=false) returns " 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0088 begin`);
      const actual: string = tabColumnsOf(3648, false);
      logInfo(`tabColumnsOf(width=3648, isFoldable=false): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(79);
      logInfo(`tabColumnsOf(width=3648, isFoldable=false): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr ');
      logInfo(`tabColumnsOf(width=3648, isFoldable=false): actual.substring(47)=${actual.substring(47)}`);
      expect(actual.substring(47)).assertEqual(' 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0088 end`);
    });

    /**
     * @tc.number    SUB_FOLDABLEADAPTATION_TAB_COLUMNS_OF_0089
     * @tc.name      FoldableAdaptation_TabColumnsOf_0089
     * @tc.desc      tabColumnsOf(width=3744, isFoldable=true) returns " 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('TabColumnsOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}TabColumnsOf_0089 begin`);
      const actual: string = tabColumnsOf(3744, true);
      logInfo(`tabColumnsOf(width=3744, isFoldable=true): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(91);
      logInfo(`tabColumnsOf(width=3744, isFoldable=true): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr ');
      logInfo(`tabColumnsOf(width=3744, isFoldable=true): actual.substring(59)=${actual.substring(59)}`);
      expect(actual.substring(59)).assertEqual(' 1fr 1fr 1fr 1fr 1fr 1fr 1fr 1fr');
      logInfo(`${BUNDLE}TabColumnsOf_0089 end`);
    });
  });
}
