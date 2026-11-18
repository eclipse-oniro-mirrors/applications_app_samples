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
export default function componentFactoryFlow23Test(): void {
  describe('ComponentFactoryFlow23Test', () => {
    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1581
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1581
     * @tc.desc      ComponentFactory call flow getContent > toArray > getContent > getContent > getContent keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1581', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1581 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('9jAL');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('rMiexP');
      subject.getContent('lwaYIV8OC');
      subject.getContent('1GgCZRUHp');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1581 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1582
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1582
     * @tc.desc      ComponentFactory call flow getParams > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1582', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1582 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('xabc');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('123_1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1582 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1583
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1583
     * @tc.desc      ComponentFactory call flow getContent > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1583', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1583 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent(' ');
      subject.getContent('fT');
      const step3 = subject.getBar('Xard8Kss3VC');
      logInfo(`step3 getBar("Xard8Kss3VC"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1583 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1584
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1584
     * @tc.desc      ComponentFactory call flow toArray > getParams > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1584', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1584 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('7r');
      subject.getContent('J4flKUQqwBH2');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1584 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1585
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1585
     * @tc.desc      ComponentFactory call flow toArray > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1585', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1585 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('VbhNLb5mKXOX');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1585 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1586
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1586
     * @tc.desc      ComponentFactory call flow toArray > getContent > getContent > toArray > getBar keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1586', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1586 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('gM0BsR6WaHlQ');
      subject.getContent('gM0BsR6WaHlQ');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5 = subject.getBar('5Qvn');
      logInfo(`step5 getBar("5Qvn"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1586 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1587
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1587
     * @tc.desc      ComponentFactory call flow getBar > getBar > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1587', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1587 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('qMrW');
      logInfo(`step1 getBar("qMrW"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('xoCXqWLigfEo');
      logInfo(`step2 getBar("xoCXqWLigfEo"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('d2e7M');
      logInfo(`step3 getBar("d2e7M"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('kaeCM0');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1587 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1588
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1588
     * @tc.desc      ComponentFactory call flow toArray > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1588', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1588 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('rU');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1588 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1589
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1589
     * @tc.desc      ComponentFactory call flow getBar > getParams > toArray > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1589', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1589 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('L7LmJ9G');
      logInfo(`step1 getBar("L7LmJ9G"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('WygLQEV');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5 = subject.getBar('hHx1r');
      logInfo(`step5 getBar("hHx1r"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1589 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1590
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1590
     * @tc.desc      ComponentFactory call flow getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1590', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1590 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('7r');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1590 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1591
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1591
     * @tc.desc      ComponentFactory call flow toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1591', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1591 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete(' Hello ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1591 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1592
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1592
     * @tc.desc      ComponentFactory call flow getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1592', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1592 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('BauR9pM8qz');
      logInfo(`step1 getBar("BauR9pM8qz"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('CyPe');
      logInfo(`step2 getBar("CyPe"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1592 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1593
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1593
     * @tc.desc      ComponentFactory call flow getContent > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1593', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1593 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('9jAL');
      const step2 = subject.getBar('5f');
      logInfo(`step2 getBar("5f"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1593 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1594
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1594
     * @tc.desc      ComponentFactory call flow toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1594', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1594 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('g9');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1594 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1595
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1595
     * @tc.desc      ComponentFactory call flow toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1595', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1595 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1595 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1596
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1596
     * @tc.desc      ComponentFactory call flow delete > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1596', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1596 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('fy');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('eU6Lz');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1596 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1597
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1597
     * @tc.desc      ComponentFactory call flow getContent > getContent > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1597', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1597 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent(' ');
      subject.getContent('wMr');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('AA');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1597 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1598
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1598
     * @tc.desc      ComponentFactory call flow delete > toArray > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1598', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1598 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('DbCp');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('T');
      logInfo(`step3 getBar("T"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('iqIQ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1598 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1599
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1599
     * @tc.desc      ComponentFactory call flow getBar > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1599', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1599 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Smhe70');
      logInfo(`step1 getBar("Smhe70"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('mnsT');
      subject.getParams('m8HTwLLgOyAe');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1599 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1600
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1600
     * @tc.desc      ComponentFactory call flow getContent > getContent > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1600 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('KBhrxv');
      subject.getContent(' 123 ');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getParams('Bhlaau3');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1600 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1601
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1601
     * @tc.desc      ComponentFactory call flow toArray > delete > delete > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1601', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1601 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete(' 123 ');
      subject.delete('kaeCM0');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getParams('1Po');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1601 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1602
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1602
     * @tc.desc      ComponentFactory call flow toArray > delete > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1602', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1602 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('aJ7v0hYfWUW8');
      subject.getContent('FnyWHce');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1602 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1603
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1603
     * @tc.desc      ComponentFactory call flow delete > getContent > getContent > getBar > getBar keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1603', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1603 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('6emR6k');
      subject.getContent('Q4ZKk');
      subject.getContent('sPR');
      const step4 = subject.getBar('n4BBP');
      logInfo(`step4 getBar("n4BBP"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getBar('P7r5');
      logInfo(`step5 getBar("P7r5"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1603 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1604
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1604
     * @tc.desc      ComponentFactory call flow toArray > getBar > delete > getParams > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1604', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1604 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('xZ');
      logInfo(`step2 getBar("xZ"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('77jE');
      subject.getParams('8');
      subject.getParams('Y');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1604 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1605
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1605
     * @tc.desc      ComponentFactory call flow toArray > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1605', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1605 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('YEaX');
      logInfo(`step2 getBar("YEaX"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('LOlUkMBnd');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1605 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1606
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1606
     * @tc.desc      ComponentFactory call flow delete > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1606', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1606 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('oiIClbtP6');
      const step2 = subject.getBar('n8oyYK');
      logInfo(`step2 getBar("n8oyYK"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('AF7Fx9LP');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1606 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1607
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1607
     * @tc.desc      ComponentFactory call flow getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1607', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1607 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('jFoCVxiA4Z');
      logInfo(`step1 getBar("jFoCVxiA4Z"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('rU');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1607 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1608
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1608
     * @tc.desc      ComponentFactory call flow getBar > getBar > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1608', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1608 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('WF2dJw');
      logInfo(`step1 getBar("WF2dJw"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('OvsjRINx');
      logInfo(`step2 getBar("OvsjRINx"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('J4flKUQqwBH2');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1608 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1609
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1609
     * @tc.desc      ComponentFactory call flow getContent > getBar > toArray > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1609', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1609 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('X64CfWVVVH');
      const step2 = subject.getBar('ZrUU4j1Q62EK');
      logInfo(`step2 getBar("ZrUU4j1Q62EK"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.delete('Uxp');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1609 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1610
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1610
     * @tc.desc      ComponentFactory call flow toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1610', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1610 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('YCf7RPBdTuW');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1610 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1611
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1611
     * @tc.desc      ComponentFactory call flow delete > getParams > getContent > getBar > getContent keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1611', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1611 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('Sample Title 123');
      subject.getParams('p02yi');
      subject.getContent('ZOfGU3m5fzix');
      const step4 = subject.getBar('PIGR');
      logInfo(`step4 getBar("PIGR"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getContent('XKKUPI7txYk');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1611 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1612
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1612
     * @tc.desc      ComponentFactory call flow toArray > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1612', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1612 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('L73EheRDgq');
      const step3 = subject.getBar(' a ');
      logInfo(`step3 getBar(" a "): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1612 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1613
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1613
     * @tc.desc      ComponentFactory call flow delete > getBar > getContent > getContent > getParams keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1613', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1613 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('BaRzkvGihLV');
      const step2 = subject.getBar('OiBfZNAar');
      logInfo(`step2 getBar("OiBfZNAar"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('yf');
      subject.getContent('Hello');
      subject.getParams('XVP');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1613 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1614
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1614
     * @tc.desc      ComponentFactory call flow getBar > getParams > getBar > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1614', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1614 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('a');
      logInfo(`step1 getBar("a"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('H7QASzBFrfnn');
      const step3 = subject.getBar(' \u4e2d\u6587 ');
      logInfo(`step3 getBar(" ?? "): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('OJQrZwvC98');
      subject.getParams('Ld');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1614 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1615
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1615
     * @tc.desc      ComponentFactory call flow toArray > getContent > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1615', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1615 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('C3bqpZ7GLYr');
      subject.delete('gbZBiNl');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1615 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1616
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1616
     * @tc.desc      ComponentFactory call flow delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1616', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1616 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('CLM');
      const step2 = subject.getBar('cM5bxlXCGHnR');
      logInfo(`step2 getBar("cM5bxlXCGHnR"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1616 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1617
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1617
     * @tc.desc      ComponentFactory call flow getBar > getContent > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1617', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1617 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('hello worldhello world');
      logInfo(`step1 getBar("hello worldhello world"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('VXcOvDGrg7');
      subject.delete('58X36');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1617 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1618
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1618
     * @tc.desc      ComponentFactory call flow getBar > getContent > getParams > delete > getParams keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1618', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1618 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar(' abc ');
      logInfo(`step1 getBar(" abc "): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('YYQlkKt5AN');
      subject.getParams('Hy3dX9N');
      subject.delete('aNv6D');
      subject.getParams('abcabc');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1618 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1619
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1619
     * @tc.desc      ComponentFactory call flow getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1619', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1619 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('MOWr');
      logInfo(`step1 getBar("MOWr"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1619 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1620
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1620
     * @tc.desc      ComponentFactory call flow getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1620', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1620 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('myeVugAZM');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1620 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1621
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1621
     * @tc.desc      ComponentFactory call flow delete > getContent > getParams > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1621', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1621 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('FEDAmRPXge');
      subject.getContent('krKBqDAeu');
      subject.getParams('H7QASzBFrfnn');
      subject.delete('MTjLYu1O4y');
      const step5 = subject.getBar('p9vA3Qd');
      logInfo(`step5 getBar("p9vA3Qd"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1621 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1622
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1622
     * @tc.desc      ComponentFactory call flow getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1622', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1622 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('bsuWtl');
      logInfo(`step1 getBar("bsuWtl"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('xNP');
      logInfo(`step2 getBar("xNP"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1622 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1623
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1623
     * @tc.desc      ComponentFactory call flow getBar > getBar > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1623', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1623 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('xMtWdQu6');
      logInfo(`step1 getBar("xMtWdQu6"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('v');
      logInfo(`step2 getBar("v"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('Uq96gDO3');
      logInfo(`step3 getBar("Uq96gDO3"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('ICl');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1623 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1624
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1624
     * @tc.desc      ComponentFactory call flow toArray > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1624', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1624 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('qS');
      const step3 = subject.getBar('sXbp2Pkw3ht7');
      logInfo(`step3 getBar("sXbp2Pkw3ht7"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1624 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1625
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1625
     * @tc.desc      ComponentFactory call flow delete > toArray > getParams > delete > getContent keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1625', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1625 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('oiIClbtP6');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('Sample Title 123_1');
      subject.delete('ofTfIEGv');
      subject.getContent('ZjpMfS');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1625 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1626
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1626
     * @tc.desc      ComponentFactory call flow toArray > toArray > getContent > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1626', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1626 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('wMr');
      subject.delete('GMuQcDUSD0D');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1626 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1627
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1627
     * @tc.desc      ComponentFactory call flow delete > getParams > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1627', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1627 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('04EQ');
      subject.getParams('LvcwiewBc');
      subject.getContent('1AlWfu7w');
      const step4 = subject.getBar('FYQfAafcAT');
      logInfo(`step4 getBar("FYQfAafcAT"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1627 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1628
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1628
     * @tc.desc      ComponentFactory call flow toArray > getParams > getContent > getParams > getParams keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1628', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1628 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('4UYNOjK');
      subject.getContent('KFP01CXhPy');
      subject.getParams('abcabc');
      subject.getParams('7xyqznYXB');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1628 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1629
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1629
     * @tc.desc      ComponentFactory call flow delete > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1629', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1629 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('futic8JODso');
      subject.getParams('BPyU9qL');
      const step3 = subject.getBar('A_1');
      logInfo(`step3 getBar("A_1"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1629 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1630
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1630
     * @tc.desc      ComponentFactory call flow getBar > getParams > getBar > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1630', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1630 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('abc');
      logInfo(`step1 getBar("abc"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('BPyU9qL');
      const step3 = subject.getBar('cM5bxlXCGHnR');
      logInfo(`step3 getBar("cM5bxlXCGHnR"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.delete('3gUvtNLzuSKO');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1630 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1631
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1631
     * @tc.desc      ComponentFactory call flow getContent > toArray > getParams > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1631', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1631 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('YjOjGONAA');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('65H');
      subject.getParams('1HZGi8Qa0');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1631 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1632
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1632
     * @tc.desc      ComponentFactory call flow getBar > getParams > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1632', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1632 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('vRiQstPt7');
      logInfo(`step1 getBar("vRiQstPt7"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('SkVafRDpC8U');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('123123');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1632 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1633
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1633
     * @tc.desc      ComponentFactory call flow getBar > toArray > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1633', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1633 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('YM5A7JRomJP1');
      logInfo(`step1 getBar("YM5A7JRomJP1"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('kbL1nDRH');
      logInfo(`step3 getBar("kbL1nDRH"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('xa');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1633 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1634
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1634
     * @tc.desc      ComponentFactory call flow toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1634', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1634 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1634 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1635
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1635
     * @tc.desc      ComponentFactory call flow getBar > toArray > delete > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1635', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1635 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Ak4');
      logInfo(`step1 getBar("Ak4"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('DDVCz5ydJ6G');
      const step4 = subject.getBar('P');
      logInfo(`step4 getBar("P"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getParams('xSample Title 123');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1635 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1636
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1636
     * @tc.desc      ComponentFactory call flow toArray > getParams > getContent > getParams > getParams keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1636', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1636 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('hGpqi45M3yCU');
      subject.getContent('0wQcs');
      subject.getParams('MMdJ8dfisUy5');
      subject.getParams('Hello_1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1636 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1637
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1637
     * @tc.desc      ComponentFactory call flow delete > toArray > toArray > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1637', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1637 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('rU');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('NUoPD1VLVZWo');
      subject.getParams('4Kn');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1637 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1638
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1638
     * @tc.desc      ComponentFactory call flow toArray > getParams > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1638', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1638 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('8YGinqG');
      const step3 = subject.getBar('mb');
      logInfo(`step3 getBar("mb"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('Hello WorldHello World');
      logInfo(`step4 getBar("Hello WorldHello World"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1638 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1639
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1639
     * @tc.desc      ComponentFactory call flow getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1639', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1639 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('mNtInRNHG');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1639 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1640
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1640
     * @tc.desc      ComponentFactory call flow getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1640', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1640 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('YEaX');
      logInfo(`step1 getBar("YEaX"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('ZjpMfS');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1640 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1641
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1641
     * @tc.desc      ComponentFactory call flow toArray > toArray > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1641', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1641 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('xHello World');
      subject.getParams('g4I3eAi8Zp4f');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1641 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1642
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1642
     * @tc.desc      ComponentFactory call flow toArray > getParams > getParams > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1642', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1642 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('Rx79u5I');
      subject.getParams('7HHi');
      subject.getParams('v7wMsz894');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1642 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1643
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1643
     * @tc.desc      ComponentFactory call flow toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1643', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1643 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1643 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1644
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1644
     * @tc.desc      ComponentFactory call flow delete > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1644', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1644 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('MTjLYu1O4y');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent(' Hello World ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1644 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1645
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1645
     * @tc.desc      ComponentFactory call flow getBar > getParams > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1645', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1645 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('h3tUUCmMN');
      logInfo(`step1 getBar("h3tUUCmMN"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('wvfa');
      subject.delete('8IkTkQ6');
      subject.getParams('V');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1645 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1646
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1646
     * @tc.desc      ComponentFactory call flow delete > toArray > getBar > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1646', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1646 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('Lu');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('Z96HHRGPJ');
      logInfo(`step3 getBar("Z96HHRGPJ"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('FdLnD6');
      logInfo(`step4 getBar("FdLnD6"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getContent(' hello world ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1646 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1647
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1647
     * @tc.desc      ComponentFactory call flow delete > getBar > getContent > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1647', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1647 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('U32wSwCuAI');
      const step2 = subject.getBar('0l');
      logInfo(`step2 getBar("0l"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('HIs3Zc');
      subject.delete('g9');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1647 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1648
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1648
     * @tc.desc      ComponentFactory call flow toArray > toArray > toArray > getContent > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1648', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1648 begin`);
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
      subject.getContent('r6');
      subject.delete('6y5vRO');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1648 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1649
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1649
     * @tc.desc      ComponentFactory call flow toArray > getParams > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1649', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1649 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('PqTAfLWDDl9');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1649 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1650
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1650
     * @tc.desc      ComponentFactory call flow toArray > getContent > getParams > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1650', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1650 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('aa');
      subject.getParams('xA');
      subject.getParams('R');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1650 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1651
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1651
     * @tc.desc      ComponentFactory call flow getContent > getParams > getParams > toArray > getParams keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1651', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1651 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('HPBKG1Df');
      subject.getParams('aog');
      subject.getParams('MTnTYD6');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getParams('0KxxJOv9RNr5');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1651 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1652
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1652
     * @tc.desc      ComponentFactory call flow getContent > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1652', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1652 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('X64CfWVVVH');
      subject.delete('EOoK1xnV');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1652 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1653
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1653
     * @tc.desc      ComponentFactory call flow delete > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1653', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1653 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('HhL62');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('AFLB4sG');
      logInfo(`step3 getBar("AFLB4sG"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1653 end`);
    });
  });
}
