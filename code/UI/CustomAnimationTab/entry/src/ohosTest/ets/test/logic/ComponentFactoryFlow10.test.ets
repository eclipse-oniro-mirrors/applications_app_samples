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
export default function componentFactoryFlow10Test(): void {
  describe('ComponentFactoryFlow10Test', () => {
    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0635
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0635
     * @tc.desc      ComponentFactory call flow toArray > delete > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0635', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0635 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('fc');
      const step3 = subject.getBar('cX2');
      logInfo(`step3 getBar("cX2"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('i4VJdShfk');
      logInfo(`step4 getBar("i4VJdShfk"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0635 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0636
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0636
     * @tc.desc      ComponentFactory call flow getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0636', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0636 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('3Pe');
      logInfo(`step1 getBar("3Pe"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('abcabc');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0636 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0637
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0637
     * @tc.desc      ComponentFactory call flow getParams > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0637', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0637 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('m8HTwLLgOyAe');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('2bFK3uf');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0637 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0638
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0638
     * @tc.desc      ComponentFactory call flow delete > getBar > toArray > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0638', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0638 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('hello world');
      const step2 = subject.getBar('onHMSlNH');
      logInfo(`step2 getBar("onHMSlNH"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('o52ed3k1i');
      subject.getParams('ix');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0638 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0639
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0639
     * @tc.desc      ComponentFactory call flow toArray > toArray > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0639', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0639 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('czXc4Bok');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0639 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0640
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0640
     * @tc.desc      ComponentFactory call flow getParams > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0640', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0640 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('khSGEyk2yQy');
      subject.getContent('I');
      const step3 = subject.getBar('3Pe');
      logInfo(`step3 getBar("3Pe"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0640 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0641
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0641
     * @tc.desc      ComponentFactory call flow delete > delete > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0641', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0641 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('J');
      subject.delete('abc');
      const step3 = subject.getBar('mb');
      logInfo(`step3 getBar("mb"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0641 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0642
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0642
     * @tc.desc      ComponentFactory call flow getContent > toArray > getParams > getParams > getBar keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0642', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0642 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('9RbqbKZqXn');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('Hello World');
      subject.getParams('xHello World');
      const step5 = subject.getBar('123');
      logInfo(`step5 getBar("123"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0642 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0643
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0643
     * @tc.desc      ComponentFactory call flow toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0643', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0643 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('cv4YfHFsY1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0643 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0644
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0644
     * @tc.desc      ComponentFactory call flow getContent > toArray > getBar > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0644', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0644 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('6ZB');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`step3 getBar("????"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('ZhT9z0B');
      logInfo(`step4 getBar("ZhT9z0B"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.delete('TUiZ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0644 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0645
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0645
     * @tc.desc      ComponentFactory call flow toArray > getParams > delete > getContent > getParams keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0645', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0645 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('9p');
      subject.delete('opAhnX5KXD2M');
      subject.getContent('HPBKG1Df');
      subject.getParams('Ti');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0645 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0646
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0646
     * @tc.desc      ComponentFactory call flow getParams > getBar > delete > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0646', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0646 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('khSGEyk2yQy');
      const step2 = subject.getBar('miyb');
      logInfo(`step2 getBar("miyb"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('x ');
      subject.delete('oY00LNDxwC');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0646 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0647
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0647
     * @tc.desc      ComponentFactory call flow getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0647', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0647 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Zkfnj8M');
      logInfo(`step1 getBar("Zkfnj8M"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('vHA');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0647 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0648
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0648
     * @tc.desc      ComponentFactory call flow toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0648', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0648 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('vYLFZm');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0648 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0649
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0649
     * @tc.desc      ComponentFactory call flow getBar > toArray > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0649', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0649 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Zkfnj8M');
      logInfo(`step1 getBar("Zkfnj8M"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('i9fjd');
      const step4 = subject.getBar('Hello WorldHello World');
      logInfo(`step4 getBar("Hello WorldHello World"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0649 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0650
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0650
     * @tc.desc      ComponentFactory call flow getParams > getBar > getContent > delete > getParams keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0650', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0650 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('cdJj6PFv3xK');
      const step2 = subject.getBar('FdLnD6');
      logInfo(`step2 getBar("FdLnD6"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('bHt');
      subject.delete('D1jifV8XEuZ8');
      subject.getParams('MO0ZHZa');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0650 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0651
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0651
     * @tc.desc      ComponentFactory call flow getContent > getContent > getBar > getBar > getContent keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0651', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0651 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('9XJ');
      subject.getContent('0s2nrz3zIDM');
      const step3 = subject.getBar('xNP');
      logInfo(`step3 getBar("xNP"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('yzvnqAN');
      logInfo(`step4 getBar("yzvnqAN"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getContent('UjnC9gnByt');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0651 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0652
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0652
     * @tc.desc      ComponentFactory call flow getParams > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0652', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0652 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('Sample Title 123');
      subject.getParams('Tjb');
      const step3 = subject.getBar('O81E1pRljiV');
      logInfo(`step3 getBar("O81E1pRljiV"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0652 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0653
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0653
     * @tc.desc      ComponentFactory call flow getParams > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0653', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0653 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('hello world');
      const step2 = subject.getBar('eyQTwU8DM7la');
      logInfo(`step2 getBar("eyQTwU8DM7la"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('zKWJB5g');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0653 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0654
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0654
     * @tc.desc      ComponentFactory call flow getParams > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0654', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0654 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('PNEX5');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('Kr4Ng');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0654 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0655
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0655
     * @tc.desc      ComponentFactory call flow getContent > getBar > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0655', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0655 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('V06sFwKy');
      const step2 = subject.getBar('i4VJdShfk');
      logInfo(`step2 getBar("i4VJdShfk"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getParams('BWteKXGeO');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0655 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0656
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0656
     * @tc.desc      ComponentFactory call flow getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0656', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0656 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('T');
      logInfo(`step1 getBar("T"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('Hello WorldHello World');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0656 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0657
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0657
     * @tc.desc      ComponentFactory call flow toArray > getParams > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0657', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0657 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('mr5lRFhAZjpp');
      subject.delete('oY00LNDxwC');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0657 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0658
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0658
     * @tc.desc      ComponentFactory call flow getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0658', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0658 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('xa');
      const step2 = subject.getBar('2');
      logInfo(`step2 getBar("2"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0658 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0659
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0659
     * @tc.desc      ComponentFactory call flow delete > getBar > getBar > getParams > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0659', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0659 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('YCf7RPBdTuW');
      const step2 = subject.getBar('Sample Title 123_1');
      logInfo(`step2 getBar("Sample Title 123_1"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('xa');
      logInfo(`step3 getBar("xa"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams(' Hello World ');
      subject.getParams('2d');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0659 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0660
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0660
     * @tc.desc      ComponentFactory call flow delete > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0660', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0660 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('aZyPzQa7arm');
      const step2 = subject.getBar('4dnloBNO2xf');
      logInfo(`step2 getBar("4dnloBNO2xf"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0660 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0661
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0661
     * @tc.desc      ComponentFactory call flow getParams > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0661', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0661 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('8YGinqG');
      subject.getParams('WygLQEV');
      const step3 = subject.getBar('Uw56XMZCO');
      logInfo(`step3 getBar("Uw56XMZCO"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0661 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0662
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0662
     * @tc.desc      ComponentFactory call flow toArray > toArray > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0662', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0662 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('AF7Fx9LP');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0662 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0663
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0663
     * @tc.desc      ComponentFactory call flow delete > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0663', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0663 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('xHello World');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('a');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0663 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0664
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0664
     * @tc.desc      ComponentFactory call flow getParams > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0664', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0664 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('i9fjd');
      subject.getParams('9YLrXjHx6t');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0664 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0665
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0665
     * @tc.desc      ComponentFactory call flow getContent > getContent > getParams > getBar > delete keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0665', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0665 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('8Uzb2NI');
      subject.getContent('Y6eQwtY');
      subject.getParams('M2ShSF15');
      const step4 = subject.getBar('N7OAv');
      logInfo(`step4 getBar("N7OAv"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.delete('x\u4e2d\u6587');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0665 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0666
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0666
     * @tc.desc      ComponentFactory call flow getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0666', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0666 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('FnyWHce');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0666 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0667
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0667
     * @tc.desc      ComponentFactory call flow getBar > getBar > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0667', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0667 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('KKqGmBc');
      logInfo(`step1 getBar("KKqGmBc"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('yhkABd');
      logInfo(`step2 getBar("yhkABd"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('NnHshymU');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0667 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0668
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0668
     * @tc.desc      ComponentFactory call flow getBar > getParams > getBar > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0668', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0668 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('PFOls05b2');
      logInfo(`step1 getBar("PFOls05b2"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('BPyU9qL');
      const step3 = subject.getBar('lEdaAGGIE');
      logInfo(`step3 getBar("lEdaAGGIE"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('eLADslckWNfW');
      logInfo(`step4 getBar("eLADslckWNfW"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getParams('LISDV');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0668 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0669
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0669
     * @tc.desc      ComponentFactory call flow toArray > getBar > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0669', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0669 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('qMrW');
      logInfo(`step2 getBar("qMrW"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent(' \u4e2d\u6587 ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0669 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0670
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0670
     * @tc.desc      ComponentFactory call flow toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0670', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0670 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0670 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0671
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0671
     * @tc.desc      ComponentFactory call flow getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0671', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0671 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('4Kn');
      const step2 = subject.getBar('dqy7B');
      logInfo(`step2 getBar("dqy7B"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0671 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0672
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0672
     * @tc.desc      ComponentFactory call flow getBar > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0672', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0672 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('xA');
      logInfo(`step1 getBar("xA"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('WRd');
      logInfo(`step2 getBar("WRd"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('Hello World_1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0672 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0673
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0673
     * @tc.desc      ComponentFactory call flow toArray > getBar > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0673', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0673 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('2Q');
      logInfo(`step2 getBar("2Q"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getParams(' hello world ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0673 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0674
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0674
     * @tc.desc      ComponentFactory call flow getParams > toArray > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0674', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0674 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('vi7UE7l39C4');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('7cMM5LUlu');
      const step4 = subject.getBar('C4');
      logInfo(`step4 getBar("C4"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0674 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0675
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0675
     * @tc.desc      ComponentFactory call flow getParams > toArray > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0675', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0675 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('VbhNLb5mKXOX');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getParams('Y');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0675 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0676
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0676
     * @tc.desc      ComponentFactory call flow toArray > delete > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0676', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0676 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('lIklZ7h');
      subject.getContent(' hello world ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0676 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0677
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0677
     * @tc.desc      ComponentFactory call flow getContent > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0677', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0677 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('HZYhpUbfgQ2');
      const step2 = subject.getBar(' \u4e2d\u6587 ');
      logInfo(`step2 getBar(" ?? "): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('aEZCm');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0677 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0678
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0678
     * @tc.desc      ComponentFactory call flow delete > getParams > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0678', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0678 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('xXOmAO1G');
      subject.getParams('Kr4Ng');
      const step3 = subject.getBar('123123');
      logInfo(`step3 getBar("123123"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('si4CUr');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0678 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0679
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0679
     * @tc.desc      ComponentFactory call flow delete > getContent > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0679', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0679 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('RAcfl');
      subject.getContent('Wi6jAzzq6AL7');
      const step3 = subject.getBar('PIGR');
      logInfo(`step3 getBar("PIGR"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('4F9j7D60VEyy');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0679 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0680
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0680
     * @tc.desc      ComponentFactory call flow getBar > getContent > getParams > toArray > toArray keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0680', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0680 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('0vSLrfP6Ad');
      logInfo(`step1 getBar("0vSLrfP6Ad"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('Y6eQwtY');
      subject.getParams('   ');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0680 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0681
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0681
     * @tc.desc      ComponentFactory call flow getParams > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0681', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0681 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('4UYNOjK');
      const step2 = subject.getBar('xMtWdQu6');
      logInfo(`step2 getBar("xMtWdQu6"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('x ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0681 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0682
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0682
     * @tc.desc      ComponentFactory call flow toArray > getContent > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0682', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0682 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('xyc');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0682 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0683
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0683
     * @tc.desc      ComponentFactory call flow getParams > toArray > delete > getParams > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0683', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0683 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('U2xjZrluups');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('H588SnQLlH');
      subject.getParams('H');
      subject.delete('AA');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0683 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0684
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0684
     * @tc.desc      ComponentFactory call flow getParams > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0684', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0684 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('J');
      subject.delete('3KXiJ');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0684 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0685
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0685
     * @tc.desc      ComponentFactory call flow toArray > getParams > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0685', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0685 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('AY2h8Amd3uN');
      subject.getParams('dEkGT');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0685 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0686
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0686
     * @tc.desc      ComponentFactory call flow toArray > toArray > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0686', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0686 begin`);
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
      subject.getContent('cuWW2qVH');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0686 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0687
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0687
     * @tc.desc      ComponentFactory call flow getBar > delete > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0687', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0687 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('n8oyYK');
      logInfo(`step1 getBar("n8oyYK"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('Sample Title 123_1');
      subject.delete('MTjLYu1O4y');
      subject.delete('gbZBiNl');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0687 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0688
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0688
     * @tc.desc      ComponentFactory call flow getContent > getContent > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0688', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0688 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('mc');
      subject.getContent('o7ehL');
      subject.getContent('Po1TV91Y');
      const step4 = subject.getBar('Ov');
      logInfo(`step4 getBar("Ov"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0688 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0689
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0689
     * @tc.desc      ComponentFactory call flow toArray > getBar > toArray > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0689', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0689 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('5Qvn');
      logInfo(`step2 getBar("5Qvn"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('D2it480C1XI');
      subject.getParams('A_1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0689 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0690
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0690
     * @tc.desc      ComponentFactory call flow getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0690', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0690 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('2atXJqonx0');
      const step2 = subject.getBar('mGe');
      logInfo(`step2 getBar("mGe"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0690 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0691
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0691
     * @tc.desc      ComponentFactory call flow getParams > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0691', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0691 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('Ow');
      const step2 = subject.getBar('cHJljbKpOHeu');
      logInfo(`step2 getBar("cHJljbKpOHeu"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0691 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0692
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0692
     * @tc.desc      ComponentFactory call flow getBar > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0692', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0692 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('NX1KxSeWWOe');
      logInfo(`step1 getBar("NX1KxSeWWOe"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('fwynvaF');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0692 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0693
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0693
     * @tc.desc      ComponentFactory call flow getParams > delete > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0693', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0693 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('8YGinqG');
      subject.delete('123_1');
      subject.delete('mnsT');
      const step4 = subject.getBar('e');
      logInfo(`step4 getBar("e"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0693 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0694
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0694
     * @tc.desc      ComponentFactory call flow delete > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0694', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0694 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('fTNSgriK74V');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('9TEfZrL');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0694 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0695
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0695
     * @tc.desc      ComponentFactory call flow toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0695', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0695 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('hello world_1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0695 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0696
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0696
     * @tc.desc      ComponentFactory call flow getParams > getParams > getBar > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0696', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0696 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('123_1');
      subject.getParams('UI');
      const step3 = subject.getBar('cCiM');
      logInfo(`step3 getBar("cCiM"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('CbhFUa9Bi');
      logInfo(`step4 getBar("CbhFUa9Bi"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0696 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0697
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0697
     * @tc.desc      ComponentFactory call flow getParams > getBar > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0697', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0697 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('wsq7rmEOO');
      const step2 = subject.getBar('Ov');
      logInfo(`step2 getBar("Ov"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('uwe90');
      logInfo(`step3 getBar("uwe90"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0697 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0698
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0698
     * @tc.desc      ComponentFactory call flow getContent > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0698', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0698 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('123123');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('CbhFUa9Bi');
      logInfo(`step3 getBar("CbhFUa9Bi"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0698 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0699
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0699
     * @tc.desc      ComponentFactory call flow getContent > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0699', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0699 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('eAN');
      subject.getContent('Cxfm40FDJmt');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0699 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0700
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0700
     * @tc.desc      ComponentFactory call flow getBar > getContent > getParams > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0700 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('jIDfJlAGM1zc');
      logInfo(`step1 getBar("jIDfJlAGM1zc"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('xxD');
      subject.getParams('AY2h8Amd3uN');
      subject.getContent('5s');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0700 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0701
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0701
     * @tc.desc      ComponentFactory call flow getBar > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0701', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0701 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('sXbp2Pkw3ht7');
      logInfo(`step1 getBar("sXbp2Pkw3ht7"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('9TEfZrL');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0701 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0702
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0702
     * @tc.desc      ComponentFactory call flow toArray > delete > getBar > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0702', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0702 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('d4NLzEvY6gQk');
      const step3 = subject.getBar('1MYBqsx53n');
      logInfo(`step3 getBar("1MYBqsx53n"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('xZK');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0702 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0703
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0703
     * @tc.desc      ComponentFactory call flow getContent > getParams > getContent > toArray > delete keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0703', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0703 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('9RbqbKZqXn');
      subject.getParams('E2Dk6zai5vj5');
      subject.getContent('eTf');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.delete('pmm');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0703 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0704
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0704
     * @tc.desc      ComponentFactory call flow toArray > getBar > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0704', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0704 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('aa');
      logInfo(`step2 getBar("aa"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('cX2');
      logInfo(`step3 getBar("cX2"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0704 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0705
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0705
     * @tc.desc      ComponentFactory call flow getContent > toArray > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0705', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0705 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('czXc4Bok');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete(' _1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0705 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0706
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0706
     * @tc.desc      ComponentFactory call flow getBar > toArray > getParams > getContent > getContent keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0706', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0706 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('PFOls05b2');
      logInfo(`step1 getBar("PFOls05b2"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('yobXge');
      subject.getContent('xabc');
      subject.getContent('P7wBLpfLbLB');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0706 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0707
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0707
     * @tc.desc      ComponentFactory call flow delete > getParams > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0707', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0707 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('123');
      subject.getParams('Sample Title 123Sample Title 123');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('7wHIP1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0707 end`);
    });
  });
}
