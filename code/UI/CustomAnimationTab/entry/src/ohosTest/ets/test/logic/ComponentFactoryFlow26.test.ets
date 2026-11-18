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
export default function componentFactoryFlow26Test(): void {
  describe('ComponentFactoryFlow26Test', () => {
    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1799
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1799
     * @tc.desc      ComponentFactory call flow getBar > toArray > delete > delete > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1799', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1799 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('q2Y');
      logInfo(`step1 getBar("q2Y"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('LLMFSrqCpLY');
      subject.delete('\u4e2d\u6587_1');
      subject.getContent('eTf');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1799 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1800
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1800
     * @tc.desc      ComponentFactory call flow getBar > getContent > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1800 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('qLnzx');
      logInfo(`step1 getBar("qLnzx"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('0Tn8NJB7UG');
      subject.getParams('lcr8');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1800 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1801
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1801
     * @tc.desc      ComponentFactory call flow toArray > getParams > getParams > getParams > delete keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1801', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1801 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('g');
      subject.getParams('FTGcAQrqoI');
      subject.getParams('9p');
      subject.delete('L4');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1801 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1802
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1802
     * @tc.desc      ComponentFactory call flow toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1802', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1802 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('znM');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1802 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1803
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1803
     * @tc.desc      ComponentFactory call flow delete > getBar > getContent > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1803', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1803 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('MtkshFv9v');
      const step2 = subject.getBar('Uw56XMZCO');
      logInfo(`step2 getBar("Uw56XMZCO"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('   ');
      subject.getParams('XDgKHeosiP');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1803 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1804
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1804
     * @tc.desc      ComponentFactory call flow getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1804', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1804 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('O6CfKF');
      logInfo(`step1 getBar("O6CfKF"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('mkGSzn');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1804 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1805
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1805
     * @tc.desc      ComponentFactory call flow getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1805', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1805 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('8v8RQ');
      const step2 = subject.getBar('Hello WorldHello World');
      logInfo(`step2 getBar("Hello WorldHello World"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1805 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1806
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1806
     * @tc.desc      ComponentFactory call flow toArray > getContent > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1806', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1806 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('LOlUkMBnd');
      subject.delete('bq2U');
      const step4 = subject.getBar('ciB48JMXh');
      logInfo(`step4 getBar("ciB48JMXh"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1806 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1807
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1807
     * @tc.desc      ComponentFactory call flow getBar > getParams > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1807', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1807 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('BeFW5WczN');
      logInfo(`step1 getBar("BeFW5WczN"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('R');
      const step3 = subject.getBar('Sample Title 123');
      logInfo(`step3 getBar("Sample Title 123"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('LLU2HUi');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1807 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1808
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1808
     * @tc.desc      ComponentFactory call flow toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1808', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1808 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('ydWDS');
      logInfo(`step2 getBar("ydWDS"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1808 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1809
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1809
     * @tc.desc      ComponentFactory call flow delete > getBar > getBar > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1809', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1809 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('gbZBiNl');
      const step2 = subject.getBar('ZhT9z0B');
      logInfo(`step2 getBar("ZhT9z0B"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('IUi');
      logInfo(`step3 getBar("IUi"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('bOd9mOl0Fwly');
      const step5 = subject.getBar('123123');
      logInfo(`step5 getBar("123123"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1809 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1810
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1810
     * @tc.desc      ComponentFactory call flow getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1810', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1810 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Uq96gDO3');
      logInfo(`step1 getBar("Uq96gDO3"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent(' ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1810 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1811
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1811
     * @tc.desc      ComponentFactory call flow getContent > getParams > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1811', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1811 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('4XSs');
      subject.getParams('H');
      subject.getParams('z');
      const step4 = subject.getBar('Hello WorldHello World');
      logInfo(`step4 getBar("Hello WorldHello World"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1811 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1812
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1812
     * @tc.desc      ComponentFactory call flow delete > getParams > getContent > getBar > toArray keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1812', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1812 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('lV');
      subject.getParams('\u4e2d\u6587\u4e2d\u6587');
      subject.getContent('0pudv5fpUF');
      const step4 = subject.getBar('AV913N');
      logInfo(`step4 getBar("AV913N"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1812 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1813
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1813
     * @tc.desc      ComponentFactory call flow toArray > getParams > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1813', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1813 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('f1');
      subject.delete('3gUvtNLzuSKO');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1813 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1814
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1814
     * @tc.desc      ComponentFactory call flow getContent > getParams > getBar > toArray > getBar keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1814', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1814 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('TFwsjyaX1xUR');
      subject.getParams('h6o');
      const step3 = subject.getBar('dBblCxE4');
      logInfo(`step3 getBar("dBblCxE4"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5 = subject.getBar('IkSzXDcXT');
      logInfo(`step5 getBar("IkSzXDcXT"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1814 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1815
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1815
     * @tc.desc      ComponentFactory call flow getParams > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1815', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1815 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams(' abc ');
      subject.getContent('HIs3Zc');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1815 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1816
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1816
     * @tc.desc      ComponentFactory call flow getContent > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1816', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1816 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent(' Sample Title 123 ');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('J6uwV');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1816 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1817
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1817
     * @tc.desc      ComponentFactory call flow getParams > toArray > getContent > delete > toArray keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1817', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1817 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('qXFp');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('gCMaP7');
      subject.delete('b');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1817 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1818
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1818
     * @tc.desc      ComponentFactory call flow delete > getParams > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1818', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1818 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('8j');
      subject.getParams('4UYNOjK');
      const step3 = subject.getBar('2OUPICNTu');
      logInfo(`step3 getBar("2OUPICNTu"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('4dnloBNO2xf');
      logInfo(`step4 getBar("4dnloBNO2xf"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1818 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1819
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1819
     * @tc.desc      ComponentFactory call flow getContent > getParams > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1819', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1819 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('ao1xPPVqGz');
      subject.getParams('4UYNOjK');
      const step3 = subject.getBar('b');
      logInfo(`step3 getBar("b"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete(' A ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1819 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1820
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1820
     * @tc.desc      ComponentFactory call flow getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1820', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1820 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('xa');
      const step2 = subject.getBar('jlxGvRARmD5f');
      logInfo(`step2 getBar("jlxGvRARmD5f"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1820 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1821
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1821
     * @tc.desc      ComponentFactory call flow getParams > getBar > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1821', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1821 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('hello world_1');
      const step2 = subject.getBar('\u4e2d\u6587_1');
      logInfo(`step2 getBar("??_1"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('  ');
      subject.getParams('fxsZv');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1821 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1822
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1822
     * @tc.desc      ComponentFactory call flow toArray > delete > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1822', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1822 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete(' hello world ');
      subject.delete('   ');
      const step4 = subject.getBar('4dnloBNO2xf');
      logInfo(`step4 getBar("4dnloBNO2xf"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1822 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1823
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1823
     * @tc.desc      ComponentFactory call flow toArray > getContent > delete > getContent > toArray keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1823', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1823 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('xA');
      subject.delete('tCjWGQQt8fTo');
      subject.getContent('ZI');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1823 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1824
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1824
     * @tc.desc      ComponentFactory call flow delete > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1824', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1824 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('NnHshymU');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('a_1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1824 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1825
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1825
     * @tc.desc      ComponentFactory call flow getParams > delete > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1825', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1825 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('8v8RQ');
      subject.delete('21Cr');
      const step3 = subject.getBar(' a ');
      logInfo(`step3 getBar(" a "): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('4emy0O7');
      logInfo(`step4 getBar("4emy0O7"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1825 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1826
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1826
     * @tc.desc      ComponentFactory call flow getContent > getContent > delete > getBar > delete keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1826', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1826 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('AA');
      subject.getContent('eJuIlW3Qr');
      subject.delete('Ccw2Zqi2ZIS');
      const step4 = subject.getBar('A_1');
      logInfo(`step4 getBar("A_1"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.delete('bCFxYHlz');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1826 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1827
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1827
     * @tc.desc      ComponentFactory call flow toArray > delete > getParams > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1827', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1827 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('fsnzJf2Zu');
      subject.getParams('z');
      subject.delete('RAcfl');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1827 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1828
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1828
     * @tc.desc      ComponentFactory call flow getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1828', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1828 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Hello World_1');
      logInfo(`step1 getBar("Hello World_1"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1828 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1829
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1829
     * @tc.desc      ComponentFactory call flow delete > toArray > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1829', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1829 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('1CsMqqN');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('UDi285Ncj');
      const step4 = subject.getBar('DM9T23Gtl2');
      logInfo(`step4 getBar("DM9T23Gtl2"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1829 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1830
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1830
     * @tc.desc      ComponentFactory call flow getBar > getParams > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1830', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1830 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('w7smXl');
      logInfo(`step1 getBar("w7smXl"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('123');
      subject.delete('Eb1lOOT');
      subject.getParams('AXWsFqFpij');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1830 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1831
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1831
     * @tc.desc      ComponentFactory call flow delete > getBar > getContent > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1831', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1831 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('pAISptGN');
      const step2 = subject.getBar('28cZ2bB4z5g');
      logInfo(`step2 getBar("28cZ2bB4z5g"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('QBFQTu');
      subject.delete('6DHUOhqDg8');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1831 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1832
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1832
     * @tc.desc      ComponentFactory call flow delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1832', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1832 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('rU');
      const step2 = subject.getBar('qfh7xvfS5B');
      logInfo(`step2 getBar("qfh7xvfS5B"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1832 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1833
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1833
     * @tc.desc      ComponentFactory call flow getBar > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1833', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1833 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('MU');
      logInfo(`step1 getBar("MU"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('VkwV');
      const step3 = subject.getBar('o7B5g');
      logInfo(`step3 getBar("o7B5g"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1833 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1834
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1834
     * @tc.desc      ComponentFactory call flow toArray > getContent > toArray > getBar > getContent keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1834', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1834 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('bHt');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('uLvz1');
      logInfo(`step4 getBar("uLvz1"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getContent(' ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1834 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1835
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1835
     * @tc.desc      ComponentFactory call flow toArray > getParams > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1835', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1835 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('FTGcAQrqoI');
      const step3 = subject.getBar('3Pe');
      logInfo(`step3 getBar("3Pe"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('A');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1835 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1836
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1836
     * @tc.desc      ComponentFactory call flow toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1836', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1836 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('Ej');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1836 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1837
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1837
     * @tc.desc      ComponentFactory call flow getBar > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1837', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1837 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('2');
      logInfo(`step1 getBar("2"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('upjzRMbiEoc');
      logInfo(`step2 getBar("upjzRMbiEoc"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('iHw1P');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1837 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1838
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1838
     * @tc.desc      ComponentFactory call flow toArray > getBar > getContent > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1838', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1838 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('x ');
      logInfo(`step2 getBar("x "): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('tj6R6zEL');
      const step4 = subject.getBar('rRj8x6YM6');
      logInfo(`step4 getBar("rRj8x6YM6"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.delete('vt7M08');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1838 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1839
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1839
     * @tc.desc      ComponentFactory call flow getBar > getParams > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1839', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1839 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Pwt6zZsPyvP');
      logInfo(`step1 getBar("Pwt6zZsPyvP"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('Hello_1');
      subject.getParams('R');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1839 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1840
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1840
     * @tc.desc      ComponentFactory call flow delete > toArray > toArray > getContent > getContent keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1840', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1840 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('hello world');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('BpzH');
      subject.getContent('OxSA80TGVBGf');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1840 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1841
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1841
     * @tc.desc      ComponentFactory call flow delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1841', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1841 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('go');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1841 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1842
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1842
     * @tc.desc      ComponentFactory call flow getParams > toArray > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1842', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1842 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('AY2h8Amd3uN');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('iHw1P');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1842 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1843
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1843
     * @tc.desc      ComponentFactory call flow getParams > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1843', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1843 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('eddPIBKPwf');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('c');
      logInfo(`step3 getBar("c"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1843 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1844
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1844
     * @tc.desc      ComponentFactory call flow getParams > getParams > getContent > getBar > getParams keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1844', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1844 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('bKAKSU');
      subject.getParams('7ziCRIc');
      subject.getContent('8kAA38');
      const step4 = subject.getBar('yMeu11snR');
      logInfo(`step4 getBar("yMeu11snR"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getParams('dSl33ylyGdF');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1844 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1845
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1845
     * @tc.desc      ComponentFactory call flow getParams > getContent > getContent > toArray > getBar keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1845', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1845 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('tye5mQmEDCCM');
      subject.getContent('xxD');
      subject.getContent('bHt');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5 = subject.getBar('WRd');
      logInfo(`step5 getBar("WRd"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1845 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1846
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1846
     * @tc.desc      ComponentFactory call flow getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1846', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1846 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('8RUUG');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1846 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1847
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1847
     * @tc.desc      ComponentFactory call flow getContent > toArray > getContent > toArray > toArray keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1847', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1847 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('8kAA38');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('QErN1rSThJLd');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1847 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1848
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1848
     * @tc.desc      ComponentFactory call flow toArray > delete > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1848', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1848 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('MTjLYu1O4y');
      subject.getParams('x ');
      const step4 = subject.getBar('mias4qIIlm');
      logInfo(`step4 getBar("mias4qIIlm"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1848 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1849
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1849
     * @tc.desc      ComponentFactory call flow toArray > getContent > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1849', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1849 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('mm6Fv');
      subject.delete('6DHUOhqDg8');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1849 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1850
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1850
     * @tc.desc      ComponentFactory call flow getContent > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1850', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1850 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('wMr');
      const step2 = subject.getBar('As0kvJU');
      logInfo(`step2 getBar("As0kvJU"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('1CsMqqN');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1850 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1851
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1851
     * @tc.desc      ComponentFactory call flow toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1851', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1851 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('WTUedcyGAZ1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1851 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1852
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1852
     * @tc.desc      ComponentFactory call flow delete > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1852', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1852 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('IaCwhx5MR');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('9wuRQd0r');
      logInfo(`step3 getBar("9wuRQd0r"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1852 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1853
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1853
     * @tc.desc      ComponentFactory call flow getBar > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1853', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1853 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('A6gejCa00mXb');
      logInfo(`step1 getBar("A6gejCa00mXb"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('GcdSixwo');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1853 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1854
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1854
     * @tc.desc      ComponentFactory call flow getBar > getContent > getContent > delete > delete keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1854', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1854 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('vRiQstPt7');
      logInfo(`step1 getBar("vRiQstPt7"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('o7ehL');
      subject.getContent('o');
      subject.delete('SsohOcYTVMY');
      subject.delete('a');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1854 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1855
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1855
     * @tc.desc      ComponentFactory call flow delete > getBar > getParams > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1855', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1855 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('1TJ2rXdPD');
      const step2 = subject.getBar('FYXMiUxa');
      logInfo(`step2 getBar("FYXMiUxa"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('5XuEUUej4hE');
      subject.getContent('A');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1855 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1856
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1856
     * @tc.desc      ComponentFactory call flow delete > getParams > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1856', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1856 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('97EUJo4w8J9k');
      subject.getParams('Y');
      subject.getParams('qXFp');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1856 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1857
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1857
     * @tc.desc      ComponentFactory call flow getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1857', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1857 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('7wHIP1');
      const step2 = subject.getBar('vRiQstPt7');
      logInfo(`step2 getBar("vRiQstPt7"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1857 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1858
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1858
     * @tc.desc      ComponentFactory call flow getParams > getBar > getContent > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1858', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1858 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('MedbmHHUIc');
      const step2 = subject.getBar('miyb');
      logInfo(`step2 getBar("miyb"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('  ');
      subject.getParams('XVP');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1858 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1859
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1859
     * @tc.desc      ComponentFactory call flow toArray > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1859', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1859 begin`);
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
      logInfo(`${BUNDLE}ComponentFactoryFlow_1859 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1860
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1860
     * @tc.desc      ComponentFactory call flow toArray > getParams > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1860', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1860 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('x123');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1860 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1861
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1861
     * @tc.desc      ComponentFactory call flow delete > getBar > delete > delete > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1861', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1861 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('HZDvRFP9g');
      const step2 = subject.getBar('KKqGmBc');
      logInfo(`step2 getBar("KKqGmBc"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('i7j2g8MMfd');
      subject.delete('TUiZ');
      subject.getContent('o');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1861 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1862
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1862
     * @tc.desc      ComponentFactory call flow getParams > getBar > delete > delete > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1862', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1862 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('123');
      const step2 = subject.getBar('o3');
      logInfo(`step2 getBar("o3"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('ND4pgmV2');
      subject.delete('T2Bl');
      subject.getContent('7C');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1862 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1863
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1863
     * @tc.desc      ComponentFactory call flow getParams > delete > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1863', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1863 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('Vw');
      subject.delete('ea4GvMxX');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('Smhe70');
      logInfo(`step4 getBar("Smhe70"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1863 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1864
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1864
     * @tc.desc      ComponentFactory call flow toArray > getParams > getContent > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1864', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1864 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('2d');
      subject.getContent('ghu5YI9wHEI');
      subject.delete('kGkIj8843');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1864 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1865
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1865
     * @tc.desc      ComponentFactory call flow getBar > delete > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1865', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1865 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('4emy0O7');
      logInfo(`step1 getBar("4emy0O7"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('DA2UJZ0');
      const step3 = subject.getBar('Sample Title 123');
      logInfo(`step3 getBar("Sample Title 123"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('pSPd');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1865 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1866
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1866
     * @tc.desc      ComponentFactory call flow toArray > getBar > getContent > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1866', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1866 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('ydWDS');
      logInfo(`step2 getBar("ydWDS"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('ghu5YI9wHEI');
      subject.delete('Sample Title 123_1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1866 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1867
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1867
     * @tc.desc      ComponentFactory call flow getContent > getParams > delete > getBar > getParams keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1867', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1867 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('mnaz9p');
      subject.getParams('Vw');
      subject.delete('oazDxlK9Y');
      const step4 = subject.getBar('xtQyJrKiAEp');
      logInfo(`step4 getBar("xtQyJrKiAEp"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getParams('dSl33ylyGdF');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1867 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1868
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1868
     * @tc.desc      ComponentFactory call flow getParams > delete > getContent > toArray > getContent keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1868', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1868 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('G76');
      subject.delete('SsohOcYTVMY');
      subject.getContent('  ');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getContent('mm6Fv');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1868 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1869
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1869
     * @tc.desc      ComponentFactory call flow getBar > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1869', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1869 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('45C0Rbxg');
      logInfo(`step1 getBar("45C0Rbxg"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('O805K7Y');
      logInfo(`step2 getBar("O805K7Y"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('5dhNrgKRA');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1869 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1870
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1870
     * @tc.desc      ComponentFactory call flow toArray > getParams > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1870', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1870 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('xHello World');
      subject.getContent('bozXXgG72');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1870 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1871
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1871
     * @tc.desc      ComponentFactory call flow toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1871', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1871 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('HikHof1f');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1871 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1872
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1872
     * @tc.desc      ComponentFactory call flow getContent > getBar > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1872', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1872 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('abc_1');
      const step2 = subject.getBar('T');
      logInfo(`step2 getBar("T"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('TLzHYlbpE2');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1872 end`);
    });
  });
}
