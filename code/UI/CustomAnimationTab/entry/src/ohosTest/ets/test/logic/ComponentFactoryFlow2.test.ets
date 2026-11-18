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

/** Logic checks for ComponentFactory flow (61 cases). */
export default function componentFactoryFlow2Test(): void {
  describe('ComponentFactoryFlow2Test', () => {
    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0067
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0067
     * @tc.desc      ComponentFactory call flow toArray > getContent > getBar > getBar > getContent keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0067 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('zx');
      const step3 = subject.getBar('ElxJx2W2C');
      logInfo(`step3 getBar("ElxJx2W2C"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('9l');
      logInfo(`step4 getBar("9l"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getContent('dh1PdJ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0067 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0068
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0068
     * @tc.desc      ComponentFactory call flow delete > delete > getBar > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0068 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('XKxsM0oJspL');
      subject.delete('Sample Title 123_1');
      const step3 = subject.getBar('njB9hbOH');
      logInfo(`step3 getBar("njB9hbOH"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('b0T');
      logInfo(`step4 getBar("b0T"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0068 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0069
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0069
     * @tc.desc      ComponentFactory call flow getContent > getContent > getBar > getBar > getBar keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0069 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('2atXJqonx0');
      subject.getContent('AllDljI');
      const step3 = subject.getBar('eltuIeS');
      logInfo(`step3 getBar("eltuIeS"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('3Pe');
      logInfo(`step4 getBar("3Pe"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getBar('EdSsHK3Z');
      logInfo(`step5 getBar("EdSsHK3Z"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0069 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0070
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0070
     * @tc.desc      ComponentFactory call flow getBar > toArray > delete > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0070 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('ZhT9z0B');
      logInfo(`step1 getBar("ZhT9z0B"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('aNv6D');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getContent('Ie8vBhT');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0070 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0071
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0071
     * @tc.desc      ComponentFactory call flow getParams > getContent > getBar > getContent > toArray keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0071 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('mY5pW6J');
      subject.getContent('HZYhpUbfgQ2');
      const step3 = subject.getBar('xa');
      logInfo(`step3 getBar("xa"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('hello world');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0071 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0072
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0072
     * @tc.desc      ComponentFactory call flow toArray > toArray > toArray > getContent > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0072 begin`);
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
      subject.getContent('Lsqkixb');
      subject.delete('8j');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0072 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0073
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0073
     * @tc.desc      ComponentFactory call flow getParams > toArray > getBar > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0073 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('xHello World');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('xSample Title 123');
      logInfo(`step3 getBar("xSample Title 123"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('BgKI');
      const step5 = subject.getBar('  ');
      logInfo(`step5 getBar("  "): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0073 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0074
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0074
     * @tc.desc      ComponentFactory call flow getBar > getParams > getBar > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0074 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('DM9T23Gtl2');
      logInfo(`step1 getBar("DM9T23Gtl2"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('PMGOs7Xt');
      const step3 = subject.getBar('eLADslckWNfW');
      logInfo(`step3 getBar("eLADslckWNfW"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('xhello world');
      const step5 = subject.getBar('xZ');
      logInfo(`step5 getBar("xZ"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0074 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0075
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0075
     * @tc.desc      ComponentFactory call flow toArray > getParams > getBar > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0075 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('PqTAfLWDDl9');
      const step3 = subject.getBar('NW');
      logInfo(`step3 getBar("NW"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('hRvutu0B');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0075 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0076
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0076
     * @tc.desc      ComponentFactory call flow getContent > delete > toArray > getBar > getContent keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0076 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('AllDljI');
      subject.delete('8uYGsOLyg');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('cX2');
      logInfo(`step4 getBar("cX2"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getContent('lwaYIV8OC');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0076 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0077
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0077
     * @tc.desc      ComponentFactory call flow getParams > getBar > toArray > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0077 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('yKIG4eakeO');
      const step2 = subject.getBar('ZhkaZi8GuZK');
      logInfo(`step2 getBar("ZhkaZi8GuZK"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('IkSzXDcXT');
      logInfo(`step4 getBar("IkSzXDcXT"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0077 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0078
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0078
     * @tc.desc      ComponentFactory call flow getParams > toArray > getBar > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0078 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('hello world_1');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('x ');
      logInfo(`step3 getBar("x "): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar(' ');
      logInfo(`step4 getBar(" "): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.delete('   ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0078 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0079
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0079
     * @tc.desc      ComponentFactory call flow delete > getBar > getBar > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0079 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('5W35fb');
      const step2 = subject.getBar('ayCVc6W3E');
      logInfo(`step2 getBar("ayCVc6W3E"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('8k');
      logInfo(`step3 getBar("8k"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('x');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0079 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0080
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0080
     * @tc.desc      ComponentFactory call flow getBar > toArray > toArray > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0080 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('a');
      logInfo(`step1 getBar("a"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('v');
      logInfo(`step4 getBar("v"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getBar('WF2dJw');
      logInfo(`step5 getBar("WF2dJw"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0080 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0081
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0081
     * @tc.desc      ComponentFactory call flow getBar > getBar > toArray > getContent > getParams keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0081 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('pwKq2PGxlZ9E');
      logInfo(`step1 getBar("pwKq2PGxlZ9E"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('e4');
      logInfo(`step2 getBar("e4"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('XsspxL');
      subject.getParams('9JNMtgePsoc');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0081 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0082
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0082
     * @tc.desc      ComponentFactory call flow getBar > getBar > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0082 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('hiTxVp');
      logInfo(`step1 getBar("hiTxVp"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('A_1');
      logInfo(`step2 getBar("A_1"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('Wi6jAzzq6AL7');
      const step4 = subject.getBar('eECT3Cnise1I');
      logInfo(`step4 getBar("eECT3Cnise1I"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0082 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0083
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0083
     * @tc.desc      ComponentFactory call flow getContent > getBar > getParams > delete > toArray keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0083 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('xZK');
      const step2 = subject.getBar('BeFW5WczN');
      logInfo(`step2 getBar("BeFW5WczN"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('abcabc');
      subject.delete('BaRzkvGihLV');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0083 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0084
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0084
     * @tc.desc      ComponentFactory call flow toArray > toArray > toArray > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0084 begin`);
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
      const step4 = subject.getBar('ICcp');
      logInfo(`step4 getBar("ICcp"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getParams('bRqkq5NaRX');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0084 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0085
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0085
     * @tc.desc      ComponentFactory call flow toArray > delete > getParams > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0085 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('riS');
      subject.getParams('dSl33ylyGdF');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0085 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0086
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0086
     * @tc.desc      ComponentFactory call flow delete > toArray > getContent > getParams > getBar keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0086 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('aZyPzQa7arm');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('S0HWBvzTs');
      subject.getParams('I22XxBc');
      const step5 = subject.getBar('rlMC8');
      logInfo(`step5 getBar("rlMC8"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0086 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0087
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0087
     * @tc.desc      ComponentFactory call flow getBar > toArray > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0087 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('etSuf');
      logInfo(`step1 getBar("etSuf"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getParams('xSample Title 123');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0087 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0088
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0088
     * @tc.desc      ComponentFactory call flow getParams > delete > delete > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0088 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('0');
      subject.delete('qhse');
      subject.delete('chSGAb3Lmu');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0088 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0089
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0089
     * @tc.desc      ComponentFactory call flow getParams > toArray > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0089 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('bKAKSU');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('Hello_1');
      logInfo(`step3 getBar("Hello_1"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0089 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0090
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0090
     * @tc.desc      ComponentFactory call flow getContent > toArray > toArray > getContent > toArray keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0090 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('2EqNO2X');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('UV7n36');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0090 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0091
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0091
     * @tc.desc      ComponentFactory call flow getBar > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0091 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Ov');
      logInfo(`step1 getBar("Ov"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar(' _1');
      logInfo(`step2 getBar(" _1"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('etSuf');
      logInfo(`step3 getBar("etSuf"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0091 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0092
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0092
     * @tc.desc      ComponentFactory call flow getContent > toArray > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0092 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('LLU2HUi');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('Lu');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0092 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0093
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0093
     * @tc.desc      ComponentFactory call flow getBar > getBar > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0093 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar(' \u4e2d\u6587 ');
      logInfo(`step1 getBar(" ?? "): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('hello worldhello world');
      logInfo(`step2 getBar("hello worldhello world"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0093 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0094
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0094
     * @tc.desc      ComponentFactory call flow getBar > getContent > toArray > getBar > getContent keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0094 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('vYncp');
      logInfo(`step1 getBar("vYncp"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('S');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('4dnloBNO2xf');
      logInfo(`step4 getBar("4dnloBNO2xf"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getContent('NwT');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0094 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0095
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0095
     * @tc.desc      ComponentFactory call flow toArray > getBar > getParams > toArray > getContent keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0095 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('HelloHello');
      logInfo(`step2 getBar("HelloHello"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('qWYQl');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getContent('Po1TV91Y');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0095 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0096
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0096
     * @tc.desc      ComponentFactory call flow toArray > toArray > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0096 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('IkSzXDcXT');
      logInfo(`step3 getBar("IkSzXDcXT"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('BeFW5WczN');
      logInfo(`step4 getBar("BeFW5WczN"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0096 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0097
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0097
     * @tc.desc      ComponentFactory call flow toArray > delete > getParams > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0097 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('pmm');
      subject.getParams('K0lV');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5 = subject.getBar(' \u4e2d\u6587 ');
      logInfo(`step5 getBar(" ?? "): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0097 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0098
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0098
     * @tc.desc      ComponentFactory call flow getParams > toArray > toArray > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0098 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('sbxkifFIV');
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
      logInfo(`${BUNDLE}ComponentFactoryFlow_0098 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0099
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0099
     * @tc.desc      ComponentFactory call flow getBar > getContent > getParams > toArray > toArray keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0099 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('ck72LRrke');
      logInfo(`step1 getBar("ck72LRrke"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('7aoKnwP');
      subject.getParams('bRqkq5NaRX');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0099 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0100
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0100
     * @tc.desc      ComponentFactory call flow getParams > toArray > getParams > getBar > toArray keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0100 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('Y');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('2pjqf');
      const step4 = subject.getBar('adEU1fZJ');
      logInfo(`step4 getBar("adEU1fZJ"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0100 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0101
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0101
     * @tc.desc      ComponentFactory call flow getBar > toArray > toArray > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0101 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('T');
      logInfo(`step1 getBar("T"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('IHZz2H');
      logInfo(`step4 getBar("IHZz2H"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getParams('j6zPJTMw');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0101 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0102
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0102
     * @tc.desc      ComponentFactory call flow getParams > toArray > getBar > getParams > toArray keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0102 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('XVP');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('mb');
      logInfo(`step3 getBar("mb"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('qWYQl');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0102 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0103
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0103
     * @tc.desc      ComponentFactory call flow getBar > toArray > getParams > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0103 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Ov');
      logInfo(`step1 getBar("Ov"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('123123');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5 = subject.getBar('rlMC8');
      logInfo(`step5 getBar("rlMC8"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0103 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0104
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0104
     * @tc.desc      ComponentFactory call flow toArray > getContent > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0104 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('gCMaP7');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('dsc6Ba0');
      logInfo(`step4 getBar("dsc6Ba0"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0104 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0105
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0105
     * @tc.desc      ComponentFactory call flow getBar > toArray > getParams > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0105 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('ciB48JMXh');
      logInfo(`step1 getBar("ciB48JMXh"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams(' abc ');
      subject.getParams('Sample Title 123');
      const step5 = subject.getBar('etSuf');
      logInfo(`step5 getBar("etSuf"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0105 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0106
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0106
     * @tc.desc      ComponentFactory call flow delete > getBar > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0106 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('H588SnQLlH');
      const step2 = subject.getBar('G7OT8');
      logInfo(`step2 getBar("G7OT8"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('upjzRMbiEoc');
      logInfo(`step3 getBar("upjzRMbiEoc"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('xA');
      logInfo(`step4 getBar("xA"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0106 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0107
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0107
     * @tc.desc      ComponentFactory call flow toArray > getContent > getBar > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0107 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('dJIIvl');
      const step3 = subject.getBar('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`step3 getBar("????"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0107 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0108
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0108
     * @tc.desc      ComponentFactory call flow getParams > toArray > getBar > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0108 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('abc_1');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('zBPStDSd46');
      logInfo(`step3 getBar("zBPStDSd46"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0108 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0109
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0109
     * @tc.desc      ComponentFactory call flow delete > toArray > delete > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0109 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('3O7FJ2Sv');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('aa');
      const step4 = subject.getBar('123123');
      logInfo(`step4 getBar("123123"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getBar('YEaX');
      logInfo(`step5 getBar("YEaX"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0109 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0110
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0110
     * @tc.desc      ComponentFactory call flow toArray > toArray > delete > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0110 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('0VsvJoEp');
      subject.getContent('123');
      const step5 = subject.getBar('L');
      logInfo(`step5 getBar("L"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0110 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0111
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0111
     * @tc.desc      ComponentFactory call flow getParams > getBar > toArray > toArray > getParams keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0111 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('MO0ZHZa');
      const step2 = subject.getBar('e7qxFXB9Kbb');
      logInfo(`step2 getBar("e7qxFXB9Kbb"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getParams('zLhiI');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0111 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0112
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0112
     * @tc.desc      ComponentFactory call flow getBar > getBar > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0112 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('xa');
      logInfo(`step1 getBar("xa"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('BeFW5WczN');
      logInfo(`step2 getBar("BeFW5WczN"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('bxg');
      logInfo(`step3 getBar("bxg"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('xoCXqWLigfEo');
      logInfo(`step4 getBar("xoCXqWLigfEo"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0112 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0113
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0113
     * @tc.desc      ComponentFactory call flow toArray > getBar > getParams > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0113 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('cX2');
      logInfo(`step2 getBar("cX2"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('SDo92I7HlZ');
      subject.delete('fsnzJf2Zu');
      const step5 = subject.getBar('xA');
      logInfo(`step5 getBar("xA"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0113 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0114
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0114
     * @tc.desc      ComponentFactory call flow toArray > getParams > getBar > getContent > getBar keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0114 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('LvcwiewBc');
      const step3 = subject.getBar('Pwt6zZsPyvP');
      logInfo(`step3 getBar("Pwt6zZsPyvP"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('PEM4');
      const step5 = subject.getBar('6Tomqj');
      logInfo(`step5 getBar("6Tomqj"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0114 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0115
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0115
     * @tc.desc      ComponentFactory call flow toArray > getBar > toArray > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0115 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('MOWr');
      logInfo(`step2 getBar("MOWr"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('o52ed3k1i');
      const step5 = subject.getBar('thaeTW');
      logInfo(`step5 getBar("thaeTW"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0115 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0116
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0116
     * @tc.desc      ComponentFactory call flow getParams > getBar > getParams > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0116 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('2JPijen1b');
      const step2 = subject.getBar('sr');
      logInfo(`step2 getBar("sr"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('Sample Title 123Sample Title 123');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5 = subject.getBar('e7qxFXB9Kbb');
      logInfo(`step5 getBar("e7qxFXB9Kbb"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0116 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0117
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0117
     * @tc.desc      ComponentFactory call flow delete > delete > toArray > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0117 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('Uxp');
      subject.delete('aHkr');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('gM0BsR6WaHlQ');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0117 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0118
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0118
     * @tc.desc      ComponentFactory call flow getBar > getParams > delete > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0118 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('ofWYb');
      logInfo(`step1 getBar("ofWYb"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('xhello world');
      subject.delete('Q1ANx2oPtq');
      subject.getContent('RzPo4Flq7657');
      const step5 = subject.getBar('As0kvJU');
      logInfo(`step5 getBar("As0kvJU"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0118 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0119
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0119
     * @tc.desc      ComponentFactory call flow toArray > getBar > toArray > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0119 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('F3iIQDZ');
      logInfo(`step2 getBar("F3iIQDZ"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getParams(' _1');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0119 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0120
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0120
     * @tc.desc      ComponentFactory call flow toArray > getBar > getContent > getParams > toArray keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0120 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('NX1KxSeWWOe');
      logInfo(`step2 getBar("NX1KxSeWWOe"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('ZOfGU3m5fzix');
      subject.getParams('mkLMR8SOQh');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0120 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0121
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0121
     * @tc.desc      ComponentFactory call flow getParams > getContent > toArray > toArray > getBar keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0121 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('Oeh3Zti');
      subject.getContent('KBhrxv');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5 = subject.getBar('rlMC8');
      logInfo(`step5 getBar("rlMC8"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0121 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0122
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0122
     * @tc.desc      ComponentFactory call flow getParams > toArray > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0122 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('aog');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('s');
      logInfo(`step4 getBar("s"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0122 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0123
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0123
     * @tc.desc      ComponentFactory call flow getBar > delete > delete > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0123 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('XHj0');
      logInfo(`step1 getBar("XHj0"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('2YgDIi9nw');
      subject.delete('XNdC3ThDoNg');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5 = subject.getBar('rlMC8');
      logInfo(`step5 getBar("rlMC8"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0123 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0124
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0124
     * @tc.desc      ComponentFactory call flow getContent > getBar > getParams > getContent > getBar keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0124 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('KBhrxv');
      const step2 = subject.getBar('T3gG4OsbMtFD');
      logInfo(`step2 getBar("T3gG4OsbMtFD"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('jxGacmhL');
      subject.getContent('otBya');
      const step5 = subject.getBar('1MYBqsx53n');
      logInfo(`step5 getBar("1MYBqsx53n"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0124 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0125
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0125
     * @tc.desc      ComponentFactory call flow toArray > toArray > delete > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0125 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('xXOmAO1G');
      subject.delete('VRHQckRveA6e');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0125 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0126
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0126
     * @tc.desc      ComponentFactory call flow delete > getBar > delete > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0126 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('jhT1oX');
      const step2 = subject.getBar('dBblCxE4');
      logInfo(`step2 getBar("dBblCxE4"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('R');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getContent('WBLf');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0126 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0127
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0127
     * @tc.desc      ComponentFactory call flow delete > getParams > getParams > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0127 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('chSGAb3Lmu');
      subject.getParams('dEkGT');
      subject.getParams('dEkCFIvXd');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5 = subject.getBar('G');
      logInfo(`step5 getBar("G"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0127 end`);
    });
  });
}
