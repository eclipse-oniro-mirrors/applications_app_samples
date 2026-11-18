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
export default function componentFactoryFlow12Test(): void {
  describe('ComponentFactoryFlow12Test', () => {
    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0781
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0781
     * @tc.desc      ComponentFactory call flow getBar > getContent > delete > toArray > getParams keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0781', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0781 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Xard8Kss3VC');
      logInfo(`step1 getBar("Xard8Kss3VC"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('cuWW2qVH');
      subject.delete('hQx3c');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getParams('x\u4e2d\u6587');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0781 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0782
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0782
     * @tc.desc      ComponentFactory call flow getBar > getParams > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0782', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0782 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('WCEOCcw2E2');
      logInfo(`step1 getBar("WCEOCcw2E2"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('AXWsFqFpij');
      subject.getContent('X64CfWVVVH');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0782 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0783
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0783
     * @tc.desc      ComponentFactory call flow getBar > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0783', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0783 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('MZEv8J');
      logInfo(`step1 getBar("MZEv8J"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('onHMSlNH');
      logInfo(`step2 getBar("onHMSlNH"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('otBya');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0783 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0784
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0784
     * @tc.desc      ComponentFactory call flow toArray > getParams > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0784', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0784 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('5C');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('jjBHMnIshV3');
      logInfo(`step4 getBar("jjBHMnIshV3"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0784 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0785
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0785
     * @tc.desc      ComponentFactory call flow delete > delete > getBar > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0785', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0785 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('2m06');
      subject.delete('vv08DE');
      const step3 = subject.getBar('ae0');
      logInfo(`step3 getBar("ae0"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('xSample Title 123');
      logInfo(`step4 getBar("xSample Title 123"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getBar('IXj4nI0');
      logInfo(`step5 getBar("IXj4nI0"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0785 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0786
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0786
     * @tc.desc      ComponentFactory call flow getContent > delete > getContent > getBar > getBar keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0786', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0786 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('LLU2HUi');
      subject.delete('NnHshymU');
      subject.getContent('Y6eQwtY');
      const step4 = subject.getBar('ZhkaZi8GuZK');
      logInfo(`step4 getBar("ZhkaZi8GuZK"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getBar('Op312');
      logInfo(`step5 getBar("Op312"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0786 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0787
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0787
     * @tc.desc      ComponentFactory call flow delete > getContent > getBar > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0787', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0787 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('DDVCz5ydJ6G');
      subject.getContent('TF6Zj');
      const step3 = subject.getBar('sr');
      logInfo(`step3 getBar("sr"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('lk1i');
      logInfo(`step4 getBar("lk1i"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getParams('qXFp');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0787 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0788
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0788
     * @tc.desc      ComponentFactory call flow getContent > delete > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0788', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0788 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('Cxfm40FDJmt');
      subject.delete('ea4GvMxX');
      subject.getContent('X');
      const step4 = subject.getBar('123');
      logInfo(`step4 getBar("123"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0788 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0789
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0789
     * @tc.desc      ComponentFactory call flow toArray > toArray > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0789', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0789 begin`);
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
      subject.getContent('   ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0789 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0790
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0790
     * @tc.desc      ComponentFactory call flow getContent > toArray > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0790', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0790 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('KUCQL');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('6emR6k');
      const step4 = subject.getBar('O805K7Y');
      logInfo(`step4 getBar("O805K7Y"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0790 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0791
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0791
     * @tc.desc      ComponentFactory call flow getContent > toArray > getParams > toArray > getContent keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0791', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0791 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('8kAA38');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('B');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getContent('wMr');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0791 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0792
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0792
     * @tc.desc      ComponentFactory call flow getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0792', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0792 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('sXbp2Pkw3ht7');
      logInfo(`step1 getBar("sXbp2Pkw3ht7"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('ThmZoPQ0Nwk');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0792 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0793
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0793
     * @tc.desc      ComponentFactory call flow delete > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0793', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0793 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('k');
      subject.delete('Zn8gjRlr');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0793 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0794
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0794
     * @tc.desc      ComponentFactory call flow getBar > getContent > getBar > getBar > getContent keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0794', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0794 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`step1 getBar("????"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('BpzH');
      const step3 = subject.getBar('3Pe');
      logInfo(`step3 getBar("3Pe"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('Hello');
      logInfo(`step4 getBar("Hello"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getContent('eJuIlW3Qr');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0794 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0795
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0795
     * @tc.desc      ComponentFactory call flow delete > getBar > getContent > getContent > delete keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0795', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0795 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('XNdC3ThDoNg');
      const step2 = subject.getBar('GuYN');
      logInfo(`step2 getBar("GuYN"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('mv6');
      subject.getContent(' abc ');
      subject.delete('nbtrrK6');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0795 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0796
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0796
     * @tc.desc      ComponentFactory call flow getParams > toArray > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0796', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0796 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('wsq7rmEOO');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0796 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0797
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0797
     * @tc.desc      ComponentFactory call flow getParams > delete > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0797', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0797 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('j6zPJTMw');
      subject.delete('MTjLYu1O4y');
      const step3 = subject.getBar('xMtWdQu6');
      logInfo(`step3 getBar("xMtWdQu6"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('znM');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0797 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0798
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0798
     * @tc.desc      ComponentFactory call flow getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0798', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0798 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('oZpLOiX');
      logInfo(`step1 getBar("oZpLOiX"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('8k');
      logInfo(`step2 getBar("8k"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0798 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0799
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0799
     * @tc.desc      ComponentFactory call flow delete > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0799', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0799 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('YD4gWjooSL');
      const step2 = subject.getBar('BA4U');
      logInfo(`step2 getBar("BA4U"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('123123');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0799 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0800
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0800
     * @tc.desc      ComponentFactory call flow getParams > getContent > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0800 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('arjTurXZeMbR');
      subject.getContent('5s');
      const step3 = subject.getBar('etSuf');
      logInfo(`step3 getBar("etSuf"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('NwT');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0800 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0801
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0801
     * @tc.desc      ComponentFactory call flow delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0801', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0801 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('i');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0801 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0802
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0802
     * @tc.desc      ComponentFactory call flow getContent > getContent > getParams > toArray > getContent keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0802', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0802 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('KUCQL');
      subject.getContent('NwT');
      subject.getParams('eU6Lz');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getContent('KR');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0802 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0803
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0803
     * @tc.desc      ComponentFactory call flow getParams > toArray > getBar > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0803', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0803 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('4UYNOjK');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('0xoZWamAK');
      logInfo(`step3 getBar("0xoZWamAK"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('T2T');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0803 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0804
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0804
     * @tc.desc      ComponentFactory call flow getBar > getParams > toArray > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0804', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0804 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('A_1');
      logInfo(`step1 getBar("A_1"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('9kN7kfusjr');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('k');
      subject.delete('XNdC3ThDoNg');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0804 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0805
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0805
     * @tc.desc      ComponentFactory call flow delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0805', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0805 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('1TJ2rXdPD');
      const step2 = subject.getBar('b0T');
      logInfo(`step2 getBar("b0T"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0805 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0806
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0806
     * @tc.desc      ComponentFactory call flow getBar > getBar > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0806', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0806 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('v');
      logInfo(`step1 getBar("v"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('k');
      logInfo(`step2 getBar("k"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('N7OAv');
      logInfo(`step3 getBar("N7OAv"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('9Yxb3LyW2g');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0806 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0807
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0807
     * @tc.desc      ComponentFactory call flow getParams > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0807', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0807 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('P5CfiBgO');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0807 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0808
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0808
     * @tc.desc      ComponentFactory call flow delete > toArray > toArray > getContent > getContent keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0808', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0808 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('sta8M7k');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('GbgePszBh');
      subject.getContent('KUCQL');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0808 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0809
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0809
     * @tc.desc      ComponentFactory call flow getParams > getContent > getContent > getParams > toArray keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0809', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0809 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('eIU9y');
      subject.getContent('Wi6jAzzq6AL7');
      subject.getContent('');
      subject.getParams('1UvjpL');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0809 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0810
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0810
     * @tc.desc      ComponentFactory call flow toArray > delete > getContent > toArray > getParams keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0810', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0810 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('inIQz');
      subject.getContent('FnyWHce');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getParams('psf8l88I');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0810 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0811
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0811
     * @tc.desc      ComponentFactory call flow getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0811', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0811 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('MO0ZHZa');
      const step2 = subject.getBar('qfh7xvfS5B');
      logInfo(`step2 getBar("qfh7xvfS5B"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0811 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0812
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0812
     * @tc.desc      ComponentFactory call flow toArray > delete > getContent > getContent > getBar keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0812', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0812 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('gpYStKeTq7');
      subject.getContent('F39Oc1Z6TI');
      subject.getContent('ZKMKI');
      const step5 = subject.getBar('Uq96gDO3');
      logInfo(`step5 getBar("Uq96gDO3"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0812 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0813
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0813
     * @tc.desc      ComponentFactory call flow toArray > getParams > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0813', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0813 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('LISDV');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('9eokJW');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0813 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0814
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0814
     * @tc.desc      ComponentFactory call flow delete > getParams > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0814', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0814 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('z8T4K');
      subject.getParams('SkVafRDpC8U');
      subject.getContent('xhello world');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0814 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0815
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0815
     * @tc.desc      ComponentFactory call flow toArray > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0815', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0815 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('C4');
      logInfo(`step2 getBar("C4"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('eU6Lz');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0815 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0816
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0816
     * @tc.desc      ComponentFactory call flow getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0816', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0816 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('XDgKHeosiP');
      const step2 = subject.getBar('c');
      logInfo(`step2 getBar("c"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0816 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0817
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0817
     * @tc.desc      ComponentFactory call flow getParams > getContent > toArray > getContent > delete keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0817', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0817 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('MDzjvi6c');
      subject.getContent('RzPo4Flq7657');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('J4flKUQqwBH2');
      subject.delete('FTyU38');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0817 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0818
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0818
     * @tc.desc      ComponentFactory call flow toArray > delete > delete > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0818', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0818 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('vt7M08');
      subject.delete('ZDKcZO');
      subject.getParams(' A ');
      const step5 = subject.getBar('P7r5');
      logInfo(`step5 getBar("P7r5"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0818 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0819
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0819
     * @tc.desc      ComponentFactory call flow toArray > toArray > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0819', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0819 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('SWLsCaq76HZR');
      logInfo(`step3 getBar("SWLsCaq76HZR"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0819 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0820
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0820
     * @tc.desc      ComponentFactory call flow getContent > delete > getParams > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0820', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0820 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent(' Hello World ');
      subject.delete(' abc ');
      subject.getParams('1HZGi8Qa0');
      const step4 = subject.getBar('7cw');
      logInfo(`step4 getBar("7cw"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getBar('iKcNgHVHejEa');
      logInfo(`step5 getBar("iKcNgHVHejEa"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0820 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0821
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0821
     * @tc.desc      ComponentFactory call flow delete > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0821', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0821 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('AGmX');
      subject.getContent('123');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0821 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0822
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0822
     * @tc.desc      ComponentFactory call flow toArray > delete > delete > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0822', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0822 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('YeZvSmculB');
      subject.delete('2cJ');
      subject.delete('q5wUacf5Ddpq');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0822 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0823
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0823
     * @tc.desc      ComponentFactory call flow getContent > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0823', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0823 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('3ZPW5');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent(' Sample Title 123 ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0823 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0824
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0824
     * @tc.desc      ComponentFactory call flow getContent > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0824', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0824 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('KUCQL');
      subject.delete('pSPd');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0824 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0825
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0825
     * @tc.desc      ComponentFactory call flow getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0825', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0825 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('e4');
      logInfo(`step1 getBar("e4"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('2bFK3uf');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0825 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0826
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0826
     * @tc.desc      ComponentFactory call flow getContent > toArray > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0826', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0826 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('nq');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('jjBHMnIshV3');
      logInfo(`step3 getBar("jjBHMnIshV3"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0826 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0827
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0827
     * @tc.desc      ComponentFactory call flow delete > getContent > delete > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0827', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0827 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('earF3');
      subject.getContent('rtwMg6lz6JPm');
      subject.delete('bZ4l');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.delete('DDVCz5ydJ6G');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0827 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0828
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0828
     * @tc.desc      ComponentFactory call flow toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0828', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0828 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('PrQuLUQF');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0828 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0829
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0829
     * @tc.desc      ComponentFactory call flow getBar > getBar > getBar > delete > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0829', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0829 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('L');
      logInfo(`step1 getBar("L"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('BauR9pM8qz');
      logInfo(`step2 getBar("BauR9pM8qz"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('UZ1');
      logInfo(`step3 getBar("UZ1"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('9');
      subject.getContent('S');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0829 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0830
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0830
     * @tc.desc      ComponentFactory call flow toArray > getContent > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0830', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0830 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('FnyWHce');
      subject.delete('fTNSgriK74V');
      subject.getParams('123');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0830 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0831
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0831
     * @tc.desc      ComponentFactory call flow getContent > toArray > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0831', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0831 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('Ie8vBhT');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('gbZBiNl');
      const step4 = subject.getBar('1MYBqsx53n');
      logInfo(`step4 getBar("1MYBqsx53n"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0831 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0832
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0832
     * @tc.desc      ComponentFactory call flow delete > delete > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0832', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0832 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('UizjmYBE');
      subject.delete('Eb1lOOT');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('kNYWGAmPVRWP');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0832 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0833
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0833
     * @tc.desc      ComponentFactory call flow getParams > getParams > toArray > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0833', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0833 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('x ');
      subject.getParams('iqIQ');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('QNl5wwTDzcMM');
      const step5 = subject.getBar('ae0');
      logInfo(`step5 getBar("ae0"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0833 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0834
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0834
     * @tc.desc      ComponentFactory call flow delete > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0834', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0834 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('vv08DE');
      const step2 = subject.getBar('T');
      logInfo(`step2 getBar("T"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('XHj0');
      logInfo(`step3 getBar("XHj0"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0834 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0835
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0835
     * @tc.desc      ComponentFactory call flow getContent > delete > getParams > getParams > toArray keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0835', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0835 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('iUES6yl3kHWU');
      subject.delete('sm');
      subject.getParams('xa');
      subject.getParams('Hello');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0835 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0836
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0836
     * @tc.desc      ComponentFactory call flow toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0836', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0836 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams(' _1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0836 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0837
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0837
     * @tc.desc      ComponentFactory call flow toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0837', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0837 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('MTjLYu1O4y');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0837 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0838
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0838
     * @tc.desc      ComponentFactory call flow getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0838', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0838 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('4i');
      const step2 = subject.getBar('HxnhpHwZpVKv');
      logInfo(`step2 getBar("HxnhpHwZpVKv"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0838 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0839
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0839
     * @tc.desc      ComponentFactory call flow delete > toArray > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0839', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0839 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('VRHQckRveA6e');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0839 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0840
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0840
     * @tc.desc      ComponentFactory call flow getContent > toArray > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0840', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0840 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('2atXJqonx0');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('uNmx');
      subject.getParams('nsWnkQmcxN');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0840 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0841
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0841
     * @tc.desc      ComponentFactory call flow toArray > delete > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0841', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0841 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('gsD6x');
      subject.getContent(' Sample Title 123 ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0841 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0842
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0842
     * @tc.desc      ComponentFactory call flow getContent > getContent > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0842', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0842 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('ZI');
      subject.getContent('XsspxL');
      subject.getContent('c7lMng8ZM');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0842 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0843
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0843
     * @tc.desc      ComponentFactory call flow toArray > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0843', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0843 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('inIQz');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0843 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0844
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0844
     * @tc.desc      ComponentFactory call flow toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0844', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0844 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('6YBKgd');
      logInfo(`step2 getBar("6YBKgd"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0844 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0845
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0845
     * @tc.desc      ComponentFactory call flow toArray > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0845', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0845 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('iKcNgHVHejEa');
      logInfo(`step2 getBar("iKcNgHVHejEa"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0845 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0846
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0846
     * @tc.desc      ComponentFactory call flow getBar > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0846', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0846 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('mias4qIIlm');
      logInfo(`step1 getBar("mias4qIIlm"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0846 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0847
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0847
     * @tc.desc      ComponentFactory call flow toArray > getBar > getBar > delete > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0847', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0847 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('Uzh40JIxi9r5');
      logInfo(`step2 getBar("Uzh40JIxi9r5"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('yhkABd');
      logInfo(`step3 getBar("yhkABd"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('i');
      subject.getContent('7EkEKsTD');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0847 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0848
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0848
     * @tc.desc      ComponentFactory call flow delete > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0848', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0848 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete(' Hello World ');
      subject.getParams('aa');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0848 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0849
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0849
     * @tc.desc      ComponentFactory call flow getParams > getParams > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0849', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0849 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('E2Dk6zai5vj5');
      subject.getParams('hGpqi45M3yCU');
      subject.delete('9Yxb3LyW2g');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0849 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0850
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0850
     * @tc.desc      ComponentFactory call flow getBar > toArray > getParams > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0850', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0850 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('6YBKgd');
      logInfo(`step1 getBar("6YBKgd"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('dEkCFIvXd');
      subject.delete('');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0850 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0851
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0851
     * @tc.desc      ComponentFactory call flow delete > delete > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0851', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0851 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('z');
      subject.delete('Sample Title 123');
      const step3 = subject.getBar('t6XAkX');
      logInfo(`step3 getBar("t6XAkX"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0851 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0852
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0852
     * @tc.desc      ComponentFactory call flow toArray > getParams > getParams > getParams > getBar keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0852', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0852 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('1Po');
      subject.getParams('zLhiI');
      subject.getParams('tCv1p8');
      const step5 = subject.getBar('dsc6Ba0');
      logInfo(`step5 getBar("dsc6Ba0"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0852 end`);
    });
  });
}
