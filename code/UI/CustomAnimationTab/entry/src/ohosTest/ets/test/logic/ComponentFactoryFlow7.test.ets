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
export default function componentFactoryFlow7Test(): void {
  describe('ComponentFactoryFlow7Test', () => {
    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0415
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0415
     * @tc.desc      ComponentFactory call flow getBar > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0415 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('cy');
      logInfo(`step1 getBar("cy"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent(' Hello ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0415 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0416
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0416
     * @tc.desc      ComponentFactory call flow toArray > delete > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0416 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('pCN5R5kTAa2');
      subject.getParams('U2xjZrluups');
      const step4 = subject.getBar(' A ');
      logInfo(`step4 getBar(" A "): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0416 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0417
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0417
     * @tc.desc      ComponentFactory call flow delete > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0417 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('2ihOb0dE7ue');
      subject.getParams('qXFp');
      const step3 = subject.getBar('thaeTW');
      logInfo(`step3 getBar("thaeTW"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0417 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0418
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0418
     * @tc.desc      ComponentFactory call flow getContent > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0418 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('DK');
      const step2 = subject.getBar('etSuf');
      logInfo(`step2 getBar("etSuf"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('oLuRAg');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0418 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0419
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0419
     * @tc.desc      ComponentFactory call flow getBar > toArray > delete > getParams > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0419 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('t6XAkX');
      logInfo(`step1 getBar("t6XAkX"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('1JQNTOALvYj1');
      subject.getParams('2d');
      subject.getParams('GcdSixwo');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0419 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0420
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0420
     * @tc.desc      ComponentFactory call flow toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0420 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('JxF8ZViSb');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0420 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0421
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0421
     * @tc.desc      ComponentFactory call flow toArray > delete > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0421 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('0f2lJSgLEE');
      subject.getContent('YYQlkKt5AN');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0421 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0422
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0422
     * @tc.desc      ComponentFactory call flow delete > getBar > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0422 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('wZwlOYmt6');
      const step2 = subject.getBar('xa');
      logInfo(`step2 getBar("xa"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('gCMaP7');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0422 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0423
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0423
     * @tc.desc      ComponentFactory call flow getContent > getBar > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0423 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('Q2JoWYCcStw');
      const step2 = subject.getBar('ED');
      logInfo(`step2 getBar("ED"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('ZrUU4j1Q62EK');
      logInfo(`step3 getBar("ZrUU4j1Q62EK"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('Hello World_1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0423 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0424
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0424
     * @tc.desc      ComponentFactory call flow delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0424 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('fTNSgriK74V');
      const step2 = subject.getBar('  ');
      logInfo(`step2 getBar("  "): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0424 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0425
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0425
     * @tc.desc      ComponentFactory call flow getContent > delete > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0425', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0425 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('abcabc');
      subject.delete('lV');
      subject.delete('XNdC3ThDoNg');
      const step4 = subject.getBar('49k1A7YOxx');
      logInfo(`step4 getBar("49k1A7YOxx"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0425 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0426
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0426
     * @tc.desc      ComponentFactory call flow toArray > getParams > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0426 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('VkwV');
      const step3 = subject.getBar('cHJljbKpOHeu');
      logInfo(`step3 getBar("cHJljbKpOHeu"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('tCjWGQQt8fTo');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0426 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0427
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0427
     * @tc.desc      ComponentFactory call flow toArray > getContent > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0427 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('NGH');
      subject.delete('SiTfSAwKht');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0427 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0428
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0428
     * @tc.desc      ComponentFactory call flow getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0428 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('HxnhpHwZpVKv');
      logInfo(`step1 getBar("HxnhpHwZpVKv"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('9eokJW');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0428 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0429
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0429
     * @tc.desc      ComponentFactory call flow getContent > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0429 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('6ZB');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('Ccw2Zqi2ZIS');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0429 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0430
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0430
     * @tc.desc      ComponentFactory call flow getBar > getContent > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0430 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('xoCXqWLigfEo');
      logInfo(`step1 getBar("xoCXqWLigfEo"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent(' hello world ');
      subject.getContent('2yJnb15b');
      const step4 = subject.getBar('xMtWdQu6');
      logInfo(`step4 getBar("xMtWdQu6"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0430 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0431
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0431
     * @tc.desc      ComponentFactory call flow toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0431', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0431 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0431 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0432
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0432
     * @tc.desc      ComponentFactory call flow getParams > toArray > getBar > getBar > getContent keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0432', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0432 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('i685dQSQE');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('hello worldhello world');
      logInfo(`step3 getBar("hello worldhello world"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('DSfb');
      logInfo(`step4 getBar("DSfb"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getContent('aa');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0432 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0433
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0433
     * @tc.desc      ComponentFactory call flow getParams > getContent > delete > toArray > getParams keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0433', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0433 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('eU6Lz');
      subject.getContent('wL3pLxnOGXj');
      subject.delete('HZDvRFP9g');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getParams('  ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0433 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0434
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0434
     * @tc.desc      ComponentFactory call flow getBar > delete > getParams > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0434', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0434 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('UZ1');
      logInfo(`step1 getBar("UZ1"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('kNYWGAmPVRWP');
      subject.getParams('123');
      subject.getContent('UUfRskW');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0434 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0435
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0435
     * @tc.desc      ComponentFactory call flow toArray > getBar > getContent > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0435', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0435 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('A');
      logInfo(`step2 getBar("A"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('JlPv');
      subject.delete('jUa7k1vO');
      subject.delete('FR5gCJGQ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0435 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0436
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0436
     * @tc.desc      ComponentFactory call flow getContent > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0436', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0436 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('bISQH7qPL');
      subject.getParams('Vw');
      const step3 = subject.getBar('e');
      logInfo(`step3 getBar("e"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0436 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0437
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0437
     * @tc.desc      ComponentFactory call flow toArray > getContent > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0437', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0437 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('mNtInRNHG');
      subject.getParams('sbxkifFIV');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0437 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0438
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0438
     * @tc.desc      ComponentFactory call flow toArray > getContent > getParams > getContent > getBar keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0438', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0438 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('JlPv');
      subject.getParams('tB9R1yPEr');
      subject.getContent('vW8IZb2km');
      const step5 = subject.getBar('Xard8Kss3VC');
      logInfo(`step5 getBar("Xard8Kss3VC"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0438 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0439
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0439
     * @tc.desc      ComponentFactory call flow getParams > getBar > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0439', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0439 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('IhXNf');
      const step2 = subject.getBar('MU');
      logInfo(`step2 getBar("MU"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('jLQcxJVfj');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0439 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0440
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0440
     * @tc.desc      ComponentFactory call flow getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0440', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0440 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('ECtggVYxqC');
      const step2 = subject.getBar('HxnhpHwZpVKv');
      logInfo(`step2 getBar("HxnhpHwZpVKv"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0440 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0441
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0441
     * @tc.desc      ComponentFactory call flow getBar > toArray > getParams > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0441', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0441 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Smhe70');
      logInfo(`step1 getBar("Smhe70"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('r');
      subject.getContent('2yJnb15b');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0441 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0442
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0442
     * @tc.desc      ComponentFactory call flow getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0442', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0442 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('zKWJB5g');
      const step2 = subject.getBar('y3BmY2P9');
      logInfo(`step2 getBar("y3BmY2P9"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0442 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0443
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0443
     * @tc.desc      ComponentFactory call flow getContent > getParams > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0443', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0443 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('oj0tXh1T');
      subject.getParams('aa');
      const step3 = subject.getBar('EdSsHK3Z');
      logInfo(`step3 getBar("EdSsHK3Z"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('Jq');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0443 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0444
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0444
     * @tc.desc      ComponentFactory call flow toArray > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0444', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0444 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('1CsMqqN');
      subject.getParams('p02yi');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0444 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0445
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0445
     * @tc.desc      ComponentFactory call flow toArray > getContent > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0445', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0445 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('TLzHYlbpE2');
      subject.getParams('EIF5t2O2ZVpJ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0445 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0446
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0446
     * @tc.desc      ComponentFactory call flow toArray > getContent > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0446', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0446 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('s7CZvpnN5wE0');
      subject.getParams('8');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0446 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0447
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0447
     * @tc.desc      ComponentFactory call flow getParams > delete > delete > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0447', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0447 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('E2Dk6zai5vj5');
      subject.delete('Q1ANx2oPtq');
      subject.delete(' Hello ');
      subject.getContent('YYQlkKt5AN');
      const step5 = subject.getBar('jtnn3');
      logInfo(`step5 getBar("jtnn3"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0447 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0448
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0448
     * @tc.desc      ComponentFactory call flow getBar > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0448', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0448 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('dBblCxE4');
      logInfo(`step1 getBar("dBblCxE4"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('AlrP57tD6bQR');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0448 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0449
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0449
     * @tc.desc      ComponentFactory call flow toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0449', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0449 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('DSfb');
      logInfo(`step2 getBar("DSfb"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0449 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0450
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0450
     * @tc.desc      ComponentFactory call flow getBar > getBar > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0450', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0450 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('DSBnmbthJ');
      logInfo(`step1 getBar("DSBnmbthJ"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('p9vA3Qd');
      logInfo(`step2 getBar("p9vA3Qd"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('PlJs');
      subject.delete('9jfEVwbUxWSz');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0450 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0451
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0451
     * @tc.desc      ComponentFactory call flow toArray > getParams > getContent > delete > getParams keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0451', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0451 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('Hello World');
      subject.getContent('GbgePszBh');
      subject.delete('L4');
      subject.getParams('qWYQl');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0451 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0452
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0452
     * @tc.desc      ComponentFactory call flow getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0452', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0452 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('P');
      logInfo(`step1 getBar("P"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('gpU4CZMSS');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0452 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0453
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0453
     * @tc.desc      ComponentFactory call flow getParams > delete > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0453', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0453 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('Jq');
      subject.delete('97EUJo4w8J9k');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('R');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0453 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0454
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0454
     * @tc.desc      ComponentFactory call flow toArray > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0454', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0454 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('k');
      subject.getParams('xHello');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0454 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0455
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0455
     * @tc.desc      ComponentFactory call flow getBar > getParams > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0455', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0455 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('ciB48JMXh');
      logInfo(`step1 getBar("ciB48JMXh"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams(' a ');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getParams('iWOsagN');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0455 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0456
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0456
     * @tc.desc      ComponentFactory call flow toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0456', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0456 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('0pudv5fpUF');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0456 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0457
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0457
     * @tc.desc      ComponentFactory call flow getBar > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0457', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0457 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('adEU1fZJ');
      logInfo(`step1 getBar("adEU1fZJ"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('gpYStKeTq7');
      subject.getParams('i9fjd');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0457 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0458
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0458
     * @tc.desc      ComponentFactory call flow getBar > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0458', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0458 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('ay6');
      logInfo(`step1 getBar("ay6"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('xa');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0458 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0459
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0459
     * @tc.desc      ComponentFactory call flow toArray > getParams > getContent > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0459', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0459 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('Y');
      subject.getContent(' _1');
      subject.delete('dM4YHaoN');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0459 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0460
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0460
     * @tc.desc      ComponentFactory call flow getContent > getParams > toArray > toArray > getContent keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0460', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0460 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('Ep');
      subject.getParams('r1OLSW8kuXJ');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getContent('dh1PdJ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0460 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0461
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0461
     * @tc.desc      ComponentFactory call flow toArray > getContent > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0461', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0461 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('OxSA80TGVBGf');
      subject.delete('bCFxYHlz');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0461 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0462
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0462
     * @tc.desc      ComponentFactory call flow getParams > getContent > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0462', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0462 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('i9fjd');
      subject.getContent('nq');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0462 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0463
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0463
     * @tc.desc      ComponentFactory call flow getBar > getContent > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0463', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0463 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Bo4Qrnt');
      logInfo(`step1 getBar("Bo4Qrnt"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('EzNIsPj');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0463 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0464
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0464
     * @tc.desc      ComponentFactory call flow getParams > getContent > getParams > toArray > getContent keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0464', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0464 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('i');
      subject.getContent('ZOfGU3m5fzix');
      subject.getParams('iYuvcsbi');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getContent(' Sample Title 123 ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0464 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0465
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0465
     * @tc.desc      ComponentFactory call flow delete > getParams > getParams > getParams > getBar keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0465', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0465 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('YD4gWjooSL');
      subject.getParams('KQe6F');
      subject.getParams('43n');
      subject.getParams('0g9xwFN');
      const step5 = subject.getBar('Bo4Qrnt');
      logInfo(`step5 getBar("Bo4Qrnt"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0465 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0466
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0466
     * @tc.desc      ComponentFactory call flow delete > delete > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0466', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0466 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete(' Hello ');
      subject.delete('K7EGmG7Pak');
      const step3 = subject.getBar('BeFW5WczN');
      logInfo(`step3 getBar("BeFW5WczN"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('qS');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0466 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0467
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0467
     * @tc.desc      ComponentFactory call flow getParams > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0467', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0467 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('Yy');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('mVOnDM');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0467 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0468
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0468
     * @tc.desc      ComponentFactory call flow getBar > delete > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0468', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0468 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('A_1');
      logInfo(`step1 getBar("A_1"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('inIQz');
      subject.getContent('xxD');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0468 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0469
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0469
     * @tc.desc      ComponentFactory call flow getParams > getBar > getBar > getContent > getContent keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0469', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0469 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('xtayMj');
      const step2 = subject.getBar('zBPStDSd46');
      logInfo(`step2 getBar("zBPStDSd46"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('A6gejCa00mXb');
      logInfo(`step3 getBar("A6gejCa00mXb"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('HelloHello');
      subject.getContent('Ep');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0469 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0470
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0470
     * @tc.desc      ComponentFactory call flow toArray > delete > delete > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0470', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0470 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('Hello');
      subject.delete('Dbx1z0');
      subject.getContent('8LIv');
      const step5 = subject.getBar('c');
      logInfo(`step5 getBar("c"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0470 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0471
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0471
     * @tc.desc      ComponentFactory call flow toArray > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0471', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0471 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('FgDmNta9Bvr');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0471 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0472
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0472
     * @tc.desc      ComponentFactory call flow toArray > delete > getBar > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0472', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0472 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('aHkr');
      const step3 = subject.getBar('49k1A7YOxx');
      logInfo(`step3 getBar("49k1A7YOxx"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('st');
      subject.delete('UlpblCT');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0472 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0473
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0473
     * @tc.desc      ComponentFactory call flow toArray > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0473', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0473 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('4dnloBNO2xf');
      logInfo(`step2 getBar("4dnloBNO2xf"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('Ld');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0473 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0474
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0474
     * @tc.desc      ComponentFactory call flow delete > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0474', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0474 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('oiIClbtP6');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('U5ac1t');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0474 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0475
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0475
     * @tc.desc      ComponentFactory call flow delete > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0475', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0475 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('YeZvSmculB');
      const step2 = subject.getBar('eLKhA');
      logInfo(`step2 getBar("eLKhA"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('Ld');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0475 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0476
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0476
     * @tc.desc      ComponentFactory call flow getParams > delete > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0476', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0476 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('iWOsagN');
      subject.delete('sz4qZ6Y');
      const step3 = subject.getBar(' Hello World ');
      logInfo(`step3 getBar(" Hello World "): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('CLM');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0476 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0477
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0477
     * @tc.desc      ComponentFactory call flow getContent > toArray > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0477', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0477 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('Tair');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('8Uzb2NI');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0477 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0478
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0478
     * @tc.desc      ComponentFactory call flow toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0478', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0478 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('eECT3Cnise1I');
      logInfo(`step2 getBar("eECT3Cnise1I"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0478 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0479
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0479
     * @tc.desc      ComponentFactory call flow toArray > getParams > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0479', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0479 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('g');
      subject.delete('UlpblCT');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0479 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0480
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0480
     * @tc.desc      ComponentFactory call flow delete > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0480', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0480 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('wj4R');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('YRgTMZgh');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0480 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0481
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0481
     * @tc.desc      ComponentFactory call flow getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0481', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0481 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('KCLPWyUfIW');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0481 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0482
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0482
     * @tc.desc      ComponentFactory call flow getBar > delete > getParams > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0482', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0482 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('HxnhpHwZpVKv');
      logInfo(`step1 getBar("HxnhpHwZpVKv"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete(' \u4e2d\u6587 ');
      subject.getParams('i');
      subject.getParams('iWOsagN');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0482 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0483
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0483
     * @tc.desc      ComponentFactory call flow getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0483', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0483 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('DKkkl');
      logInfo(`step1 getBar("DKkkl"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0483 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0484
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0484
     * @tc.desc      ComponentFactory call flow toArray > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0484', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0484 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('gpU4CZMSS');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0484 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0485
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0485
     * @tc.desc      ComponentFactory call flow delete > delete > toArray > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0485', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0485 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('Hello World');
      subject.delete('vt7M08');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('Zv4ZAUwRHoi');
      const step5 = subject.getBar('c');
      logInfo(`step5 getBar("c"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0485 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0486
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0486
     * @tc.desc      ComponentFactory call flow getParams > getBar > toArray > getContent > getContent keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0486', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0486 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams(' A ');
      const step2 = subject.getBar('thaeTW');
      logInfo(`step2 getBar("thaeTW"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('xA');
      subject.getContent('vW8IZb2km');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0486 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0487
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0487
     * @tc.desc      ComponentFactory call flow delete > toArray > getParams > delete > getContent keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0487', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0487 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('earF3');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('P0OMaAqQY8xL');
      subject.delete('QoK4');
      subject.getContent('4mRCIp6Bk0k4');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0487 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0488
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0488
     * @tc.desc      ComponentFactory call flow toArray > getParams > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0488', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0488 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('UVLwtn');
      subject.getParams('');
      const step4 = subject.getBar('dqX9qYwm');
      logInfo(`step4 getBar("dqX9qYwm"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0488 end`);
    });
  });
}
