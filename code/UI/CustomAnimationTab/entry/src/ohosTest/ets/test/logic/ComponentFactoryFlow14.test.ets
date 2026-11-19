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

/** Logic checks for ComponentFactory flow (72 cases). */
export default function componentFactoryFlow14Test(): void {
  describe('ComponentFactoryFlow14Test', () => {
    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0927
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0927
     * @tc.desc      ComponentFactory call flow getBar > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0927', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0927 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('eltuIeS');
      logInfo(`step1 getBar("eltuIeS"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('VXcOvDGrg7');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0927 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0928
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0928
     * @tc.desc      ComponentFactory call flow toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0928', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0928 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('JPpP');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0928 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0929
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0929
     * @tc.desc      ComponentFactory call flow getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0929', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0929 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('v');
      logInfo(`step1 getBar("v"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0929 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0930
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0930
     * @tc.desc      ComponentFactory call flow toArray > delete > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0930', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0930 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('hello world');
      subject.getParams('FE6S319GoD');
      const step4 = subject.getBar('xoCXqWLigfEo');
      logInfo(`step4 getBar("xoCXqWLigfEo"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0930 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0931
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0931
     * @tc.desc      ComponentFactory call flow toArray > delete > getParams > toArray > getContent keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0931', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0931 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('ASFrvK5j');
      subject.getParams('yobXge');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getContent('MUalu12Q');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0931 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0932
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0932
     * @tc.desc      ComponentFactory call flow delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0932', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0932 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('0VsvJoEp');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0932 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0933
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0933
     * @tc.desc      ComponentFactory call flow getContent > delete > getParams > toArray > getContent keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0933', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0933 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('cQIHk1oqt');
      subject.delete('aHkr');
      subject.getParams('b5WJMy');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getContent('8Uzb2NI');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0933 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0934
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0934
     * @tc.desc      ComponentFactory call flow getContent > getContent > delete > getBar > toArray keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0934', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0934 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('sGzPsbc');
      subject.getContent('OoA8pf');
      subject.delete('EMZcrnNG9m');
      const step4 = subject.getBar('FYXMiUxa');
      logInfo(`step4 getBar("FYXMiUxa"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0934 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0935
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0935
     * @tc.desc      ComponentFactory call flow getParams > getContent > getContent > getContent > getBar keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0935', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0935 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('iWOsagN');
      subject.getContent('eAYcBjsH');
      subject.getContent('U1lXp');
      subject.getContent('N1zGx4HsEP');
      const step5 = subject.getBar('kRhUbvP8S');
      logInfo(`step5 getBar("kRhUbvP8S"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0935 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0936
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0936
     * @tc.desc      ComponentFactory call flow getBar > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0936', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0936 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('w');
      logInfo(`step1 getBar("w"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('vRiQstPt7');
      logInfo(`step3 getBar("vRiQstPt7"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0936 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0937
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0937
     * @tc.desc      ComponentFactory call flow toArray > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0937', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0937 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('GcdSixwo');
      const step3 = subject.getBar('t6XAkX');
      logInfo(`step3 getBar("t6XAkX"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0937 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0938
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0938
     * @tc.desc      ComponentFactory call flow delete > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0938', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0938 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('6NbRySY');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('As0kvJU');
      logInfo(`step3 getBar("As0kvJU"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0938 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0939
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0939
     * @tc.desc      ComponentFactory call flow getContent > getContent > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0939', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0939 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('uhEdJ8TYI');
      subject.getContent('YjOjGONAA');
      subject.getContent('ao1xPPVqGz');
      const step4 = subject.getBar('6YBKgd');
      logInfo(`step4 getBar("6YBKgd"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0939 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0940
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0940
     * @tc.desc      ComponentFactory call flow delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0940', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0940 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('lIklZ7h');
      const step2 = subject.getBar('As0kvJU');
      logInfo(`step2 getBar("As0kvJU"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0940 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0941
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0941
     * @tc.desc      ComponentFactory call flow getContent > toArray > toArray > getBar > getParams keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0941', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0941 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('KR');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('i4VJdShfk');
      logInfo(`step4 getBar("i4VJdShfk"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getParams('8jk');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0941 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0942
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0942
     * @tc.desc      ComponentFactory call flow getParams > delete > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0942', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0942 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('l0vCXsQi3');
      subject.delete('bCA');
      subject.getContent('rMiexP');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0942 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0943
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0943
     * @tc.desc      ComponentFactory call flow toArray > delete > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0943', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0943 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('0VsvJoEp');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0943 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0944
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0944
     * @tc.desc      ComponentFactory call flow toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0944', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0944 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('3');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0944 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0945
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0945
     * @tc.desc      ComponentFactory call flow getParams > toArray > getContent > toArray > getParams keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0945', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0945 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('mwmaw1');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('x ');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getParams('xa');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0945 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0946
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0946
     * @tc.desc      ComponentFactory call flow getParams > toArray > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0946', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0946 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('   ');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('O6CfKF');
      logInfo(`step3 getBar("O6CfKF"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0946 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0947
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0947
     * @tc.desc      ComponentFactory call flow toArray > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0947', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0947 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('iMCpJ1');
      subject.delete('EMgUpK6s');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0947 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0948
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0948
     * @tc.desc      ComponentFactory call flow getParams > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0948', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0948 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('2tIMNtcNOL');
      const step2 = subject.getBar('uwe90');
      logInfo(`step2 getBar("uwe90"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0948 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0949
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0949
     * @tc.desc      ComponentFactory call flow getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0949', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0949 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('i');
      const step2 = subject.getBar('Hello');
      logInfo(`step2 getBar("Hello"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0949 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0950
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0950
     * @tc.desc      ComponentFactory call flow getContent > getBar > getContent > getContent > toArray keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0950', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0950 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('7ZjIEOmdPkOR');
      const step2 = subject.getBar('jtnn3');
      logInfo(`step2 getBar("jtnn3"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('bOd9mOl0Fwly');
      subject.getContent('1AlWfu7w');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0950 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0951
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0951
     * @tc.desc      ComponentFactory call flow getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0951', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0951 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar(' Sample Title 123 ');
      logInfo(`step1 getBar(" Sample Title 123 "): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('hello world_1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0951 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0952
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0952
     * @tc.desc      ComponentFactory call flow getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0952', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0952 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('iUES6yl3kHWU');
      const step2 = subject.getBar('w7smXl');
      logInfo(`step2 getBar("w7smXl"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0952 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0953
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0953
     * @tc.desc      ComponentFactory call flow getParams > getBar > getBar > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0953', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0953 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('V');
      const step2 = subject.getBar('Uw56XMZCO');
      logInfo(`step2 getBar("Uw56XMZCO"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('abcabc');
      logInfo(`step3 getBar("abcabc"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('Uw56XMZCO');
      logInfo(`step4 getBar("Uw56XMZCO"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getParams('');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0953 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0954
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0954
     * @tc.desc      ComponentFactory call flow getContent > getParams > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0954', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0954 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('123');
      subject.getParams('v7wMsz894');
      const step3 = subject.getBar('cy');
      logInfo(`step3 getBar("cy"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0954 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0955
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0955
     * @tc.desc      ComponentFactory call flow getParams > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0955', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0955 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('LvcwiewBc');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('ZcJyDJ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0955 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0956
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0956
     * @tc.desc      ComponentFactory call flow getParams > getParams > getBar > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0956', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0956 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('b5WJMy');
      subject.getParams('l7Da1');
      const step3 = subject.getBar('VEn9iepX');
      logInfo(`step3 getBar("VEn9iepX"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.delete('upg');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0956 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0957
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0957
     * @tc.desc      ComponentFactory call flow getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0957', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0957 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('n8ki');
      logInfo(`step1 getBar("n8ki"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0957 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0958
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0958
     * @tc.desc      ComponentFactory call flow delete > getParams > getParams > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0958', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0958 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('9Q');
      subject.getParams('iHw1P');
      subject.getParams('H');
      const step4 = subject.getBar('mGe');
      logInfo(`step4 getBar("mGe"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0958 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0959
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0959
     * @tc.desc      ComponentFactory call flow toArray > getParams > delete > getContent > getBar keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0959', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0959 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('m2');
      subject.delete(' 123 ');
      subject.getContent('mVOnDM');
      const step5 = subject.getBar('CbhFUa9Bi');
      logInfo(`step5 getBar("CbhFUa9Bi"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0959 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0960
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0960
     * @tc.desc      ComponentFactory call flow getContent > delete > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0960', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0960 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('47lak6JVXRR');
      subject.delete('Fuod');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent(' \u4e2d\u6587 ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0960 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0961
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0961
     * @tc.desc      ComponentFactory call flow delete > getParams > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0961', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0961 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('OJQrZwvC98');
      subject.getParams('1UvjpL');
      subject.delete('\u4e2d\u6587_1');
      const step4 = subject.getBar('Y');
      logInfo(`step4 getBar("Y"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0961 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0962
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0962
     * @tc.desc      ComponentFactory call flow toArray > getContent > delete > delete > getParams keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0962', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0962 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('mm6Fv');
      subject.delete('HQ');
      subject.delete('Y81DfEBjzC');
      subject.getParams('wCpONBzv9');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0962 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0963
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0963
     * @tc.desc      ComponentFactory call flow toArray > toArray > delete > delete > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0963', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0963 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('2m06');
      subject.delete('123');
      subject.getContent('aa');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0963 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0964
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0964
     * @tc.desc      ComponentFactory call flow toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0964', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0964 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0964 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0965
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0965
     * @tc.desc      ComponentFactory call flow toArray > delete > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0965', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0965 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('DFXlTccFsR');
      subject.delete(' Sample Title 123 ');
      subject.getParams('iE');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0965 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0966
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0966
     * @tc.desc      ComponentFactory call flow getContent > getBar > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0966', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0966 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('N7w');
      const step2 = subject.getBar('OvsjRINx');
      logInfo(`step2 getBar("OvsjRINx"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('oazDxlK9Y');
      subject.getParams('x123');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0966 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0967
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0967
     * @tc.desc      ComponentFactory call flow toArray > delete > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0967', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0967 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('p');
      subject.delete('UDi285Ncj');
      const step4 = subject.getBar('y3BmY2P9');
      logInfo(`step4 getBar("y3BmY2P9"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0967 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0968
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0968
     * @tc.desc      ComponentFactory call flow getParams > getBar > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0968', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0968 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('abc_1');
      const step2 = subject.getBar('GwrQCX');
      logInfo(`step2 getBar("GwrQCX"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('pBJGLVMA');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0968 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0969
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0969
     * @tc.desc      ComponentFactory call flow toArray > getBar > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0969', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0969 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('xoCXqWLigfEo');
      logInfo(`step2 getBar("xoCXqWLigfEo"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('\u4e2d\u6587\u4e2d\u6587');
      const step4 = subject.getBar('XHj0');
      logInfo(`step4 getBar("XHj0"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0969 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0970
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0970
     * @tc.desc      ComponentFactory call flow getContent > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0970', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0970 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('9shlXE');
      subject.getContent('S6FkWO');
      const step3 = subject.getBar('BA4U');
      logInfo(`step3 getBar("BA4U"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0970 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0971
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0971
     * @tc.desc      ComponentFactory call flow getBar > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0971', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0971 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('o3');
      logInfo(`step1 getBar("o3"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('AV913N');
      logInfo(`step2 getBar("AV913N"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0971 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0972
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0972
     * @tc.desc      ComponentFactory call flow delete > getBar > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0972', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0972 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('9Q');
      const step2 = subject.getBar('pB0KQflQ');
      logInfo(`step2 getBar("pB0KQflQ"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('');
      logInfo(`step3 getBar(""): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('w7smXl');
      logInfo(`step4 getBar("w7smXl"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0972 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0973
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0973
     * @tc.desc      ComponentFactory call flow getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0973', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0973 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('QEugm4vLp');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0973 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0974
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0974
     * @tc.desc      ComponentFactory call flow getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0974', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0974 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('6Gs7');
      logInfo(`step1 getBar("6Gs7"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0974 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0975
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0975
     * @tc.desc      ComponentFactory call flow getParams > toArray > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0975', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0975 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('UI');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('RAcfl');
      subject.delete('DbCp');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0975 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0976
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0976
     * @tc.desc      ComponentFactory call flow delete > getContent > getParams > toArray > getParams keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0976', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0976 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('04EQ');
      subject.getContent('nq');
      subject.getParams('7r');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getParams('ix');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0976 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0977
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0977
     * @tc.desc      ComponentFactory call flow getContent > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0977', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0977 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('CrR');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0977 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0978
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0978
     * @tc.desc      ComponentFactory call flow getBar > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0978', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0978 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('qLnzx');
      logInfo(`step1 getBar("qLnzx"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('mb');
      logInfo(`step3 getBar("mb"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0978 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0979
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0979
     * @tc.desc      ComponentFactory call flow getContent > toArray > getParams > getContent > getContent keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0979', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0979 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('8Uzb2NI');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('Hello World_1');
      subject.getContent('iUES6yl3kHWU');
      subject.getContent('UUfRskW');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0979 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0980
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0980
     * @tc.desc      ComponentFactory call flow toArray > getParams > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0980', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0980 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('qzZ4');
      subject.getContent('TM');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0980 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0981
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0981
     * @tc.desc      ComponentFactory call flow delete > delete > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0981', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0981 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('T2T');
      subject.delete('R5hntg');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getParams('8YGinqG');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0981 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0982
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0982
     * @tc.desc      ComponentFactory call flow getBar > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0982', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0982 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('upjzRMbiEoc');
      logInfo(`step1 getBar("upjzRMbiEoc"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('eyQTwU8DM7la');
      logInfo(`step2 getBar("eyQTwU8DM7la"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('5Qvn');
      logInfo(`step3 getBar("5Qvn"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0982 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0983
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0983
     * @tc.desc      ComponentFactory call flow getParams > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0983', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0983 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('2d');
      subject.getContent('7NMMVN');
      const step3 = subject.getBar('bd');
      logInfo(`step3 getBar("bd"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0983 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0984
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0984
     * @tc.desc      ComponentFactory call flow getBar > getContent > getBar > getContent > getParams keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0984', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0984 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('5f');
      logInfo(`step1 getBar("5f"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('xHello World');
      const step3 = subject.getBar('n6t');
      logInfo(`step3 getBar("n6t"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('Zj3J0');
      subject.getParams('tiCdW');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0984 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0985
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0985
     * @tc.desc      ComponentFactory call flow getBar > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0985', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0985 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('xZ');
      logInfo(`step1 getBar("xZ"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('R5P2ymPHAz5');
      const step3 = subject.getBar('L');
      logInfo(`step3 getBar("L"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0985 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0986
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0986
     * @tc.desc      ComponentFactory call flow getBar > delete > getBar > getContent > getContent keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0986', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0986 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('eECT3Cnise1I');
      logInfo(`step1 getBar("eECT3Cnise1I"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('DFXlTccFsR');
      const step3 = subject.getBar('eltuIeS');
      logInfo(`step3 getBar("eltuIeS"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent(' ');
      subject.getContent('9WYSYc9Q');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0986 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0987
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0987
     * @tc.desc      ComponentFactory call flow toArray > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0987', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0987 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('rlMC8');
      logInfo(`step2 getBar("rlMC8"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('ScNobGpvdWM');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0987 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0988
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0988
     * @tc.desc      ComponentFactory call flow getBar > getParams > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0988', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0988 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('WCEOCcw2E2');
      logInfo(`step1 getBar("WCEOCcw2E2"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('123');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0988 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0989
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0989
     * @tc.desc      ComponentFactory call flow delete > getContent > getContent > toArray > delete keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0989', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0989 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('lIklZ7h');
      subject.getContent('9jAL');
      subject.getContent('Sw7D9');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.delete('aa');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0989 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0990
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0990
     * @tc.desc      ComponentFactory call flow getParams > getContent > delete > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0990', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0990 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('fxsZv');
      subject.getContent('8RUUG');
      subject.delete('HelloHello');
      const step4 = subject.getBar('a_1');
      logInfo(`step4 getBar("a_1"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.delete('EMgUpK6s');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0990 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0991
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0991
     * @tc.desc      ComponentFactory call flow getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0991', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0991 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('xa');
      logInfo(`step1 getBar("xa"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('Fuod');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0991 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0992
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0992
     * @tc.desc      ComponentFactory call flow getParams > getParams > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0992', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0992 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('h6o');
      subject.getParams('Sample Title 123');
      subject.getParams('123_1');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0992 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0993
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0993
     * @tc.desc      ComponentFactory call flow toArray > getContent > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0993', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0993 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('rtwMg6lz6JPm');
      subject.delete('Sample Title 123');
      subject.getParams('i');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0993 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0994
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0994
     * @tc.desc      ComponentFactory call flow delete > getBar > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0994', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0994 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('x123');
      const step2 = subject.getBar('');
      logInfo(`step2 getBar(""): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('ofTfIEGv');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0994 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0995
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0995
     * @tc.desc      ComponentFactory call flow toArray > delete > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0995', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0995 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('Sample Title 123');
      const step3 = subject.getBar('IUi');
      logInfo(`step3 getBar("IUi"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0995 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0996
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0996
     * @tc.desc      ComponentFactory call flow getBar > toArray > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0996', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0996 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('e4');
      logInfo(`step1 getBar("e4"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('IYDn');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0996 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0997
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0997
     * @tc.desc      ComponentFactory call flow getBar > delete > getParams > getParams > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0997', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0997 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('w7smXl');
      logInfo(`step1 getBar("w7smXl"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('P6');
      subject.getParams('7HHi');
      subject.getParams('kt62Ld');
      subject.delete('aB9p');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0997 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0998
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0998
     * @tc.desc      ComponentFactory call flow getBar > getParams > getContent > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0998', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0998 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('b0T');
      logInfo(`step1 getBar("b0T"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('');
      subject.getContent(' hello world ');
      subject.delete('fYygLBY7');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0998 end`);
    });
  });
}
