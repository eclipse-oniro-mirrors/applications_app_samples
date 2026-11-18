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

/** Logic checks for ComponentFactory flow (73 cases). */
export default function componentFactoryFlow15Test(): void {
  describe('ComponentFactoryFlow15Test', () => {
    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0999
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0999
     * @tc.desc      ComponentFactory call flow delete > toArray > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0999', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0999 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('z');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('  ');
      const step4 = subject.getBar('s');
      logInfo(`step4 getBar("s"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0999 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1000
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1000
     * @tc.desc      ComponentFactory call flow toArray > getParams > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1000 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('2JPijen1b');
      subject.delete('JPpP');
      const step4 = subject.getBar('xZ');
      logInfo(`step4 getBar("xZ"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1000 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1001
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1001
     * @tc.desc      ComponentFactory call flow delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1001 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('pmm');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1001 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1002
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1002
     * @tc.desc      ComponentFactory call flow getContent > getBar > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1002 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('5s6JepBUhol');
      const step2 = subject.getBar('MU');
      logInfo(`step2 getBar("MU"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('xZ');
      logInfo(`step3 getBar("xZ"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('123_1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1002 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1003
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1003
     * @tc.desc      ComponentFactory call flow toArray > getContent > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1003 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('lGJxC');
      subject.delete('XL1HgQagEU');
      subject.delete('J6uwV');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1003 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1004
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1004
     * @tc.desc      ComponentFactory call flow getBar > getContent > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1004 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('xtQyJrKiAEp');
      logInfo(`step1 getBar("xtQyJrKiAEp"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('F39Oc1Z6TI');
      subject.delete('H588SnQLlH');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1004 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1005
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1005
     * @tc.desc      ComponentFactory call flow getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1005 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('mVOnDM');
      const step2 = subject.getBar('dqy7B');
      logInfo(`step2 getBar("dqy7B"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1005 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1006
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1006
     * @tc.desc      ComponentFactory call flow toArray > toArray > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1006 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('y3BmY2P9');
      logInfo(`step3 getBar("y3BmY2P9"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('JPpP');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1006 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1007
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1007
     * @tc.desc      ComponentFactory call flow getBar > getBar > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1007 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('kRhUbvP8S');
      logInfo(`step1 getBar("kRhUbvP8S"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('jFoCVxiA4Z');
      logInfo(`step2 getBar("jFoCVxiA4Z"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getParams('bKAKSU');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1007 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1008
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1008
     * @tc.desc      ComponentFactory call flow getParams > delete > getParams > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1008 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('Sample Title 123');
      subject.delete('aa');
      subject.getParams('WTUedcyGAZ1');
      const step4 = subject.getBar('7cw');
      logInfo(`step4 getBar("7cw"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1008 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1009
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1009
     * @tc.desc      ComponentFactory call flow getParams > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1009 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('1HZGi8Qa0');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('mc');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1009 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1010
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1010
     * @tc.desc      ComponentFactory call flow delete > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1010 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('EMZcrnNG9m');
      const step2 = subject.getBar('sXbp2Pkw3ht7');
      logInfo(`step2 getBar("sXbp2Pkw3ht7"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('A_1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1010 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1011
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1011
     * @tc.desc      ComponentFactory call flow toArray > getContent > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1011 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('LLU2HUi');
      subject.delete('Hello WorldHello World');
      subject.getParams('U2xjZrluups');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1011 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1012
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1012
     * @tc.desc      ComponentFactory call flow getContent > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1012 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('otBya');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1012 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1013
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1013
     * @tc.desc      ComponentFactory call flow delete > getParams > toArray > getContent > getBar keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1013 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('lV');
      subject.getParams('3A6n');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('HPBKG1Df');
      const step5 = subject.getBar('PIGR');
      logInfo(`step5 getBar("PIGR"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1013 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1014
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1014
     * @tc.desc      ComponentFactory call flow toArray > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1014 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('ZOfGU3m5fzix');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1014 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1015
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1015
     * @tc.desc      ComponentFactory call flow toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1015 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('miozIxq8Dm9z');
      logInfo(`step2 getBar("miozIxq8Dm9z"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1015 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1016
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1016
     * @tc.desc      ComponentFactory call flow getContent > toArray > delete > getContent > getBar keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1016 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('123_1');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete(' Hello ');
      subject.getContent('mc');
      const step5 = subject.getBar('jIDfJlAGM1zc');
      logInfo(`step5 getBar("jIDfJlAGM1zc"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1016 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1017
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1017
     * @tc.desc      ComponentFactory call flow delete > getContent > getBar > getParams > getParams keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1017 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('R');
      subject.getContent('lB5m');
      const step3 = subject.getBar('sEgYAx01NMC');
      logInfo(`step3 getBar("sEgYAx01NMC"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('Bh0rR');
      subject.getParams('3A6n');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1017 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1018
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1018
     * @tc.desc      ComponentFactory call flow delete > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1018 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('FEDAmRPXge');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('wCFzP5g');
      logInfo(`step3 getBar("wCFzP5g"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1018 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1019
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1019
     * @tc.desc      ComponentFactory call flow toArray > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1019 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('q5wUacf5Ddpq');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1019 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1020
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1020
     * @tc.desc      ComponentFactory call flow toArray > getContent > getBar > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1020 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('a_1');
      const step3 = subject.getBar('Op312');
      logInfo(`step3 getBar("Op312"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete(' ');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1020 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1021
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1021
     * @tc.desc      ComponentFactory call flow getParams > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1021 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('h6o');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('qr3Vm7rLf7E');
      logInfo(`step3 getBar("qr3Vm7rLf7E"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1021 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1022
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1022
     * @tc.desc      ComponentFactory call flow delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1022 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('FEDAmRPXge');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1022 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1023
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1023
     * @tc.desc      ComponentFactory call flow getContent > getParams > getBar > getParams > getBar keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1023 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('c7lMng8ZM');
      subject.getParams('h6o');
      const step3 = subject.getBar('qfh7xvfS5B');
      logInfo(`step3 getBar("qfh7xvfS5B"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('l7Da1');
      const step5 = subject.getBar('\u4e2d\u6587');
      logInfo(`step5 getBar("??"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1023 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1024
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1024
     * @tc.desc      ComponentFactory call flow getParams > toArray > getBar > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1024 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('o2qEgX2Q9t');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('   ');
      logInfo(`step3 getBar("   "): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('JMWbFJUA');
      const step5 = subject.getBar('zmnW');
      logInfo(`step5 getBar("zmnW"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1024 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1025
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1025
     * @tc.desc      ComponentFactory call flow getBar > getParams > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1025 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('hO3w7f');
      logInfo(`step1 getBar("hO3w7f"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('iqIQ');
      subject.getParams('Hello WorldHello World');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1025 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1026
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1026
     * @tc.desc      ComponentFactory call flow getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1026 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('S6FkWO');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1026 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1027
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1027
     * @tc.desc      ComponentFactory call flow getBar > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1027 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('whOLzSN');
      logInfo(`step1 getBar("whOLzSN"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('Ti');
      const step3 = subject.getBar('cy');
      logInfo(`step3 getBar("cy"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1027 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1028
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1028
     * @tc.desc      ComponentFactory call flow toArray > delete > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1028 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('U5ac1t');
      subject.getContent('e');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1028 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1029
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1029
     * @tc.desc      ComponentFactory call flow getContent > delete > getContent > getContent > getBar keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1029 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('cv4YfHFsY1');
      subject.delete('sz4qZ6Y');
      subject.getContent('xSample Title 123');
      subject.getContent('a');
      const step5 = subject.getBar('zmnW');
      logInfo(`step5 getBar("zmnW"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1029 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1030
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1030
     * @tc.desc      ComponentFactory call flow toArray > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1030 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('6YBKgd');
      logInfo(`step2 getBar("6YBKgd"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1030 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1031
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1031
     * @tc.desc      ComponentFactory call flow getContent > delete > toArray > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1031 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('Ie8vBhT');
      subject.delete('o52ed3k1i');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('8IkTkQ6');
      subject.delete('abc');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1031 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1032
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1032
     * @tc.desc      ComponentFactory call flow delete > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1032 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('slmFzqKNFkHC');
      subject.getContent('xHello');
      const step3 = subject.getBar('mI');
      logInfo(`step3 getBar("mI"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1032 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1033
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1033
     * @tc.desc      ComponentFactory call flow toArray > getContent > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1033 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('AA');
      const step3 = subject.getBar('ElxJx2W2C');
      logInfo(`step3 getBar("ElxJx2W2C"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1033 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1034
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1034
     * @tc.desc      ComponentFactory call flow getBar > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1034 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Uq96gDO3');
      logInfo(`step1 getBar("Uq96gDO3"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('DDvsyu');
      logInfo(`step3 getBar("DDvsyu"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1034 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1035
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1035
     * @tc.desc      ComponentFactory call flow getBar > getParams > toArray > getParams > getParams keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1035 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('49k1A7YOxx');
      logInfo(`step1 getBar("49k1A7YOxx"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams(' A ');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getParams('2bWAF');
      subject.getParams('bRqkq5NaRX');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1035 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1036
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1036
     * @tc.desc      ComponentFactory call flow toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1036 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1036 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1037
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1037
     * @tc.desc      ComponentFactory call flow toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1037 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('QEDYfzwN');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1037 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1038
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1038
     * @tc.desc      ComponentFactory call flow getContent > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1038 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('KBhrxv');
      const step2 = subject.getBar('aa');
      logInfo(`step2 getBar("aa"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('DpuswFSnb');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1038 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1039
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1039
     * @tc.desc      ComponentFactory call flow getParams > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1039 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('bSLL7S');
      const step2 = subject.getBar('i4VJdShfk');
      logInfo(`step2 getBar("i4VJdShfk"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('eECT3Cnise1I');
      logInfo(`step3 getBar("eECT3Cnise1I"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1039 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1040
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1040
     * @tc.desc      ComponentFactory call flow delete > getContent > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1040 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('A');
      subject.getContent('b8vshwWWo68');
      subject.getParams('\u4e2d\u6587\u4e2d\u6587');
      const step4 = subject.getBar('IXj4nI0');
      logInfo(`step4 getBar("IXj4nI0"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1040 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1041
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1041
     * @tc.desc      ComponentFactory call flow getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1041 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('PIGR');
      logInfo(`step1 getBar("PIGR"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('hRvutu0B');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1041 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1042
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1042
     * @tc.desc      ComponentFactory call flow toArray > getParams > toArray > getParams > getContent keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1042 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('aHby');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getParams('iWOsagN');
      subject.getContent('s7CZvpnN5wE0');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1042 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1043
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1043
     * @tc.desc      ComponentFactory call flow toArray > toArray > getParams > delete > getContent keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1043 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('LkeYFE');
      subject.delete('U32wSwCuAI');
      subject.getContent('N7w');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1043 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1044
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1044
     * @tc.desc      ComponentFactory call flow getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1044 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('b');
      logInfo(`step1 getBar("b"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete(' _1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1044 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1045
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1045
     * @tc.desc      ComponentFactory call flow delete > getBar > getBar > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1045 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('Sgol4pAe');
      const step2 = subject.getBar('Sample Title 123Sample Title 123');
      logInfo(`step2 getBar("Sample Title 123Sample Titl...: step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar(' ');
      logInfo(`step3 getBar(" "): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('rRj8x6YM6');
      logInfo(`step4 getBar("rRj8x6YM6"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getContent('myeVugAZM');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1045 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1046
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1046
     * @tc.desc      ComponentFactory call flow getParams > getParams > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1046 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('Sample Title 123');
      subject.getParams('Bh0rR');
      const step3 = subject.getBar('eLADslckWNfW');
      logInfo(`step3 getBar("eLADslckWNfW"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('aa');
      logInfo(`step4 getBar("aa"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1046 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1047
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1047
     * @tc.desc      ComponentFactory call flow getContent > toArray > delete > getContent > getParams keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1047 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('zKWJB5g');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('x\u4e2d\u6587');
      subject.getContent('e');
      subject.getParams('P0OMaAqQY8xL');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1047 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1048
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1048
     * @tc.desc      ComponentFactory call flow getParams > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1048 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('PqTAfLWDDl9');
      subject.delete('jLQcxJVfj');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1048 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1049
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1049
     * @tc.desc      ComponentFactory call flow getParams > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1049 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('A');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('fAN');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1049 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1050
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1050
     * @tc.desc      ComponentFactory call flow getContent > delete > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1050 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('o');
      subject.delete('2m06');
      subject.getContent('eAN');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1050 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1051
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1051
     * @tc.desc      ComponentFactory call flow toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1051 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('HIs3Zc');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1051 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1052
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1052
     * @tc.desc      ComponentFactory call flow toArray > getBar > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1052 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('mI');
      logInfo(`step2 getBar("mI"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('U32wSwCuAI');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1052 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1053
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1053
     * @tc.desc      ComponentFactory call flow toArray > getParams > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1053 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('K0lV');
      const step3 = subject.getBar('WG4eeWlpGG');
      logInfo(`step3 getBar("WG4eeWlpGG"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('c7lMng8ZM');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1053 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1054
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1054
     * @tc.desc      ComponentFactory call flow getContent > toArray > delete > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1054 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('AllDljI');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete(' ');
      subject.getContent('WBLf');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1054 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1055
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1055
     * @tc.desc      ComponentFactory call flow getBar > getParams > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1055 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('h3tUUCmMN');
      logInfo(`step1 getBar("h3tUUCmMN"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('szadka6LFnS');
      subject.delete('6DHUOhqDg8');
      subject.delete('XNdC3ThDoNg');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1055 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1056
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1056
     * @tc.desc      ComponentFactory call flow toArray > toArray > getBar > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1056 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('IXj4nI0');
      logInfo(`step3 getBar("IXj4nI0"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('xa');
      subject.delete('77jE');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1056 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1057
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1057
     * @tc.desc      ComponentFactory call flow getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1057 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('Hello World_1');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1057 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1058
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1058
     * @tc.desc      ComponentFactory call flow delete > delete > getBar > getParams > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1058 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('9Yxb3LyW2g');
      subject.delete('jLQcxJVfj');
      const step3 = subject.getBar(' Hello ');
      logInfo(`step3 getBar(" Hello "): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('szadka6LFnS');
      subject.delete('FTyU38');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1058 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1059
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1059
     * @tc.desc      ComponentFactory call flow getBar > delete > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1059 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('thaeTW');
      logInfo(`step1 getBar("thaeTW"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('g9');
      subject.delete('P6');
      subject.getParams('mwmaw1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1059 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1060
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1060
     * @tc.desc      ComponentFactory call flow toArray > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1060 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('z8T4K');
      const step3 = subject.getBar('dsc6Ba0');
      logInfo(`step3 getBar("dsc6Ba0"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1060 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1061
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1061
     * @tc.desc      ComponentFactory call flow getParams > toArray > getContent > delete > toArray keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1061 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('\u4e2d\u6587_1');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('x');
      subject.delete('xa');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1061 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1062
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1062
     * @tc.desc      ComponentFactory call flow getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1062 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('IXj4nI0');
      logInfo(`step1 getBar("IXj4nI0"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('gZ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1062 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1063
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1063
     * @tc.desc      ComponentFactory call flow getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1063 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('HelloHello');
      logInfo(`step1 getBar("HelloHello"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('KKqGmBc');
      logInfo(`step2 getBar("KKqGmBc"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1063 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1064
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1064
     * @tc.desc      ComponentFactory call flow getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1064 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('a_1');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1064 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1065
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1065
     * @tc.desc      ComponentFactory call flow getBar > getContent > delete > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1065 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('xHello');
      logInfo(`step1 getBar("xHello"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('vW8IZb2km');
      subject.delete('2cJ');
      subject.getContent('9XJ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1065 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1066
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1066
     * @tc.desc      ComponentFactory call flow getContent > getBar > getParams > delete > getContent keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1066 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('xA');
      const step2 = subject.getBar('cCiM');
      logInfo(`step2 getBar("cCiM"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('iHw1P');
      subject.delete('PlJs');
      subject.getContent('   ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1066 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1067
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1067
     * @tc.desc      ComponentFactory call flow toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1067 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('0Tn8NJB7UG');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1067 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1068
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1068
     * @tc.desc      ComponentFactory call flow getParams > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1068 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('u28YtwC8GrPf');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('KBhrxv');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1068 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1069
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1069
     * @tc.desc      ComponentFactory call flow getParams > getContent > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1069 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('a_1');
      subject.getContent('Tair');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('xabc');
      logInfo(`step4 getBar("xabc"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1069 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1070
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1070
     * @tc.desc      ComponentFactory call flow getBar > getBar > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1070 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('b');
      logInfo(`step1 getBar("b"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('MU');
      logInfo(`step2 getBar("MU"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('2Iah91P');
      logInfo(`step3 getBar("2Iah91P"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('hCxdZO');
      logInfo(`step4 getBar("hCxdZO"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1070 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1071
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1071
     * @tc.desc      ComponentFactory call flow getContent > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1071 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('S1KaTmmeYq6');
      subject.getContent('N7w');
      const step3 = subject.getBar('Eo');
      logInfo(`step3 getBar("Eo"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1071 end`);
    });
  });
}
