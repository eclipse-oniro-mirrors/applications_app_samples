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
import { routeOf } from './model/UiExtensionLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_UIExtensionSamples]';
const BUNDLE: string = 'UIExtensionSamples_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for routeOf (90 cases). */
export default function routeOfTest(): void {
  describe('RouteOfTest', () => {
    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0001
     * @tc.name      UIExtensionSamples_RouteOf_0001
     * @tc.desc      routeOf(item="") returns "uiextensionpages/"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_RouteOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RouteOf_0001 begin`);
      const actual: string = routeOf('');
      logInfo(`routeOf(item=""): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/');
      logInfo(`${BUNDLE}RouteOf_0001 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0002
     * @tc.name      UIExtensionSamples_RouteOf_0002
     * @tc.desc      routeOf(item="a") returns "uiextensionpages/a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('UIExtensionSamples_RouteOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}RouteOf_0002 begin`);
      const actual: string = routeOf('a');
      logInfo(`routeOf(item="a"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/a');
      logInfo(`${BUNDLE}RouteOf_0002 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0003
     * @tc.name      UIExtensionSamples_RouteOf_0003
     * @tc.desc      routeOf(item="abc") returns "uiextensionpages/abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0003 begin`);
      const actual: string = routeOf('abc');
      logInfo(`routeOf(item="abc"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/abc');
      logInfo(`${BUNDLE}RouteOf_0003 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0004
     * @tc.name      UIExtensionSamples_RouteOf_0004
     * @tc.desc      routeOf(item="Hello World") returns "uiextensionpages/Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0004 begin`);
      const actual: string = routeOf('Hello World');
      logInfo(`routeOf(item="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/Hello World');
      logInfo(`${BUNDLE}RouteOf_0004 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0005
     * @tc.name      UIExtensionSamples_RouteOf_0005
     * @tc.desc      routeOf(item=" ") returns "uiextensionpages/ "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0005 begin`);
      const actual: string = routeOf(' ');
      logInfo(`routeOf(item=" "): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/ ');
      logInfo(`${BUNDLE}RouteOf_0005 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0006
     * @tc.name      UIExtensionSamples_RouteOf_0006
     * @tc.desc      routeOf(item="123") returns "uiextensionpages/123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0006 begin`);
      const actual: string = routeOf('123');
      logInfo(`routeOf(item="123"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/123');
      logInfo(`${BUNDLE}RouteOf_0006 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0007
     * @tc.name      UIExtensionSamples_RouteOf_0007
     * @tc.desc      routeOf(item=" a ") returns "uiextensionpages/ a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_RouteOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RouteOf_0007 begin`);
      const actual: string = routeOf(' a ');
      logInfo(`routeOf(item=" a "): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/ a ');
      logInfo(`${BUNDLE}RouteOf_0007 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0008
     * @tc.name      UIExtensionSamples_RouteOf_0008
     * @tc.desc      routeOf(item="aa") returns "uiextensionpages/aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0008 begin`);
      const actual: string = routeOf('aa');
      logInfo(`routeOf(item="aa"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/aa');
      logInfo(`${BUNDLE}RouteOf_0008 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0009
     * @tc.name      UIExtensionSamples_RouteOf_0009
     * @tc.desc      routeOf(item="a_1") returns "uiextensionpages/a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0009 begin`);
      const actual: string = routeOf('a_1');
      logInfo(`routeOf(item="a_1"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/a_1');
      logInfo(`${BUNDLE}RouteOf_0009 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0010
     * @tc.name      UIExtensionSamples_RouteOf_0010
     * @tc.desc      routeOf(item="xa") returns "uiextensionpages/xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_RouteOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RouteOf_0010 begin`);
      const actual: string = routeOf('xa');
      logInfo(`routeOf(item="xa"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/xa');
      logInfo(`${BUNDLE}RouteOf_0010 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0011
     * @tc.name      UIExtensionSamples_RouteOf_0011
     * @tc.desc      routeOf(item=" abc ") returns "uiextensionpages/ abc "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_RouteOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RouteOf_0011 begin`);
      const actual: string = routeOf(' abc ');
      logInfo(`routeOf(item=" abc "): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/ abc ');
      logInfo(`${BUNDLE}RouteOf_0011 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0012
     * @tc.name      UIExtensionSamples_RouteOf_0012
     * @tc.desc      routeOf(item="abcabc") returns "uiextensionpages/abcabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0012 begin`);
      const actual: string = routeOf('abcabc');
      logInfo(`routeOf(item="abcabc"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/abcabc');
      logInfo(`${BUNDLE}RouteOf_0012 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0013
     * @tc.name      UIExtensionSamples_RouteOf_0013
     * @tc.desc      routeOf(item="abc_1") returns "uiextensionpages/abc_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0013 begin`);
      const actual: string = routeOf('abc_1');
      logInfo(`routeOf(item="abc_1"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/abc_1');
      logInfo(`${BUNDLE}RouteOf_0013 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0014
     * @tc.name      UIExtensionSamples_RouteOf_0014
     * @tc.desc      routeOf(item="xabc") returns "uiextensionpages/xabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_RouteOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RouteOf_0014 begin`);
      const actual: string = routeOf('xabc');
      logInfo(`routeOf(item="xabc"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/xabc');
      logInfo(`${BUNDLE}RouteOf_0014 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0015
     * @tc.name      UIExtensionSamples_RouteOf_0015
     * @tc.desc      routeOf(item=" Hello World ") returns "uiextensionpages/ Hello World "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_RouteOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RouteOf_0015 begin`);
      const actual: string = routeOf(' Hello World ');
      logInfo(`routeOf(item=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/ Hello World ');
      logInfo(`${BUNDLE}RouteOf_0015 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0016
     * @tc.name      UIExtensionSamples_RouteOf_0016
     * @tc.desc      routeOf(item="Hello WorldHello World") returns "uiextensionpages/Hello WorldHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0016 begin`);
      const actual: string = routeOf('Hello WorldHello World');
      logInfo(`routeOf(item="Hello WorldHello World"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/Hello WorldHello World');
      logInfo(`${BUNDLE}RouteOf_0016 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0017
     * @tc.name      UIExtensionSamples_RouteOf_0017
     * @tc.desc      routeOf(item="Hello World_1") returns "uiextensionpages/Hello World_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0017 begin`);
      const actual: string = routeOf('Hello World_1');
      logInfo(`routeOf(item="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/Hello World_1');
      logInfo(`${BUNDLE}RouteOf_0017 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0018
     * @tc.name      UIExtensionSamples_RouteOf_0018
     * @tc.desc      routeOf(item="xHello World") returns "uiextensionpages/xHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_RouteOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RouteOf_0018 begin`);
      const actual: string = routeOf('xHello World');
      logInfo(`routeOf(item="xHello World"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/xHello World');
      logInfo(`${BUNDLE}RouteOf_0018 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0019
     * @tc.name      UIExtensionSamples_RouteOf_0019
     * @tc.desc      routeOf(item="   ") returns "uiextensionpages/   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_RouteOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RouteOf_0019 begin`);
      const actual: string = routeOf('   ');
      logInfo(`routeOf(item="   "): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/   ');
      logInfo(`${BUNDLE}RouteOf_0019 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0020
     * @tc.name      UIExtensionSamples_RouteOf_0020
     * @tc.desc      routeOf(item="  ") returns "uiextensionpages/  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0020 begin`);
      const actual: string = routeOf('  ');
      logInfo(`routeOf(item="  "): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/  ');
      logInfo(`${BUNDLE}RouteOf_0020 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0021
     * @tc.name      UIExtensionSamples_RouteOf_0021
     * @tc.desc      routeOf(item=" _1") returns "uiextensionpages/ _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0021 begin`);
      const actual: string = routeOf(' _1');
      logInfo(`routeOf(item=" _1"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/ _1');
      logInfo(`${BUNDLE}RouteOf_0021 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0022
     * @tc.name      UIExtensionSamples_RouteOf_0022
     * @tc.desc      routeOf(item="x ") returns "uiextensionpages/x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_RouteOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RouteOf_0022 begin`);
      const actual: string = routeOf('x ');
      logInfo(`routeOf(item="x "): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/x ');
      logInfo(`${BUNDLE}RouteOf_0022 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0023
     * @tc.name      UIExtensionSamples_RouteOf_0023
     * @tc.desc      routeOf(item=" 123 ") returns "uiextensionpages/ 123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_RouteOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RouteOf_0023 begin`);
      const actual: string = routeOf(' 123 ');
      logInfo(`routeOf(item=" 123 "): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/ 123 ');
      logInfo(`${BUNDLE}RouteOf_0023 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0024
     * @tc.name      UIExtensionSamples_RouteOf_0024
     * @tc.desc      routeOf(item="123123") returns "uiextensionpages/123123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0024 begin`);
      const actual: string = routeOf('123123');
      logInfo(`routeOf(item="123123"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/123123');
      logInfo(`${BUNDLE}RouteOf_0024 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0025
     * @tc.name      UIExtensionSamples_RouteOf_0025
     * @tc.desc      routeOf(item="123_1") returns "uiextensionpages/123_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0025 begin`);
      const actual: string = routeOf('123_1');
      logInfo(`routeOf(item="123_1"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/123_1');
      logInfo(`${BUNDLE}RouteOf_0025 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0026
     * @tc.name      UIExtensionSamples_RouteOf_0026
     * @tc.desc      routeOf(item="x123") returns "uiextensionpages/x123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('UIExtensionSamples_RouteOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}RouteOf_0026 begin`);
      const actual: string = routeOf('x123');
      logInfo(`routeOf(item="x123"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/x123');
      logInfo(`${BUNDLE}RouteOf_0026 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0027
     * @tc.name      UIExtensionSamples_RouteOf_0027
     * @tc.desc      routeOf(item="s4ZURNQ") returns "uiextensionpages/s4ZURNQ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0027 begin`);
      const actual: string = routeOf('s4ZURNQ');
      logInfo(`routeOf(item="s4ZURNQ"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/s4ZURNQ');
      logInfo(`${BUNDLE}RouteOf_0027 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0028
     * @tc.name      UIExtensionSamples_RouteOf_0028
     * @tc.desc      routeOf(item="QV8UV4") returns "uiextensionpages/QV8UV4"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0028 begin`);
      const actual: string = routeOf('QV8UV4');
      logInfo(`routeOf(item="QV8UV4"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/QV8UV4');
      logInfo(`${BUNDLE}RouteOf_0028 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0029
     * @tc.name      UIExtensionSamples_RouteOf_0029
     * @tc.desc      routeOf(item="j9t3R") returns "uiextensionpages/j9t3R"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0029 begin`);
      const actual: string = routeOf('j9t3R');
      logInfo(`routeOf(item="j9t3R"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/j9t3R');
      logInfo(`${BUNDLE}RouteOf_0029 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0030
     * @tc.name      UIExtensionSamples_RouteOf_0030
     * @tc.desc      routeOf(item="b4KBcyjpn") returns "uiextensionpages/b4KBcyjpn"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0030 begin`);
      const actual: string = routeOf('b4KBcyjpn');
      logInfo(`routeOf(item="b4KBcyjpn"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/b4KBcyjpn');
      logInfo(`${BUNDLE}RouteOf_0030 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0031
     * @tc.name      UIExtensionSamples_RouteOf_0031
     * @tc.desc      routeOf(item="2Ixz") returns "uiextensionpages/2Ixz"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0031 begin`);
      const actual: string = routeOf('2Ixz');
      logInfo(`routeOf(item="2Ixz"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/2Ixz');
      logInfo(`${BUNDLE}RouteOf_0031 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0032
     * @tc.name      UIExtensionSamples_RouteOf_0032
     * @tc.desc      routeOf(item="F3wBt2A0P") returns "uiextensionpages/F3wBt2A0P"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0032 begin`);
      const actual: string = routeOf('F3wBt2A0P');
      logInfo(`routeOf(item="F3wBt2A0P"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/F3wBt2A0P');
      logInfo(`${BUNDLE}RouteOf_0032 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0033
     * @tc.name      UIExtensionSamples_RouteOf_0033
     * @tc.desc      routeOf(item="8n") returns "uiextensionpages/8n"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0033 begin`);
      const actual: string = routeOf('8n');
      logInfo(`routeOf(item="8n"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/8n');
      logInfo(`${BUNDLE}RouteOf_0033 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0034
     * @tc.name      UIExtensionSamples_RouteOf_0034
     * @tc.desc      routeOf(item="cl") returns "uiextensionpages/cl"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0034 begin`);
      const actual: string = routeOf('cl');
      logInfo(`routeOf(item="cl"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/cl');
      logInfo(`${BUNDLE}RouteOf_0034 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0035
     * @tc.name      UIExtensionSamples_RouteOf_0035
     * @tc.desc      routeOf(item="06n9") returns "uiextensionpages/06n9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0035 begin`);
      const actual: string = routeOf('06n9');
      logInfo(`routeOf(item="06n9"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/06n9');
      logInfo(`${BUNDLE}RouteOf_0035 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0036
     * @tc.name      UIExtensionSamples_RouteOf_0036
     * @tc.desc      routeOf(item="NSFCBBaGB") returns "uiextensionpages/NSFCBBaGB"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0036 begin`);
      const actual: string = routeOf('NSFCBBaGB');
      logInfo(`routeOf(item="NSFCBBaGB"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/NSFCBBaGB');
      logInfo(`${BUNDLE}RouteOf_0036 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0037
     * @tc.name      UIExtensionSamples_RouteOf_0037
     * @tc.desc      routeOf(item="1374v38") returns "uiextensionpages/1374v38"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0037 begin`);
      const actual: string = routeOf('1374v38');
      logInfo(`routeOf(item="1374v38"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/1374v38');
      logInfo(`${BUNDLE}RouteOf_0037 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0038
     * @tc.name      UIExtensionSamples_RouteOf_0038
     * @tc.desc      routeOf(item="ylOJCPlus7") returns "uiextensionpages/ylOJCPlus7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0038 begin`);
      const actual: string = routeOf('ylOJCPlus7');
      logInfo(`routeOf(item="ylOJCPlus7"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/ylOJCPlus7');
      logInfo(`${BUNDLE}RouteOf_0038 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0039
     * @tc.name      UIExtensionSamples_RouteOf_0039
     * @tc.desc      routeOf(item="mJ6wPfDy") returns "uiextensionpages/mJ6wPfDy"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0039 begin`);
      const actual: string = routeOf('mJ6wPfDy');
      logInfo(`routeOf(item="mJ6wPfDy"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/mJ6wPfDy');
      logInfo(`${BUNDLE}RouteOf_0039 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0040
     * @tc.name      UIExtensionSamples_RouteOf_0040
     * @tc.desc      routeOf(item="uQb2RZW6QA") returns "uiextensionpages/uQb2RZW6QA"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0040 begin`);
      const actual: string = routeOf('uQb2RZW6QA');
      logInfo(`routeOf(item="uQb2RZW6QA"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/uQb2RZW6QA');
      logInfo(`${BUNDLE}RouteOf_0040 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0041
     * @tc.name      UIExtensionSamples_RouteOf_0041
     * @tc.desc      routeOf(item="PM") returns "uiextensionpages/PM"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0041 begin`);
      const actual: string = routeOf('PM');
      logInfo(`routeOf(item="PM"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/PM');
      logInfo(`${BUNDLE}RouteOf_0041 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0042
     * @tc.name      UIExtensionSamples_RouteOf_0042
     * @tc.desc      routeOf(item="UHoTZjZ7") returns "uiextensionpages/UHoTZjZ7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0042 begin`);
      const actual: string = routeOf('UHoTZjZ7');
      logInfo(`routeOf(item="UHoTZjZ7"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UHoTZjZ7');
      logInfo(`${BUNDLE}RouteOf_0042 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0043
     * @tc.name      UIExtensionSamples_RouteOf_0043
     * @tc.desc      routeOf(item="aQ8E") returns "uiextensionpages/aQ8E"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0043 begin`);
      const actual: string = routeOf('aQ8E');
      logInfo(`routeOf(item="aQ8E"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/aQ8E');
      logInfo(`${BUNDLE}RouteOf_0043 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0044
     * @tc.name      UIExtensionSamples_RouteOf_0044
     * @tc.desc      routeOf(item="VnjQj") returns "uiextensionpages/VnjQj"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0044 begin`);
      const actual: string = routeOf('VnjQj');
      logInfo(`routeOf(item="VnjQj"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/VnjQj');
      logInfo(`${BUNDLE}RouteOf_0044 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0045
     * @tc.name      UIExtensionSamples_RouteOf_0045
     * @tc.desc      routeOf(item="tVGB0gBqIum") returns "uiextensionpages/tVGB0gBqIum"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0045 begin`);
      const actual: string = routeOf('tVGB0gBqIum');
      logInfo(`routeOf(item="tVGB0gBqIum"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/tVGB0gBqIum');
      logInfo(`${BUNDLE}RouteOf_0045 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0046
     * @tc.name      UIExtensionSamples_RouteOf_0046
     * @tc.desc      routeOf(item="gVmzE58DJFX") returns "uiextensionpages/gVmzE58DJFX"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0046 begin`);
      const actual: string = routeOf('gVmzE58DJFX');
      logInfo(`routeOf(item="gVmzE58DJFX"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/gVmzE58DJFX');
      logInfo(`${BUNDLE}RouteOf_0046 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0047
     * @tc.name      UIExtensionSamples_RouteOf_0047
     * @tc.desc      routeOf(item="njyyqe7") returns "uiextensionpages/njyyqe7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0047 begin`);
      const actual: string = routeOf('njyyqe7');
      logInfo(`routeOf(item="njyyqe7"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/njyyqe7');
      logInfo(`${BUNDLE}RouteOf_0047 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0048
     * @tc.name      UIExtensionSamples_RouteOf_0048
     * @tc.desc      routeOf(item="z6at") returns "uiextensionpages/z6at"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0048 begin`);
      const actual: string = routeOf('z6at');
      logInfo(`routeOf(item="z6at"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/z6at');
      logInfo(`${BUNDLE}RouteOf_0048 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0049
     * @tc.name      UIExtensionSamples_RouteOf_0049
     * @tc.desc      routeOf(item="pf37anc") returns "uiextensionpages/pf37anc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0049 begin`);
      const actual: string = routeOf('pf37anc');
      logInfo(`routeOf(item="pf37anc"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/pf37anc');
      logInfo(`${BUNDLE}RouteOf_0049 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0050
     * @tc.name      UIExtensionSamples_RouteOf_0050
     * @tc.desc      routeOf(item="ydRFvhReZe") returns "uiextensionpages/ydRFvhReZe"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0050 begin`);
      const actual: string = routeOf('ydRFvhReZe');
      logInfo(`routeOf(item="ydRFvhReZe"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/ydRFvhReZe');
      logInfo(`${BUNDLE}RouteOf_0050 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0051
     * @tc.name      UIExtensionSamples_RouteOf_0051
     * @tc.desc      routeOf(item="53yjThh99R") returns "uiextensionpages/53yjThh99R"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0051 begin`);
      const actual: string = routeOf('53yjThh99R');
      logInfo(`routeOf(item="53yjThh99R"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/53yjThh99R');
      logInfo(`${BUNDLE}RouteOf_0051 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0052
     * @tc.name      UIExtensionSamples_RouteOf_0052
     * @tc.desc      routeOf(item="VO67yh4C6") returns "uiextensionpages/VO67yh4C6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0052 begin`);
      const actual: string = routeOf('VO67yh4C6');
      logInfo(`routeOf(item="VO67yh4C6"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/VO67yh4C6');
      logInfo(`${BUNDLE}RouteOf_0052 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0053
     * @tc.name      UIExtensionSamples_RouteOf_0053
     * @tc.desc      routeOf(item="aTPimoq8I") returns "uiextensionpages/aTPimoq8I"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0053 begin`);
      const actual: string = routeOf('aTPimoq8I');
      logInfo(`routeOf(item="aTPimoq8I"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/aTPimoq8I');
      logInfo(`${BUNDLE}RouteOf_0053 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0054
     * @tc.name      UIExtensionSamples_RouteOf_0054
     * @tc.desc      routeOf(item="7YIhu94") returns "uiextensionpages/7YIhu94"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0054 begin`);
      const actual: string = routeOf('7YIhu94');
      logInfo(`routeOf(item="7YIhu94"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/7YIhu94');
      logInfo(`${BUNDLE}RouteOf_0054 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0055
     * @tc.name      UIExtensionSamples_RouteOf_0055
     * @tc.desc      routeOf(item="X") returns "uiextensionpages/X"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0055 begin`);
      const actual: string = routeOf('X');
      logInfo(`routeOf(item="X"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/X');
      logInfo(`${BUNDLE}RouteOf_0055 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0056
     * @tc.name      UIExtensionSamples_RouteOf_0056
     * @tc.desc      routeOf(item="b") returns "uiextensionpages/b"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0056 begin`);
      const actual: string = routeOf('b');
      logInfo(`routeOf(item="b"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/b');
      logInfo(`${BUNDLE}RouteOf_0056 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0057
     * @tc.name      UIExtensionSamples_RouteOf_0057
     * @tc.desc      routeOf(item="aQOJvB0t") returns "uiextensionpages/aQOJvB0t"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0057 begin`);
      const actual: string = routeOf('aQOJvB0t');
      logInfo(`routeOf(item="aQOJvB0t"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/aQOJvB0t');
      logInfo(`${BUNDLE}RouteOf_0057 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0058
     * @tc.name      UIExtensionSamples_RouteOf_0058
     * @tc.desc      routeOf(item="Npf3Fhqyr") returns "uiextensionpages/Npf3Fhqyr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0058 begin`);
      const actual: string = routeOf('Npf3Fhqyr');
      logInfo(`routeOf(item="Npf3Fhqyr"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/Npf3Fhqyr');
      logInfo(`${BUNDLE}RouteOf_0058 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0059
     * @tc.name      UIExtensionSamples_RouteOf_0059
     * @tc.desc      routeOf(item="A7Ph0r9koL") returns "uiextensionpages/A7Ph0r9koL"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0059 begin`);
      const actual: string = routeOf('A7Ph0r9koL');
      logInfo(`routeOf(item="A7Ph0r9koL"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/A7Ph0r9koL');
      logInfo(`${BUNDLE}RouteOf_0059 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0060
     * @tc.name      UIExtensionSamples_RouteOf_0060
     * @tc.desc      routeOf(item="n") returns "uiextensionpages/n"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0060 begin`);
      const actual: string = routeOf('n');
      logInfo(`routeOf(item="n"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/n');
      logInfo(`${BUNDLE}RouteOf_0060 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0061
     * @tc.name      UIExtensionSamples_RouteOf_0061
     * @tc.desc      routeOf(item="oq5WQ") returns "uiextensionpages/oq5WQ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0061 begin`);
      const actual: string = routeOf('oq5WQ');
      logInfo(`routeOf(item="oq5WQ"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/oq5WQ');
      logInfo(`${BUNDLE}RouteOf_0061 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0062
     * @tc.name      UIExtensionSamples_RouteOf_0062
     * @tc.desc      routeOf(item="AabQW2Yah3") returns "uiextensionpages/AabQW2Yah3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0062 begin`);
      const actual: string = routeOf('AabQW2Yah3');
      logInfo(`routeOf(item="AabQW2Yah3"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/AabQW2Yah3');
      logInfo(`${BUNDLE}RouteOf_0062 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0063
     * @tc.name      UIExtensionSamples_RouteOf_0063
     * @tc.desc      routeOf(item="moSKZP") returns "uiextensionpages/moSKZP"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0063 begin`);
      const actual: string = routeOf('moSKZP');
      logInfo(`routeOf(item="moSKZP"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/moSKZP');
      logInfo(`${BUNDLE}RouteOf_0063 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0064
     * @tc.name      UIExtensionSamples_RouteOf_0064
     * @tc.desc      routeOf(item="hQ4QGPJA") returns "uiextensionpages/hQ4QGPJA"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0064 begin`);
      const actual: string = routeOf('hQ4QGPJA');
      logInfo(`routeOf(item="hQ4QGPJA"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/hQ4QGPJA');
      logInfo(`${BUNDLE}RouteOf_0064 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0065
     * @tc.name      UIExtensionSamples_RouteOf_0065
     * @tc.desc      routeOf(item="i2Uy9wvTY") returns "uiextensionpages/i2Uy9wvTY"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0065 begin`);
      const actual: string = routeOf('i2Uy9wvTY');
      logInfo(`routeOf(item="i2Uy9wvTY"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/i2Uy9wvTY');
      logInfo(`${BUNDLE}RouteOf_0065 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0066
     * @tc.name      UIExtensionSamples_RouteOf_0066
     * @tc.desc      routeOf(item="PMP") returns "uiextensionpages/PMP"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0066 begin`);
      const actual: string = routeOf('PMP');
      logInfo(`routeOf(item="PMP"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/PMP');
      logInfo(`${BUNDLE}RouteOf_0066 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0067
     * @tc.name      UIExtensionSamples_RouteOf_0067
     * @tc.desc      routeOf(item="sBPj4EepOtQ") returns "uiextensionpages/sBPj4EepOtQ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0067 begin`);
      const actual: string = routeOf('sBPj4EepOtQ');
      logInfo(`routeOf(item="sBPj4EepOtQ"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/sBPj4EepOtQ');
      logInfo(`${BUNDLE}RouteOf_0067 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0068
     * @tc.name      UIExtensionSamples_RouteOf_0068
     * @tc.desc      routeOf(item="Pr6") returns "uiextensionpages/Pr6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0068 begin`);
      const actual: string = routeOf('Pr6');
      logInfo(`routeOf(item="Pr6"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/Pr6');
      logInfo(`${BUNDLE}RouteOf_0068 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0069
     * @tc.name      UIExtensionSamples_RouteOf_0069
     * @tc.desc      routeOf(item="6oi") returns "uiextensionpages/6oi"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0069 begin`);
      const actual: string = routeOf('6oi');
      logInfo(`routeOf(item="6oi"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/6oi');
      logInfo(`${BUNDLE}RouteOf_0069 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0070
     * @tc.name      UIExtensionSamples_RouteOf_0070
     * @tc.desc      routeOf(item="tUQuY1DYGNM") returns "uiextensionpages/tUQuY1DYGNM"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0070 begin`);
      const actual: string = routeOf('tUQuY1DYGNM');
      logInfo(`routeOf(item="tUQuY1DYGNM"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/tUQuY1DYGNM');
      logInfo(`${BUNDLE}RouteOf_0070 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0071
     * @tc.name      UIExtensionSamples_RouteOf_0071
     * @tc.desc      routeOf(item="RjiFDbzKnYa") returns "uiextensionpages/RjiFDbzKnYa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0071 begin`);
      const actual: string = routeOf('RjiFDbzKnYa');
      logInfo(`routeOf(item="RjiFDbzKnYa"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/RjiFDbzKnYa');
      logInfo(`${BUNDLE}RouteOf_0071 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0072
     * @tc.name      UIExtensionSamples_RouteOf_0072
     * @tc.desc      routeOf(item="2Tg") returns "uiextensionpages/2Tg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0072 begin`);
      const actual: string = routeOf('2Tg');
      logInfo(`routeOf(item="2Tg"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/2Tg');
      logInfo(`${BUNDLE}RouteOf_0072 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0073
     * @tc.name      UIExtensionSamples_RouteOf_0073
     * @tc.desc      routeOf(item="Lk1nJF") returns "uiextensionpages/Lk1nJF"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0073 begin`);
      const actual: string = routeOf('Lk1nJF');
      logInfo(`routeOf(item="Lk1nJF"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/Lk1nJF');
      logInfo(`${BUNDLE}RouteOf_0073 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0074
     * @tc.name      UIExtensionSamples_RouteOf_0074
     * @tc.desc      routeOf(item="uVIXQEyRY") returns "uiextensionpages/uVIXQEyRY"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0074 begin`);
      const actual: string = routeOf('uVIXQEyRY');
      logInfo(`routeOf(item="uVIXQEyRY"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/uVIXQEyRY');
      logInfo(`${BUNDLE}RouteOf_0074 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0075
     * @tc.name      UIExtensionSamples_RouteOf_0075
     * @tc.desc      routeOf(item="UULmiTBSmEcn") returns "uiextensionpages/UULmiTBSmEcn"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0075 begin`);
      const actual: string = routeOf('UULmiTBSmEcn');
      logInfo(`routeOf(item="UULmiTBSmEcn"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/UULmiTBSmEcn');
      logInfo(`${BUNDLE}RouteOf_0075 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0076
     * @tc.name      UIExtensionSamples_RouteOf_0076
     * @tc.desc      routeOf(item="hr") returns "uiextensionpages/hr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0076 begin`);
      const actual: string = routeOf('hr');
      logInfo(`routeOf(item="hr"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/hr');
      logInfo(`${BUNDLE}RouteOf_0076 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0077
     * @tc.name      UIExtensionSamples_RouteOf_0077
     * @tc.desc      routeOf(item="nSUSIH9") returns "uiextensionpages/nSUSIH9"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0077 begin`);
      const actual: string = routeOf('nSUSIH9');
      logInfo(`routeOf(item="nSUSIH9"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/nSUSIH9');
      logInfo(`${BUNDLE}RouteOf_0077 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0078
     * @tc.name      UIExtensionSamples_RouteOf_0078
     * @tc.desc      routeOf(item="jfV6ux3PcJr") returns "uiextensionpages/jfV6ux3PcJr"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0078 begin`);
      const actual: string = routeOf('jfV6ux3PcJr');
      logInfo(`routeOf(item="jfV6ux3PcJr"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/jfV6ux3PcJr');
      logInfo(`${BUNDLE}RouteOf_0078 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0079
     * @tc.name      UIExtensionSamples_RouteOf_0079
     * @tc.desc      routeOf(item="sCJIQpsb") returns "uiextensionpages/sCJIQpsb"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0079 begin`);
      const actual: string = routeOf('sCJIQpsb');
      logInfo(`routeOf(item="sCJIQpsb"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/sCJIQpsb');
      logInfo(`${BUNDLE}RouteOf_0079 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0080
     * @tc.name      UIExtensionSamples_RouteOf_0080
     * @tc.desc      routeOf(item="T56BzzO1P") returns "uiextensionpages/T56BzzO1P"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0080 begin`);
      const actual: string = routeOf('T56BzzO1P');
      logInfo(`routeOf(item="T56BzzO1P"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/T56BzzO1P');
      logInfo(`${BUNDLE}RouteOf_0080 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0081
     * @tc.name      UIExtensionSamples_RouteOf_0081
     * @tc.desc      routeOf(item="0QUJXMyMk") returns "uiextensionpages/0QUJXMyMk"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0081 begin`);
      const actual: string = routeOf('0QUJXMyMk');
      logInfo(`routeOf(item="0QUJXMyMk"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/0QUJXMyMk');
      logInfo(`${BUNDLE}RouteOf_0081 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0082
     * @tc.name      UIExtensionSamples_RouteOf_0082
     * @tc.desc      routeOf(item="Tw9VH6") returns "uiextensionpages/Tw9VH6"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0082 begin`);
      const actual: string = routeOf('Tw9VH6');
      logInfo(`routeOf(item="Tw9VH6"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/Tw9VH6');
      logInfo(`${BUNDLE}RouteOf_0082 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0083
     * @tc.name      UIExtensionSamples_RouteOf_0083
     * @tc.desc      routeOf(item="t") returns "uiextensionpages/t"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0083 begin`);
      const actual: string = routeOf('t');
      logInfo(`routeOf(item="t"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/t');
      logInfo(`${BUNDLE}RouteOf_0083 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0084
     * @tc.name      UIExtensionSamples_RouteOf_0084
     * @tc.desc      routeOf(item="MNyxK4rDF") returns "uiextensionpages/MNyxK4rDF"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0084 begin`);
      const actual: string = routeOf('MNyxK4rDF');
      logInfo(`routeOf(item="MNyxK4rDF"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/MNyxK4rDF');
      logInfo(`${BUNDLE}RouteOf_0084 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0085
     * @tc.name      UIExtensionSamples_RouteOf_0085
     * @tc.desc      routeOf(item="CH81QRl") returns "uiextensionpages/CH81QRl"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0085 begin`);
      const actual: string = routeOf('CH81QRl');
      logInfo(`routeOf(item="CH81QRl"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/CH81QRl');
      logInfo(`${BUNDLE}RouteOf_0085 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0086
     * @tc.name      UIExtensionSamples_RouteOf_0086
     * @tc.desc      routeOf(item="n9uPVW") returns "uiextensionpages/n9uPVW"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0086 begin`);
      const actual: string = routeOf('n9uPVW');
      logInfo(`routeOf(item="n9uPVW"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/n9uPVW');
      logInfo(`${BUNDLE}RouteOf_0086 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0087
     * @tc.name      UIExtensionSamples_RouteOf_0087
     * @tc.desc      routeOf(item="lenOA") returns "uiextensionpages/lenOA"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0087 begin`);
      const actual: string = routeOf('lenOA');
      logInfo(`routeOf(item="lenOA"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/lenOA');
      logInfo(`${BUNDLE}RouteOf_0087 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0088
     * @tc.name      UIExtensionSamples_RouteOf_0088
     * @tc.desc      routeOf(item="cTt") returns "uiextensionpages/cTt"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0088 begin`);
      const actual: string = routeOf('cTt');
      logInfo(`routeOf(item="cTt"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/cTt');
      logInfo(`${BUNDLE}RouteOf_0088 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0089
     * @tc.name      UIExtensionSamples_RouteOf_0089
     * @tc.desc      routeOf(item="LaX5") returns "uiextensionpages/LaX5"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0089 begin`);
      const actual: string = routeOf('LaX5');
      logInfo(`routeOf(item="LaX5"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/LaX5');
      logInfo(`${BUNDLE}RouteOf_0089 end`);
    });

    /**
     * @tc.number    SUB_UIEXTENSIONSAMPLES_ROUTE_OF_0090
     * @tc.name      UIExtensionSamples_RouteOf_0090
     * @tc.desc      routeOf(item="gclz") returns "uiextensionpages/gclz"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('UIExtensionSamples_RouteOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}RouteOf_0090 begin`);
      const actual: string = routeOf('gclz');
      logInfo(`routeOf(item="gclz"): actual=${actual}`);
      expect(actual).assertEqual('uiextensionpages/gclz');
      logInfo(`${BUNDLE}RouteOf_0090 end`);
    });
  });
}
