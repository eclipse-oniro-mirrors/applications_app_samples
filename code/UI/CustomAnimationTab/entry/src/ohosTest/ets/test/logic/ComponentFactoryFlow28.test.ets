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

/** Logic checks for ComponentFactory flow (56 cases). */
export default function componentFactoryFlow28Test(): void {
  describe('ComponentFactoryFlow28Test', () => {
    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1945
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1945
     * @tc.desc      ComponentFactory call flow getContent > delete > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1945', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1945 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('TLBDIj0F7Coe');
      subject.delete('NnHshymU');
      subject.getContent('mv6');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1945 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1946
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1946
     * @tc.desc      ComponentFactory call flow getContent > getBar > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1946', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1946 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('hello worldhello world');
      const step2 = subject.getBar('BYHPHkdoCTWS');
      logInfo(`step2 getBar("BYHPHkdoCTWS"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('6DHUOhqDg8');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1946 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1947
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1947
     * @tc.desc      ComponentFactory call flow getParams > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1947', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1947 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('HelloHello');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1947 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1948
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1948
     * @tc.desc      ComponentFactory call flow getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1948', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1948 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('');
      logInfo(`step1 getBar(""): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1948 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1949
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1949
     * @tc.desc      ComponentFactory call flow getBar > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1949', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1949 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('0l');
      logInfo(`step1 getBar("0l"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('6Gs7');
      logInfo(`step2 getBar("6Gs7"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('YYQlkKt5AN');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1949 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1950
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1950
     * @tc.desc      ComponentFactory call flow toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1950', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1950 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1950 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1951
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1951
     * @tc.desc      ComponentFactory call flow getParams > toArray > getParams > getParams > getParams keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1951', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1951 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('dSl33ylyGdF');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('m8HTwLLgOyAe');
      subject.getParams('r');
      subject.getParams('bKAKSU');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1951 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1952
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1952
     * @tc.desc      ComponentFactory call flow getParams > delete > getBar > getContent > getParams keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1952', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1952 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('AXWsFqFpij');
      subject.delete('upg');
      const step3 = subject.getBar('PFOls05b2');
      logInfo(`step3 getBar("PFOls05b2"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('TM');
      subject.getParams('f1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1952 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1953
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1953
     * @tc.desc      ComponentFactory call flow toArray > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1953', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1953 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('Hello World_1');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1953 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1954
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1954
     * @tc.desc      ComponentFactory call flow delete > getParams > getBar > getContent > getParams keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1954', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1954 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('9Yxb3LyW2g');
      subject.getParams('I22XxBc');
      const step3 = subject.getBar(' 123 ');
      logInfo(`step3 getBar(" 123 "): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('8LIv');
      subject.getParams('9YLrXjHx6t');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1954 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1955
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1955
     * @tc.desc      ComponentFactory call flow getContent > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1955', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1955 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('0wQcs');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1955 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1956
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1956
     * @tc.desc      ComponentFactory call flow getContent > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1956', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1956 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('s7CZvpnN5wE0');
      const step2 = subject.getBar('Ov');
      logInfo(`step2 getBar("Ov"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('2OUPICNTu');
      logInfo(`step3 getBar("2OUPICNTu"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1956 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1957
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1957
     * @tc.desc      ComponentFactory call flow delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1957', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1957 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('fsnzJf2Zu');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1957 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1958
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1958
     * @tc.desc      ComponentFactory call flow toArray > getContent > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1958', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1958 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('Sw7D9');
      subject.delete('NUoPD1VLVZWo');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1958 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1959
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1959
     * @tc.desc      ComponentFactory call flow toArray > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1959', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1959 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('eECT3Cnise1I');
      logInfo(`step2 getBar("eECT3Cnise1I"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('p9vA3Qd');
      logInfo(`step3 getBar("p9vA3Qd"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1959 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1960
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1960
     * @tc.desc      ComponentFactory call flow getBar > getContent > getContent > getContent > getParams keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1960', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1960 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('L');
      logInfo(`step1 getBar("L"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('sp67XTpnyJGQ');
      subject.getContent('h');
      subject.getContent('xA');
      subject.getParams('iqIQ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1960 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1961
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1961
     * @tc.desc      ComponentFactory call flow getContent > getParams > getParams > getBar > getBar keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1961', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1961 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('Sample Title 123');
      subject.getParams('P5CfiBgO');
      subject.getParams('65H');
      const step4 = subject.getBar('Sample Title 123Sample Title 123');
      logInfo(`step4 getBar("Sample Title 123Sample Titl...: step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getBar('miyb');
      logInfo(`step5 getBar("miyb"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1961 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1962
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1962
     * @tc.desc      ComponentFactory call flow getBar > delete > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1962', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1962 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('xMtWdQu6');
      logInfo(`step1 getBar("xMtWdQu6"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('x5bX');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('jlxGvRARmD5f');
      logInfo(`step4 getBar("jlxGvRARmD5f"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1962 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1963
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1963
     * @tc.desc      ComponentFactory call flow getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1963', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1963 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('ik');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1963 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1964
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1964
     * @tc.desc      ComponentFactory call flow getParams > toArray > getBar > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1964', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1964 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('M2ShSF15');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('');
      logInfo(`step3 getBar(""): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('inIQz');
      subject.delete('aZyPzQa7arm');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1964 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1965
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1965
     * @tc.desc      ComponentFactory call flow getContent > getBar > toArray > getBar > getContent keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1965', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1965 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('x');
      const step2 = subject.getBar('UxuoihOCz');
      logInfo(`step2 getBar("UxuoihOCz"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('F3iIQDZ');
      logInfo(`step4 getBar("F3iIQDZ"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getContent('7aoKnwP');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1965 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1966
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1966
     * @tc.desc      ComponentFactory call flow toArray > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1966', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1966 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('5s');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1966 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1967
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1967
     * @tc.desc      ComponentFactory call flow getContent > getBar > getParams > toArray > getContent keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1967', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1967 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('JlPv');
      const step2 = subject.getBar('ae0');
      logInfo(`step2 getBar("ae0"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('ti2UlpzkdM2');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getContent('xBKm');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1967 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1968
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1968
     * @tc.desc      ComponentFactory call flow toArray > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1968', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1968 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('hU8bQlzh2x');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1968 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1969
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1969
     * @tc.desc      ComponentFactory call flow toArray > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1969', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1969 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('zoYGeOB');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1969 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1970
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1970
     * @tc.desc      ComponentFactory call flow getParams > delete > getBar > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1970', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1970 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('SaZUvlunWF');
      subject.delete('rU');
      const step3 = subject.getBar('0vSLrfP6Ad');
      logInfo(`step3 getBar("0vSLrfP6Ad"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('kRhUbvP8S');
      logInfo(`step4 getBar("kRhUbvP8S"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1970 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1971
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1971
     * @tc.desc      ComponentFactory call flow getParams > toArray > toArray > getParams > getBar keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1971', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1971 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('II9');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getParams('IhXNf');
      const step5 = subject.getBar('28cZ2bB4z5g');
      logInfo(`step5 getBar("28cZ2bB4z5g"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1971 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1972
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1972
     * @tc.desc      ComponentFactory call flow delete > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1972', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1972 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('x123');
      subject.getParams('mxJz');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1972 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1973
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1973
     * @tc.desc      ComponentFactory call flow getBar > getBar > delete > getContent > getContent keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1973', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1973 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('5f');
      logInfo(`step1 getBar("5f"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('Aw2U6KL');
      logInfo(`step2 getBar("Aw2U6KL"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('dM4YHaoN');
      subject.getContent('Hello');
      subject.getContent('3ZPW5');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1973 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1974
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1974
     * @tc.desc      ComponentFactory call flow getParams > toArray > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1974', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1974 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('iqIQ');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('gsD6x');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1974 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1975
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1975
     * @tc.desc      ComponentFactory call flow getContent > getContent > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1975', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1975 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('bozXXgG72');
      subject.getContent('zU');
      subject.getContent('c7lMng8ZM');
      const step4 = subject.getBar('a');
      logInfo(`step4 getBar("a"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1975 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1976
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1976
     * @tc.desc      ComponentFactory call flow getBar > getParams > getParams > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1976', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1976 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('xa');
      logInfo(`step1 getBar("xa"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('U2xjZrluups');
      subject.getParams('Fl');
      subject.delete('xTkzdKaT');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1976 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1977
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1977
     * @tc.desc      ComponentFactory call flow toArray > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1977', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1977 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('Z96HHRGPJ');
      logInfo(`step3 getBar("Z96HHRGPJ"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1977 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1978
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1978
     * @tc.desc      ComponentFactory call flow getBar > delete > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1978', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1978 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Ak4');
      logInfo(`step1 getBar("Ak4"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('b');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('WRd');
      logInfo(`step4 getBar("WRd"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1978 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1979
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1979
     * @tc.desc      ComponentFactory call flow getContent > toArray > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1979', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1979 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('Q2JoWYCcStw');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('i685dQSQE');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1979 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1980
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1980
     * @tc.desc      ComponentFactory call flow getBar > getContent > getParams > getParams > getParams keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1980', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1980 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('3Pe');
      logInfo(`step1 getBar("3Pe"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('ik');
      subject.getParams('9JNMtgePsoc');
      subject.getParams('ZEqWn0MffB7');
      subject.getParams('AQQtOTN');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1980 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1981
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1981
     * @tc.desc      ComponentFactory call flow getContent > getContent > getParams > toArray > delete keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1981', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1981 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('8RUUG');
      subject.getContent('uR');
      subject.getParams('jKT9Pt');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.delete('aHkr');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1981 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1982
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1982
     * @tc.desc      ComponentFactory call flow delete > getBar > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1982', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1982 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('P');
      const step2 = subject.getBar('upjzRMbiEoc');
      logInfo(`step2 getBar("upjzRMbiEoc"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('7ZkFBoe');
      logInfo(`step3 getBar("7ZkFBoe"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('mv6');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1982 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1983
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1983
     * @tc.desc      ComponentFactory call flow getContent > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1983', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1983 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent(' A ');
      subject.delete('HZDvRFP9g');
      const step3 = subject.getBar('WCEOCcw2E2');
      logInfo(`step3 getBar("WCEOCcw2E2"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1983 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1984
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1984
     * @tc.desc      ComponentFactory call flow getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1984', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1984 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('P7r5');
      logInfo(`step1 getBar("P7r5"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1984 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1985
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1985
     * @tc.desc      ComponentFactory call flow toArray > toArray > getBar > getContent > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1985', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1985 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('O81E1pRljiV');
      logInfo(`step3 getBar("O81E1pRljiV"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('AllDljI');
      subject.delete('Fuod');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1985 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1986
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1986
     * @tc.desc      ComponentFactory call flow delete > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1986', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1986 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('fwynvaF');
      subject.getContent('4UPwWZl');
      const step3 = subject.getBar('a');
      logInfo(`step3 getBar("a"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1986 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1987
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1987
     * @tc.desc      ComponentFactory call flow toArray > getParams > getBar > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1987', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1987 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('Oeh3Zti');
      const step3 = subject.getBar('eltuIeS');
      logInfo(`step3 getBar("eltuIeS"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('tGx');
      logInfo(`step4 getBar("tGx"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.delete('earF3');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1987 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1988
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1988
     * @tc.desc      ComponentFactory call flow delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1988', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1988 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('9jfEVwbUxWSz');
      const step2 = subject.getBar(' Hello World ');
      logInfo(`step2 getBar(" Hello World "): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1988 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1989
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1989
     * @tc.desc      ComponentFactory call flow getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1989', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1989 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('CDfrwdMnV');
      logInfo(`step1 getBar("CDfrwdMnV"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('A');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1989 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1990
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1990
     * @tc.desc      ComponentFactory call flow toArray > getParams > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1990', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1990 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('Ej');
      const step3 = subject.getBar('MOWr');
      logInfo(`step3 getBar("MOWr"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1990 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1991
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1991
     * @tc.desc      ComponentFactory call flow getContent > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1991', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1991 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('4XSs');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('AV913N');
      logInfo(`step3 getBar("AV913N"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1991 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1992
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1992
     * @tc.desc      ComponentFactory call flow getBar > getParams > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1992', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1992 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('cf3CZgYgp');
      logInfo(`step1 getBar("cf3CZgYgp"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('123');
      subject.getContent('9WYSYc9Q');
      const step4 = subject.getBar('Bo4Qrnt');
      logInfo(`step4 getBar("Bo4Qrnt"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1992 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1993
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1993
     * @tc.desc      ComponentFactory call flow getBar > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1993', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1993 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('qr3Vm7rLf7E');
      logInfo(`step1 getBar("qr3Vm7rLf7E"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('eltuIeS');
      logInfo(`step2 getBar("eltuIeS"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('k');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1993 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1994
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1994
     * @tc.desc      ComponentFactory call flow getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1994', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1994 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('eLADslckWNfW');
      logInfo(`step1 getBar("eLADslckWNfW"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('wMr');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1994 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1995
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1995
     * @tc.desc      ComponentFactory call flow toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1995', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1995 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('PFOls05b2');
      logInfo(`step2 getBar("PFOls05b2"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1995 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1996
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1996
     * @tc.desc      ComponentFactory call flow delete > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1996', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1996 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('sz4qZ6Y');
      subject.delete('p7H');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1996 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1997
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1997
     * @tc.desc      ComponentFactory call flow getBar > getParams > delete > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1997', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1997 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('WG4eeWlpGG');
      logInfo(`step1 getBar("WG4eeWlpGG"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('KQe6F');
      subject.delete('58X36');
      subject.getContent('F');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1997 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1998
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1998
     * @tc.desc      ComponentFactory call flow getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1998', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1998 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('Sample Title 123');
      const step2 = subject.getBar('xabc');
      logInfo(`step2 getBar("xabc"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1998 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1999
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1999
     * @tc.desc      ComponentFactory call flow getBar > getBar > getContent > getParams > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1999', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1999 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('et');
      logInfo(`step1 getBar("et"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('BauR9pM8qz');
      logInfo(`step2 getBar("BauR9pM8qz"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('bISQH7qPL');
      subject.getParams('MedbmHHUIc');
      subject.delete('FEDAmRPXge');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1999 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_2000
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_2000
     * @tc.desc      ComponentFactory call flow toArray > getContent > delete > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_2000 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('ECtggVYxqC');
      subject.delete('fwynvaF');
      subject.delete('K');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_2000 end`);
    });
  });
}
