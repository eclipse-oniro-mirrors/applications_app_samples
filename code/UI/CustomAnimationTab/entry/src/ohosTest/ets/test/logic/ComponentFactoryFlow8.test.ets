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
export default function componentFactoryFlow8Test(): void {
  describe('ComponentFactoryFlow8Test', () => {
    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0489
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0489
     * @tc.desc      ComponentFactory call flow getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0489', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0489 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('9WYSYc9Q');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0489 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0490
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0490
     * @tc.desc      ComponentFactory call flow toArray > toArray > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0490', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0490 begin`);
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
      subject.getContent('zU');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0490 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0491
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0491
     * @tc.desc      ComponentFactory call flow getContent > toArray > getParams > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0491', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0491 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent(' a ');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams(' Sample Title 123 ');
      subject.getContent('PjjA');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0491 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0492
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0492
     * @tc.desc      ComponentFactory call flow getParams > delete > getBar > toArray > getContent keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0492', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0492 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('aa');
      subject.delete('CuTzMjV');
      const step3 = subject.getBar('mias4qIIlm');
      logInfo(`step3 getBar("mias4qIIlm"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getContent('ghu5YI9wHEI');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0492 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0493
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0493
     * @tc.desc      ComponentFactory call flow getContent > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0493', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0493 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('llDFYCi');
      subject.getContent('Hello WorldHello World');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0493 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0494
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0494
     * @tc.desc      ComponentFactory call flow getBar > toArray > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0494', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0494 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('O6CfKF');
      logInfo(`step1 getBar("O6CfKF"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('Hello_1');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0494 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0495
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0495
     * @tc.desc      ComponentFactory call flow delete > getParams > getParams > getBar > getContent keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0495', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0495 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('VRHQckRveA6e');
      subject.getParams('arjTurXZeMbR');
      subject.getParams('vi7UE7l39C4');
      const step4 = subject.getBar('l');
      logInfo(`step4 getBar("l"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getContent('R6Cty5d');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0495 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0496
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0496
     * @tc.desc      ComponentFactory call flow getBar > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0496', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0496 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('NX1KxSeWWOe');
      logInfo(`step1 getBar("NX1KxSeWWOe"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('Ak4');
      logInfo(`step3 getBar("Ak4"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0496 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0497
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0497
     * @tc.desc      ComponentFactory call flow getParams > getContent > getBar > getContent > delete keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0497', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0497 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('9YLrXjHx6t');
      subject.getContent('4UPwWZl');
      const step3 = subject.getBar('ZhkaZi8GuZK');
      logInfo(`step3 getBar("ZhkaZi8GuZK"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('UV7n36');
      subject.delete('Hello World_1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0497 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0498
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0498
     * @tc.desc      ComponentFactory call flow getContent > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0498', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0498 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('Cxfm40FDJmt');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0498 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0499
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0499
     * @tc.desc      ComponentFactory call flow toArray > getContent > getBar > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0499', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0499 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('R6Cty5d');
      const step3 = subject.getBar('Ak4');
      logInfo(`step3 getBar("Ak4"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('5dhNrgKRA');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0499 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0500
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0500
     * @tc.desc      ComponentFactory call flow toArray > toArray > getContent > toArray > getContent keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0500 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('XWEWfC');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getContent('9shlXE');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0500 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0501
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0501
     * @tc.desc      ComponentFactory call flow delete > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0501', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0501 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('b');
      const step2 = subject.getBar('o7B5g');
      logInfo(`step2 getBar("o7B5g"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('Eo');
      logInfo(`step3 getBar("Eo"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0501 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0502
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0502
     * @tc.desc      ComponentFactory call flow getParams > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0502', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0502 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('H7QASzBFrfnn');
      subject.getContent('fAN');
      const step3 = subject.getBar('DSfb');
      logInfo(`step3 getBar("DSfb"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0502 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0503
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0503
     * @tc.desc      ComponentFactory call flow toArray > getContent > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0503', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0503 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('wMr');
      const step3 = subject.getBar('ED');
      logInfo(`step3 getBar("ED"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('8MUd8zV');
      logInfo(`step4 getBar("8MUd8zV"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0503 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0504
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0504
     * @tc.desc      ComponentFactory call flow toArray > toArray > delete > getContent > getContent keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0504', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0504 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('3KXiJ');
      subject.getContent('xA');
      subject.getContent('3Ymm5m7acs');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0504 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0505
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0505
     * @tc.desc      ComponentFactory call flow toArray > delete > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0505', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0505 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('7v');
      subject.getContent('c7lMng8ZM');
      const step4 = subject.getBar('onHMSlNH');
      logInfo(`step4 getBar("onHMSlNH"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0505 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0506
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0506
     * @tc.desc      ComponentFactory call flow getBar > getContent > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0506', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0506 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('hCxdZO');
      logInfo(`step1 getBar("hCxdZO"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('7C');
      subject.getContent('hE');
      const step4 = subject.getBar('sr');
      logInfo(`step4 getBar("sr"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0506 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0507
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0507
     * @tc.desc      ComponentFactory call flow delete > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0507', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0507 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('sz4qZ6Y');
      const step2 = subject.getBar('qr3Vm7rLf7E');
      logInfo(`step2 getBar("qr3Vm7rLf7E"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('0wQcs');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0507 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0508
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0508
     * @tc.desc      ComponentFactory call flow getBar > getBar > delete > getContent > getContent keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0508', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0508 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Y');
      logInfo(`step1 getBar("Y"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('d2e7M');
      logInfo(`step2 getBar("d2e7M"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('x ');
      subject.getContent('ij84GYmvSI39');
      subject.getContent(' hello world ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0508 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0509
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0509
     * @tc.desc      ComponentFactory call flow getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0509', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0509 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('ghu5YI9wHEI');
      const step2 = subject.getBar('MU');
      logInfo(`step2 getBar("MU"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0509 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0510
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0510
     * @tc.desc      ComponentFactory call flow getBar > getContent > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0510 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('6YBKgd');
      logInfo(`step1 getBar("6YBKgd"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('123_1');
      subject.delete('0f2lJSgLEE');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0510 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0511
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0511
     * @tc.desc      ComponentFactory call flow getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0511', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0511 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('YYQlkKt5AN');
      const step2 = subject.getBar('y3BmY2P9');
      logInfo(`step2 getBar("y3BmY2P9"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0511 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0512
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0512
     * @tc.desc      ComponentFactory call flow getParams > toArray > getContent > toArray > delete keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0512', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0512 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('8H');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('JlPv');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.delete('x5bX');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0512 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0513
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0513
     * @tc.desc      ComponentFactory call flow toArray > delete > getContent > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0513', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0513 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('3KXiJ');
      subject.getContent('cm');
      subject.getContent('lGJxC');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0513 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0514
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0514
     * @tc.desc      ComponentFactory call flow getParams > getBar > getParams > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0514', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0514 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('xabc');
      const step2 = subject.getBar('a');
      logInfo(`step2 getBar("a"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('Tjb');
      subject.delete(' Sample Title 123 ');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0514 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0515
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0515
     * @tc.desc      ComponentFactory call flow toArray > getContent > getParams > getBar > getContent keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0515', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0515 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('7cMM5LUlu');
      subject.getParams('Fl');
      const step4 = subject.getBar(' Hello ');
      logInfo(`step4 getBar(" Hello "): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getContent('FtoCiTdI');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0515 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0516
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0516
     * @tc.desc      ComponentFactory call flow getBar > delete > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0516', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0516 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('DDvsyu');
      logInfo(`step1 getBar("DDvsyu"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('xA');
      subject.getContent('0QU5');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0516 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0517
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0517
     * @tc.desc      ComponentFactory call flow delete > toArray > delete > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0517', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0517 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('x\u4e2d\u6587');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('9Q');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getContent('Ie8vBhT');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0517 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0518
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0518
     * @tc.desc      ComponentFactory call flow getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0518', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0518 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('b5WJMy');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0518 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0519
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0519
     * @tc.desc      ComponentFactory call flow delete > delete > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0519', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0519 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('YRgTMZgh');
      subject.delete('FgDmNta9Bvr');
      subject.delete('\u4e2d\u6587');
      const step4 = subject.getBar('3Pe');
      logInfo(`step4 getBar("3Pe"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0519 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0520
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0520
     * @tc.desc      ComponentFactory call flow toArray > getBar > getContent > getContent > delete keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0520', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0520 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('2Q');
      logInfo(`step2 getBar("2Q"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('6Xzwmv0Kt');
      subject.getContent('zoYGeOB');
      subject.delete('hRvutu0B');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0520 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0521
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0521
     * @tc.desc      ComponentFactory call flow getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0521', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0521 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('zBPStDSd46');
      logInfo(`step1 getBar("zBPStDSd46"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('A2');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0521 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0522
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0522
     * @tc.desc      ComponentFactory call flow toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0522', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0522 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('eTf');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0522 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0523
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0523
     * @tc.desc      ComponentFactory call flow toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0523', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0523 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('8tsdK7xbk5');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0523 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0524
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0524
     * @tc.desc      ComponentFactory call flow getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0524', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0524 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('L');
      logInfo(`step1 getBar("L"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('QBFQTu');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0524 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0525
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0525
     * @tc.desc      ComponentFactory call flow getContent > getBar > toArray > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0525', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0525 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent(' A ');
      const step2 = subject.getBar('XkrydQBO');
      logInfo(`step2 getBar("XkrydQBO"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('A6gejCa00mXb');
      logInfo(`step4 getBar("A6gejCa00mXb"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0525 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0526
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0526
     * @tc.desc      ComponentFactory call flow getParams > toArray > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0526', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0526 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('WygLQEV');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('zj');
      logInfo(`step3 getBar("zj"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('T');
      logInfo(`step4 getBar("T"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0526 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0527
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0527
     * @tc.desc      ComponentFactory call flow toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0527', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0527 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('Zv4ZAUwRHoi');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0527 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0528
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0528
     * @tc.desc      ComponentFactory call flow getBar > delete > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0528', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0528 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('CyPe');
      logInfo(`step1 getBar("CyPe"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('J6uwV');
      subject.getContent('tj6q8');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0528 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0529
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0529
     * @tc.desc      ComponentFactory call flow getContent > delete > delete > getParams > toArray keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0529', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0529 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('glNOtEmitNG4');
      subject.delete('o52ed3k1i');
      subject.delete('YeZvSmculB');
      subject.getParams('9kN7kfusjr');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0529 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0530
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0530
     * @tc.desc      ComponentFactory call flow getParams > toArray > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0530', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0530 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('KQe6F');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('FgDmNta9Bvr');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0530 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0531
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0531
     * @tc.desc      ComponentFactory call flow getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0531', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0531 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('SWLsCaq76HZR');
      logInfo(`step1 getBar("SWLsCaq76HZR"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('n7vjxF1hrfT');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0531 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0532
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0532
     * @tc.desc      ComponentFactory call flow getParams > toArray > delete > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0532', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0532 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('xSample Title 123');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('PlJs');
      subject.delete('6y5vRO');
      const step5 = subject.getBar('P7r5');
      logInfo(`step5 getBar("P7r5"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0532 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0533
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0533
     * @tc.desc      ComponentFactory call flow delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0533', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0533 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('a_1');
      const step2 = subject.getBar(' \u4e2d\u6587 ');
      logInfo(`step2 getBar(" ?? "): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0533 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0534
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0534
     * @tc.desc      ComponentFactory call flow toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0534', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0534 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('PrQuLUQF');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0534 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0535
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0535
     * @tc.desc      ComponentFactory call flow getContent > delete > toArray > toArray > getContent keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0535', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0535 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('MUalu12Q');
      subject.delete('uNmx');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getContent('wL3pLxnOGXj');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0535 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0536
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0536
     * @tc.desc      ComponentFactory call flow getParams > delete > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0536', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0536 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('xhello world');
      subject.delete('bSxeDoYBn');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('P6');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0536 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0537
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0537
     * @tc.desc      ComponentFactory call flow getBar > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0537', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0537 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('s');
      logInfo(`step1 getBar("s"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('kaeCM0');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0537 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0538
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0538
     * @tc.desc      ComponentFactory call flow getParams > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0538', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0538 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('2JPijen1b');
      subject.getParams('bRqkq5NaRX');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0538 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0539
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0539
     * @tc.desc      ComponentFactory call flow getContent > delete > getParams > getParams > toArray keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0539', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0539 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('cv4YfHFsY1');
      subject.delete('xHello World');
      subject.getParams('G76');
      subject.getParams(' 123 ');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0539 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0540
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0540
     * @tc.desc      ComponentFactory call flow delete > getContent > delete > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0540', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0540 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('qhse');
      subject.getContent('OoA8pf');
      subject.delete('YjHW');
      subject.delete('YeZvSmculB');
      const step5 = subject.getBar('5f');
      logInfo(`step5 getBar("5f"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0540 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0541
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0541
     * @tc.desc      ComponentFactory call flow getContent > delete > getParams > toArray > getParams keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0541', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0541 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('fAN');
      subject.delete('FEDAmRPXge');
      subject.getParams('\u4e2d\u6587_1');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getParams('Sample Title 123Sample Title 123');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0541 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0542
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0542
     * @tc.desc      ComponentFactory call flow getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0542', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0542 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('bsuWtl');
      logInfo(`step1 getBar("bsuWtl"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0542 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0543
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0543
     * @tc.desc      ComponentFactory call flow toArray > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0543', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0543 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('eLKhA');
      logInfo(`step2 getBar("eLKhA"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('bKAKSU');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0543 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0544
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0544
     * @tc.desc      ComponentFactory call flow toArray > getBar > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0544', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0544 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('EuOAOYf');
      logInfo(`step2 getBar("EuOAOYf"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('glNOtEmitNG4');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0544 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0545
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0545
     * @tc.desc      ComponentFactory call flow getParams > toArray > getParams > getParams > delete keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0545', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0545 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('ZEqWn0MffB7');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('aEZCm');
      subject.getParams('eIU9y');
      subject.delete('Hello World');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0545 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0546
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0546
     * @tc.desc      ComponentFactory call flow delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0546', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0546 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('EMgUpK6s');
      const step2 = subject.getBar('EdSsHK3Z');
      logInfo(`step2 getBar("EdSsHK3Z"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0546 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0547
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0547
     * @tc.desc      ComponentFactory call flow getContent > getParams > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0547', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0547 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('x123');
      subject.getParams('2d');
      subject.getParams('FTGcAQrqoI');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0547 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0548
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0548
     * @tc.desc      ComponentFactory call flow getBar > delete > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0548', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0548 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Aw2U6KL');
      logInfo(`step1 getBar("Aw2U6KL"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('LLMFSrqCpLY');
      subject.getContent('MUalu12Q');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0548 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0549
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0549
     * @tc.desc      ComponentFactory call flow toArray > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0549', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0549 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('   ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0549 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0550
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0550
     * @tc.desc      ComponentFactory call flow toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0550', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0550 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0550 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0551
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0551
     * @tc.desc      ComponentFactory call flow getBar > getContent > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0551', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0551 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('a0Zw2D');
      logInfo(`step1 getBar("a0Zw2D"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('Td7IPsx59Z');
      subject.getContent('TF6Zj');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0551 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0552
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0552
     * @tc.desc      ComponentFactory call flow delete > getParams > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0552', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0552 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('xTkzdKaT');
      subject.getParams('BgKI');
      subject.delete('Y81DfEBjzC');
      const step4 = subject.getBar('zBPStDSd46');
      logInfo(`step4 getBar("zBPStDSd46"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0552 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0553
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0553
     * @tc.desc      ComponentFactory call flow toArray > getBar > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0553', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0553 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('a0Zw2D');
      logInfo(`step2 getBar("a0Zw2D"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('9WYSYc9Q');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0553 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0554
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0554
     * @tc.desc      ComponentFactory call flow delete > getContent > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0554', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0554 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('QNl5wwTDzcMM');
      subject.getContent('ij84GYmvSI39');
      subject.delete('aHkr');
      const step4 = subject.getBar('Hello WorldHello World');
      logInfo(`step4 getBar("Hello WorldHello World"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0554 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0555
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0555
     * @tc.desc      ComponentFactory call flow toArray > toArray > getParams > getContent > delete keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0555', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0555 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('8H');
      subject.getContent('otBya');
      subject.delete('fy');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0555 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0556
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0556
     * @tc.desc      ComponentFactory call flow delete > getParams > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0556', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0556 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('xa');
      subject.getParams('AQQtOTN');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0556 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0557
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0557
     * @tc.desc      ComponentFactory call flow toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0557', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0557 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('97EUJo4w8J9k');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0557 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0558
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0558
     * @tc.desc      ComponentFactory call flow getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0558', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0558 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('bxg');
      logInfo(`step1 getBar("bxg"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('ti2UlpzkdM2');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0558 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0559
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0559
     * @tc.desc      ComponentFactory call flow getBar > delete > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0559', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0559 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('wCFzP5g');
      logInfo(`step1 getBar("wCFzP5g"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('gsD6x');
      subject.delete('gsD6x');
      subject.getParams('KbK');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0559 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0560
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0560
     * @tc.desc      ComponentFactory call flow getContent > toArray > getContent > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0560', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0560 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('EzNIsPj');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('aa');
      subject.getParams('m2');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0560 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0561
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0561
     * @tc.desc      ComponentFactory call flow getContent > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0561', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0561 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('Cxfm40FDJmt');
      const step2 = subject.getBar('\u4e2d\u6587_1');
      logInfo(`step2 getBar("??_1"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('xHello');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0561 end`);
    });
  });
}
