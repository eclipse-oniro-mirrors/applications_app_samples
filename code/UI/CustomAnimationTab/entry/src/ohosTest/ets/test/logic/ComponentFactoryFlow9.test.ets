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
export default function componentFactoryFlow9Test(): void {
  describe('ComponentFactoryFlow9Test', () => {
    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0562
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0562
     * @tc.desc      ComponentFactory call flow getContent > delete > getContent > toArray > getContent keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0562', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0562 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('Q2JoWYCcStw');
      subject.delete('oazDxlK9Y');
      subject.getContent('DpuswFSnb');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getContent('bVeasKn6');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0562 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0563
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0563
     * @tc.desc      ComponentFactory call flow getBar > getContent > getContent > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0563', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0563 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('et');
      logInfo(`step1 getBar("et"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('r6');
      subject.getContent('123');
      subject.getParams('BgKI');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0563 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0564
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0564
     * @tc.desc      ComponentFactory call flow toArray > delete > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0564', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0564 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('YRgTMZgh');
      subject.getParams(' hello world ');
      const step4 = subject.getBar('T');
      logInfo(`step4 getBar("T"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0564 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0565
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0565
     * @tc.desc      ComponentFactory call flow delete > getContent > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0565', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0565 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('FxlcWtnYctK');
      subject.getContent('VNtmYMZpN5R5');
      subject.delete('K7EGmG7Pak');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0565 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0566
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0566
     * @tc.desc      ComponentFactory call flow toArray > getParams > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0566', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0566 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('l');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getParams('XVP');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0566 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0567
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0567
     * @tc.desc      ComponentFactory call flow delete > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0567', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0567 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('U5ac1t');
      const step2 = subject.getBar('A6gejCa00mXb');
      logInfo(`step2 getBar("A6gejCa00mXb"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('sEgYAx01NMC');
      logInfo(`step3 getBar("sEgYAx01NMC"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0567 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0568
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0568
     * @tc.desc      ComponentFactory call flow delete > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0568', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0568 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('3mmJMh');
      const step2 = subject.getBar('PIGR');
      logInfo(`step2 getBar("PIGR"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0568 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0569
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0569
     * @tc.desc      ComponentFactory call flow getParams > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0569', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0569 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('\u4e2d\u6587\u4e2d\u6587');
      const step2 = subject.getBar('mI');
      logInfo(`step2 getBar("mI"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('bysMUMdqfPdq');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0569 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0570
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0570
     * @tc.desc      ComponentFactory call flow delete > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0570', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0570 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('wj4R');
      subject.delete('9jfEVwbUxWSz');
      const step3 = subject.getBar('AFLB4sG');
      logInfo(`step3 getBar("AFLB4sG"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0570 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0571
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0571
     * @tc.desc      ComponentFactory call flow toArray > getParams > getBar > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0571', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0571 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('P0OMaAqQY8xL');
      const step3 = subject.getBar('jtnn3');
      logInfo(`step3 getBar("jtnn3"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.delete('1TJ2rXdPD');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0571 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0572
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0572
     * @tc.desc      ComponentFactory call flow getParams > getParams > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0572', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0572 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('r');
      subject.getParams('123123');
      const step3 = subject.getBar('et');
      logInfo(`step3 getBar("et"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('abc');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0572 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0573
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0573
     * @tc.desc      ComponentFactory call flow getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0573', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0573 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('otBya');
      const step2 = subject.getBar('O805K7Y');
      logInfo(`step2 getBar("O805K7Y"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0573 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0574
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0574
     * @tc.desc      ComponentFactory call flow getContent > getBar > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0574', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0574 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('I');
      const step2 = subject.getBar('VHU');
      logInfo(`step2 getBar("VHU"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('ElxJx2W2C');
      logInfo(`step3 getBar("ElxJx2W2C"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('mnsT');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0574 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0575
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0575
     * @tc.desc      ComponentFactory call flow delete > getParams > getBar > getParams > getParams keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0575', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0575 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete(' Hello World ');
      subject.getParams('bRqkq5NaRX');
      const step3 = subject.getBar('6');
      logInfo(`step3 getBar("6"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('p02yi');
      subject.getParams('Pj');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0575 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0576
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0576
     * @tc.desc      ComponentFactory call flow toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0576', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0576 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('gsD6x');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0576 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0577
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0577
     * @tc.desc      ComponentFactory call flow toArray > toArray > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0577', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0577 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar(' Sample Title 123 ');
      logInfo(`step3 getBar(" Sample Title 123 "): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('YMVoJhtrZ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0577 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0578
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0578
     * @tc.desc      ComponentFactory call flow toArray > getParams > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0578', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0578 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('3A6n');
      subject.getContent('suJIqPBMsZ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0578 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0579
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0579
     * @tc.desc      ComponentFactory call flow getBar > getContent > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0579', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0579 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('OiBfZNAar');
      logInfo(`step1 getBar("OiBfZNAar"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('CnX');
      subject.delete('9eokJW');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0579 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0580
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0580
     * @tc.desc      ComponentFactory call flow toArray > getContent > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0580', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0580 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('hE');
      const step3 = subject.getBar('   ');
      logInfo(`step3 getBar("   "): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('8kAA38');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0580 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0581
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0581
     * @tc.desc      ComponentFactory call flow getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0581', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0581 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('b0T');
      logInfo(`step1 getBar("b0T"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('ZjpMfS');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0581 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0582
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0582
     * @tc.desc      ComponentFactory call flow toArray > delete > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0582', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0582 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('pSPd');
      const step3 = subject.getBar('bB7TmFt');
      logInfo(`step3 getBar("bB7TmFt"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('U2xjZrluups');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0582 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0583
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0583
     * @tc.desc      ComponentFactory call flow getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0583', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0583 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('Ld');
      const step2 = subject.getBar('jFoCVxiA4Z');
      logInfo(`step2 getBar("jFoCVxiA4Z"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0583 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0584
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0584
     * @tc.desc      ComponentFactory call flow getParams > delete > toArray > toArray > getParams keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0584', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0584 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams(' a ');
      subject.delete('T2Bl');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getParams('arjTurXZeMbR');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0584 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0585
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0585
     * @tc.desc      ComponentFactory call flow getBar > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0585', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0585 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('123');
      logInfo(`step1 getBar("123"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('hello worldhello world');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0585 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0586
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0586
     * @tc.desc      ComponentFactory call flow getBar > getBar > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0586', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0586 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('b');
      logInfo(`step1 getBar("b"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('5Qvn');
      logInfo(`step2 getBar("5Qvn"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('xa');
      subject.getParams('Hello WorldHello World');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0586 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0587
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0587
     * @tc.desc      ComponentFactory call flow getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0587', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0587 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('HPBKG1Df');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0587 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0588
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0588
     * @tc.desc      ComponentFactory call flow getContent > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0588', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0588 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('Tair');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('TLzHYlbpE2');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0588 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0589
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0589
     * @tc.desc      ComponentFactory call flow toArray > getParams > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0589', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0589 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('MTnTYD6');
      subject.delete('T2Bl');
      const step4 = subject.getBar('xNP');
      logInfo(`step4 getBar("xNP"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0589 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0590
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0590
     * @tc.desc      ComponentFactory call flow toArray > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0590', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0590 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('123123');
      logInfo(`step2 getBar("123123"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('Xcw36Vv5MFT');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0590 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0591
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0591
     * @tc.desc      ComponentFactory call flow getContent > getParams > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0591', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0591 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('dh1PdJ');
      subject.getParams('Uc45f3');
      subject.getContent('SVCGZjw');
      const step4 = subject.getBar('xA');
      logInfo(`step4 getBar("xA"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0591 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0592
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0592
     * @tc.desc      ComponentFactory call flow getParams > getContent > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0592', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0592 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('MedbmHHUIc');
      subject.getContent('3ZPW5');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0592 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0593
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0593
     * @tc.desc      ComponentFactory call flow getContent > getBar > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0593', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0593 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('bHt');
      const step2 = subject.getBar('abc');
      logInfo(`step2 getBar("abc"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('mdL');
      logInfo(`step3 getBar("mdL"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('xtayMj');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0593 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0594
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0594
     * @tc.desc      ComponentFactory call flow getContent > getBar > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0594', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0594 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('AAWtEho');
      const step2 = subject.getBar('PFOls05b2');
      logInfo(`step2 getBar("PFOls05b2"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('O81E1pRljiV');
      logInfo(`step3 getBar("O81E1pRljiV"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('SVCGZjw');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0594 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0595
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0595
     * @tc.desc      ComponentFactory call flow getParams > getBar > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0595', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0595 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams(' a ');
      const step2 = subject.getBar('FYXMiUxa');
      logInfo(`step2 getBar("FYXMiUxa"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('BauR9pM8qz');
      logInfo(`step3 getBar("BauR9pM8qz"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0595 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0596
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0596
     * @tc.desc      ComponentFactory call flow getBar > getParams > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0596', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0596 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('abc');
      logInfo(`step1 getBar("abc"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('Oeh3Zti');
      subject.getParams('iE');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0596 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0597
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0597
     * @tc.desc      ComponentFactory call flow delete > getBar > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0597', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0597 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('IYDn');
      const step2 = subject.getBar('abc');
      logInfo(`step2 getBar("abc"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('sta8M7k');
      subject.delete('FEDAmRPXge');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0597 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0598
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0598
     * @tc.desc      ComponentFactory call flow getContent > toArray > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0598', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0598 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('Wy');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('hHx1r');
      logInfo(`step3 getBar("hHx1r"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0598 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0599
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0599
     * @tc.desc      ComponentFactory call flow getContent > getParams > getContent > getBar > toArray keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0599', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0599 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('x');
      subject.getParams('2tIMNtcNOL');
      subject.getContent('Po1TV91Y');
      const step4 = subject.getBar('PFOls05b2');
      logInfo(`step4 getBar("PFOls05b2"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0599 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0600
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0600
     * @tc.desc      ComponentFactory call flow getBar > toArray > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0600 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('A_1');
      logInfo(`step1 getBar("A_1"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('teOgE50');
      logInfo(`step4 getBar("teOgE50"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0600 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0601
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0601
     * @tc.desc      ComponentFactory call flow toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0601', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0601 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('\u4e2d\u6587_1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0601 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0602
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0602
     * @tc.desc      ComponentFactory call flow getBar > delete > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0602', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0602 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('28cZ2bB4z5g');
      logInfo(`step1 getBar("28cZ2bB4z5g"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('58X36');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('tr9fihM1RvDV');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0602 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0603
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0603
     * @tc.desc      ComponentFactory call flow toArray > getBar > getBar > getContent > getContent keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0603', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0603 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('njB9hbOH');
      logInfo(`step2 getBar("njB9hbOH"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('BA4U');
      logInfo(`step3 getBar("BA4U"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('lwaYIV8OC');
      subject.getContent('\u4e2d\u6587');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0603 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0604
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0604
     * @tc.desc      ComponentFactory call flow getContent > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0604', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0604 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent(' A ');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('JMWbFJUA');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0604 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0605
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0605
     * @tc.desc      ComponentFactory call flow getBar > getContent > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0605', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0605 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('C4');
      logInfo(`step1 getBar("C4"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('eJuIlW3Qr');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('xHello');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0605 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0606
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0606
     * @tc.desc      ComponentFactory call flow toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0606', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0606 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('J6uwV');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0606 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0607
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0607
     * @tc.desc      ComponentFactory call flow getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0607', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0607 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('XHj0');
      logInfo(`step1 getBar("XHj0"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('2atXJqonx0');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0607 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0608
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0608
     * @tc.desc      ComponentFactory call flow getBar > getBar > getParams > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0608', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0608 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('n4BBP');
      logInfo(`step1 getBar("n4BBP"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('n6t');
      logInfo(`step2 getBar("n6t"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('P0OMaAqQY8xL');
      subject.delete('gpYStKeTq7');
      subject.getParams('M2ShSF15');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0608 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0609
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0609
     * @tc.desc      ComponentFactory call flow getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0609', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0609 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('SaZUvlunWF');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0609 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0610
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0610
     * @tc.desc      ComponentFactory call flow delete > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0610', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0610 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('fWZMrR');
      subject.getContent('8LIv');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0610 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0611
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0611
     * @tc.desc      ComponentFactory call flow getContent > getContent > getBar > getBar > delete keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0611', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0611 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('czXc4Bok');
      subject.getContent('3Ymm5m7acs');
      const step3 = subject.getBar('hello worldhello world');
      logInfo(`step3 getBar("hello worldhello world"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('qMrW');
      logInfo(`step4 getBar("qMrW"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.delete('A_1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0611 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0612
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0612
     * @tc.desc      ComponentFactory call flow delete > delete > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0612', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0612 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('Fuod');
      subject.delete('8uYGsOLyg');
      subject.delete('xabc');
      const step4 = subject.getBar('o3');
      logInfo(`step4 getBar("o3"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0612 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0613
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0613
     * @tc.desc      ComponentFactory call flow toArray > getParams > getContent > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0613', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0613 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('Bh0rR');
      subject.getContent('S6FkWO');
      subject.getContent('DpuswFSnb');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0613 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0614
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0614
     * @tc.desc      ComponentFactory call flow getParams > toArray > toArray > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0614', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0614 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('Hello WorldHello World');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0614 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0615
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0615
     * @tc.desc      ComponentFactory call flow getBar > getParams > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0615', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0615 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('etSuf');
      logInfo(`step1 getBar("etSuf"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('H7QASzBFrfnn');
      subject.getContent('XqccvLh');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0615 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0616
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0616
     * @tc.desc      ComponentFactory call flow getContent > getBar > getParams > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0616', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0616 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('2yJnb15b');
      const step2 = subject.getBar('tGx');
      logInfo(`step2 getBar("tGx"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('UVLwtn');
      subject.delete('6emR6k');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0616 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0617
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0617
     * @tc.desc      ComponentFactory call flow getBar > getContent > delete > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0617', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0617 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar(' Hello ');
      logInfo(`step1 getBar(" Hello "): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('7Fn4');
      subject.delete('abcabc');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.delete('x\u4e2d\u6587');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0617 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0618
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0618
     * @tc.desc      ComponentFactory call flow getParams > delete > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0618', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0618 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('8tsdK7xbk5');
      subject.delete('XVkfLk');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('7wHIP1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0618 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0619
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0619
     * @tc.desc      ComponentFactory call flow getBar > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0619', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0619 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('lEdaAGGIE');
      logInfo(`step1 getBar("lEdaAGGIE"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('rb6bBOpG0w');
      const step3 = subject.getBar('hO3w7f');
      logInfo(`step3 getBar("hO3w7f"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0619 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0620
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0620
     * @tc.desc      ComponentFactory call flow toArray > delete > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0620', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0620 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('PlJs');
      subject.getContent('e');
      const step4 = subject.getBar('1YW3Xow');
      logInfo(`step4 getBar("1YW3Xow"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0620 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0621
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0621
     * @tc.desc      ComponentFactory call flow getContent > getContent > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0621', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0621 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('HelloHello');
      subject.getContent('yf');
      subject.getContent('zKWJB5g');
      const step4 = subject.getBar('9wuRQd0r');
      logInfo(`step4 getBar("9wuRQd0r"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0621 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0622
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0622
     * @tc.desc      ComponentFactory call flow getBar > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0622', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0622 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('UZ1');
      logInfo(`step1 getBar("UZ1"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('hello world_1');
      logInfo(`step2 getBar("hello world_1"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('WBLf');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0622 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0623
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0623
     * @tc.desc      ComponentFactory call flow getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0623', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0623 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('7ZkFBoe');
      logInfo(`step1 getBar("7ZkFBoe"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('wBZMXHZkcBd');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0623 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0624
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0624
     * @tc.desc      ComponentFactory call flow toArray > delete > getBar > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0624', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0624 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('tC');
      const step3 = subject.getBar('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`step3 getBar("????"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('7wHIP1');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0624 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0625
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0625
     * @tc.desc      ComponentFactory call flow toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0625', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0625 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('47lak6JVXRR');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0625 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0626
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0626
     * @tc.desc      ComponentFactory call flow getBar > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0626', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0626 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('A_1');
      logInfo(`step1 getBar("A_1"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('rh2f6yPSgIA');
      subject.delete('9');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0626 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0627
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0627
     * @tc.desc      ComponentFactory call flow getParams > getBar > getContent > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0627', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0627 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('LISDV');
      const step2 = subject.getBar('mdL');
      logInfo(`step2 getBar("mdL"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('7NMMVN');
      subject.delete('vWF3');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0627 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0628
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0628
     * @tc.desc      ComponentFactory call flow getParams > getContent > getContent > toArray > toArray keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0628', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0628 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('EIF5t2O2ZVpJ');
      subject.getContent('LOlUkMBnd');
      subject.getContent('uhEdJ8TYI');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0628 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0629
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0629
     * @tc.desc      ComponentFactory call flow getContent > toArray > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0629', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0629 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('cuWW2qVH');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('wCFzP5g');
      logInfo(`step3 getBar("wCFzP5g"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('BA4U');
      logInfo(`step4 getBar("BA4U"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0629 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0630
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0630
     * @tc.desc      ComponentFactory call flow getBar > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0630', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0630 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('pB0KQflQ');
      logInfo(`step1 getBar("pB0KQflQ"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('Aw2U6KL');
      logInfo(`step2 getBar("Aw2U6KL"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('D');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0630 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0631
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0631
     * @tc.desc      ComponentFactory call flow getContent > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0631', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0631 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('s7CZvpnN5wE0');
      subject.getContent('a_1');
      const step3 = subject.getBar('YM5A7JRomJP1');
      logInfo(`step3 getBar("YM5A7JRomJP1"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0631 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0632
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0632
     * @tc.desc      ComponentFactory call flow toArray > getContent > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0632', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0632 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('bISQH7qPL');
      subject.getParams('');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0632 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0633
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0633
     * @tc.desc      ComponentFactory call flow toArray > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0633', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0633 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('5s');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0633 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0634
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0634
     * @tc.desc      ComponentFactory call flow toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0634', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0634 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0634 end`);
    });
  });
}
