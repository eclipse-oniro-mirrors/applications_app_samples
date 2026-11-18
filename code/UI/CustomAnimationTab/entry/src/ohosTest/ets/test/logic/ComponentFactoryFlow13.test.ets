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
export default function componentFactoryFlow13Test(): void {
  describe('ComponentFactoryFlow13Test', () => {
    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0853
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0853
     * @tc.desc      ComponentFactory call flow getContent > delete > getParams > getBar > getParams keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0853', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0853 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('SVCGZjw');
      subject.delete('q5wUacf5Ddpq');
      subject.getParams('VnaypZA');
      const step4 = subject.getBar('n8ki');
      logInfo(`step4 getBar("n8ki"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getParams('4UYNOjK');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0853 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0854
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0854
     * @tc.desc      ComponentFactory call flow toArray > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0854', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0854 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('ghu5YI9wHEI');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0854 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0855
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0855
     * @tc.desc      ComponentFactory call flow toArray > getContent > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0855', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0855 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent(' abc ');
      subject.getParams('kyXxMW4MLV');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0855 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0856
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0856
     * @tc.desc      ComponentFactory call flow getContent > getContent > getParams > toArray > delete keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0856', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0856 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('sGzPsbc');
      subject.getContent('7MmBfPvMALD');
      subject.getParams('YMVoJhtrZ');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.delete('MTjLYu1O4y');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0856 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0857
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0857
     * @tc.desc      ComponentFactory call flow getBar > delete > getContent > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0857', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0857 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('lvXxnAa8l');
      logInfo(`step1 getBar("lvXxnAa8l"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('o52ed3k1i');
      subject.getContent('B');
      subject.getContent('A_1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0857 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0858
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0858
     * @tc.desc      ComponentFactory call flow delete > getParams > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0858', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0858 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('pmm');
      subject.getParams('7xyqznYXB');
      subject.delete('vt7M08');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0858 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0859
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0859
     * @tc.desc      ComponentFactory call flow getContent > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0859', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0859 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('A2');
      subject.getContent('sp67XTpnyJGQ');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0859 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0860
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0860
     * @tc.desc      ComponentFactory call flow getContent > toArray > getParams > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0860', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0860 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('3ZPW5');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('a');
      subject.getParams('pwoK7bO1YT');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0860 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0861
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0861
     * @tc.desc      ComponentFactory call flow delete > getContent > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0861', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0861 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('8IkTkQ6');
      subject.getContent('123');
      subject.delete('pCN5R5kTAa2');
      const step4 = subject.getBar('y');
      logInfo(`step4 getBar("y"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0861 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0862
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0862
     * @tc.desc      ComponentFactory call flow getBar > delete > getContent > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0862', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0862 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('9wuRQd0r');
      logInfo(`step1 getBar("9wuRQd0r"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('d4NLzEvY6gQk');
      subject.getContent('Hello WorldHello World');
      subject.getContent('SO');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0862 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0863
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0863
     * @tc.desc      ComponentFactory call flow getParams > delete > getBar > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0863', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0863 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('8H');
      subject.delete('PlJs');
      const step3 = subject.getBar('Xard8Kss3VC');
      logInfo(`step3 getBar("Xard8Kss3VC"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('2Iah91P');
      logInfo(`step4 getBar("2Iah91P"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getContent('A2');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0863 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0864
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0864
     * @tc.desc      ComponentFactory call flow getParams > delete > getBar > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0864', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0864 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('u28YtwC8GrPf');
      subject.delete('xabc');
      const step3 = subject.getBar('oKLdk67uzs');
      logInfo(`step3 getBar("oKLdk67uzs"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getParams('0dQ76ka');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0864 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0865
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0865
     * @tc.desc      ComponentFactory call flow getBar > getContent > toArray > getContent > getContent keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0865', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0865 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('n8ki');
      logInfo(`step1 getBar("n8ki"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('xxD');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('Sample Title 123_1');
      subject.getContent('LOlUkMBnd');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0865 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0866
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0866
     * @tc.desc      ComponentFactory call flow delete > getParams > getBar > delete > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0866', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0866 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('kGkIj8843');
      subject.getParams(' Hello ');
      const step3 = subject.getBar('bd');
      logInfo(`step3 getBar("bd"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('P6');
      subject.getContent('J');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0866 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0867
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0867
     * @tc.desc      ComponentFactory call flow toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0867', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0867 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('LISDV');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0867 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0868
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0868
     * @tc.desc      ComponentFactory call flow toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0868', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0868 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0868 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0869
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0869
     * @tc.desc      ComponentFactory call flow getContent > delete > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0869', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0869 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('tj6R6zEL');
      subject.delete('d4NLzEvY6gQk');
      subject.getParams('m');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0869 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0870
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0870
     * @tc.desc      ComponentFactory call flow toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0870', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0870 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('y');
      logInfo(`step2 getBar("y"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0870 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0871
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0871
     * @tc.desc      ComponentFactory call flow getParams > toArray > getContent > delete > getContent keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0871', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0871 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('xa');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('XqccvLh');
      subject.delete('p');
      subject.getContent('bysMUMdqfPdq');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0871 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0872
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0872
     * @tc.desc      ComponentFactory call flow delete > getContent > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0872', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0872 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('xHello World');
      subject.getContent('3Ymm5m7acs');
      const step3 = subject.getBar('NX1KxSeWWOe');
      logInfo(`step3 getBar("NX1KxSeWWOe"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('0vSLrfP6Ad');
      logInfo(`step4 getBar("0vSLrfP6Ad"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0872 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0873
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0873
     * @tc.desc      ComponentFactory call flow getParams > toArray > getContent > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0873', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0873 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('si4CUr');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('6Xzwmv0Kt');
      subject.getContent('X');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0873 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0874
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0874
     * @tc.desc      ComponentFactory call flow getContent > getBar > getParams > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0874', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0874 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('iUES6yl3kHWU');
      const step2 = subject.getBar('HelloHello');
      logInfo(`step2 getBar("HelloHello"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('II9');
      subject.getParams('9JNMtgePsoc');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0874 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0875
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0875
     * @tc.desc      ComponentFactory call flow getBar > getContent > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0875', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0875 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('cy');
      logInfo(`step1 getBar("cy"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('5s');
      subject.getContent('N7w');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0875 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0876
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0876
     * @tc.desc      ComponentFactory call flow getParams > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0876', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0876 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('fxsZv');
      subject.getContent('bOd9mOl0Fwly');
      const step3 = subject.getBar('Op312');
      logInfo(`step3 getBar("Op312"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0876 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0877
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0877
     * @tc.desc      ComponentFactory call flow getBar > getContent > delete > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0877', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0877 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('rRj8x6YM6');
      logInfo(`step1 getBar("rRj8x6YM6"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('4UPwWZl');
      subject.delete('QoK4');
      subject.getContent('3ZPW5');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0877 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0878
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0878
     * @tc.desc      ComponentFactory call flow delete > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0878', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0878 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('Q1ANx2oPtq');
      const step2 = subject.getBar('kRhUbvP8S');
      logInfo(`step2 getBar("kRhUbvP8S"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('mwmaw1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0878 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0879
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0879
     * @tc.desc      ComponentFactory call flow delete > getBar > getContent > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0879', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0879 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('fYygLBY7');
      const step2 = subject.getBar('ElxJx2W2C');
      logInfo(`step2 getBar("ElxJx2W2C"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('c7lMng8ZM');
      subject.delete('AGmX');
      subject.getParams('tB9R1yPEr');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0879 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0880
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0880
     * @tc.desc      ComponentFactory call flow delete > toArray > getParams > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0880', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0880 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('D2it480C1XI');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('r');
      subject.delete('qGYTjRIW');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0880 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0881
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0881
     * @tc.desc      ComponentFactory call flow toArray > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0881', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0881 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('Uc45f3');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0881 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0882
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0882
     * @tc.desc      ComponentFactory call flow getContent > getContent > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0882', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0882 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('e');
      subject.getContent('eTf');
      const step3 = subject.getBar('yzvnqAN');
      logInfo(`step3 getBar("yzvnqAN"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('cN2zDR83ns');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0882 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0883
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0883
     * @tc.desc      ComponentFactory call flow delete > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0883', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0883 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('8IkTkQ6');
      const step2 = subject.getBar('a0Zw2D');
      logInfo(`step2 getBar("a0Zw2D"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('ciB48JMXh');
      logInfo(`step3 getBar("ciB48JMXh"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0883 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0884
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0884
     * @tc.desc      ComponentFactory call flow getContent > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0884', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0884 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('4XSs');
      subject.getContent('Wy');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0884 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0885
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0885
     * @tc.desc      ComponentFactory call flow delete > toArray > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0885', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0885 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('riS');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('NX1KxSeWWOe');
      logInfo(`step3 getBar("NX1KxSeWWOe"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0885 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0886
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0886
     * @tc.desc      ComponentFactory call flow getContent > getBar > delete > getContent > getContent keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0886', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0886 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('mkWE');
      const step2 = subject.getBar('Pwt6zZsPyvP');
      logInfo(`step2 getBar("Pwt6zZsPyvP"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('Hello World');
      subject.getContent('eTf');
      subject.getContent('lGJxC');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0886 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0887
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0887
     * @tc.desc      ComponentFactory call flow toArray > delete > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0887', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0887 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete(' abc ');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('2atXJqonx0');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0887 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0888
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0888
     * @tc.desc      ComponentFactory call flow getParams > toArray > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0888', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0888 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('4UYNOjK');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getParams('VkwV');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0888 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0889
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0889
     * @tc.desc      ComponentFactory call flow delete > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0889', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0889 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('lV');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('OxSA80TGVBGf');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0889 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0890
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0890
     * @tc.desc      ComponentFactory call flow toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0890', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0890 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('aEZCm');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0890 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0891
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0891
     * @tc.desc      ComponentFactory call flow getParams > getBar > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0891', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0891 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('arjTurXZeMbR');
      const step2 = subject.getBar('28cZ2bB4z5g');
      logInfo(`step2 getBar("28cZ2bB4z5g"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('uR');
      const step4 = subject.getBar('yhkABd');
      logInfo(`step4 getBar("yhkABd"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0891 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0892
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0892
     * @tc.desc      ComponentFactory call flow getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0892', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0892 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('mm6Fv');
      const step2 = subject.getBar('y3BmY2P9');
      logInfo(`step2 getBar("y3BmY2P9"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0892 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0893
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0893
     * @tc.desc      ComponentFactory call flow toArray > getParams > getContent > delete > toArray keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0893', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0893 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('7r');
      subject.getContent('J');
      subject.delete('123_1');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0893 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0894
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0894
     * @tc.desc      ComponentFactory call flow getContent > getParams > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0894', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0894 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('sPR');
      subject.getParams('Jq');
      subject.delete('hQx3c');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0894 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0895
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0895
     * @tc.desc      ComponentFactory call flow toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0895', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0895 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('2Iah91P');
      logInfo(`step2 getBar("2Iah91P"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0895 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0896
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0896
     * @tc.desc      ComponentFactory call flow delete > getParams > getBar > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0896', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0896 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('8uYGsOLyg');
      subject.getParams('iWOsagN');
      const step3 = subject.getBar('49k1A7YOxx');
      logInfo(`step3 getBar("49k1A7YOxx"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('FgDmNta9Bvr');
      subject.delete('04EQ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0896 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0897
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0897
     * @tc.desc      ComponentFactory call flow delete > getBar > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0897', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0897 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('bCFxYHlz');
      const step2 = subject.getBar('hiTxVp');
      logInfo(`step2 getBar("hiTxVp"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('XNdC3ThDoNg');
      subject.delete('DbCp');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0897 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0898
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0898
     * @tc.desc      ComponentFactory call flow getBar > getParams > delete > getContent > getParams keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0898', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0898 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('bd');
      logInfo(`step1 getBar("bd"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('EIF5t2O2ZVpJ');
      subject.delete('earF3');
      subject.getContent('QjJmW');
      subject.getParams('GWc8T0X');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0898 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0899
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0899
     * @tc.desc      ComponentFactory call flow getParams > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0899', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0899 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('aEZCm');
      const step2 = subject.getBar('   ');
      logInfo(`step2 getBar("   "): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('a_1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0899 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0900
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0900
     * @tc.desc      ComponentFactory call flow getParams > delete > getParams > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0900 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('8tsdK7xbk5');
      subject.delete('YD4gWjooSL');
      subject.getParams('8v8RQ');
      const step4 = subject.getBar('   ');
      logInfo(`step4 getBar("   "): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0900 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0901
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0901
     * @tc.desc      ComponentFactory call flow getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0901', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0901 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Sample Title 123Sample Title 123');
      logInfo(`step1 getBar("Sample Title 123Sample Titl...: step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('FYQfAafcAT');
      logInfo(`step2 getBar("FYQfAafcAT"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0901 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0902
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0902
     * @tc.desc      ComponentFactory call flow toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0902', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0902 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('AA');
      logInfo(`step2 getBar("AA"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0902 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0903
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0903
     * @tc.desc      ComponentFactory call flow getBar > getContent > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0903', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0903 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('c');
      logInfo(`step1 getBar("c"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('eJuIlW3Qr');
      subject.delete('FR5gCJGQ');
      const step4 = subject.getBar('lk1i');
      logInfo(`step4 getBar("lk1i"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0903 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0904
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0904
     * @tc.desc      ComponentFactory call flow getParams > getContent > toArray > toArray > getContent keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0904', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0904 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams(' hello world ');
      subject.getContent('\u4e2d\u6587\u4e2d\u6587');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getContent('cm');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0904 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0905
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0905
     * @tc.desc      ComponentFactory call flow getContent > getBar > toArray > toArray > getParams keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0905', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0905 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('SVCGZjw');
      const step2 = subject.getBar('qLnzx');
      logInfo(`step2 getBar("qLnzx"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getParams('xHello World');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0905 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0906
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0906
     * @tc.desc      ComponentFactory call flow getBar > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0906', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0906 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('8MUd8zV');
      logInfo(`step1 getBar("8MUd8zV"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('ea4GvMxX');
      subject.delete('SsohOcYTVMY');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0906 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0907
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0907
     * @tc.desc      ComponentFactory call flow getParams > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0907', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0907 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('suDRvuuO');
      const step2 = subject.getBar('qr3Vm7rLf7E');
      logInfo(`step2 getBar("qr3Vm7rLf7E"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0907 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0908
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0908
     * @tc.desc      ComponentFactory call flow getParams > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0908', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0908 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('p02yi');
      subject.getParams('ZhaqxnStvyQ');
      const step3 = subject.getBar('uwe90');
      logInfo(`step3 getBar("uwe90"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0908 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0909
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0909
     * @tc.desc      ComponentFactory call flow getBar > getContent > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0909', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0909 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('x\u4e2d\u6587');
      logInfo(`step1 getBar("x??"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('EzNIsPj');
      subject.getContent('xHello World');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0909 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0910
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0910
     * @tc.desc      ComponentFactory call flow getParams > toArray > getContent > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0910', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0910 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('1UvjpL');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('YYQlkKt5AN');
      subject.getParams('IhXNf');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0910 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0911
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0911
     * @tc.desc      ComponentFactory call flow getContent > delete > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0911', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0911 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('0QK');
      subject.delete('HZDvRFP9g');
      subject.delete('HelloHello');
      const step4 = subject.getBar('xNP');
      logInfo(`step4 getBar("xNP"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0911 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0912
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0912
     * @tc.desc      ComponentFactory call flow toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0912', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0912 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('4i');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0912 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0913
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0913
     * @tc.desc      ComponentFactory call flow delete > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0913', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0913 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('XxY');
      const step2 = subject.getBar('zmnW');
      logInfo(`step2 getBar("zmnW"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('AA');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0913 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0914
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0914
     * @tc.desc      ComponentFactory call flow toArray > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0914', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0914 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('aZyPzQa7arm');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0914 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0915
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0915
     * @tc.desc      ComponentFactory call flow getParams > toArray > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0915', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0915 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('mr5lRFhAZjpp');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('abc');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0915 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0916
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0916
     * @tc.desc      ComponentFactory call flow getContent > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0916', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0916 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('Zj3J0');
      subject.getContent('DK');
      const step3 = subject.getBar('IHZz2H');
      logInfo(`step3 getBar("IHZz2H"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0916 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0917
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0917
     * @tc.desc      ComponentFactory call flow getContent > delete > getParams > getBar > getParams keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0917', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0917 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('cv4YfHFsY1');
      subject.delete('XKxsM0oJspL');
      subject.getParams('J');
      const step4 = subject.getBar('a_1');
      logInfo(`step4 getBar("a_1"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getParams('pwoK7bO1YT');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0917 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0918
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0918
     * @tc.desc      ComponentFactory call flow getParams > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0918', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0918 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('MO0ZHZa');
      const step2 = subject.getBar('vRiQstPt7');
      logInfo(`step2 getBar("vRiQstPt7"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0918 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0919
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0919
     * @tc.desc      ComponentFactory call flow toArray > getBar > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0919', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0919 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('123_1');
      logInfo(`step2 getBar("123_1"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('HZDvRFP9g');
      const step4 = subject.getBar('adwN3');
      logInfo(`step4 getBar("adwN3"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0919 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0920
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0920
     * @tc.desc      ComponentFactory call flow delete > getContent > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0920', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0920 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('XKxsM0oJspL');
      subject.getContent('Wi6jAzzq6AL7');
      const step3 = subject.getBar('e7qxFXB9Kbb');
      logInfo(`step3 getBar("e7qxFXB9Kbb"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('Dh');
      logInfo(`step4 getBar("Dh"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0920 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0921
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0921
     * @tc.desc      ComponentFactory call flow getContent > getBar > getBar > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0921', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0921 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('ij84GYmvSI39');
      const step2 = subject.getBar('A_1');
      logInfo(`step2 getBar("A_1"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('123123');
      logInfo(`step3 getBar("123123"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('3');
      logInfo(`step4 getBar("3"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getParams('si4CUr');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0921 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0922
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0922
     * @tc.desc      ComponentFactory call flow toArray > toArray > getParams > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0922', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0922 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams(' _1');
      subject.getParams('W');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0922 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0923
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0923
     * @tc.desc      ComponentFactory call flow delete > getParams > delete > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0923', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0923 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('bSxeDoYBn');
      subject.getParams('Sample Title 123');
      subject.delete('1TJ2rXdPD');
      const step4 = subject.getBar('3');
      logInfo(`step4 getBar("3"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0923 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0924
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0924
     * @tc.desc      ComponentFactory call flow getParams > getContent > getBar > getParams > getContent keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0924', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0924 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('aHby');
      subject.getContent('KFP01CXhPy');
      const step3 = subject.getBar('Dh');
      logInfo(`step3 getBar("Dh"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('d');
      subject.getContent('Fzf');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0924 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0925
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0925
     * @tc.desc      ComponentFactory call flow toArray > delete > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0925', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0925 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('P');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar(' Sample Title 123 ');
      logInfo(`step4 getBar(" Sample Title 123 "): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0925 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0926
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0926
     * @tc.desc      ComponentFactory call flow delete > getContent > toArray > getBar > getParams keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0926', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0926 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('0VsvJoEp');
      subject.getContent('I');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('YM5A7JRomJP1');
      logInfo(`step4 getBar("YM5A7JRomJP1"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getParams('wvfa');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0926 end`);
    });
  });
}
