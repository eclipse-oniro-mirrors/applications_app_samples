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
import { factoryKindOf } from '../model/DynamicLayoutLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ImperativeDynamicLayouts]';
const BUNDLE: string = 'ImperativeDynamicLayouts_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for factoryKindOf (30 cases). */
export default function factoryKindOfTest(): void {
  describe('FactoryKindOfTest', () => {
    beforeEach(yieldToEventLoop);
    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FACTORY_KIND_OF_0001
     * @tc.name      ImperativeDynamicLayouts_FactoryKindOf_0001
     * @tc.desc      factoryKindOf(type="") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImperativeDynamicLayouts_FactoryKindOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FactoryKindOf_0001 begin`);
      const actual: string = factoryKindOf('');
      logInfo(`factoryKindOf(type=""): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}FactoryKindOf_0001 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FACTORY_KIND_OF_0002
     * @tc.name      ImperativeDynamicLayouts_FactoryKindOf_0002
     * @tc.desc      factoryKindOf(type="x") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('ImperativeDynamicLayouts_FactoryKindOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}FactoryKindOf_0002 begin`);
      const actual: string = factoryKindOf('x');
      logInfo(`factoryKindOf(type="x"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}FactoryKindOf_0002 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FACTORY_KIND_OF_0003
     * @tc.name      ImperativeDynamicLayouts_FactoryKindOf_0003
     * @tc.desc      factoryKindOf(type="a") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_FactoryKindOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FactoryKindOf_0003 begin`);
      const actual: string = factoryKindOf('a');
      logInfo(`factoryKindOf(type="a"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}FactoryKindOf_0003 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FACTORY_KIND_OF_0004
     * @tc.name      ImperativeDynamicLayouts_FactoryKindOf_0004
     * @tc.desc      factoryKindOf(type="abc") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_FactoryKindOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FactoryKindOf_0004 begin`);
      const actual: string = factoryKindOf('abc');
      logInfo(`factoryKindOf(type="abc"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}FactoryKindOf_0004 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FACTORY_KIND_OF_0005
     * @tc.name      ImperativeDynamicLayouts_FactoryKindOf_0005
     * @tc.desc      factoryKindOf(type="Hello World") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_FactoryKindOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FactoryKindOf_0005 begin`);
      const actual: string = factoryKindOf('Hello World');
      logInfo(`factoryKindOf(type="Hello World"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}FactoryKindOf_0005 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FACTORY_KIND_OF_0006
     * @tc.name      ImperativeDynamicLayouts_FactoryKindOf_0006
     * @tc.desc      factoryKindOf(type=" ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_FactoryKindOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FactoryKindOf_0006 begin`);
      const actual: string = factoryKindOf(' ');
      logInfo(`factoryKindOf(type=" "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}FactoryKindOf_0006 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FACTORY_KIND_OF_0007
     * @tc.name      ImperativeDynamicLayouts_FactoryKindOf_0007
     * @tc.desc      factoryKindOf(type="123") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_FactoryKindOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FactoryKindOf_0007 begin`);
      const actual: string = factoryKindOf('123');
      logInfo(`factoryKindOf(type="123"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}FactoryKindOf_0007 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FACTORY_KIND_OF_0008
     * @tc.name      ImperativeDynamicLayouts_FactoryKindOf_0008
     * @tc.desc      factoryKindOf(type=" x ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_FactoryKindOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FactoryKindOf_0008 begin`);
      const actual: string = factoryKindOf(' x ');
      logInfo(`factoryKindOf(type=" x "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}FactoryKindOf_0008 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FACTORY_KIND_OF_0009
     * @tc.name      ImperativeDynamicLayouts_FactoryKindOf_0009
     * @tc.desc      factoryKindOf(type="xx") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_FactoryKindOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FactoryKindOf_0009 begin`);
      const actual: string = factoryKindOf('xx');
      logInfo(`factoryKindOf(type="xx"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}FactoryKindOf_0009 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FACTORY_KIND_OF_0010
     * @tc.name      ImperativeDynamicLayouts_FactoryKindOf_0010
     * @tc.desc      factoryKindOf(type="x_1") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_FactoryKindOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FactoryKindOf_0010 begin`);
      const actual: string = factoryKindOf('x_1');
      logInfo(`factoryKindOf(type="x_1"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}FactoryKindOf_0010 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FACTORY_KIND_OF_0011
     * @tc.name      ImperativeDynamicLayouts_FactoryKindOf_0011
     * @tc.desc      factoryKindOf(type=" a ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_FactoryKindOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FactoryKindOf_0011 begin`);
      const actual: string = factoryKindOf(' a ');
      logInfo(`factoryKindOf(type=" a "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}FactoryKindOf_0011 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FACTORY_KIND_OF_0012
     * @tc.name      ImperativeDynamicLayouts_FactoryKindOf_0012
     * @tc.desc      factoryKindOf(type="aa") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_FactoryKindOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FactoryKindOf_0012 begin`);
      const actual: string = factoryKindOf('aa');
      logInfo(`factoryKindOf(type="aa"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}FactoryKindOf_0012 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FACTORY_KIND_OF_0013
     * @tc.name      ImperativeDynamicLayouts_FactoryKindOf_0013
     * @tc.desc      factoryKindOf(type="a_1") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_FactoryKindOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FactoryKindOf_0013 begin`);
      const actual: string = factoryKindOf('a_1');
      logInfo(`factoryKindOf(type="a_1"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}FactoryKindOf_0013 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FACTORY_KIND_OF_0014
     * @tc.name      ImperativeDynamicLayouts_FactoryKindOf_0014
     * @tc.desc      factoryKindOf(type="xa") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_FactoryKindOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FactoryKindOf_0014 begin`);
      const actual: string = factoryKindOf('xa');
      logInfo(`factoryKindOf(type="xa"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}FactoryKindOf_0014 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FACTORY_KIND_OF_0015
     * @tc.name      ImperativeDynamicLayouts_FactoryKindOf_0015
     * @tc.desc      factoryKindOf(type=" abc ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_FactoryKindOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FactoryKindOf_0015 begin`);
      const actual: string = factoryKindOf(' abc ');
      logInfo(`factoryKindOf(type=" abc "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}FactoryKindOf_0015 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FACTORY_KIND_OF_0016
     * @tc.name      ImperativeDynamicLayouts_FactoryKindOf_0016
     * @tc.desc      factoryKindOf(type="abcabc") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_FactoryKindOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FactoryKindOf_0016 begin`);
      const actual: string = factoryKindOf('abcabc');
      logInfo(`factoryKindOf(type="abcabc"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}FactoryKindOf_0016 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FACTORY_KIND_OF_0017
     * @tc.name      ImperativeDynamicLayouts_FactoryKindOf_0017
     * @tc.desc      factoryKindOf(type="abc_1") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_FactoryKindOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FactoryKindOf_0017 begin`);
      const actual: string = factoryKindOf('abc_1');
      logInfo(`factoryKindOf(type="abc_1"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}FactoryKindOf_0017 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FACTORY_KIND_OF_0018
     * @tc.name      ImperativeDynamicLayouts_FactoryKindOf_0018
     * @tc.desc      factoryKindOf(type="xabc") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_FactoryKindOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FactoryKindOf_0018 begin`);
      const actual: string = factoryKindOf('xabc');
      logInfo(`factoryKindOf(type="xabc"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}FactoryKindOf_0018 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FACTORY_KIND_OF_0019
     * @tc.name      ImperativeDynamicLayouts_FactoryKindOf_0019
     * @tc.desc      factoryKindOf(type=" Hello World ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_FactoryKindOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FactoryKindOf_0019 begin`);
      const actual: string = factoryKindOf(' Hello World ');
      logInfo(`factoryKindOf(type=" Hello World "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}FactoryKindOf_0019 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FACTORY_KIND_OF_0020
     * @tc.name      ImperativeDynamicLayouts_FactoryKindOf_0020
     * @tc.desc      factoryKindOf(type="Hello WorldHello World") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_FactoryKindOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FactoryKindOf_0020 begin`);
      const actual: string = factoryKindOf('Hello WorldHello World');
      logInfo(`factoryKindOf(type="Hello WorldHello World"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}FactoryKindOf_0020 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FACTORY_KIND_OF_0021
     * @tc.name      ImperativeDynamicLayouts_FactoryKindOf_0021
     * @tc.desc      factoryKindOf(type="Hello World_1") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_FactoryKindOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FactoryKindOf_0021 begin`);
      const actual: string = factoryKindOf('Hello World_1');
      logInfo(`factoryKindOf(type="Hello World_1"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}FactoryKindOf_0021 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FACTORY_KIND_OF_0022
     * @tc.name      ImperativeDynamicLayouts_FactoryKindOf_0022
     * @tc.desc      factoryKindOf(type="xHello World") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_FactoryKindOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FactoryKindOf_0022 begin`);
      const actual: string = factoryKindOf('xHello World');
      logInfo(`factoryKindOf(type="xHello World"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}FactoryKindOf_0022 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FACTORY_KIND_OF_0023
     * @tc.name      ImperativeDynamicLayouts_FactoryKindOf_0023
     * @tc.desc      factoryKindOf(type="   ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_FactoryKindOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FactoryKindOf_0023 begin`);
      const actual: string = factoryKindOf('   ');
      logInfo(`factoryKindOf(type="   "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}FactoryKindOf_0023 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FACTORY_KIND_OF_0024
     * @tc.name      ImperativeDynamicLayouts_FactoryKindOf_0024
     * @tc.desc      factoryKindOf(type="  ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_FactoryKindOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FactoryKindOf_0024 begin`);
      const actual: string = factoryKindOf('  ');
      logInfo(`factoryKindOf(type="  "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}FactoryKindOf_0024 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FACTORY_KIND_OF_0025
     * @tc.name      ImperativeDynamicLayouts_FactoryKindOf_0025
     * @tc.desc      factoryKindOf(type=" _1") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_FactoryKindOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FactoryKindOf_0025 begin`);
      const actual: string = factoryKindOf(' _1');
      logInfo(`factoryKindOf(type=" _1"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}FactoryKindOf_0025 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FACTORY_KIND_OF_0026
     * @tc.name      ImperativeDynamicLayouts_FactoryKindOf_0026
     * @tc.desc      factoryKindOf(type="x ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_FactoryKindOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FactoryKindOf_0026 begin`);
      const actual: string = factoryKindOf('x ');
      logInfo(`factoryKindOf(type="x "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}FactoryKindOf_0026 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FACTORY_KIND_OF_0027
     * @tc.name      ImperativeDynamicLayouts_FactoryKindOf_0027
     * @tc.desc      factoryKindOf(type=" 123 ") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_FactoryKindOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FactoryKindOf_0027 begin`);
      const actual: string = factoryKindOf(' 123 ');
      logInfo(`factoryKindOf(type=" 123 "): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}FactoryKindOf_0027 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FACTORY_KIND_OF_0028
     * @tc.name      ImperativeDynamicLayouts_FactoryKindOf_0028
     * @tc.desc      factoryKindOf(type="123123") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_FactoryKindOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FactoryKindOf_0028 begin`);
      const actual: string = factoryKindOf('123123');
      logInfo(`factoryKindOf(type="123123"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}FactoryKindOf_0028 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FACTORY_KIND_OF_0029
     * @tc.name      ImperativeDynamicLayouts_FactoryKindOf_0029
     * @tc.desc      factoryKindOf(type="123_1") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('ImperativeDynamicLayouts_FactoryKindOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}FactoryKindOf_0029 begin`);
      const actual: string = factoryKindOf('123_1');
      logInfo(`factoryKindOf(type="123_1"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}FactoryKindOf_0029 end`);
    });

    /**
     * @tc.number    SUB_IMPERATIVEDYNAMICLAYOUTS_FACTORY_KIND_OF_0030
     * @tc.name      ImperativeDynamicLayouts_FactoryKindOf_0030
     * @tc.desc      factoryKindOf(type="x123") returns ""
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('ImperativeDynamicLayouts_FactoryKindOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}FactoryKindOf_0030 begin`);
      const actual: string = factoryKindOf('x123');
      logInfo(`factoryKindOf(type="x123"): actual=${actual}`);
      expect(actual).assertEqual('');
      logInfo(`${BUNDLE}FactoryKindOf_0030 end`);
    });
  });
}
