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
export default function componentFactoryFlow21Test(): void {
  describe('ComponentFactoryFlow21Test', () => {
    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1435
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1435
     * @tc.desc      ComponentFactory call flow delete > toArray > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1435', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1435 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('PrQuLUQF');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('Uq96gDO3');
      logInfo(`step3 getBar("Uq96gDO3"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('p7H');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1435 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1436
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1436
     * @tc.desc      ComponentFactory call flow delete > toArray > getContent > getContent > getParams keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1436', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1436 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('8eTCm');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('OxSA80TGVBGf');
      subject.getContent('nThV0UM4');
      subject.getParams('1UvjpL');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1436 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1437
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1437
     * @tc.desc      ComponentFactory call flow toArray > getParams > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1437', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1437 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('7HHi');
      const step3 = subject.getBar('CbhFUa9Bi');
      logInfo(`step3 getBar("CbhFUa9Bi"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('G76');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1437 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1438
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1438
     * @tc.desc      ComponentFactory call flow getContent > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1438', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1438 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('5s');
      const step2 = subject.getBar('qfh7xvfS5B');
      logInfo(`step2 getBar("qfh7xvfS5B"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('hello worldhello world');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1438 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1439
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1439
     * @tc.desc      ComponentFactory call flow getBar > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1439', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1439 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('kbL1nDRH');
      logInfo(`step1 getBar("kbL1nDRH"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('ik');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1439 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1440
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1440
     * @tc.desc      ComponentFactory call flow getContent > getContent > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1440', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1440 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('r6');
      subject.getContent('zx');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1440 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1441
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1441
     * @tc.desc      ComponentFactory call flow delete > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1441', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1441 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('vHA');
      subject.getParams('ICl');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1441 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1442
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1442
     * @tc.desc      ComponentFactory call flow delete > toArray > toArray > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1442', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1442 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('\u4e2d\u6587');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getParams('arjTurXZeMbR');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1442 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1443
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1443
     * @tc.desc      ComponentFactory call flow toArray > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1443', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1443 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('gCMaP7');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1443 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1444
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1444
     * @tc.desc      ComponentFactory call flow getContent > getContent > toArray > getParams > delete keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1444', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1444 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('i');
      subject.getContent('VQ');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getParams('tiCdW');
      subject.delete('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1444 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1445
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1445
     * @tc.desc      ComponentFactory call flow getContent > getBar > getBar > getContent > delete keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1445', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1445 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('XKKUPI7txYk');
      const step2 = subject.getBar('dqy7B');
      logInfo(`step2 getBar("dqy7B"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('zmnW');
      logInfo(`step3 getBar("zmnW"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('9TEfZrL');
      subject.delete('xHello World');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1445 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1446
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1446
     * @tc.desc      ComponentFactory call flow getContent > getParams > getContent > delete > getBar keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1446', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1446 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('hello worldhello world');
      subject.getParams('Vw');
      subject.getContent('eAN');
      subject.delete('2YgDIi9nw');
      const step5 = subject.getBar('ndk');
      logInfo(`step5 getBar("ndk"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1446 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1447
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1447
     * @tc.desc      ComponentFactory call flow toArray > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1447', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1447 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('N7w');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1447 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1448
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1448
     * @tc.desc      ComponentFactory call flow delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1448', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1448 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('3KXiJ');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1448 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1449
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1449
     * @tc.desc      ComponentFactory call flow delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1449', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1449 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('z8T4K');
      const step2 = subject.getBar('Hello World');
      logInfo(`step2 getBar("Hello World"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1449 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1450
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1450
     * @tc.desc      ComponentFactory call flow toArray > delete > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1450', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1450 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete(' abc ');
      subject.getContent('8BWbAJQz');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1450 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1451
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1451
     * @tc.desc      ComponentFactory call flow toArray > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1451', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1451 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('1UvjpL');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1451 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1452
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1452
     * @tc.desc      ComponentFactory call flow getParams > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1452', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1452 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('W');
      const step2 = subject.getBar('p9vA3Qd');
      logInfo(`step2 getBar("p9vA3Qd"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1452 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1453
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1453
     * @tc.desc      ComponentFactory call flow getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1453', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1453 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('123_1');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1453 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1454
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1454
     * @tc.desc      ComponentFactory call flow getParams > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1454', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1454 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('b5WJMy');
      const step2 = subject.getBar(' hello world ');
      logInfo(`step2 getBar(" hello world "): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('lk1i');
      logInfo(`step3 getBar("lk1i"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1454 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1455
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1455
     * @tc.desc      ComponentFactory call flow getParams > toArray > getBar > getContent > toArray keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1455', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1455 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('Jq');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('IBRvXI');
      logInfo(`step3 getBar("IBRvXI"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('  ');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1455 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1456
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1456
     * @tc.desc      ComponentFactory call flow getContent > toArray > delete > getParams > delete keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1456', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1456 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('DK');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('FEDAmRPXge');
      subject.getParams('8tsdK7xbk5');
      subject.delete('q5wUacf5Ddpq');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1456 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1457
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1457
     * @tc.desc      ComponentFactory call flow getParams > toArray > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1457', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1457 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('Sample Title 123');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('OoA8pf');
      const step4 = subject.getBar('vYncp');
      logInfo(`step4 getBar("vYncp"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1457 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1458
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1458
     * @tc.desc      ComponentFactory call flow toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1458', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1458 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1458 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1459
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1459
     * @tc.desc      ComponentFactory call flow toArray > getParams > delete > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1459', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1459 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('u28YtwC8GrPf');
      subject.delete('Sample Title 123_1');
      const step4 = subject.getBar('Hello WorldHello World');
      logInfo(`step4 getBar("Hello WorldHello World"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getBar('ZhT9z0B');
      logInfo(`step5 getBar("ZhT9z0B"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1459 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1460
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1460
     * @tc.desc      ComponentFactory call flow delete > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1460', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1460 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('H');
      const step2 = subject.getBar('xHello World');
      logInfo(`step2 getBar("xHello World"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1460 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1461
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1461
     * @tc.desc      ComponentFactory call flow toArray > delete > getParams > getContent > toArray keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1461', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1461 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('Z2de');
      subject.getParams('psf8l88I');
      subject.getContent('9FRWZAoj8b');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1461 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1462
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1462
     * @tc.desc      ComponentFactory call flow delete > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1462', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1462 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('IaCwhx5MR');
      subject.delete('nbtrrK6');
      const step3 = subject.getBar('CDfrwdMnV');
      logInfo(`step3 getBar("CDfrwdMnV"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1462 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1463
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1463
     * @tc.desc      ComponentFactory call flow delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1463', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1463 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('77jE');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1463 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1464
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1464
     * @tc.desc      ComponentFactory call flow toArray > getParams > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1464', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1464 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('Sample Title 123');
      subject.getParams('A_1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1464 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1465
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1465
     * @tc.desc      ComponentFactory call flow getContent > getParams > getBar > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1465', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1465 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('bISQH7qPL');
      subject.getParams('PMGOs7Xt');
      const step3 = subject.getBar('6Gs7');
      logInfo(`step3 getBar("6Gs7"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('cM5bxlXCGHnR');
      logInfo(`step4 getBar("cM5bxlXCGHnR"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.delete('QGcHwzD3R');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1465 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1466
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1466
     * @tc.desc      ComponentFactory call flow delete > delete > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1466', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1466 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('YTQNvDFZ');
      subject.delete('u63n86V');
      subject.delete('jhT1oX');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1466 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1467
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1467
     * @tc.desc      ComponentFactory call flow getBar > delete > getBar > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1467', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1467 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('v');
      logInfo(`step1 getBar("v"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('2ihOb0dE7ue');
      const step3 = subject.getBar('7J8');
      logInfo(`step3 getBar("7J8"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('2JPijen1b');
      const step5 = subject.getBar('WF2dJw');
      logInfo(`step5 getBar("WF2dJw"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1467 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1468
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1468
     * @tc.desc      ComponentFactory call flow getParams > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1468', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1468 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('GKJ');
      subject.delete('JxF8ZViSb');
      const step3 = subject.getBar('YEaX');
      logInfo(`step3 getBar("YEaX"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1468 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1469
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1469
     * @tc.desc      ComponentFactory call flow toArray > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1469', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1469 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('gcI');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1469 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1470
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1470
     * @tc.desc      ComponentFactory call flow getContent > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1470', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1470 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('fAN');
      subject.getParams('Tjb');
      const step3 = subject.getBar('jjBHMnIshV3');
      logInfo(`step3 getBar("jjBHMnIshV3"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1470 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1471
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1471
     * @tc.desc      ComponentFactory call flow getParams > getContent > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1471', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1471 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('Bwig9b9gr');
      subject.getContent('ao1xPPVqGz');
      subject.getContent('F39Oc1Z6TI');
      const step4 = subject.getBar('As0kvJU');
      logInfo(`step4 getBar("As0kvJU"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1471 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1472
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1472
     * @tc.desc      ComponentFactory call flow toArray > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1472', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1472 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('Bwig9b9gr');
      const step3 = subject.getBar('yMeu11snR');
      logInfo(`step3 getBar("yMeu11snR"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1472 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1473
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1473
     * @tc.desc      ComponentFactory call flow toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1473', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1473 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('0pudv5fpUF');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1473 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1474
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1474
     * @tc.desc      ComponentFactory call flow getContent > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1474', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1474 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('4mRCIp6Bk0k4');
      const step2 = subject.getBar('8k');
      logInfo(`step2 getBar("8k"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('o7ehL');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1474 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1475
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1475
     * @tc.desc      ComponentFactory call flow delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1475', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1475 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('uRl170MkqV6');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1475 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1476
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1476
     * @tc.desc      ComponentFactory call flow getBar > getContent > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1476', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1476 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('123');
      logInfo(`step1 getBar("123"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('sPR');
      const step3 = subject.getBar('0l');
      logInfo(`step3 getBar("0l"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('x\u4e2d\u6587');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1476 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1477
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1477
     * @tc.desc      ComponentFactory call flow toArray > toArray > delete > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1477', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1477 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('YD4gWjooSL');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.delete('fc');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1477 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1478
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1478
     * @tc.desc      ComponentFactory call flow getContent > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1478', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1478 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('1GgCZRUHp');
      subject.getContent('KCLPWyUfIW');
      const step3 = subject.getBar('1MYBqsx53n');
      logInfo(`step3 getBar("1MYBqsx53n"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1478 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1479
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1479
     * @tc.desc      ComponentFactory call flow delete > getBar > delete > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1479', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1479 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('ZN4ItyJVKgg');
      const step2 = subject.getBar('bd');
      logInfo(`step2 getBar("bd"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('DDVCz5ydJ6G');
      subject.getContent('FnyWHce');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1479 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1480
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1480
     * @tc.desc      ComponentFactory call flow getContent > getParams > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1480', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1480 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('Sample Title 123_1');
      subject.getParams('Y');
      subject.getContent('sGzPsbc');
      const step4 = subject.getBar('5Qvn');
      logInfo(`step4 getBar("5Qvn"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1480 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1481
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1481
     * @tc.desc      ComponentFactory call flow delete > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1481', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1481 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('abcabc');
      subject.delete('ZDKcZO');
      const step3 = subject.getBar('k');
      logInfo(`step3 getBar("k"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1481 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1482
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1482
     * @tc.desc      ComponentFactory call flow getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1482', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1482 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('SaZUvlunWF');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1482 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1483
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1483
     * @tc.desc      ComponentFactory call flow toArray > delete > getContent > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1483', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1483 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('77jE');
      subject.getContent('zU');
      subject.getParams('iWOsagN');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1483 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1484
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1484
     * @tc.desc      ComponentFactory call flow getParams > getBar > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1484', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1484 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('II9');
      const step2 = subject.getBar('n8ki');
      logInfo(`step2 getBar("n8ki"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('A_1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1484 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1485
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1485
     * @tc.desc      ComponentFactory call flow getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1485', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1485 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('gpU4CZMSS');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1485 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1486
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1486
     * @tc.desc      ComponentFactory call flow getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1486', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1486 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('123123');
      logInfo(`step1 getBar("123123"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('Wy');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1486 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1487
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1487
     * @tc.desc      ComponentFactory call flow delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1487', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1487 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('o52ed3k1i');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1487 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1488
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1488
     * @tc.desc      ComponentFactory call flow getParams > getParams > getContent > getParams > toArray keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1488', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1488 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('hlD0LZUeA');
      subject.getParams('d');
      subject.getContent('NwT');
      subject.getParams('jxGacmhL');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1488 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1489
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1489
     * @tc.desc      ComponentFactory call flow getParams > delete > toArray > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1489', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1489 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('0KxxJOv9RNr5');
      subject.delete('DbCp');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('LLMFSrqCpLY');
      subject.getParams('8tsdK7xbk5');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1489 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1490
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1490
     * @tc.desc      ComponentFactory call flow delete > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1490', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1490 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('abc');
      const step2 = subject.getBar(' abc ');
      logInfo(`step2 getBar(" abc "): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1490 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1491
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1491
     * @tc.desc      ComponentFactory call flow getBar > getContent > delete > getContent > getContent keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1491', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1491 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('VEn9iepX');
      logInfo(`step1 getBar("VEn9iepX"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('UV7n36');
      subject.delete('Hello WorldHello World');
      subject.getContent('7NMMVN');
      subject.getContent('S');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1491 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1492
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1492
     * @tc.desc      ComponentFactory call flow getContent > getContent > toArray > toArray > getContent keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1492', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1492 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('dh1PdJ');
      subject.getContent('bozXXgG72');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getContent('HPBKG1Df');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1492 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1493
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1493
     * @tc.desc      ComponentFactory call flow getParams > getBar > toArray > getContent > toArray keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1493', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1493 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams(' Sample Title 123 ');
      const step2 = subject.getBar('yzvnqAN');
      logInfo(`step2 getBar("yzvnqAN"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('S6FkWO');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1493 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1494
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1494
     * @tc.desc      ComponentFactory call flow toArray > getBar > getParams > getParams > toArray keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1494', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1494 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('jL8OO8aOM');
      logInfo(`step2 getBar("jL8OO8aOM"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('m');
      subject.getParams('jKT9Pt');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1494 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1495
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1495
     * @tc.desc      ComponentFactory call flow getParams > getParams > toArray > getParams > getContent keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1495', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1495 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('i685dQSQE');
      subject.getParams('cN2zDR83ns');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getParams('iqIQ');
      subject.getContent('mc');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1495 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1496
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1496
     * @tc.desc      ComponentFactory call flow getParams > getParams > delete > getParams > getBar keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1496', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1496 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('g4I3eAi8Zp4f');
      subject.getParams('hGpqi45M3yCU');
      subject.delete('DFXlTccFsR');
      subject.getParams('l');
      const step5 = subject.getBar('NW');
      logInfo(`step5 getBar("NW"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1496 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1497
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1497
     * @tc.desc      ComponentFactory call flow getContent > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1497', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1497 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('uR');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('ZjpMfS');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1497 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1498
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1498
     * @tc.desc      ComponentFactory call flow getContent > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1498', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1498 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('l');
      subject.getParams('i685dQSQE');
      const step3 = subject.getBar('6Tomqj');
      logInfo(`step3 getBar("6Tomqj"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1498 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1499
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1499
     * @tc.desc      ComponentFactory call flow getBar > delete > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1499', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1499 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('k');
      logInfo(`step1 getBar("k"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete(' Hello ');
      subject.getContent('2EqNO2X');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1499 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1500
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1500
     * @tc.desc      ComponentFactory call flow delete > getBar > getBar > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1500 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('Bljp2xBz');
      const step2 = subject.getBar('X');
      logInfo(`step2 getBar("X"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('qfh7xvfS5B');
      logInfo(`step3 getBar("qfh7xvfS5B"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.delete('D1jifV8XEuZ8');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1500 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1501
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1501
     * @tc.desc      ComponentFactory call flow getBar > getParams > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1501', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1501 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('WF2dJw');
      logInfo(`step1 getBar("WF2dJw"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('M2ShSF15');
      subject.getParams('H');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1501 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1502
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1502
     * @tc.desc      ComponentFactory call flow getParams > getParams > getParams > getBar > toArray keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1502', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1502 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('ZhaqxnStvyQ');
      subject.getParams('suDRvuuO');
      subject.getParams('QEugm4vLp');
      const step4 = subject.getBar('P7r5');
      logInfo(`step4 getBar("P7r5"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1502 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1503
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1503
     * @tc.desc      ComponentFactory call flow toArray > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1503', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1503 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('u63n86V');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1503 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1504
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1504
     * @tc.desc      ComponentFactory call flow getBar > getParams > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1504', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1504 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('qr3Vm7rLf7E');
      logInfo(`step1 getBar("qr3Vm7rLf7E"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('m8HTwLLgOyAe');
      subject.getContent('uhEdJ8TYI');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1504 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1505
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1505
     * @tc.desc      ComponentFactory call flow delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1505', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1505 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('YRgTMZgh');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1505 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1506
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1506
     * @tc.desc      ComponentFactory call flow getBar > delete > delete > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1506', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1506 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar(' abc ');
      logInfo(`step1 getBar(" abc "): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('GMuQcDUSD0D');
      subject.delete('aZyPzQa7arm');
      subject.getContent('9XJ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1506 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1507
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1507
     * @tc.desc      ComponentFactory call flow getContent > getContent > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1507', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1507 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent(' abc ');
      subject.getContent('hE');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('mkGSzn');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1507 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1508
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1508
     * @tc.desc      ComponentFactory call flow getParams > getParams > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1508', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1508 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('r');
      subject.getParams('3A6n');
      const step3 = subject.getBar('onHMSlNH');
      logInfo(`step3 getBar("onHMSlNH"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1508 end`);
    });
  });
}
