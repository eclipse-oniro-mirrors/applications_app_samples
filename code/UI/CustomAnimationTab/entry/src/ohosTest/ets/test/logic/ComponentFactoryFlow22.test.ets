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

/** Logic checks for ComponentFactory flow (72 cases). */
export default function componentFactoryFlow22Test(): void {
  describe('ComponentFactoryFlow22Test', () => {
    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1509
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1509
     * @tc.desc      ComponentFactory call flow delete > getParams > getParams > getContent > getBar keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1509', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1509 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('K7EGmG7Pak');
      subject.getParams('udYH3PUTTOIf');
      subject.getParams('ohKONXqD5');
      subject.getContent('\u4e2d\u6587\u4e2d\u6587');
      const step5 = subject.getBar('gx4');
      logInfo(`step5 getBar("gx4"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1509 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1510
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1510
     * @tc.desc      ComponentFactory call flow getBar > toArray > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1510', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1510 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('AV913N');
      logInfo(`step1 getBar("AV913N"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('As0kvJU');
      logInfo(`step4 getBar("As0kvJU"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1510 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1511
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1511
     * @tc.desc      ComponentFactory call flow delete > getBar > toArray > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1511', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1511 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('i');
      const step2 = subject.getBar('MZEv8J');
      logInfo(`step2 getBar("MZEv8J"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('\u4e2d\u6587');
      logInfo(`step4 getBar("??"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getContent('Zj3J0');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1511 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1512
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1512
     * @tc.desc      ComponentFactory call flow getBar > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1512', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1512 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('FYXMiUxa');
      logInfo(`step1 getBar("FYXMiUxa"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('IkSzXDcXT');
      logInfo(`step2 getBar("IkSzXDcXT"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('n8ki');
      logInfo(`step3 getBar("n8ki"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1512 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1513
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1513
     * @tc.desc      ComponentFactory call flow getBar > getContent > getContent > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1513', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1513 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Zkfnj8M');
      logInfo(`step1 getBar("Zkfnj8M"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('ik');
      subject.getContent(' a ');
      subject.getContent('cQIHk1oqt');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1513 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1514
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1514
     * @tc.desc      ComponentFactory call flow getParams > delete > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1514', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1514 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('1HZGi8Qa0');
      subject.delete('PlJs');
      const step3 = subject.getBar('6YBKgd');
      logInfo(`step3 getBar("6YBKgd"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1514 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1515
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1515
     * @tc.desc      ComponentFactory call flow getBar > getBar > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1515', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1515 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('yhkABd');
      logInfo(`step1 getBar("yhkABd"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('DM9T23Gtl2');
      logInfo(`step2 getBar("DM9T23Gtl2"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('hello world_1');
      logInfo(`step4 getBar("hello world_1"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1515 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1516
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1516
     * @tc.desc      ComponentFactory call flow getContent > getBar > getParams > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1516', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1516 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('l');
      const step2 = subject.getBar('b0T');
      logInfo(`step2 getBar("b0T"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('Bwig9b9gr');
      subject.getContent('0QK');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1516 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1517
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1517
     * @tc.desc      ComponentFactory call flow getParams > delete > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1517', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1517 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('cxX8QMs');
      subject.delete('QNl5wwTDzcMM');
      subject.getParams('thJK');
      const step4 = subject.getBar('MOWr');
      logInfo(`step4 getBar("MOWr"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1517 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1518
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1518
     * @tc.desc      ComponentFactory call flow getBar > delete > delete > getParams > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1518', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1518 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('xHello');
      logInfo(`step1 getBar("xHello"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('123_1');
      subject.delete('boOMz');
      subject.getParams('8YGinqG');
      subject.getParams('rb6bBOpG0w');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1518 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1519
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1519
     * @tc.desc      ComponentFactory call flow getParams > getParams > toArray > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1519', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1519 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('UI');
      subject.getParams('vi7UE7l39C4');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('uG2');
      logInfo(`step4 getBar("uG2"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.delete('IaCwhx5MR');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1519 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1520
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1520
     * @tc.desc      ComponentFactory call flow getContent > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1520', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1520 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('DpuswFSnb');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent(' ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1520 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1521
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1521
     * @tc.desc      ComponentFactory call flow getBar > toArray > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1521', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1521 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Hello World_1');
      logInfo(`step1 getBar("Hello World_1"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getParams(' ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1521 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1522
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1522
     * @tc.desc      ComponentFactory call flow toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1522', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1522 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('PlJs');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1522 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1523
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1523
     * @tc.desc      ComponentFactory call flow getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1523', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1523 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('szadka6LFnS');
      const step2 = subject.getBar('Y');
      logInfo(`step2 getBar("Y"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1523 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1524
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1524
     * @tc.desc      ComponentFactory call flow toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1524', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1524 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('xSample Title 123');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1524 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1525
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1525
     * @tc.desc      ComponentFactory call flow getBar > getParams > delete > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1525', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1525 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('zj');
      logInfo(`step1 getBar("zj"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('7bf6');
      subject.delete('8j');
      subject.delete('Sample Title 123Sample Title 123');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1525 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1526
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1526
     * @tc.desc      ComponentFactory call flow toArray > getContent > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1526', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1526 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('QjJmW');
      const step3 = subject.getBar('ayCVc6W3E');
      logInfo(`step3 getBar("ayCVc6W3E"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('ND4pgmV2');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1526 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1527
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1527
     * @tc.desc      ComponentFactory call flow delete > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1527', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1527 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('xA');
      const step2 = subject.getBar('v');
      logInfo(`step2 getBar("v"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('Yy');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1527 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1528
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1528
     * @tc.desc      ComponentFactory call flow delete > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1528', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1528 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('XVkfLk');
      subject.getContent('47lak6JVXRR');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1528 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1529
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1529
     * @tc.desc      ComponentFactory call flow getBar > delete > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1529', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1529 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('eECT3Cnise1I');
      logInfo(`step1 getBar("eECT3Cnise1I"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('FgDmNta9Bvr');
      const step3 = subject.getBar(' 123 ');
      logInfo(`step3 getBar(" 123 "): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('wCFzP5g');
      logInfo(`step4 getBar("wCFzP5g"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1529 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1530
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1530
     * @tc.desc      ComponentFactory call flow getBar > getBar > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1530', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1530 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('XHj0');
      logInfo(`step1 getBar("XHj0"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar(' hello world ');
      logInfo(`step2 getBar(" hello world "): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('S6FkWO');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1530 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1531
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1531
     * @tc.desc      ComponentFactory call flow getContent > getBar > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1531', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1531 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('J');
      const step2 = subject.getBar('  ');
      logInfo(`step2 getBar("  "): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('Hello World');
      const step4 = subject.getBar('n6t');
      logInfo(`step4 getBar("n6t"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1531 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1532
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1532
     * @tc.desc      ComponentFactory call flow delete > delete > getBar > getParams > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1532', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1532 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('JPpP');
      subject.delete('iMCpJ1');
      const step3 = subject.getBar('2');
      logInfo(`step3 getBar("2"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('ZEqWn0MffB7');
      subject.getContent('Hello World');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1532 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1533
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1533
     * @tc.desc      ComponentFactory call flow getParams > getContent > toArray > delete > delete keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1533', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1533 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('A_1');
      subject.getContent('v4bZi4a546ta');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('gbZBiNl');
      subject.delete('UlpblCT');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1533 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1534
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1534
     * @tc.desc      ComponentFactory call flow getBar > delete > getParams > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1534', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1534 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('A6gejCa00mXb');
      logInfo(`step1 getBar("A6gejCa00mXb"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('EOoK1xnV');
      subject.getParams('x123');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getParams('FE6S319GoD');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1534 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1535
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1535
     * @tc.desc      ComponentFactory call flow getBar > delete > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1535', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1535 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('zmnW');
      logInfo(`step1 getBar("zmnW"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('upg');
      subject.delete('aa');
      subject.getParams('3b0EBZ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1535 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1536
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1536
     * @tc.desc      ComponentFactory call flow getParams > getContent > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1536', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1536 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('mY5pW6J');
      subject.getContent('xxD');
      subject.getParams('Hello WorldHello World');
      const step4 = subject.getBar('9l');
      logInfo(`step4 getBar("9l"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1536 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1537
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1537
     * @tc.desc      ComponentFactory call flow delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1537', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1537 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('zo');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1537 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1538
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1538
     * @tc.desc      ComponentFactory call flow toArray > getContent > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1538', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1538 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('TF6Zj');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getParams('8YGinqG');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1538 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1539
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1539
     * @tc.desc      ComponentFactory call flow getParams > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1539', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1539 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('mwmaw1');
      const step2 = subject.getBar('AV913N');
      logInfo(`step2 getBar("AV913N"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('123');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1539 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1540
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1540
     * @tc.desc      ComponentFactory call flow getBar > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1540', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1540 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('hello world');
      logInfo(`step1 getBar("hello world"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('lwaYIV8OC');
      const step3 = subject.getBar('CDfrwdMnV');
      logInfo(`step3 getBar("CDfrwdMnV"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1540 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1541
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1541
     * @tc.desc      ComponentFactory call flow toArray > getContent > getParams > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1541', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1541 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('');
      subject.getParams('hloKKo4gyX');
      subject.getContent('KUCQL');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1541 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1542
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1542
     * @tc.desc      ComponentFactory call flow getBar > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1542', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1542 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('oJ');
      logInfo(`step1 getBar("oJ"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('ti2UlpzkdM2');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1542 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1543
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1543
     * @tc.desc      ComponentFactory call flow toArray > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1543', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1543 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('x\u4e2d\u6587');
      const step3 = subject.getBar('b0T');
      logInfo(`step3 getBar("b0T"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1543 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1544
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1544
     * @tc.desc      ComponentFactory call flow toArray > delete > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1544', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1544 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('fc');
      subject.getParams('a');
      const step4 = subject.getBar('rRj8x6YM6');
      logInfo(`step4 getBar("rRj8x6YM6"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1544 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1545
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1545
     * @tc.desc      ComponentFactory call flow getContent > getParams > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1545', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1545 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('pBJGLVMA');
      subject.getParams('iYuvcsbi');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1545 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1546
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1546
     * @tc.desc      ComponentFactory call flow toArray > getParams > getBar > getContent > toArray keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1546', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1546 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('7ziCRIc');
      const step3 = subject.getBar(' _1');
      logInfo(`step3 getBar(" _1"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('ZI');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1546 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1547
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1547
     * @tc.desc      ComponentFactory call flow getBar > delete > getContent > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1547', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1547 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('IUi');
      logInfo(`step1 getBar("IUi"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('9Yxb3LyW2g');
      subject.getContent('mnaz9p');
      const step4 = subject.getBar('etSuf');
      logInfo(`step4 getBar("etSuf"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.delete('a');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1547 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1548
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1548
     * @tc.desc      ComponentFactory call flow getParams > getParams > toArray > toArray > getParams keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1548', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1548 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('WygLQEV');
      subject.getParams('BPyU9qL');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getParams('a_1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1548 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1549
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1549
     * @tc.desc      ComponentFactory call flow delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1549', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1549 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('2m06');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1549 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1550
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1550
     * @tc.desc      ComponentFactory call flow getBar > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1550', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1550 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('s');
      logInfo(`step1 getBar("s"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('kaeCM0');
      const step3 = subject.getBar('XHj0');
      logInfo(`step3 getBar("XHj0"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1550 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1551
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1551
     * @tc.desc      ComponentFactory call flow delete > getContent > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1551', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1551 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('mnsT');
      subject.getContent('zx');
      subject.getParams('7xyqznYXB');
      const step4 = subject.getBar('   ');
      logInfo(`step4 getBar("   "): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1551 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1552
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1552
     * @tc.desc      ComponentFactory call flow getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1552', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1552 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Xard8Kss3VC');
      logInfo(`step1 getBar("Xard8Kss3VC"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('yKIG4eakeO');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1552 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1553
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1553
     * @tc.desc      ComponentFactory call flow delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1553', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1553 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('Zn8gjRlr');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1553 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1554
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1554
     * @tc.desc      ComponentFactory call flow delete > toArray > getBar > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1554', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1554 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('UlpblCT');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('aa');
      logInfo(`step3 getBar("aa"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('xZ');
      logInfo(`step4 getBar("xZ"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getParams('d');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1554 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1555
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1555
     * @tc.desc      ComponentFactory call flow getBar > getBar > toArray > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1555', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1555 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('eECT3Cnise1I');
      logInfo(`step1 getBar("eECT3Cnise1I"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('Zkfnj8M');
      logInfo(`step2 getBar("Zkfnj8M"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('aB9p');
      const step5 = subject.getBar('2Q');
      logInfo(`step5 getBar("2Q"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1555 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1556
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1556
     * @tc.desc      ComponentFactory call flow getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1556', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1556 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('7J8');
      logInfo(`step1 getBar("7J8"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('vW8IZb2km');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1556 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1557
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1557
     * @tc.desc      ComponentFactory call flow toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1557', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1557 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('123123');
      logInfo(`step2 getBar("123123"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1557 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1558
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1558
     * @tc.desc      ComponentFactory call flow getContent > toArray > getParams > getParams > getParams keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1558', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1558 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('0Tn8NJB7UG');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('Bwig9b9gr');
      subject.getParams('cdJj6PFv3xK');
      subject.getParams('   ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1558 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1559
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1559
     * @tc.desc      ComponentFactory call flow toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1559', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1559 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('q3Mx7');
      logInfo(`step2 getBar("q3Mx7"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1559 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1560
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1560
     * @tc.desc      ComponentFactory call flow toArray > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1560', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1560 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('A');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1560 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1561
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1561
     * @tc.desc      ComponentFactory call flow toArray > getBar > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1561', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1561 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('IHZz2H');
      logInfo(`step2 getBar("IHZz2H"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('BPyU9qL');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1561 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1562
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1562
     * @tc.desc      ComponentFactory call flow getParams > getContent > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1562', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1562 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('MXmNvV');
      subject.getContent('RMUD7OVx');
      subject.getContent('VQ');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1562 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1563
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1563
     * @tc.desc      ComponentFactory call flow getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1563', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1563 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('f1');
      const step2 = subject.getBar('c');
      logInfo(`step2 getBar("c"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1563 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1564
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1564
     * @tc.desc      ComponentFactory call flow getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1564', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1564 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('xabc');
      logInfo(`step1 getBar("xabc"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('sta8M7k');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1564 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1565
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1565
     * @tc.desc      ComponentFactory call flow getContent > getParams > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1565', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1565 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('sp67XTpnyJGQ');
      subject.getParams('MDzjvi6c');
      subject.getParams('iqIQ');
      const step4 = subject.getBar('P7r5');
      logInfo(`step4 getBar("P7r5"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1565 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1566
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1566
     * @tc.desc      ComponentFactory call flow delete > toArray > getBar > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1566', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1566 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('x123');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('VEn9iepX');
      logInfo(`step3 getBar("VEn9iepX"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('  ');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1566 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1567
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1567
     * @tc.desc      ComponentFactory call flow getBar > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1567', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1567 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('DSfb');
      logInfo(`step1 getBar("DSfb"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('faUbD2HRbLah');
      const step3 = subject.getBar('lvXxnAa8l');
      logInfo(`step3 getBar("lvXxnAa8l"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1567 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1568
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1568
     * @tc.desc      ComponentFactory call flow delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1568', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1568 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('UlpblCT');
      const step2 = subject.getBar('BauR9pM8qz');
      logInfo(`step2 getBar("BauR9pM8qz"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1568 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1569
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1569
     * @tc.desc      ComponentFactory call flow getParams > delete > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1569', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1569 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('qJVpmab5mq');
      subject.delete('RAcfl');
      subject.delete('9');
      const step4 = subject.getBar('x\u4e2d\u6587');
      logInfo(`step4 getBar("x??"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1569 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1570
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1570
     * @tc.desc      ComponentFactory call flow getParams > getParams > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1570', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1570 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('123123');
      subject.getParams('m');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('hello worldhello world');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1570 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1571
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1571
     * @tc.desc      ComponentFactory call flow toArray > getContent > getContent > getContent > getContent keeps sta...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1571', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1571 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('cm');
      subject.getContent('SVCGZjw');
      subject.getContent('123123');
      subject.getContent('Cxfm40FDJmt');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1571 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1572
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1572
     * @tc.desc      ComponentFactory call flow getContent > toArray > delete > getBar > getParams keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1572', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1572 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('TFwsjyaX1xUR');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('Zv4ZAUwRHoi');
      const step4 = subject.getBar('0l');
      logInfo(`step4 getBar("0l"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getParams('arjTurXZeMbR');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1572 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1573
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1573
     * @tc.desc      ComponentFactory call flow getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1573', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1573 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('xSample Title 123');
      logInfo(`step1 getBar("xSample Title 123"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1573 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1574
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1574
     * @tc.desc      ComponentFactory call flow getBar > getContent > delete > getParams > getParams keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1574', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1574 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('w7smXl');
      logInfo(`step1 getBar("w7smXl"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('HIs3Zc');
      subject.delete('VRHQckRveA6e');
      subject.getParams(' a ');
      subject.getParams('xa');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1574 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1575
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1575
     * @tc.desc      ComponentFactory call flow getBar > getBar > delete > getParams > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1575', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1575 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('IHZz2H');
      logInfo(`step1 getBar("IHZz2H"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('Hello World_1');
      logInfo(`step2 getBar("Hello World_1"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('EOoK1xnV');
      subject.getParams('MnI2Nm8ZFH');
      subject.delete('rh2f6yPSgIA');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1575 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1576
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1576
     * @tc.desc      ComponentFactory call flow getContent > getBar > delete > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1576', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1576 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('\u4e2d\u6587\u4e2d\u6587');
      const step2 = subject.getBar('hello world');
      logInfo(`step2 getBar("hello world"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('T2Bl');
      const step4 = subject.getBar('\u4e2d\u6587_1');
      logInfo(`step4 getBar("??_1"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.delete('Uxp');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1576 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1577
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1577
     * @tc.desc      ComponentFactory call flow getParams > getBar > getContent > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1577', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1577 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('7r');
      const step2 = subject.getBar('a');
      logInfo(`step2 getBar("a"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('t4a');
      subject.delete('FgDmNta9Bvr');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1577 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1578
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1578
     * @tc.desc      ComponentFactory call flow toArray > delete > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1578', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1578 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('znM');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('DpuswFSnb');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1578 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1579
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1579
     * @tc.desc      ComponentFactory call flow getContent > getContent > toArray > getParams > getContent keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1579', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1579 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent(' 123 ');
      subject.getContent('EzNIsPj');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getParams('MTnTYD6');
      subject.getContent('ij84GYmvSI39');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1579 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1580
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1580
     * @tc.desc      ComponentFactory call flow delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1580', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1580 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('2m06');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1580 end`);
    });
  });
}
