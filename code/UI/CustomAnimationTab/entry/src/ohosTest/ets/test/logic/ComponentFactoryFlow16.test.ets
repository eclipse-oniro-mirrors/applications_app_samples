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

/** Logic checks for ComponentFactory flow (74 cases). */
export default function componentFactoryFlow16Test(): void {
  describe('ComponentFactoryFlow16Test', () => {
    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1072
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1072
     * @tc.desc      ComponentFactory call flow getBar > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1072 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('9l');
      logInfo(`step1 getBar("9l"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('mb');
      logInfo(`step2 getBar("mb"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('TaJc');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1072 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1073
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1073
     * @tc.desc      ComponentFactory call flow toArray > getContent > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1073 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('8Uzb2NI');
      subject.delete('upg');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1073 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1074
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1074
     * @tc.desc      ComponentFactory call flow getParams > getBar > getContent > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1074 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('b5WJMy');
      const step2 = subject.getBar('8MUd8zV');
      logInfo(`step2 getBar("8MUd8zV"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('uR');
      subject.getParams('hello world_1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1074 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1075
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1075
     * @tc.desc      ComponentFactory call flow getContent > getParams > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1075 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('zx');
      subject.getParams('7xyqznYXB');
      const step3 = subject.getBar('l');
      logInfo(`step3 getBar("l"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('l');
      logInfo(`step4 getBar("l"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1075 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1076
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1076
     * @tc.desc      ComponentFactory call flow getBar > toArray > getParams > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1076 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Aw2U6KL');
      logInfo(`step1 getBar("Aw2U6KL"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('0dQ76ka');
      const step4 = subject.getBar('pB0KQflQ');
      logInfo(`step4 getBar("pB0KQflQ"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getParams('Bwig9b9gr');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1076 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1077
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1077
     * @tc.desc      ComponentFactory call flow getParams > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1077 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('HN0');
      const step2 = subject.getBar('Op312');
      logInfo(`step2 getBar("Op312"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('TLBDIj0F7Coe');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1077 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1078
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1078
     * @tc.desc      ComponentFactory call flow delete > getBar > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1078 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('gbZBiNl');
      const step2 = subject.getBar(' ');
      logInfo(`step2 getBar(" "): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('a');
      const step4 = subject.getBar('MZEv8J');
      logInfo(`step4 getBar("MZEv8J"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1078 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1079
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1079
     * @tc.desc      ComponentFactory call flow getContent > toArray > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1079 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('xZK');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('AXWsFqFpij');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1079 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1080
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1080
     * @tc.desc      ComponentFactory call flow getBar > delete > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1080 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('xhello world');
      logInfo(`step1 getBar("xhello world"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('inw86m');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getParams('xA');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1080 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1081
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1081
     * @tc.desc      ComponentFactory call flow getParams > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1081 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('j6zPJTMw');
      subject.getContent('OxSA80TGVBGf');
      const step3 = subject.getBar('uLvz1');
      logInfo(`step3 getBar("uLvz1"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1081 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1082
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1082
     * @tc.desc      ComponentFactory call flow toArray > getContent > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1082 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('TFwsjyaX1xUR');
      subject.delete('chSGAb3Lmu');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1082 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1083
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1083
     * @tc.desc      ComponentFactory call flow delete > toArray > getParams > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1083 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('1TJ2rXdPD');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('rF0zI0O');
      subject.getContent('mnaz9p');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1083 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1084
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1084
     * @tc.desc      ComponentFactory call flow toArray > getBar > getParams > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1084 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('G');
      logInfo(`step2 getBar("G"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('5XuEUUej4hE');
      subject.delete('p');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1084 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1085
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1085
     * @tc.desc      ComponentFactory call flow delete > getParams > getBar > getParams > getParams keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1085 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('x ');
      subject.getParams('Hy3dX9N');
      const step3 = subject.getBar('ck72LRrke');
      logInfo(`step3 getBar("ck72LRrke"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('wGSFFV');
      subject.getParams('eWSFiv9i');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1085 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1086
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1086
     * @tc.desc      ComponentFactory call flow delete > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1086 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('3KXiJ');
      const step2 = subject.getBar('0xoZWamAK');
      logInfo(`step2 getBar("0xoZWamAK"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('tr9fihM1RvDV');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1086 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1087
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1087
     * @tc.desc      ComponentFactory call flow getContent > getBar > delete > getParams > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1087 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('F');
      const step2 = subject.getBar('BWZOfF6GDY');
      logInfo(`step2 getBar("BWZOfF6GDY"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('HelloHello');
      subject.getParams('Hello_1');
      subject.delete('JPpP');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1087 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1088
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1088
     * @tc.desc      ComponentFactory call flow getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1088 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('QHpy');
      const step2 = subject.getBar('jlxGvRARmD5f');
      logInfo(`step2 getBar("jlxGvRARmD5f"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1088 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1089
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1089
     * @tc.desc      ComponentFactory call flow getContent > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1089 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('cuWW2qVH');
      subject.getContent('\u4e2d\u6587');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1089 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1090
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1090
     * @tc.desc      ComponentFactory call flow getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1090 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('dQmNqBlh');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1090 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1091
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1091
     * @tc.desc      ComponentFactory call flow getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1091 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('Ld');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1091 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1092
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1092
     * @tc.desc      ComponentFactory call flow getParams > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1092 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('R');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('28cZ2bB4z5g');
      logInfo(`step3 getBar("28cZ2bB4z5g"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1092 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1093
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1093
     * @tc.desc      ComponentFactory call flow toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1093 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('QGcHwzD3R');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1093 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1094
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1094
     * @tc.desc      ComponentFactory call flow delete > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1094 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('VvICRs58S');
      const step2 = subject.getBar('CyPe');
      logInfo(`step2 getBar("CyPe"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('XWEWfC');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1094 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1095
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1095
     * @tc.desc      ComponentFactory call flow delete > getContent > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1095 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('Zn8gjRlr');
      subject.getContent('UjnC9gnByt');
      subject.delete('Hello_1');
      const step4 = subject.getBar('ED');
      logInfo(`step4 getBar("ED"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1095 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1096
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1096
     * @tc.desc      ComponentFactory call flow delete > getContent > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1096 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('Uxp');
      subject.getContent('J');
      const step3 = subject.getBar('HelloHello');
      logInfo(`step3 getBar("HelloHello"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('g');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1096 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1097
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1097
     * @tc.desc      ComponentFactory call flow getBar > delete > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1097 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('L');
      logInfo(`step1 getBar("L"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('ASFrvK5j');
      const step3 = subject.getBar('P');
      logInfo(`step3 getBar("P"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('yf');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1097 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1098
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1098
     * @tc.desc      ComponentFactory call flow getBar > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1098 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('7J8');
      logInfo(`step1 getBar("7J8"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('Y');
      const step3 = subject.getBar('DM9T23Gtl2');
      logInfo(`step3 getBar("DM9T23Gtl2"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1098 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1099
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1099
     * @tc.desc      ComponentFactory call flow getParams > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1099 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('gpU4CZMSS');
      const step2 = subject.getBar('Uq96gDO3');
      logInfo(`step2 getBar("Uq96gDO3"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('xxD');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1099 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1100
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1100
     * @tc.desc      ComponentFactory call flow getBar > getBar > toArray > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1100 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('hCxdZO');
      logInfo(`step1 getBar("hCxdZO"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('dBblCxE4');
      logInfo(`step2 getBar("dBblCxE4"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('XkrydQBO');
      logInfo(`step4 getBar("XkrydQBO"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.delete('6DHUOhqDg8');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1100 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1101
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1101
     * @tc.desc      ComponentFactory call flow getParams > toArray > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1101 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('hello worldhello world');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('rRj8x6YM6');
      logInfo(`step4 getBar("rRj8x6YM6"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1101 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1102
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1102
     * @tc.desc      ComponentFactory call flow getBar > getParams > getContent > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1102 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('123_1');
      logInfo(`step1 getBar("123_1"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('lq5');
      subject.getContent('3ZPW5');
      subject.getParams('5XuEUUej4hE');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1102 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1103
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1103
     * @tc.desc      ComponentFactory call flow toArray > delete > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1103 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('Sample Title 123');
      subject.delete('opAhnX5KXD2M');
      subject.getParams('7xyqznYXB');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1103 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1104
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1104
     * @tc.desc      ComponentFactory call flow getParams > getParams > getContent > getBar > getContent keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1104 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('Ej');
      subject.getParams('o2qEgX2Q9t');
      subject.getContent('czXc4Bok');
      const step4 = subject.getBar('AA');
      logInfo(`step4 getBar("AA"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getContent('2EqNO2X');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1104 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1105
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1105
     * @tc.desc      ComponentFactory call flow getParams > toArray > getParams > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1105 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('u28YtwC8GrPf');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('rb6bBOpG0w');
      subject.delete('C80FbSN3yvo');
      const step5 = subject.getBar('P84ipO3HrA');
      logInfo(`step5 getBar("P84ipO3HrA"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1105 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1106
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1106
     * @tc.desc      ComponentFactory call flow getContent > toArray > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1106 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('b8vshwWWo68');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('KR');
      const step4 = subject.getBar('pB0KQflQ');
      logInfo(`step4 getBar("pB0KQflQ"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1106 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1107
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1107
     * @tc.desc      ComponentFactory call flow getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1107 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('nq');
      const step2 = subject.getBar('o3');
      logInfo(`step2 getBar("o3"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1107 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1108
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1108
     * @tc.desc      ComponentFactory call flow getContent > getContent > toArray > getContent > getParams keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1108 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('jk8tbuD');
      subject.getContent('glNOtEmitNG4');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('TM');
      subject.getParams('3b0EBZ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1108 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1109
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1109
     * @tc.desc      ComponentFactory call flow toArray > getContent > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1109 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('ao1xPPVqGz');
      subject.getContent('RzPo4Flq7657');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1109 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1110
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1110
     * @tc.desc      ComponentFactory call flow toArray > toArray > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1110 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('3O7FJ2Sv');
      subject.delete('x ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1110 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1111
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1111
     * @tc.desc      ComponentFactory call flow getBar > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1111 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('eLKhA');
      logInfo(`step1 getBar("eLKhA"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('YEaX');
      logInfo(`step2 getBar("YEaX"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete(' hello world ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1111 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1112
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1112
     * @tc.desc      ComponentFactory call flow getBar > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1112 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Ov');
      logInfo(`step1 getBar("Ov"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('dqy7B');
      logInfo(`step2 getBar("dqy7B"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('gpYStKeTq7');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1112 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1113
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1113
     * @tc.desc      ComponentFactory call flow getParams > getBar > getContent > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1113 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('P5CfiBgO');
      const step2 = subject.getBar('jlxGvRARmD5f');
      logInfo(`step2 getBar("jlxGvRARmD5f"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('EzNIsPj');
      subject.getContent('Sw7D9');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1113 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1114
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1114
     * @tc.desc      ComponentFactory call flow toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1114 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('fxsZv');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1114 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1115
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1115
     * @tc.desc      ComponentFactory call flow delete > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1115 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('HQ');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('1MYBqsx53n');
      logInfo(`step3 getBar("1MYBqsx53n"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1115 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1116
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1116
     * @tc.desc      ComponentFactory call flow toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1116 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('x123');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1116 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1117
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1117
     * @tc.desc      ComponentFactory call flow getBar > toArray > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1117 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('mias4qIIlm');
      logInfo(`step1 getBar("mias4qIIlm"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar(' A ');
      logInfo(`step3 getBar(" A "): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('ZDKcZO');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1117 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1118
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1118
     * @tc.desc      ComponentFactory call flow getBar > getBar > getParams > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1118 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('49k1A7YOxx');
      logInfo(`step1 getBar("49k1A7YOxx"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('Smhe70');
      logInfo(`step2 getBar("Smhe70"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('MMdJ8dfisUy5');
      subject.getParams('cN2zDR83ns');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1118 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1119
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1119
     * @tc.desc      ComponentFactory call flow toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1119 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('bOd9mOl0Fwly');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1119 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1120
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1120
     * @tc.desc      ComponentFactory call flow delete > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1120 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete(' hello world ');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('miyb');
      logInfo(`step3 getBar("miyb"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1120 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1121
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1121
     * @tc.desc      ComponentFactory call flow getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1121 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('eLADslckWNfW');
      logInfo(`step1 getBar("eLADslckWNfW"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('VQ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1121 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1122
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1122
     * @tc.desc      ComponentFactory call flow delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1122 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('hRvutu0B');
      const step2 = subject.getBar('7cw');
      logInfo(`step2 getBar("7cw"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1122 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1123
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1123
     * @tc.desc      ComponentFactory call flow getContent > getParams > toArray > getParams > delete keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1123 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('Hello');
      subject.getParams('u28YtwC8GrPf');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getParams('z');
      subject.delete('abcabc');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1123 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1124
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1124
     * @tc.desc      ComponentFactory call flow delete > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1124 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('7v');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('MedbmHHUIc');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1124 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1125
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1125
     * @tc.desc      ComponentFactory call flow getBar > getBar > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1125 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('qr3Vm7rLf7E');
      logInfo(`step1 getBar("qr3Vm7rLf7E"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('Pwt6zZsPyvP');
      logInfo(`step2 getBar("Pwt6zZsPyvP"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('Tair');
      const step4 = subject.getBar('lk1i');
      logInfo(`step4 getBar("lk1i"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1125 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1126
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1126
     * @tc.desc      ComponentFactory call flow toArray > getContent > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1126 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent(' hello world ');
      subject.getParams('x\u4e2d\u6587');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1126 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1127
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1127
     * @tc.desc      ComponentFactory call flow getContent > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1127 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('bHt');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('BauR9pM8qz');
      logInfo(`step3 getBar("BauR9pM8qz"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1127 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1128
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1128
     * @tc.desc      ComponentFactory call flow getContent > toArray > getBar > getParams > getBar keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1128 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('VNtmYMZpN5R5');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar(' Hello World ');
      logInfo(`step3 getBar(" Hello World "): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('Vw');
      const step5 = subject.getBar('XkrydQBO');
      logInfo(`step5 getBar("XkrydQBO"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1128 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1129
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1129
     * @tc.desc      ComponentFactory call flow toArray > toArray > toArray > getParams > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1129 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getParams('Rx79u5I');
      subject.delete('nbtrrK6');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1129 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1130
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1130
     * @tc.desc      ComponentFactory call flow delete > getContent > getBar > getContent > getContent keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1130 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('bSxeDoYBn');
      subject.getContent('m');
      const step3 = subject.getBar('w');
      logInfo(`step3 getBar("w"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('0wQcs');
      subject.getContent('9FRWZAoj8b');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1130 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1131
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1131
     * @tc.desc      ComponentFactory call flow getBar > toArray > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1131 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Yz3');
      logInfo(`step1 getBar("Yz3"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('kNYWGAmPVRWP');
      const step4 = subject.getBar('rlMC8');
      logInfo(`step4 getBar("rlMC8"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1131 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1132
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1132
     * @tc.desc      ComponentFactory call flow getParams > toArray > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1132 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('tiCdW');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('SsohOcYTVMY');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1132 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1133
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1133
     * @tc.desc      ComponentFactory call flow delete > delete > delete > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1133 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('LaGV');
      subject.delete('');
      subject.delete('iMCpJ1');
      subject.delete('q5wUacf5Ddpq');
      const step5 = subject.getBar('qLnzx');
      logInfo(`step5 getBar("qLnzx"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1133 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1134
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1134
     * @tc.desc      ComponentFactory call flow delete > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1134 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('pAISptGN');
      subject.delete('6DHUOhqDg8');
      const step3 = subject.getBar('UZ1');
      logInfo(`step3 getBar("UZ1"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1134 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1135
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1135
     * @tc.desc      ComponentFactory call flow getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1135 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Y');
      logInfo(`step1 getBar("Y"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('\u4e2d\u6587');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1135 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1136
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1136
     * @tc.desc      ComponentFactory call flow getBar > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1136 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('upjzRMbiEoc');
      logInfo(`step1 getBar("upjzRMbiEoc"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('aHkr');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1136 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1137
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1137
     * @tc.desc      ComponentFactory call flow getBar > getContent > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1137 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('9wuRQd0r');
      logInfo(`step1 getBar("9wuRQd0r"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('0pudv5fpUF');
      subject.delete('hello world');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1137 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1138
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1138
     * @tc.desc      ComponentFactory call flow getParams > toArray > getContent > getParams > getContent keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1138 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('xHello World');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('RJ');
      subject.getParams('dEkGT');
      subject.getContent('swys');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1138 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1139
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1139
     * @tc.desc      ComponentFactory call flow toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1139 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('XVkfLk');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1139 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1140
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1140
     * @tc.desc      ComponentFactory call flow toArray > delete > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1140 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('pgM');
      subject.getContent('Fu');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1140 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1141
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1141
     * @tc.desc      ComponentFactory call flow getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1141 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('uwe90');
      logInfo(`step1 getBar("uwe90"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('xA');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1141 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1142
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1142
     * @tc.desc      ComponentFactory call flow getContent > getContent > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1142 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('7cMM5LUlu');
      subject.getContent('F');
      subject.getParams('kt62Ld');
      const step4 = subject.getBar('b');
      logInfo(`step4 getBar("b"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1142 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1143
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1143
     * @tc.desc      ComponentFactory call flow getParams > delete > getBar > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1143 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('kyXxMW4MLV');
      subject.delete('FfIwdN');
      const step3 = subject.getBar('O805K7Y');
      logInfo(`step3 getBar("O805K7Y"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('dEkGT');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1143 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1144
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1144
     * @tc.desc      ComponentFactory call flow toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1144 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('mnaz9p');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1144 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1145
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1145
     * @tc.desc      ComponentFactory call flow getBar > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1145 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('xa');
      logInfo(`step1 getBar("xa"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('Bo4Qrnt');
      logInfo(`step2 getBar("Bo4Qrnt"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('jLQcxJVfj');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1145 end`);
    });
  });
}
