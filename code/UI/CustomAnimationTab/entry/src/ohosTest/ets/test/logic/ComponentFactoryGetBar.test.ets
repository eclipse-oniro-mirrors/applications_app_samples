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
import { ComponentFactory } from '../../../../main/ets/bridge/CustomAnimationTabBridge';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_CustomAnimationTab]';
const BUNDLE: string = 'CustomAnimationTab_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for ComponentFactory.getBar (30 cases). */
export default function componentFactoryGetBarTest(): void {
  describe('ComponentFactoryGetBarTest', () => {
    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_GET_BAR_0001
     * @tc.name      CustomAnimationTab_ComponentFactoryGetBar_0001
     * @tc.desc      ComponentFactory.getBar(name="Hello") yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CustomAnimationTab_ComponentFactoryGetBar_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0001 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const actual = subject.getBar('Hello');
      logInfo(`getBar(name="Hello"): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0001 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_GET_BAR_0002
     * @tc.name      CustomAnimationTab_ComponentFactoryGetBar_0002
     * @tc.desc      ComponentFactory.getBar(name="hello world") yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CustomAnimationTab_ComponentFactoryGetBar_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0002 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const actual = subject.getBar('hello world');
      logInfo(`getBar(name="hello world"): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0002 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_GET_BAR_0003
     * @tc.name      CustomAnimationTab_ComponentFactoryGetBar_0003
     * @tc.desc      ComponentFactory.getBar(name="") yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CustomAnimationTab_ComponentFactoryGetBar_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0003 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const actual = subject.getBar('');
      logInfo(`getBar(name=""): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0003 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_GET_BAR_0004
     * @tc.name      CustomAnimationTab_ComponentFactoryGetBar_0004
     * @tc.desc      ComponentFactory.getBar(name=" ") yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryGetBar_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0004 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const actual = subject.getBar(' ');
      logInfo(`getBar(name=" "): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0004 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_GET_BAR_0005
     * @tc.name      CustomAnimationTab_ComponentFactoryGetBar_0005
     * @tc.desc      ComponentFactory.getBar(name="A") yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryGetBar_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0005 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const actual = subject.getBar('A');
      logInfo(`getBar(name="A"): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0005 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_GET_BAR_0006
     * @tc.name      CustomAnimationTab_ComponentFactoryGetBar_0006
     * @tc.desc      ComponentFactory.getBar(name="Sample Title 123") yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryGetBar_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0006 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const actual = subject.getBar('Sample Title 123');
      logInfo(`getBar(name="Sample Title 123"): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0006 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_GET_BAR_0007
     * @tc.name      CustomAnimationTab_ComponentFactoryGetBar_0007
     * @tc.desc      ComponentFactory.getBar(name="??") yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryGetBar_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0007 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const actual = subject.getBar('\u4e2d\u6587');
      logInfo(`getBar(name="??"): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0007 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_GET_BAR_0008
     * @tc.name      CustomAnimationTab_ComponentFactoryGetBar_0008
     * @tc.desc      ComponentFactory.getBar(name="a") yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryGetBar_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0008 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const actual = subject.getBar('a');
      logInfo(`getBar(name="a"): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0008 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_GET_BAR_0009
     * @tc.name      CustomAnimationTab_ComponentFactoryGetBar_0009
     * @tc.desc      ComponentFactory.getBar(name="abc") yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryGetBar_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0009 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const actual = subject.getBar('abc');
      logInfo(`getBar(name="abc"): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0009 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_GET_BAR_0010
     * @tc.name      CustomAnimationTab_ComponentFactoryGetBar_0010
     * @tc.desc      ComponentFactory.getBar(name="Hello World") yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryGetBar_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0010 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const actual = subject.getBar('Hello World');
      logInfo(`getBar(name="Hello World"): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0010 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_GET_BAR_0011
     * @tc.name      CustomAnimationTab_ComponentFactoryGetBar_0011
     * @tc.desc      ComponentFactory.getBar(name="123") yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryGetBar_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0011 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const actual = subject.getBar('123');
      logInfo(`getBar(name="123"): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0011 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_GET_BAR_0012
     * @tc.name      CustomAnimationTab_ComponentFactoryGetBar_0012
     * @tc.desc      ComponentFactory.getBar(name=" Hello ") yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CustomAnimationTab_ComponentFactoryGetBar_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0012 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const actual = subject.getBar(' Hello ');
      logInfo(`getBar(name=" Hello "): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0012 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_GET_BAR_0013
     * @tc.name      CustomAnimationTab_ComponentFactoryGetBar_0013
     * @tc.desc      ComponentFactory.getBar(name="HelloHello") yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryGetBar_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0013 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const actual = subject.getBar('HelloHello');
      logInfo(`getBar(name="HelloHello"): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0013 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_GET_BAR_0014
     * @tc.name      CustomAnimationTab_ComponentFactoryGetBar_0014
     * @tc.desc      ComponentFactory.getBar(name="Hello_1") yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryGetBar_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0014 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const actual = subject.getBar('Hello_1');
      logInfo(`getBar(name="Hello_1"): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0014 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_GET_BAR_0015
     * @tc.name      CustomAnimationTab_ComponentFactoryGetBar_0015
     * @tc.desc      ComponentFactory.getBar(name="xHello") yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CustomAnimationTab_ComponentFactoryGetBar_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0015 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const actual = subject.getBar('xHello');
      logInfo(`getBar(name="xHello"): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0015 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_GET_BAR_0016
     * @tc.name      CustomAnimationTab_ComponentFactoryGetBar_0016
     * @tc.desc      ComponentFactory.getBar(name=" hello world ") yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CustomAnimationTab_ComponentFactoryGetBar_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0016 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const actual = subject.getBar(' hello world ');
      logInfo(`getBar(name=" hello world "): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0016 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_GET_BAR_0017
     * @tc.name      CustomAnimationTab_ComponentFactoryGetBar_0017
     * @tc.desc      ComponentFactory.getBar(name="hello worldhello world") yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryGetBar_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0017 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const actual = subject.getBar('hello worldhello world');
      logInfo(`getBar(name="hello worldhello world"): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0017 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_GET_BAR_0018
     * @tc.name      CustomAnimationTab_ComponentFactoryGetBar_0018
     * @tc.desc      ComponentFactory.getBar(name="hello world_1") yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryGetBar_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0018 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const actual = subject.getBar('hello world_1');
      logInfo(`getBar(name="hello world_1"): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0018 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_GET_BAR_0019
     * @tc.name      CustomAnimationTab_ComponentFactoryGetBar_0019
     * @tc.desc      ComponentFactory.getBar(name="xhello world") yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CustomAnimationTab_ComponentFactoryGetBar_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0019 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const actual = subject.getBar('xhello world');
      logInfo(`getBar(name="xhello world"): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0019 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_GET_BAR_0020
     * @tc.name      CustomAnimationTab_ComponentFactoryGetBar_0020
     * @tc.desc      ComponentFactory.getBar(name="   ") yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CustomAnimationTab_ComponentFactoryGetBar_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0020 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const actual = subject.getBar('   ');
      logInfo(`getBar(name="   "): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0020 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_GET_BAR_0021
     * @tc.name      CustomAnimationTab_ComponentFactoryGetBar_0021
     * @tc.desc      ComponentFactory.getBar(name="  ") yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryGetBar_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0021 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const actual = subject.getBar('  ');
      logInfo(`getBar(name="  "): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0021 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_GET_BAR_0022
     * @tc.name      CustomAnimationTab_ComponentFactoryGetBar_0022
     * @tc.desc      ComponentFactory.getBar(name=" _1") yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryGetBar_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0022 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const actual = subject.getBar(' _1');
      logInfo(`getBar(name=" _1"): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0022 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_GET_BAR_0023
     * @tc.name      CustomAnimationTab_ComponentFactoryGetBar_0023
     * @tc.desc      ComponentFactory.getBar(name="x ") yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CustomAnimationTab_ComponentFactoryGetBar_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0023 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const actual = subject.getBar('x ');
      logInfo(`getBar(name="x "): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0023 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_GET_BAR_0024
     * @tc.name      CustomAnimationTab_ComponentFactoryGetBar_0024
     * @tc.desc      ComponentFactory.getBar(name=" A ") yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CustomAnimationTab_ComponentFactoryGetBar_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0024 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const actual = subject.getBar(' A ');
      logInfo(`getBar(name=" A "): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0024 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_GET_BAR_0025
     * @tc.name      CustomAnimationTab_ComponentFactoryGetBar_0025
     * @tc.desc      ComponentFactory.getBar(name="AA") yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryGetBar_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0025 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const actual = subject.getBar('AA');
      logInfo(`getBar(name="AA"): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0025 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_GET_BAR_0026
     * @tc.name      CustomAnimationTab_ComponentFactoryGetBar_0026
     * @tc.desc      ComponentFactory.getBar(name="A_1") yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryGetBar_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0026 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const actual = subject.getBar('A_1');
      logInfo(`getBar(name="A_1"): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0026 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_GET_BAR_0027
     * @tc.name      CustomAnimationTab_ComponentFactoryGetBar_0027
     * @tc.desc      ComponentFactory.getBar(name="xA") yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CustomAnimationTab_ComponentFactoryGetBar_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0027 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const actual = subject.getBar('xA');
      logInfo(`getBar(name="xA"): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0027 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_GET_BAR_0028
     * @tc.name      CustomAnimationTab_ComponentFactoryGetBar_0028
     * @tc.desc      ComponentFactory.getBar(name=" Sample Title 123 ") yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('CustomAnimationTab_ComponentFactoryGetBar_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0028 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const actual = subject.getBar(' Sample Title 123 ');
      logInfo(`getBar(name=" Sample Title 123 "): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0028 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_GET_BAR_0029
     * @tc.name      CustomAnimationTab_ComponentFactoryGetBar_0029
     * @tc.desc      ComponentFactory.getBar(name="Sample Title 123Sample Title 123") yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryGetBar_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0029 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const actual = subject.getBar('Sample Title 123Sample Title 123');
      logInfo(`getBar(name="Sample Title 123Sample Title...: actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0029 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_GET_BAR_0030
     * @tc.name      CustomAnimationTab_ComponentFactoryGetBar_0030
     * @tc.desc      ComponentFactory.getBar(name="Sample Title 123_1") yields undefined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryGetBar_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0030 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const actual = subject.getBar('Sample Title 123_1');
      logInfo(`getBar(name="Sample Title 123_1"): actual=${actual}`);
      expect(actual).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryGetBar_0030 end`);
    });
  });
}
