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

/** Logic checks for ComponentFactory flow (75 cases). */
export default function componentFactoryFlow4Test(): void {
  describe('ComponentFactoryFlow4Test', () => {
    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0188
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0188
     * @tc.desc      ComponentFactory call flow toArray > delete > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0188 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('QEDYfzwN');
      subject.getParams('2d');
      const step4 = subject.getBar('p9vA3Qd');
      logInfo(`step4 getBar("p9vA3Qd"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0188 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0189
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0189
     * @tc.desc      ComponentFactory call flow delete > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0189 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('YD4gWjooSL');
      const step2 = subject.getBar(' A ');
      logInfo(`step2 getBar(" A "): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('m');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0189 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0190
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0190
     * @tc.desc      ComponentFactory call flow getContent > getBar > getContent > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0190 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('123_1');
      const step2 = subject.getBar('Op312');
      logInfo(`step2 getBar("Op312"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('   ');
      subject.getParams('lq5');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0190 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0191
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0191
     * @tc.desc      ComponentFactory call flow toArray > getContent > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0191 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('tr9fihM1RvDV');
      subject.getContent('Hello');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0191 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0192
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0192
     * @tc.desc      ComponentFactory call flow toArray > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0192 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('DDVCz5ydJ6G');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0192 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0193
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0193
     * @tc.desc      ComponentFactory call flow toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0193 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('Hello_1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0193 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0194
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0194
     * @tc.desc      ComponentFactory call flow getContent > getContent > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0194 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('DpuswFSnb');
      subject.getContent('A2');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('eJuIlW3Qr');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0194 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0195
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0195
     * @tc.desc      ComponentFactory call flow toArray > getParams > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0195 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('qJVpmab5mq');
      subject.getParams('2bWAF');
      const step4 = subject.getBar('IBRvXI');
      logInfo(`step4 getBar("IBRvXI"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0195 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0196
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0196
     * @tc.desc      ComponentFactory call flow getBar > getContent > getContent > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0196 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('HelloHello');
      logInfo(`step1 getBar("HelloHello"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('J');
      subject.getContent('9FRWZAoj8b');
      subject.getParams('xA');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0196 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0197
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0197
     * @tc.desc      ComponentFactory call flow delete > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0197 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('futic8JODso');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0197 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0198
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0198
     * @tc.desc      ComponentFactory call flow getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0198 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('cy');
      logInfo(`step1 getBar("cy"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0198 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0199
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0199
     * @tc.desc      ComponentFactory call flow getContent > toArray > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0199 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('otBya');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0199 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0200
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0200
     * @tc.desc      ComponentFactory call flow getParams > getBar > delete > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0200 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('Fl');
      const step2 = subject.getBar('yzvnqAN');
      logInfo(`step2 getBar("yzvnqAN"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('uNmx');
      subject.getContent('B');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0200 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0201
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0201
     * @tc.desc      ComponentFactory call flow getParams > delete > getBar > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0201 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('GcdSixwo');
      subject.delete('bCA');
      const step3 = subject.getBar('SWLsCaq76HZR');
      logInfo(`step3 getBar("SWLsCaq76HZR"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('9f');
      subject.getParams('zLhiI');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0201 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0202
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0202
     * @tc.desc      ComponentFactory call flow getContent > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0202 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('yf');
      const step2 = subject.getBar('Uq96gDO3');
      logInfo(`step2 getBar("Uq96gDO3"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0202 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0203
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0203
     * @tc.desc      ComponentFactory call flow getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0203 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('EdSsHK3Z');
      logInfo(`step1 getBar("EdSsHK3Z"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('KCLPWyUfIW');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0203 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0204
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0204
     * @tc.desc      ComponentFactory call flow toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0204 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('EdSsHK3Z');
      logInfo(`step2 getBar("EdSsHK3Z"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0204 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0205
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0205
     * @tc.desc      ComponentFactory call flow delete > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0205 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('HZDvRFP9g');
      const step2 = subject.getBar('AFLB4sG');
      logInfo(`step2 getBar("AFLB4sG"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('A');
      logInfo(`step3 getBar("A"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0205 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0206
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0206
     * @tc.desc      ComponentFactory call flow getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0206 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('  ');
      logInfo(`step1 getBar("  "): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('p');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0206 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0207
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0207
     * @tc.desc      ComponentFactory call flow getParams > getParams > getParams > toArray > getContent keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0207 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('PqTAfLWDDl9');
      subject.getParams('Hello_1');
      subject.getParams('yobXge');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getContent('0Tn8NJB7UG');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0207 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0208
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0208
     * @tc.desc      ComponentFactory call flow getBar > toArray > getParams > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0208 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('s');
      logInfo(`step1 getBar("s"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('wCpONBzv9');
      subject.delete('o52ed3k1i');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0208 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0209
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0209
     * @tc.desc      ComponentFactory call flow getParams > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0209 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('rb6bBOpG0w');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('Dh');
      logInfo(`step3 getBar("Dh"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0209 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0210
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0210
     * @tc.desc      ComponentFactory call flow toArray > getParams > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0210 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('Yy');
      subject.delete('5CIlGrf0dH');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0210 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0211
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0211
     * @tc.desc      ComponentFactory call flow getParams > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0211 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('hU8bQlzh2x');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('swys');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0211 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0212
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0212
     * @tc.desc      ComponentFactory call flow getContent > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0212 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('myeVugAZM');
      subject.getContent('8LIv');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0212 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0213
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0213
     * @tc.desc      ComponentFactory call flow getParams > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0213 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('\u4e2d\u6587');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('LOlUkMBnd');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0213 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0214
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0214
     * @tc.desc      ComponentFactory call flow getParams > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0214 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('g4I3eAi8Zp4f');
      const step2 = subject.getBar('hello world_1');
      logInfo(`step2 getBar("hello world_1"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0214 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0215
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0215
     * @tc.desc      ComponentFactory call flow getParams > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0215 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('iqIQ');
      subject.getParams('l7Da1');
      const step3 = subject.getBar('G');
      logInfo(`step3 getBar("G"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0215 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0216
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0216
     * @tc.desc      ComponentFactory call flow delete > getContent > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0216 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('hello worldhello world');
      subject.getContent('gM0BsR6WaHlQ');
      const step3 = subject.getBar('dBblCxE4');
      logInfo(`step3 getBar("dBblCxE4"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('Ld');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0216 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0217
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0217
     * @tc.desc      ComponentFactory call flow getBar > getParams > getParams > getContent > getContent keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0217 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('eECT3Cnise1I');
      logInfo(`step1 getBar("eECT3Cnise1I"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('M2ShSF15');
      subject.getParams('oLuRAg');
      subject.getContent('AllDljI');
      subject.getContent('xBKm');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0217 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0218
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0218
     * @tc.desc      ComponentFactory call flow getContent > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0218 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('i');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('uNmx');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0218 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0219
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0219
     * @tc.desc      ComponentFactory call flow getContent > getContent > delete > toArray > getParams keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0219 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('mc');
      subject.getContent('ZKMKI');
      subject.delete('QNl5wwTDzcMM');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getParams('cxX8QMs');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0219 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0220
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0220
     * @tc.desc      ComponentFactory call flow getParams > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0220 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('j6zPJTMw');
      const step2 = subject.getBar('XkrydQBO');
      logInfo(`step2 getBar("XkrydQBO"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('Uq96gDO3');
      logInfo(`step3 getBar("Uq96gDO3"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0220 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0221
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0221
     * @tc.desc      ComponentFactory call flow toArray > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0221 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('CyPe');
      logInfo(`step2 getBar("CyPe"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('7qHQfp4He');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0221 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0222
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0222
     * @tc.desc      ComponentFactory call flow toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0222 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('AA');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0222 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0223
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0223
     * @tc.desc      ComponentFactory call flow toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0223 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('xA');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0223 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0224
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0224
     * @tc.desc      ComponentFactory call flow toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0224 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('7ziCRIc');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0224 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0225
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0225
     * @tc.desc      ComponentFactory call flow getParams > getBar > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0225 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('HikHof1f');
      const step2 = subject.getBar('l');
      logInfo(`step2 getBar("l"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('Hello WorldHello World');
      logInfo(`step3 getBar("Hello WorldHello World"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams(' Sample Title 123 ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0225 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0226
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0226
     * @tc.desc      ComponentFactory call flow delete > getBar > toArray > delete > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0226 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('Y81DfEBjzC');
      const step2 = subject.getBar('wCFzP5g');
      logInfo(`step2 getBar("wCFzP5g"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('6emR6k');
      subject.getContent('Hello WorldHello World');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0226 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0227
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0227
     * @tc.desc      ComponentFactory call flow delete > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0227 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('3');
      subject.delete('3KXiJ');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0227 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0228
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0228
     * @tc.desc      ComponentFactory call flow toArray > delete > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0228 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('U5ac1t');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getParams(' \u4e2d\u6587 ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0228 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0229
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0229
     * @tc.desc      ComponentFactory call flow delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0229 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('Q1ANx2oPtq');
      const step2 = subject.getBar('UxuoihOCz');
      logInfo(`step2 getBar("UxuoihOCz"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0229 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0230
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0230
     * @tc.desc      ComponentFactory call flow delete > delete > getBar > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0230 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('YD4gWjooSL');
      subject.delete('ASFrvK5j');
      const step3 = subject.getBar('DDvsyu');
      logInfo(`step3 getBar("DDvsyu"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getContent('TM');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0230 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0231
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0231
     * @tc.desc      ComponentFactory call flow getContent > toArray > getParams > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0231 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('Wy');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('hello world');
      subject.delete('g9');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0231 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0232
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0232
     * @tc.desc      ComponentFactory call flow getParams > delete > getContent > getContent > getBar keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0232 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('WTUedcyGAZ1');
      subject.delete('3mmJMh');
      subject.getContent('Zj3J0');
      subject.getContent('Q4ZKk');
      const step5 = subject.getBar('uLvz1');
      logInfo(`step5 getBar("uLvz1"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0232 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0233
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0233
     * @tc.desc      ComponentFactory call flow getBar > toArray > getContent > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0233 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('a');
      logInfo(`step1 getBar("a"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('2Hl3ViT');
      subject.delete('gcI');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0233 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0234
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0234
     * @tc.desc      ComponentFactory call flow getParams > getParams > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0234 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('H7QASzBFrfnn');
      subject.getParams('r1OLSW8kuXJ');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('0s2nrz3zIDM');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0234 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0235
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0235
     * @tc.desc      ComponentFactory call flow toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0235 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0235 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0236
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0236
     * @tc.desc      ComponentFactory call flow getBar > getContent > getParams > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0236 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('3LN2SuKY4');
      logInfo(`step1 getBar("3LN2SuKY4"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('Ep');
      subject.getParams('cft2jduykq');
      subject.getParams('gT');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0236 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0237
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0237
     * @tc.desc      ComponentFactory call flow getParams > getBar > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0237 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('Sample Title 123_1');
      const step2 = subject.getBar('uwe90');
      logInfo(`step2 getBar("uwe90"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('l');
      logInfo(`step3 getBar("l"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('yf');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0237 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0238
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0238
     * @tc.desc      ComponentFactory call flow getBar > getParams > getContent > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0238 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('n6t');
      logInfo(`step1 getBar("n6t"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('XVP');
      subject.getContent('Lsqkixb');
      subject.delete('rh2f6yPSgIA');
      subject.delete('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0238 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0239
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0239
     * @tc.desc      ComponentFactory call flow toArray > getParams > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0239 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('3');
      subject.delete('g9');
      subject.getParams('ML4Kk6');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0239 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0240
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0240
     * @tc.desc      ComponentFactory call flow getParams > getContent > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0240 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('K0lV');
      subject.getContent('XsspxL');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0240 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0241
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0241
     * @tc.desc      ComponentFactory call flow toArray > getParams > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0241 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('pwoK7bO1YT');
      subject.getContent('eAYcBjsH');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0241 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0242
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0242
     * @tc.desc      ComponentFactory call flow getBar > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0242 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('NX1KxSeWWOe');
      logInfo(`step1 getBar("NX1KxSeWWOe"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('KUCQL');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0242 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0243
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0243
     * @tc.desc      ComponentFactory call flow getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0243 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('MU');
      logInfo(`step1 getBar("MU"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0243 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0244
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0244
     * @tc.desc      ComponentFactory call flow getParams > getParams > getBar > delete > getContent keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0244 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('cft2jduykq');
      subject.getParams('hGpqi45M3yCU');
      const step3 = subject.getBar(' abc ');
      logInfo(`step3 getBar(" abc "): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('x\u4e2d\u6587');
      subject.getContent('b8vshwWWo68');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0244 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0245
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0245
     * @tc.desc      ComponentFactory call flow getBar > getContent > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0245 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('AV913N');
      logInfo(`step1 getBar("AV913N"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('qg11IZpfs9');
      subject.delete('d');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0245 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0246
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0246
     * @tc.desc      ComponentFactory call flow delete > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0246 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('slmFzqKNFkHC');
      subject.getContent('p57pLqj4iPEd');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0246 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0247
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0247
     * @tc.desc      ComponentFactory call flow getParams > delete > toArray > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0247 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('Fl');
      subject.delete('VRHQckRveA6e');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.delete('zo');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0247 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0248
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0248
     * @tc.desc      ComponentFactory call flow toArray > getContent > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0248 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('mc');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('Hello World');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0248 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0249
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0249
     * @tc.desc      ComponentFactory call flow getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0249 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('ElxJx2W2C');
      logInfo(`step1 getBar("ElxJx2W2C"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('xiAG');
      logInfo(`step2 getBar("xiAG"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0249 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0250
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0250
     * @tc.desc      ComponentFactory call flow getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0250 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('rlMC8');
      logInfo(`step1 getBar("rlMC8"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('XKKUPI7txYk');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0250 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0251
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0251
     * @tc.desc      ComponentFactory call flow delete > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0251 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('i');
      subject.getContent('R6Cty5d');
      const step3 = subject.getBar('b0T');
      logInfo(`step3 getBar("b0T"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0251 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0252
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0252
     * @tc.desc      ComponentFactory call flow getParams > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0252 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('Kr4Ng');
      subject.getContent('7Fn4');
      const step3 = subject.getBar(' hello world ');
      logInfo(`step3 getBar(" hello world "): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0252 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0253
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0253
     * @tc.desc      ComponentFactory call flow getParams > getBar > getParams > delete > getContent keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0253 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('123_1');
      const step2 = subject.getBar('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`step2 getBar("????"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('x123');
      subject.delete('uRl170MkqV6');
      subject.getContent('sGzPsbc');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0253 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0254
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0254
     * @tc.desc      ComponentFactory call flow delete > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0254 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('gcI');
      const step2 = subject.getBar('P84ipO3HrA');
      logInfo(`step2 getBar("P84ipO3HrA"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('tye5mQmEDCCM');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0254 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0255
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0255
     * @tc.desc      ComponentFactory call flow getContent > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0255 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent(' ');
      const step2 = subject.getBar('4emy0O7');
      logInfo(`step2 getBar("4emy0O7"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0255 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0256
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0256
     * @tc.desc      ComponentFactory call flow delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0256 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('UizjmYBE');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0256 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0257
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0257
     * @tc.desc      ComponentFactory call flow getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0257 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('Fu');
      const step2 = subject.getBar('BauR9pM8qz');
      logInfo(`step2 getBar("BauR9pM8qz"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0257 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0258
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0258
     * @tc.desc      ComponentFactory call flow getBar > getContent > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0258 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('EdSsHK3Z');
      logInfo(`step1 getBar("EdSsHK3Z"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('VySbhZ2Tc');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getParams('AF7Fx9LP');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0258 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0259
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0259
     * @tc.desc      ComponentFactory call flow getContent > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0259 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('UV7n36');
      subject.delete('DDVCz5ydJ6G');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0259 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0260
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0260
     * @tc.desc      ComponentFactory call flow getContent > getContent > delete > getContent > toArray keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0260 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('Hello WorldHello World');
      subject.getContent('EzNIsPj');
      subject.delete('77jE');
      subject.getContent('UjnC9gnByt');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0260 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0261
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0261
     * @tc.desc      ComponentFactory call flow toArray > getContent > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0261 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('xBKm');
      subject.delete('q5wUacf5Ddpq');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0261 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0262
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0262
     * @tc.desc      ComponentFactory call flow delete > getContent > toArray > toArray > getParams keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0262 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('CGZhNcAL');
      subject.getContent('KBhrxv');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getParams(' Sample Title 123 ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0262 end`);
    });
  });
}
