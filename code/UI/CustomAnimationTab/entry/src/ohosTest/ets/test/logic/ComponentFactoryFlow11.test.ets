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
export default function componentFactoryFlow11Test(): void {
  describe('ComponentFactoryFlow11Test', () => {
    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0708
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0708
     * @tc.desc      ComponentFactory call flow getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0708', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0708 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('s7CZvpnN5wE0');
      const step2 = subject.getBar('ndk');
      logInfo(`step2 getBar("ndk"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0708 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0709
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0709
     * @tc.desc      ComponentFactory call flow getContent > getParams > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0709', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0709 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('wBF');
      subject.getParams('xa');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('jh1xjQMI');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0709 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0710
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0710
     * @tc.desc      ComponentFactory call flow getBar > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0710', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0710 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('NW');
      logInfo(`step1 getBar("NW"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('UUfRskW');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0710 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0711
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0711
     * @tc.desc      ComponentFactory call flow getContent > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0711', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0711 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('sPR');
      const step2 = subject.getBar('Bo4Qrnt');
      logInfo(`step2 getBar("Bo4Qrnt"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0711 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0712
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0712
     * @tc.desc      ComponentFactory call flow getContent > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0712', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0712 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('oj0tXh1T');
      subject.delete('jLQcxJVfj');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0712 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0713
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0713
     * @tc.desc      ComponentFactory call flow getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0713', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0713 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('45C0Rbxg');
      logInfo(`step1 getBar("45C0Rbxg"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('bB7TmFt');
      logInfo(`step2 getBar("bB7TmFt"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0713 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0714
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0714
     * @tc.desc      ComponentFactory call flow delete > toArray > getBar > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0714', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0714 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('Hello World');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('7J8');
      logInfo(`step3 getBar("7J8"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.delete('2ihOb0dE7ue');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0714 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0715
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0715
     * @tc.desc      ComponentFactory call flow getContent > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0715', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0715 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('J4flKUQqwBH2');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('TUiZ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0715 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0716
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0716
     * @tc.desc      ComponentFactory call flow getContent > delete > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0716', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0716 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('B');
      subject.delete('abcabc');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('zKWJB5g');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0716 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0717
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0717
     * @tc.desc      ComponentFactory call flow getContent > getBar > getParams > delete > toArray keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0717', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0717 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('ayKozb0tPG');
      const step2 = subject.getBar('zBPStDSd46');
      logInfo(`step2 getBar("zBPStDSd46"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('l');
      subject.delete('a_1');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0717 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0718
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0718
     * @tc.desc      ComponentFactory call flow getContent > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0718', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0718 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('KFP01CXhPy');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0718 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0719
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0719
     * @tc.desc      ComponentFactory call flow getParams > getContent > getBar > getParams > toArray keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0719', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0719 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('SkVafRDpC8U');
      subject.getContent('Td7IPsx59Z');
      const step3 = subject.getBar('n6t');
      logInfo(`step3 getBar("n6t"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('Jq');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0719 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0720
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0720
     * @tc.desc      ComponentFactory call flow getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0720', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0720 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('ZrUU4j1Q62EK');
      logInfo(`step1 getBar("ZrUU4j1Q62EK"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('pmm');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0720 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0721
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0721
     * @tc.desc      ComponentFactory call flow toArray > delete > delete > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0721', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0721 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('hello world');
      subject.delete('9eokJW');
      subject.getContent('ao1xPPVqGz');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0721 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0722
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0722
     * @tc.desc      ComponentFactory call flow getParams > delete > getContent > getBar > toArray keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0722', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0722 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('ti2UlpzkdM2');
      subject.delete('K7EGmG7Pak');
      subject.getContent('5s6JepBUhol');
      const step4 = subject.getBar(' A ');
      logInfo(`step4 getBar(" A "): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0722 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0723
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0723
     * @tc.desc      ComponentFactory call flow getParams > getBar > delete > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0723', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0723 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('Bwig9b9gr');
      const step2 = subject.getBar('hello world');
      logInfo(`step2 getBar("hello world"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete(' ');
      const step4 = subject.getBar('cy');
      logInfo(`step4 getBar("cy"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getContent('8RUUG');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0723 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0724
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0724
     * @tc.desc      ComponentFactory call flow getBar > toArray > toArray > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0724', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0724 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('9l');
      logInfo(`step1 getBar("9l"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('miozIxq8Dm9z');
      logInfo(`step4 getBar("miozIxq8Dm9z"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getParams('iqIQ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0724 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0725
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0725
     * @tc.desc      ComponentFactory call flow delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0725', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0725 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('Hello World');
      const step2 = subject.getBar('4dnloBNO2xf');
      logInfo(`step2 getBar("4dnloBNO2xf"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0725 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0726
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0726
     * @tc.desc      ComponentFactory call flow getContent > toArray > getParams > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0726', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0726 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('xa');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('MDzjvi6c');
      subject.getParams('8YGinqG');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0726 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0727
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0727
     * @tc.desc      ComponentFactory call flow toArray > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0727', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0727 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('0VsvJoEp');
      subject.delete('tROh17M');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0727 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0728
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0728
     * @tc.desc      ComponentFactory call flow getBar > getBar > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0728', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0728 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('kRhUbvP8S');
      logInfo(`step1 getBar("kRhUbvP8S"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('bxg');
      logInfo(`step2 getBar("bxg"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('GbgePszBh');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0728 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0729
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0729
     * @tc.desc      ComponentFactory call flow getParams > getContent > delete > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0729', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0729 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('hGpqi45M3yCU');
      subject.getContent('Sample Title 123_1');
      subject.delete('21Cr');
      subject.delete('riS');
      const step5 = subject.getBar('e4');
      logInfo(`step5 getBar("e4"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0729 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0730
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0730
     * @tc.desc      ComponentFactory call flow getContent > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0730', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0730 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('ghu5YI9wHEI');
      const step2 = subject.getBar('Uzh40JIxi9r5');
      logInfo(`step2 getBar("Uzh40JIxi9r5"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('ML4Kk6');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0730 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0731
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0731
     * @tc.desc      ComponentFactory call flow toArray > getBar > getParams > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0731', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0731 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('L');
      logInfo(`step2 getBar("L"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('aHby');
      const step4 = subject.getBar('n4BBP');
      logInfo(`step4 getBar("n4BBP"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getParams('wGSFFV');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0731 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0732
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0732
     * @tc.desc      ComponentFactory call flow getContent > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0732', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0732 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('uhEdJ8TYI');
      subject.delete('DFXlTccFsR');
      const step3 = subject.getBar('n8ki');
      logInfo(`step3 getBar("n8ki"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0732 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0733
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0733
     * @tc.desc      ComponentFactory call flow delete > getBar > delete > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0733', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0733 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('LaGV');
      const step2 = subject.getBar('y3BmY2P9');
      logInfo(`step2 getBar("y3BmY2P9"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('q5wUacf5Ddpq');
      subject.delete(' 123 ');
      subject.delete('Lu');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0733 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0734
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0734
     * @tc.desc      ComponentFactory call flow toArray > toArray > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0734', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0734 begin`);
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
      const step4 = subject.getBar('123');
      logInfo(`step4 getBar("123"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0734 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0735
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0735
     * @tc.desc      ComponentFactory call flow getContent > getBar > getBar > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0735', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0735 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('ZcJyDJ');
      const step2 = subject.getBar('hello world');
      logInfo(`step2 getBar("hello world"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('h3tUUCmMN');
      logInfo(`step3 getBar("h3tUUCmMN"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('qhse');
      subject.getParams(' a ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0735 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0736
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0736
     * @tc.desc      ComponentFactory call flow getBar > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0736', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0736 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('L7LmJ9G');
      logInfo(`step1 getBar("L7LmJ9G"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('Hello');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0736 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0737
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0737
     * @tc.desc      ComponentFactory call flow toArray > getContent > getParams > getParams > delete keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0737', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0737 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('BpzH');
      subject.getParams('I22XxBc');
      subject.getParams('  ');
      subject.delete('FEDAmRPXge');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0737 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0738
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0738
     * @tc.desc      ComponentFactory call flow getContent > delete > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0738', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0738 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('x');
      subject.delete('BaRzkvGihLV');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('whOLzSN');
      logInfo(`step4 getBar("whOLzSN"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0738 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0739
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0739
     * @tc.desc      ComponentFactory call flow delete > getParams > delete > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0739', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0739 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('XNdC3ThDoNg');
      subject.getParams('ML4Kk6');
      subject.delete('SiTfSAwKht');
      const step4 = subject.getBar('p9vA3Qd');
      logInfo(`step4 getBar("p9vA3Qd"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getParams('x123');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0739 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0740
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0740
     * @tc.desc      ComponentFactory call flow toArray > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0740', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0740 begin`);
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
      logInfo(`${BUNDLE}ComponentFactoryFlow_0740 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0741
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0741
     * @tc.desc      ComponentFactory call flow getBar > toArray > getParams > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0741', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0741 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('lk1i');
      logInfo(`step1 getBar("lk1i"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('v7wMsz894');
      subject.delete('bq2U');
      const step5 = subject.getBar('HxnhpHwZpVKv');
      logInfo(`step5 getBar("HxnhpHwZpVKv"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0741 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0742
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0742
     * @tc.desc      ComponentFactory call flow getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0742', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0742 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Uzh40JIxi9r5');
      logInfo(`step1 getBar("Uzh40JIxi9r5"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('04EQ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0742 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0743
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0743
     * @tc.desc      ComponentFactory call flow getContent > getParams > getContent > toArray > delete keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0743', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0743 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('2yJnb15b');
      subject.getParams('rb6bBOpG0w');
      subject.getContent('XKKUPI7txYk');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.delete('go');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0743 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0744
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0744
     * @tc.desc      ComponentFactory call flow delete > getContent > delete > getContent > getBar keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0744', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0744 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('xHello');
      subject.getContent('ZI');
      subject.delete('HhL62');
      subject.getContent('eAYcBjsH');
      const step5 = subject.getBar('N7OAv');
      logInfo(`step5 getBar("N7OAv"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0744 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0745
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0745
     * @tc.desc      ComponentFactory call flow getParams > delete > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0745', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0745 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('STO');
      subject.delete('FEDAmRPXge');
      const step3 = subject.getBar('Uq96gDO3');
      logInfo(`step3 getBar("Uq96gDO3"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0745 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0746
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0746
     * @tc.desc      ComponentFactory call flow toArray > delete > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0746', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0746 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('1JQNTOALvYj1');
      subject.getContent('glNOtEmitNG4');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0746 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0747
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0747
     * @tc.desc      ComponentFactory call flow getContent > delete > getBar > getParams > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0747', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0747 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('nThV0UM4');
      subject.delete('A_1');
      const step3 = subject.getBar('jL8OO8aOM');
      logInfo(`step3 getBar("jL8OO8aOM"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('2tIMNtcNOL');
      subject.delete('YeZvSmculB');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0747 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0748
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0748
     * @tc.desc      ComponentFactory call flow getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0748', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0748 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('n8ki');
      logInfo(`step1 getBar("n8ki"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('ZOfGU3m5fzix');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0748 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0749
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0749
     * @tc.desc      ComponentFactory call flow getBar > getContent > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0749', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0749 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('8MUd8zV');
      logInfo(`step1 getBar("8MUd8zV"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('vW8IZb2km');
      subject.delete('al');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0749 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0750
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0750
     * @tc.desc      ComponentFactory call flow delete > toArray > getContent > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0750', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0750 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('VvICRs58S');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('Kf');
      subject.getParams('123123');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0750 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0751
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0751
     * @tc.desc      ComponentFactory call flow getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0751', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0751 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('\u4e2d\u6587\u4e2d\u6587');
      const step2 = subject.getBar('O805K7Y');
      logInfo(`step2 getBar("O805K7Y"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0751 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0752
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0752
     * @tc.desc      ComponentFactory call flow getContent > getContent > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0752', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0752 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('FLQOuZsk');
      subject.getContent('8BWbAJQz');
      subject.getContent('123_1');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0752 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0753
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0753
     * @tc.desc      ComponentFactory call flow getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0753', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0753 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Hello_1');
      logInfo(`step1 getBar("Hello_1"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('pCN5R5kTAa2');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0753 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0754
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0754
     * @tc.desc      ComponentFactory call flow getContent > getContent > toArray > getBar > delete keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0754', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0754 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('glNOtEmitNG4');
      subject.getContent('7MmBfPvMALD');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('Uq96gDO3');
      logInfo(`step4 getBar("Uq96gDO3"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.delete('PrQuLUQF');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0754 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0755
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0755
     * @tc.desc      ComponentFactory call flow getContent > getBar > getBar > getParams > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0755', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0755 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('0s2nrz3zIDM');
      const step2 = subject.getBar('DKkkl');
      logInfo(`step2 getBar("DKkkl"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('A_1');
      logInfo(`step3 getBar("A_1"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('Fl');
      subject.delete('a_1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0755 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0756
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0756
     * @tc.desc      ComponentFactory call flow getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0756', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0756 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('Td7IPsx59Z');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0756 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0757
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0757
     * @tc.desc      ComponentFactory call flow delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0757', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0757 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('gsD6x');
      const step2 = subject.getBar('Hello_1');
      logInfo(`step2 getBar("Hello_1"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0757 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0758
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0758
     * @tc.desc      ComponentFactory call flow getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0758', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0758 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('BA4U');
      logInfo(`step1 getBar("BA4U"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0758 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0759
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0759
     * @tc.desc      ComponentFactory call flow delete > delete > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0759', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0759 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('fTNSgriK74V');
      subject.delete('7qHQfp4He');
      subject.getParams('IhXNf');
      const step4 = subject.getBar('Sample Title 123');
      logInfo(`step4 getBar("Sample Title 123"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0759 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0760
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0760
     * @tc.desc      ComponentFactory call flow delete > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0760', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0760 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('Sample Title 123');
      subject.delete(' Sample Title 123 ');
      const step3 = subject.getBar('Hello World_1');
      logInfo(`step3 getBar("Hello World_1"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0760 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0761
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0761
     * @tc.desc      ComponentFactory call flow delete > toArray > getContent > getContent > getContent keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0761', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0761 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('fYygLBY7');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('fAN');
      subject.getContent('cuWW2qVH');
      subject.getContent('SVCGZjw');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0761 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0762
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0762
     * @tc.desc      ComponentFactory call flow getParams > getContent > getBar > getBar > toArray keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0762', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0762 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('x\u4e2d\u6587');
      subject.getContent('Sample Title 123_1');
      const step3 = subject.getBar('Rv1MAGc');
      logInfo(`step3 getBar("Rv1MAGc"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('ndk');
      logInfo(`step4 getBar("ndk"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0762 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0763
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0763
     * @tc.desc      ComponentFactory call flow toArray > getParams > getContent > getContent > getParams keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0763', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0763 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('qWYQl');
      subject.getContent('QBFQTu');
      subject.getContent('0QK');
      subject.getParams('65H');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0763 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0764
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0764
     * @tc.desc      ComponentFactory call flow getBar > getBar > delete > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0764', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0764 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('P7r5');
      logInfo(`step1 getBar("P7r5"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('OiBfZNAar');
      logInfo(`step2 getBar("OiBfZNAar"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('bq2U');
      subject.delete('Uxp');
      subject.delete('FfIwdN');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0764 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0765
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0765
     * @tc.desc      ComponentFactory call flow delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0765', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0765 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('AA');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0765 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0766
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0766
     * @tc.desc      ComponentFactory call flow getContent > getBar > getParams > delete > getParams keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0766', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0766 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('ECtggVYxqC');
      const step2 = subject.getBar(' abc ');
      logInfo(`step2 getBar(" abc "): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('\u4e2d\u6587\u4e2d\u6587');
      subject.delete('XL1HgQagEU');
      subject.getParams('Bh0rR');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0766 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0767
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0767
     * @tc.desc      ComponentFactory call flow getParams > getContent > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0767', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0767 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('Ej');
      subject.getContent('9RbqbKZqXn');
      const step3 = subject.getBar('dBblCxE4');
      logInfo(`step3 getBar("dBblCxE4"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('IHZz2H');
      logInfo(`step4 getBar("IHZz2H"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0767 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0768
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0768
     * @tc.desc      ComponentFactory call flow toArray > getBar > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0768', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0768 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('miyb');
      logInfo(`step2 getBar("miyb"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('c4ZDLC');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0768 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0769
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0769
     * @tc.desc      ComponentFactory call flow getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0769', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0769 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('MUalu12Q');
      const step2 = subject.getBar('ciB48JMXh');
      logInfo(`step2 getBar("ciB48JMXh"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0769 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0770
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0770
     * @tc.desc      ComponentFactory call flow getParams > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0770', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0770 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('ggSZnOTRvj9U');
      const step2 = subject.getBar('   ');
      logInfo(`step2 getBar("   "): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0770 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0771
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0771
     * @tc.desc      ComponentFactory call flow toArray > getParams > delete > toArray > getContent keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0771', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0771 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('Vw');
      subject.delete('b');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getContent('Hello World');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0771 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0772
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0772
     * @tc.desc      ComponentFactory call flow delete > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0772', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0772 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('hello world');
      const step2 = subject.getBar('adwN3');
      logInfo(`step2 getBar("adwN3"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('Hello WorldHello World');
      logInfo(`step3 getBar("Hello WorldHello World"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0772 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0773
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0773
     * @tc.desc      ComponentFactory call flow getContent > getParams > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0773', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0773 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('8LIv');
      subject.getParams(' ');
      const step3 = subject.getBar('jlxGvRARmD5f');
      logInfo(`step3 getBar("jlxGvRARmD5f"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('3');
      logInfo(`step4 getBar("3"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0773 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0774
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0774
     * @tc.desc      ComponentFactory call flow getBar > delete > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0774', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0774 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar(' \u4e2d\u6587 ');
      logInfo(`step1 getBar(" ?? "): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('QNl5wwTDzcMM');
      subject.getContent('CXu8');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0774 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0775
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0775
     * @tc.desc      ComponentFactory call flow getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0775', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0775 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('x\u4e2d\u6587');
      logInfo(`step1 getBar("x??"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('DbCp');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0775 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0776
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0776
     * @tc.desc      ComponentFactory call flow toArray > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0776', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0776 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('ZEqWn0MffB7');
      const step3 = subject.getBar('miyb');
      logInfo(`step3 getBar("miyb"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0776 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0777
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0777
     * @tc.desc      ComponentFactory call flow getContent > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0777', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0777 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('X64CfWVVVH');
      subject.getContent('LOlUkMBnd');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0777 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0778
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0778
     * @tc.desc      ComponentFactory call flow getBar > delete > delete > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0778', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0778 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('e');
      logInfo(`step1 getBar("e"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('z8T4K');
      subject.delete('XNdC3ThDoNg');
      subject.getContent('swys');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0778 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0779
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0779
     * @tc.desc      ComponentFactory call flow delete > delete > getParams > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0779', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0779 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('u63n86V');
      subject.delete('aNv6D');
      subject.getParams('');
      const step4 = subject.getBar('L7LmJ9G');
      logInfo(`step4 getBar("L7LmJ9G"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.delete('Hello_1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0779 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0780
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0780
     * @tc.desc      ComponentFactory call flow getContent > getContent > delete > getBar > getParams keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0780', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0780 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('AllDljI');
      subject.getContent('1AlWfu7w');
      subject.delete('Q1ANx2oPtq');
      const step4 = subject.getBar('IBRvXI');
      logInfo(`step4 getBar("IBRvXI"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getParams('0dQ76ka');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0780 end`);
    });
  });
}
