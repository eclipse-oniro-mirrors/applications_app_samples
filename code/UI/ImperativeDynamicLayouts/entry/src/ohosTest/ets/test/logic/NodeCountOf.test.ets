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

import { describe, beforeEach, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../TestEventLoop';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { nodeCountOf } from '../model/DynamicLayoutLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ImperativeDynamicLayouts]';
const BUNDLE: string = 'ImperativeDynamicLayouts_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for nodeCountOf (50 cases). */
export default function nodeCountOfTest(): void {
  describe('NodeCountOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0001
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0001
     * @tc.desc      nodeCountOf(type="") returns 24
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NodeCountOf_0001 begin`);
      const actual: number = nodeCountOf('');
      logInfo(`nodeCountOf(type=""): actual=${actual}`);
      expect(actual).assertEqual(24);
      logInfo(`${BUNDLE}NodeCountOf_0001 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0002
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0002
     * @tc.desc      nodeCountOf(type="a") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}NodeCountOf_0002 begin`);
      const actual: number = nodeCountOf('a');
      logInfo(`nodeCountOf(type="a"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0002 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0003
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0003
     * @tc.desc      nodeCountOf(type="abc") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0003 begin`);
      const actual: number = nodeCountOf('abc');
      logInfo(`nodeCountOf(type="abc"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0003 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0004
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0004
     * @tc.desc      nodeCountOf(type="Hello World") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0004 begin`);
      const actual: number = nodeCountOf('Hello World');
      logInfo(`nodeCountOf(type="Hello World"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0004 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0005
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0005
     * @tc.desc      nodeCountOf(type=" ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0005 begin`);
      const actual: number = nodeCountOf(' ');
      logInfo(`nodeCountOf(type=" "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0005 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0006
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0006
     * @tc.desc      nodeCountOf(type="123") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0006 begin`);
      const actual: number = nodeCountOf('123');
      logInfo(`nodeCountOf(type="123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0006 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0007
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0007
     * @tc.desc      nodeCountOf(type=" a ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NodeCountOf_0007 begin`);
      const actual: number = nodeCountOf(' a ');
      logInfo(`nodeCountOf(type=" a "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0007 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0008
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0008
     * @tc.desc      nodeCountOf(type="aa") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0008 begin`);
      const actual: number = nodeCountOf('aa');
      logInfo(`nodeCountOf(type="aa"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0008 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0009
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0009
     * @tc.desc      nodeCountOf(type="a_1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0009 begin`);
      const actual: number = nodeCountOf('a_1');
      logInfo(`nodeCountOf(type="a_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0009 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0010
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0010
     * @tc.desc      nodeCountOf(type="xa") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NodeCountOf_0010 begin`);
      const actual: number = nodeCountOf('xa');
      logInfo(`nodeCountOf(type="xa"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0010 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0011
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0011
     * @tc.desc      nodeCountOf(type=" abc ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NodeCountOf_0011 begin`);
      const actual: number = nodeCountOf(' abc ');
      logInfo(`nodeCountOf(type=" abc "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0011 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0012
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0012
     * @tc.desc      nodeCountOf(type="abcabc") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0012 begin`);
      const actual: number = nodeCountOf('abcabc');
      logInfo(`nodeCountOf(type="abcabc"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0012 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0013
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0013
     * @tc.desc      nodeCountOf(type="abc_1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0013 begin`);
      const actual: number = nodeCountOf('abc_1');
      logInfo(`nodeCountOf(type="abc_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0013 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0014
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0014
     * @tc.desc      nodeCountOf(type="xabc") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NodeCountOf_0014 begin`);
      const actual: number = nodeCountOf('xabc');
      logInfo(`nodeCountOf(type="xabc"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0014 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0015
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0015
     * @tc.desc      nodeCountOf(type=" Hello World ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NodeCountOf_0015 begin`);
      const actual: number = nodeCountOf(' Hello World ');
      logInfo(`nodeCountOf(type=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0015 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0016
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0016
     * @tc.desc      nodeCountOf(type="Hello WorldHello World") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0016 begin`);
      const actual: number = nodeCountOf('Hello WorldHello World');
      logInfo(`nodeCountOf(type="Hello WorldHello World"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0016 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0017
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0017
     * @tc.desc      nodeCountOf(type="Hello World_1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0017 begin`);
      const actual: number = nodeCountOf('Hello World_1');
      logInfo(`nodeCountOf(type="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0017 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0018
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0018
     * @tc.desc      nodeCountOf(type="xHello World") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NodeCountOf_0018 begin`);
      const actual: number = nodeCountOf('xHello World');
      logInfo(`nodeCountOf(type="xHello World"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0018 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0019
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0019
     * @tc.desc      nodeCountOf(type="   ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NodeCountOf_0019 begin`);
      const actual: number = nodeCountOf('   ');
      logInfo(`nodeCountOf(type="   "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0019 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0020
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0020
     * @tc.desc      nodeCountOf(type="  ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0020 begin`);
      const actual: number = nodeCountOf('  ');
      logInfo(`nodeCountOf(type="  "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0020 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0021
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0021
     * @tc.desc      nodeCountOf(type=" _1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0021 begin`);
      const actual: number = nodeCountOf(' _1');
      logInfo(`nodeCountOf(type=" _1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0021 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0022
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0022
     * @tc.desc      nodeCountOf(type="x ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NodeCountOf_0022 begin`);
      const actual: number = nodeCountOf('x ');
      logInfo(`nodeCountOf(type="x "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0022 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0023
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0023
     * @tc.desc      nodeCountOf(type=" 123 ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NodeCountOf_0023 begin`);
      const actual: number = nodeCountOf(' 123 ');
      logInfo(`nodeCountOf(type=" 123 "): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0023 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0024
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0024
     * @tc.desc      nodeCountOf(type="123123") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0024 begin`);
      const actual: number = nodeCountOf('123123');
      logInfo(`nodeCountOf(type="123123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0024 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0025
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0025
     * @tc.desc      nodeCountOf(type="123_1") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0025 begin`);
      const actual: number = nodeCountOf('123_1');
      logInfo(`nodeCountOf(type="123_1"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0025 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0026
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0026
     * @tc.desc      nodeCountOf(type="x123") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}NodeCountOf_0026 begin`);
      const actual: number = nodeCountOf('x123');
      logInfo(`nodeCountOf(type="x123"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0026 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0027
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0027
     * @tc.desc      nodeCountOf(type="yTisiJcwWmZG") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0027 begin`);
      const actual: number = nodeCountOf('yTisiJcwWmZG');
      logInfo(`nodeCountOf(type="yTisiJcwWmZG"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0027 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0028
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0028
     * @tc.desc      nodeCountOf(type="hhOz") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0028 begin`);
      const actual: number = nodeCountOf('hhOz');
      logInfo(`nodeCountOf(type="hhOz"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0028 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0029
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0029
     * @tc.desc      nodeCountOf(type="dXG88KBTgnB") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0029 begin`);
      const actual: number = nodeCountOf('dXG88KBTgnB');
      logInfo(`nodeCountOf(type="dXG88KBTgnB"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0029 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0030
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0030
     * @tc.desc      nodeCountOf(type="QW") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0030 begin`);
      const actual: number = nodeCountOf('QW');
      logInfo(`nodeCountOf(type="QW"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0030 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0031
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0031
     * @tc.desc      nodeCountOf(type="VF5gOize0PxV") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0031 begin`);
      const actual: number = nodeCountOf('VF5gOize0PxV');
      logInfo(`nodeCountOf(type="VF5gOize0PxV"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0031 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0032
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0032
     * @tc.desc      nodeCountOf(type="Xy") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0032 begin`);
      const actual: number = nodeCountOf('Xy');
      logInfo(`nodeCountOf(type="Xy"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0032 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0033
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0033
     * @tc.desc      nodeCountOf(type="jwiVizZ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0033 begin`);
      const actual: number = nodeCountOf('jwiVizZ');
      logInfo(`nodeCountOf(type="jwiVizZ"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0033 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0034
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0034
     * @tc.desc      nodeCountOf(type="D") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0034 begin`);
      const actual: number = nodeCountOf('D');
      logInfo(`nodeCountOf(type="D"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0034 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0035
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0035
     * @tc.desc      nodeCountOf(type="0ASSnbiH") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0035 begin`);
      const actual: number = nodeCountOf('0ASSnbiH');
      logInfo(`nodeCountOf(type="0ASSnbiH"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0035 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0036
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0036
     * @tc.desc      nodeCountOf(type="vRMM6qav64b") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0036 begin`);
      const actual: number = nodeCountOf('vRMM6qav64b');
      logInfo(`nodeCountOf(type="vRMM6qav64b"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0036 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0037
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0037
     * @tc.desc      nodeCountOf(type="ToAv") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0037 begin`);
      const actual: number = nodeCountOf('ToAv');
      logInfo(`nodeCountOf(type="ToAv"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0037 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0038
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0038
     * @tc.desc      nodeCountOf(type="4o8AaL") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0038 begin`);
      const actual: number = nodeCountOf('4o8AaL');
      logInfo(`nodeCountOf(type="4o8AaL"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0038 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0039
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0039
     * @tc.desc      nodeCountOf(type="zy") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0039 begin`);
      const actual: number = nodeCountOf('zy');
      logInfo(`nodeCountOf(type="zy"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0039 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0040
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0040
     * @tc.desc      nodeCountOf(type="hMky8S") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0040 begin`);
      const actual: number = nodeCountOf('hMky8S');
      logInfo(`nodeCountOf(type="hMky8S"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0040 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0041
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0041
     * @tc.desc      nodeCountOf(type="kbQgaz6FN") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0041 begin`);
      const actual: number = nodeCountOf('kbQgaz6FN');
      logInfo(`nodeCountOf(type="kbQgaz6FN"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0041 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0042
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0042
     * @tc.desc      nodeCountOf(type="2") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0042 begin`);
      const actual: number = nodeCountOf('2');
      logInfo(`nodeCountOf(type="2"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0042 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0043
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0043
     * @tc.desc      nodeCountOf(type="K") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0043 begin`);
      const actual: number = nodeCountOf('K');
      logInfo(`nodeCountOf(type="K"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0043 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0044
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0044
     * @tc.desc      nodeCountOf(type="O4xudJ7bNHJ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0044 begin`);
      const actual: number = nodeCountOf('O4xudJ7bNHJ');
      logInfo(`nodeCountOf(type="O4xudJ7bNHJ"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0044 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0045
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0045
     * @tc.desc      nodeCountOf(type="DfmF") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0045 begin`);
      const actual: number = nodeCountOf('DfmF');
      logInfo(`nodeCountOf(type="DfmF"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0045 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0046
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0046
     * @tc.desc      nodeCountOf(type="P1kZqLkfB8g") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0046 begin`);
      const actual: number = nodeCountOf('P1kZqLkfB8g');
      logInfo(`nodeCountOf(type="P1kZqLkfB8g"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0046 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0047
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0047
     * @tc.desc      nodeCountOf(type="6JushEyAwk") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0047 begin`);
      const actual: number = nodeCountOf('6JushEyAwk');
      logInfo(`nodeCountOf(type="6JushEyAwk"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0047 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0048
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0048
     * @tc.desc      nodeCountOf(type="c") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0048 begin`);
      const actual: number = nodeCountOf('c');
      logInfo(`nodeCountOf(type="c"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0048 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0049
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0049
     * @tc.desc      nodeCountOf(type="bTQxNQ") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0049 begin`);
      const actual: number = nodeCountOf('bTQxNQ');
      logInfo(`nodeCountOf(type="bTQxNQ"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0049 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_NODE_COUNT_OF_0050
     * @tc.name      ImperativeDynamicLayouts_NodeCountOf_0050
     * @tc.desc      nodeCountOf(type="w3qoC7fQ0") returns 0
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_NodeCountOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}NodeCountOf_0050 begin`);
      const actual: number = nodeCountOf('w3qoC7fQ0');
      logInfo(`nodeCountOf(type="w3qoC7fQ0"): actual=${actual}`);
      expect(actual).assertEqual(0);
      logInfo(`${BUNDLE}NodeCountOf_0050 end`);
    });
  });
}
