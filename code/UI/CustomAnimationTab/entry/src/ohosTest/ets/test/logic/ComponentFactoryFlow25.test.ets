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
export default function componentFactoryFlow25Test(): void {
  describe('ComponentFactoryFlow25Test', () => {
    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1726
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1726
     * @tc.desc      ComponentFactory call flow getParams > getContent > getContent > delete > getBar keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1726', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1726 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('p02yi');
      subject.getContent('lwaYIV8OC');
      subject.getContent('bVeasKn6');
      subject.delete('2ihOb0dE7ue');
      const step5 = subject.getBar('O805K7Y');
      logInfo(`step5 getBar("O805K7Y"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1726 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1727
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1727
     * @tc.desc      ComponentFactory call flow getBar > toArray > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1727', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1727 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('yzvnqAN');
      logInfo(`step1 getBar("yzvnqAN"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('iKcNgHVHejEa');
      logInfo(`step3 getBar("iKcNgHVHejEa"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('VXcOvDGrg7');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1727 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1728
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1728
     * @tc.desc      ComponentFactory call flow getParams > getContent > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1728', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1728 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('ZEqWn0MffB7');
      subject.getContent('C3bqpZ7GLYr');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('HZYhpUbfgQ2');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1728 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1729
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1729
     * @tc.desc      ComponentFactory call flow getContent > getBar > delete > getParams > getContent keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1729', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1729 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('F39Oc1Z6TI');
      const step2 = subject.getBar('rlMC8');
      logInfo(`step2 getBar("rlMC8"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('GP5aw8ge9U');
      subject.getParams('5XuEUUej4hE');
      subject.getContent('XsspxL');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1729 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1730
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1730
     * @tc.desc      ComponentFactory call flow delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1730', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1730 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('bZ4l');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1730 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1731
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1731
     * @tc.desc      ComponentFactory call flow delete > getBar > getParams > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1731', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1731 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('21Cr');
      const step2 = subject.getBar('s');
      logInfo(`step2 getBar("s"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('xa');
      subject.delete('jLQcxJVfj');
      const step5 = subject.getBar('7J8');
      logInfo(`step5 getBar("7J8"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1731 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1732
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1732
     * @tc.desc      ComponentFactory call flow getParams > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1732', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1732 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('cft2jduykq');
      subject.getParams('XDgKHeosiP');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1732 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1733
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1733
     * @tc.desc      ComponentFactory call flow getContent > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1733', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1733 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('tr9fihM1RvDV');
      subject.delete('\u4e2d\u6587\u4e2d\u6587');
      const step3 = subject.getBar('G');
      logInfo(`step3 getBar("G"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1733 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1734
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1734
     * @tc.desc      ComponentFactory call flow toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1734', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1734 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1734 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1735
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1735
     * @tc.desc      ComponentFactory call flow getBar > getParams > getBar > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1735', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1735 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Uq96gDO3');
      logInfo(`step1 getBar("Uq96gDO3"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('x\u4e2d\u6587');
      const step3 = subject.getBar('dqX9qYwm');
      logInfo(`step3 getBar("dqX9qYwm"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('ICl');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1735 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1736
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1736
     * @tc.desc      ComponentFactory call flow getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1736', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1736 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('gM0BsR6WaHlQ');
      const step2 = subject.getBar('XkrydQBO');
      logInfo(`step2 getBar("XkrydQBO"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1736 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1737
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1737
     * @tc.desc      ComponentFactory call flow toArray > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1737', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1737 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('   ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1737 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1738
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1738
     * @tc.desc      ComponentFactory call flow getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1738', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1738 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('x ');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1738 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1739
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1739
     * @tc.desc      ComponentFactory call flow toArray > getContent > getBar > delete > getContent keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1739', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1739 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('RMUD7OVx');
      const step3 = subject.getBar('P84ipO3HrA');
      logInfo(`step3 getBar("P84ipO3HrA"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('EMZcrnNG9m');
      subject.getContent('TLBDIj0F7Coe');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1739 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1740
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1740
     * @tc.desc      ComponentFactory call flow toArray > getParams > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1740', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1740 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('8');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1740 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1741
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1741
     * @tc.desc      ComponentFactory call flow toArray > getContent > delete > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1741', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1741 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('8Uzb2NI');
      subject.delete('hFp');
      subject.delete('jhT1oX');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1741 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1742
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1742
     * @tc.desc      ComponentFactory call flow getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1742', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1742 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('etSuf');
      logInfo(`step1 getBar("etSuf"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('97EUJo4w8J9k');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1742 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1743
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1743
     * @tc.desc      ComponentFactory call flow getContent > toArray > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1743', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1743 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('abcabc');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('XL1HgQagEU');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1743 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1744
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1744
     * @tc.desc      ComponentFactory call flow getContent > getContent > getParams > toArray > delete keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1744', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1744 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('2atXJqonx0');
      subject.getContent('bOd9mOl0Fwly');
      subject.getParams('123123');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.delete('go');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1744 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1745
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1745
     * @tc.desc      ComponentFactory call flow getContent > toArray > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1745', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1745 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('ZI');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete(' abc ');
      subject.getParams('gR1IfSc79');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1745 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1746
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1746
     * @tc.desc      ComponentFactory call flow getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1746', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1746 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('b0T');
      logInfo(`step1 getBar("b0T"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1746 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1747
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1747
     * @tc.desc      ComponentFactory call flow getBar > toArray > getBar > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1747', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1747 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('xoCXqWLigfEo');
      logInfo(`step1 getBar("xoCXqWLigfEo"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('d2e7M');
      logInfo(`step3 getBar("d2e7M"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('BA4U');
      logInfo(`step4 getBar("BA4U"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getBar('yzvnqAN');
      logInfo(`step5 getBar("yzvnqAN"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1747 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1748
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1748
     * @tc.desc      ComponentFactory call flow delete > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1748', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1748 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('U5ac1t');
      const step2 = subject.getBar('8MUd8zV');
      logInfo(`step2 getBar("8MUd8zV"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams(' Sample Title 123 ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1748 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1749
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1749
     * @tc.desc      ComponentFactory call flow getContent > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1749', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1749 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('KR');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1749 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1750
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1750
     * @tc.desc      ComponentFactory call flow delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1750', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1750 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('Hello World_1');
      const step2 = subject.getBar(' Hello World ');
      logInfo(`step2 getBar(" Hello World "): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1750 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1751
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1751
     * @tc.desc      ComponentFactory call flow toArray > delete > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1751', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1751 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('xabc');
      subject.delete('pSPd');
      const step4 = subject.getBar('xZ');
      logInfo(`step4 getBar("xZ"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1751 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1752
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1752
     * @tc.desc      ComponentFactory call flow toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1752', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1752 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('HelloHello');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1752 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1753
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1753
     * @tc.desc      ComponentFactory call flow toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1753', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1753 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent(' a ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1753 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1754
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1754
     * @tc.desc      ComponentFactory call flow getContent > getContent > getParams > getBar > getParams keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1754', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1754 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('NGH');
      subject.getContent('8LIv');
      subject.getParams('MedbmHHUIc');
      const step4 = subject.getBar('4emy0O7');
      logInfo(`step4 getBar("4emy0O7"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getParams('123_1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1754 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1755
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1755
     * @tc.desc      ComponentFactory call flow toArray > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1755', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1755 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('fTNSgriK74V');
      subject.delete('d4NLzEvY6gQk');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1755 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1756
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1756
     * @tc.desc      ComponentFactory call flow getParams > toArray > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1756', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1756 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('5C');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('Hello WorldHello World');
      subject.delete('AA');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1756 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1757
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1757
     * @tc.desc      ComponentFactory call flow toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1757', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1757 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1757 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1758
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1758
     * @tc.desc      ComponentFactory call flow toArray > delete > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1758', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1758 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('q5wUacf5Ddpq');
      subject.delete('pgM');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1758 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1759
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1759
     * @tc.desc      ComponentFactory call flow getBar > getParams > getParams > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1759', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1759 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('DSfb');
      logInfo(`step1 getBar("DSfb"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('5C');
      subject.getParams('WygLQEV');
      subject.delete('UDi285Ncj');
      const step5 = subject.getBar('Uq96gDO3');
      logInfo(`step5 getBar("Uq96gDO3"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1759 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1760
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1760
     * @tc.desc      ComponentFactory call flow getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1760', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1760 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('8RUUG');
      const step2 = subject.getBar('6');
      logInfo(`step2 getBar("6"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1760 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1761
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1761
     * @tc.desc      ComponentFactory call flow getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1761', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1761 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('thJK');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1761 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1762
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1762
     * @tc.desc      ComponentFactory call flow toArray > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1762', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1762 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('Hello');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1762 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1763
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1763
     * @tc.desc      ComponentFactory call flow getParams > getParams > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1763', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1763 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('LkeYFE');
      subject.getParams('Hy3dX9N');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getParams('8YGinqG');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1763 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1764
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1764
     * @tc.desc      ComponentFactory call flow toArray > delete > delete > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1764', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1764 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('2ihOb0dE7ue');
      subject.delete('uNmx');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.delete('4F9j7D60VEyy');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1764 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1765
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1765
     * @tc.desc      ComponentFactory call flow getBar > toArray > getContent > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1765', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1765 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('jFoCVxiA4Z');
      logInfo(`step1 getBar("jFoCVxiA4Z"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('VXcOvDGrg7');
      subject.delete('JMWbFJUA');
      const step5 = subject.getBar('IXj4nI0');
      logInfo(`step5 getBar("IXj4nI0"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1765 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1766
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1766
     * @tc.desc      ComponentFactory call flow getParams > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1766', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1766 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('9JNMtgePsoc');
      const step2 = subject.getBar('Pwt6zZsPyvP');
      logInfo(`step2 getBar("Pwt6zZsPyvP"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('Pj');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1766 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1767
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1767
     * @tc.desc      ComponentFactory call flow getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1767', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1767 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('mY5pW6J');
      const step2 = subject.getBar('zmnW');
      logInfo(`step2 getBar("zmnW"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1767 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1768
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1768
     * @tc.desc      ComponentFactory call flow getContent > getParams > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1768', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1768 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent(' _1');
      subject.getParams('HelloHello');
      subject.getContent('DK');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1768 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1769
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1769
     * @tc.desc      ComponentFactory call flow toArray > toArray > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1769', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1769 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('xtQyJrKiAEp');
      logInfo(`step3 getBar("xtQyJrKiAEp"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('BYHPHkdoCTWS');
      logInfo(`step4 getBar("BYHPHkdoCTWS"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1769 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1770
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1770
     * @tc.desc      ComponentFactory call flow getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1770', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1770 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Uw56XMZCO');
      logInfo(`step1 getBar("Uw56XMZCO"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('BgKI');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1770 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1771
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1771
     * @tc.desc      ComponentFactory call flow getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1771', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1771 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('45C0Rbxg');
      logInfo(`step1 getBar("45C0Rbxg"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1771 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1772
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1772
     * @tc.desc      ComponentFactory call flow getContent > getBar > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1772', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1772 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('VySbhZ2Tc');
      const step2 = subject.getBar('9l');
      logInfo(`step2 getBar("9l"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('WG4eeWlpGG');
      logInfo(`step4 getBar("WG4eeWlpGG"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1772 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1773
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1773
     * @tc.desc      ComponentFactory call flow toArray > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1773', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1773 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('qJVpmab5mq');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1773 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1774
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1774
     * @tc.desc      ComponentFactory call flow delete > getParams > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1774', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1774 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('dtxX86ijO8nY');
      subject.getParams('x1MxmKa5');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('xHello');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1774 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1775
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1775
     * @tc.desc      ComponentFactory call flow toArray > toArray > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1775', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1775 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('8IkTkQ6');
      const step4 = subject.getBar('MU');
      logInfo(`step4 getBar("MU"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1775 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1776
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1776
     * @tc.desc      ComponentFactory call flow getBar > getParams > delete > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1776', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1776 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('iKcNgHVHejEa');
      logInfo(`step1 getBar("iKcNgHVHejEa"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('z');
      subject.delete('sz4qZ6Y');
      const step4 = subject.getBar('YEaX');
      logInfo(`step4 getBar("YEaX"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getParams('0dQ76ka');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1776 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1777
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1777
     * @tc.desc      ComponentFactory call flow delete > getBar > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1777', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1777 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('mnsT');
      const step2 = subject.getBar('l');
      logInfo(`step2 getBar("l"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('aog');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1777 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1778
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1778
     * @tc.desc      ComponentFactory call flow toArray > getContent > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1778', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1778 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('vW8IZb2km');
      subject.getContent('Hello_1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1778 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1779
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1779
     * @tc.desc      ComponentFactory call flow toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1779', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1779 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1779 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1780
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1780
     * @tc.desc      ComponentFactory call flow getContent > delete > getContent > getBar > toArray keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1780', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1780 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('OxSA80TGVBGf');
      subject.delete('qGYTjRIW');
      subject.getContent('p57pLqj4iPEd');
      const step4 = subject.getBar('CDfrwdMnV');
      logInfo(`step4 getBar("CDfrwdMnV"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1780 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1781
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1781
     * @tc.desc      ComponentFactory call flow getContent > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1781', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1781 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('123123');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('OiBfZNAar');
      logInfo(`step3 getBar("OiBfZNAar"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1781 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1782
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1782
     * @tc.desc      ComponentFactory call flow delete > getParams > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1782', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1782 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('YjHW');
      subject.getParams('W');
      subject.delete('FgDmNta9Bvr');
      const step4 = subject.getBar(' Sample Title 123 ');
      logInfo(`step4 getBar(" Sample Title 123 "): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1782 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1783
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1783
     * @tc.desc      ComponentFactory call flow delete > delete > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1783', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1783 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('bq2U');
      subject.delete('x123');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('6y5vRO');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1783 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1784
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1784
     * @tc.desc      ComponentFactory call flow toArray > toArray > getContent > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1784', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1784 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('suJIqPBMsZ');
      subject.getContent('wL3pLxnOGXj');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1784 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1785
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1785
     * @tc.desc      ComponentFactory call flow getContent > toArray > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1785', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1785 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('rtwMg6lz6JPm');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('Ccw2Zqi2ZIS');
      const step4 = subject.getBar('O81E1pRljiV');
      logInfo(`step4 getBar("O81E1pRljiV"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1785 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1786
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1786
     * @tc.desc      ComponentFactory call flow getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1786', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1786 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('ao1xPPVqGz');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1786 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1787
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1787
     * @tc.desc      ComponentFactory call flow getBar > getContent > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1787', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1787 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('mI');
      logInfo(`step1 getBar("mI"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('p57pLqj4iPEd');
      subject.delete(' abc ');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1787 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1788
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1788
     * @tc.desc      ComponentFactory call flow getParams > getParams > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1788', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1788 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams(' \u4e2d\u6587 ');
      subject.getParams('YMVoJhtrZ');
      const step3 = subject.getBar('IXj4nI0');
      logInfo(`step3 getBar("IXj4nI0"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('Hello World_1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1788 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1789
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1789
     * @tc.desc      ComponentFactory call flow toArray > delete > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1789', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1789 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('FfIwdN');
      subject.delete('DFXlTccFsR');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1789 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1790
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1790
     * @tc.desc      ComponentFactory call flow delete > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1790', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1790 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('pgM');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('a');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1790 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1791
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1791
     * @tc.desc      ComponentFactory call flow toArray > getParams > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1791', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1791 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('aEZCm');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('rh2f6yPSgIA');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1791 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1792
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1792
     * @tc.desc      ComponentFactory call flow getBar > toArray > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1792', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1792 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('ck72LRrke');
      logInfo(`step1 getBar("ck72LRrke"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('58X36');
      subject.delete('abc_1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1792 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1793
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1793
     * @tc.desc      ComponentFactory call flow getContent > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1793', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1793 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('5s6JepBUhol');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1793 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1794
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1794
     * @tc.desc      ComponentFactory call flow getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1794', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1794 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('mGe');
      logInfo(`step1 getBar("mGe"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('xabc');
      logInfo(`step2 getBar("xabc"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1794 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1795
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1795
     * @tc.desc      ComponentFactory call flow getContent > getParams > getParams > getParams > getBar keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1795', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1795 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('F39Oc1Z6TI');
      subject.getParams('Sample Title 123Sample Title 123');
      subject.getParams('x1MxmKa5');
      subject.getParams('kt62Ld');
      const step5 = subject.getBar('BWZOfF6GDY');
      logInfo(`step5 getBar("BWZOfF6GDY"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1795 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1796
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1796
     * @tc.desc      ComponentFactory call flow getBar > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1796', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1796 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('zBPStDSd46');
      logInfo(`step1 getBar("zBPStDSd46"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1796 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1797
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1797
     * @tc.desc      ComponentFactory call flow toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1797', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1797 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('AQQtOTN');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1797 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1798
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1798
     * @tc.desc      ComponentFactory call flow getBar > getBar > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1798', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1798 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('WCEOCcw2E2');
      logInfo(`step1 getBar("WCEOCcw2E2"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('e7qxFXB9Kbb');
      logInfo(`step2 getBar("e7qxFXB9Kbb"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('yhkABd');
      logInfo(`step4 getBar("yhkABd"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1798 end`);
    });
  });
}
