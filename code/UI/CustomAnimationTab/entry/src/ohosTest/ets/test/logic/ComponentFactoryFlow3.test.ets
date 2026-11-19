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

/** Logic checks for ComponentFactory flow (60 cases). */
export default function componentFactoryFlow3Test(): void {
  describe('ComponentFactoryFlow3Test', () => {
    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0128
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0128
     * @tc.desc      ComponentFactory call flow getContent > getBar > delete > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0128 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('Td7IPsx59Z');
      const step2 = subject.getBar('L7LmJ9G');
      logInfo(`step2 getBar("L7LmJ9G"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('9Yxb3LyW2g');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0128 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0129
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0129
     * @tc.desc      ComponentFactory call flow getParams > toArray > delete > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0129 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('dEkCFIvXd');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('u63n86V');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5 = subject.getBar('ayCVc6W3E');
      logInfo(`step5 getBar("ayCVc6W3E"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0129 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0130
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0130
     * @tc.desc      ComponentFactory call flow getContent > delete > getBar > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0130 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('o7ehL');
      subject.delete('FR5gCJGQ');
      const step3 = subject.getBar('adEU1fZJ');
      logInfo(`step3 getBar("adEU1fZJ"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5 = subject.getBar('rRj8x6YM6');
      logInfo(`step5 getBar("rRj8x6YM6"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0130 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0131
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0131
     * @tc.desc      ComponentFactory call flow getBar > getBar > toArray > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0131 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('n6t');
      logInfo(`step1 getBar("n6t"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('njB9hbOH');
      logInfo(`step2 getBar("njB9hbOH"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('3');
      logInfo(`step4 getBar("3"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0131 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0132
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0132
     * @tc.desc      ComponentFactory call flow toArray > toArray > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0132 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('uhEdJ8TYI');
      const step4 = subject.getBar('n8oyYK');
      logInfo(`step4 getBar("n8oyYK"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0132 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0133
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0133
     * @tc.desc      ComponentFactory call flow getBar > getBar > getParams > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0133 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('\u4e2d\u6587_1');
      logInfo(`step1 getBar("??_1"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('YEaX');
      logInfo(`step2 getBar("YEaX"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('123_1');
      subject.getContent('7MmBfPvMALD');
      const step5 = subject.getBar(' _1');
      logInfo(`step5 getBar(" _1"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0133 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0134
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0134
     * @tc.desc      ComponentFactory call flow toArray > getBar > toArray > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0134 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('uG2');
      logInfo(`step2 getBar("uG2"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('upjzRMbiEoc');
      logInfo(`step4 getBar("upjzRMbiEoc"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getParams('h6o');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0134 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0135
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0135
     * @tc.desc      ComponentFactory call flow getParams > toArray > delete > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0135 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('i685dQSQE');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete(' A ');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0135 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0136
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0136
     * @tc.desc      ComponentFactory call flow getParams > getBar > toArray > getContent > getBar keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0136 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('Hello');
      const step2 = subject.getBar('0FT');
      logInfo(`step2 getBar("0FT"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('bHt');
      const step5 = subject.getBar('b0T');
      logInfo(`step5 getBar("b0T"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0136 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0137
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0137
     * @tc.desc      ComponentFactory call flow toArray > getContent > getContent > getBar > getBar keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0137 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('FLQOuZsk');
      subject.getContent('1AlWfu7w');
      const step4 = subject.getBar(' ');
      logInfo(`step4 getBar(" "): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getBar('xoCXqWLigfEo');
      logInfo(`step5 getBar("xoCXqWLigfEo"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0137 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0138
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0138
     * @tc.desc      ComponentFactory call flow getParams > getBar > getParams > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0138 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('tCv1p8');
      const step2 = subject.getBar(' Sample Title 123 ');
      logInfo(`step2 getBar(" Sample Title 123 "): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('Ej');
      const step4 = subject.getBar('Uw56XMZCO');
      logInfo(`step4 getBar("Uw56XMZCO"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getBar('uwe90');
      logInfo(`step5 getBar("uwe90"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0138 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0139
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0139
     * @tc.desc      ComponentFactory call flow getBar > toArray > getBar > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0139 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('0vSLrfP6Ad');
      logInfo(`step1 getBar("0vSLrfP6Ad"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('WCEOCcw2E2');
      logInfo(`step3 getBar("WCEOCcw2E2"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('eAYcBjsH');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0139 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0140
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0140
     * @tc.desc      ComponentFactory call flow delete > getBar > toArray > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0140 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('p7H');
      const step2 = subject.getBar('O81E1pRljiV');
      logInfo(`step2 getBar("O81E1pRljiV"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('AA');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0140 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0141
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0141
     * @tc.desc      ComponentFactory call flow getBar > getParams > delete > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0141 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('UxuoihOCz');
      logInfo(`step1 getBar("UxuoihOCz"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('gpU4CZMSS');
      subject.delete('xa');
      const step4 = subject.getBar('');
      logInfo(`step4 getBar(""): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getBar('ICcp');
      logInfo(`step5 getBar("ICcp"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0141 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0142
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0142
     * @tc.desc      ComponentFactory call flow getBar > toArray > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0142 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('O81E1pRljiV');
      logInfo(`step1 getBar("O81E1pRljiV"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0142 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0143
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0143
     * @tc.desc      ComponentFactory call flow toArray > delete > toArray > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0143 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('bSxeDoYBn');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('4F9j7D60VEyy');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0143 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0144
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0144
     * @tc.desc      ComponentFactory call flow toArray > getBar > toArray > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0144 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('kRhUbvP8S');
      logInfo(`step2 getBar("kRhUbvP8S"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getParams('BgKI');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0144 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0145
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0145
     * @tc.desc      ComponentFactory call flow toArray > toArray > getContent > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0145 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('o');
      const step4 = subject.getBar(' a ');
      logInfo(`step4 getBar(" a "): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0145 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0146
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0146
     * @tc.desc      ComponentFactory call flow getBar > getBar > delete > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0146 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('xhello world');
      logInfo(`step1 getBar("xhello world"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('0xoZWamAK');
      logInfo(`step2 getBar("0xoZWamAK"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('dAGx');
      subject.getContent('XKKUPI7txYk');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0146 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0147
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0147
     * @tc.desc      ComponentFactory call flow getBar > getBar > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0147 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('XHj0');
      logInfo(`step1 getBar("XHj0"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('Zkfnj8M');
      logInfo(`step2 getBar("Zkfnj8M"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('ofTfIEGv');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0147 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0148
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0148
     * @tc.desc      ComponentFactory call flow toArray > toArray > toArray > toArray > getContent keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0148 begin`);
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
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getContent('U1lXp');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0148 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0149
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0149
     * @tc.desc      ComponentFactory call flow getBar > getContent > delete > getContent > toArray keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0149 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('mb');
      logInfo(`step1 getBar("mb"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('b8vshwWWo68');
      subject.delete('Eb1lOOT');
      subject.getContent('Kf');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0149 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0150
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0150
     * @tc.desc      ComponentFactory call flow getContent > getBar > getBar > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0150 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('cv4YfHFsY1');
      const step2 = subject.getBar(' Hello World ');
      logInfo(`step2 getBar(" Hello World "): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('aa');
      logInfo(`step3 getBar("aa"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5 = subject.getBar('xZ');
      logInfo(`step5 getBar("xZ"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0150 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0151
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0151
     * @tc.desc      ComponentFactory call flow getBar > getBar > getBar > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0151 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('WRd');
      logInfo(`step1 getBar("WRd"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar(' 123 ');
      logInfo(`step2 getBar(" 123 "): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar(' \u4e2d\u6587 ');
      logInfo(`step3 getBar(" ?? "): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0151 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0152
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0152
     * @tc.desc      ComponentFactory call flow getBar > getBar > delete > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0152 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('6Gs7');
      logInfo(`step1 getBar("6Gs7"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('T');
      logInfo(`step2 getBar("T"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('mnsT');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0152 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0153
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0153
     * @tc.desc      ComponentFactory call flow getBar > toArray > getContent > getContent > toArray keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0153 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('YEaX');
      logInfo(`step1 getBar("YEaX"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('UUfRskW');
      subject.getContent('dh1PdJ');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0153 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0154
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0154
     * @tc.desc      ComponentFactory call flow getBar > toArray > getBar > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0154 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('WF2dJw');
      logInfo(`step1 getBar("WF2dJw"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('GuYN');
      logInfo(`step3 getBar("GuYN"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('A6gejCa00mXb');
      logInfo(`step4 getBar("A6gejCa00mXb"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getBar('IBRvXI');
      logInfo(`step5 getBar("IBRvXI"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0154 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0155
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0155
     * @tc.desc      ComponentFactory call flow getBar > getParams > toArray > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0155 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('e7qxFXB9Kbb');
      logInfo(`step1 getBar("e7qxFXB9Kbb"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('v20t6bh');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5 = subject.getBar('DM9T23Gtl2');
      logInfo(`step5 getBar("DM9T23Gtl2"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0155 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0156
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0156
     * @tc.desc      ComponentFactory call flow toArray > delete > toArray > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0156 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('vHA');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('Sample Title 123Sample Title 123');
      logInfo(`step4 getBar("Sample Title 123Sample Titl...: step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0156 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0157
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0157
     * @tc.desc      ComponentFactory call flow getBar > getContent > toArray > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0157 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('CDfrwdMnV');
      logInfo(`step1 getBar("CDfrwdMnV"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('jk8tbuD');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('go');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0157 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0158
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0158
     * @tc.desc      ComponentFactory call flow getBar > delete > getBar > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0158 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('  ');
      logInfo(`step1 getBar("  "): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('CLM');
      const step3 = subject.getBar('3LN2SuKY4');
      logInfo(`step3 getBar("3LN2SuKY4"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('2pjqf');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0158 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0159
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0159
     * @tc.desc      ComponentFactory call flow toArray > toArray > getBar > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0159 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('Yz3');
      logInfo(`step3 getBar("Yz3"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('3b0EBZ');
      const step5 = subject.getBar('123123');
      logInfo(`step5 getBar("123123"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0159 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0160
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0160
     * @tc.desc      ComponentFactory call flow toArray > toArray > toArray > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0160 begin`);
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
      subject.getParams('vNjVZmEshdi');
      const step5 = subject.getBar('uG2');
      logInfo(`step5 getBar("uG2"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0160 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0161
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0161
     * @tc.desc      ComponentFactory call flow getContent > getBar > toArray > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0161 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('QjJmW');
      const step2 = subject.getBar(' a ');
      logInfo(`step2 getBar(" a "): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0161 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0162
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0162
     * @tc.desc      ComponentFactory call flow toArray > getContent > toArray > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0162 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('KR');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('x0');
      const step5 = subject.getBar(' _1');
      logInfo(`step5 getBar(" _1"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0162 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0163
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0163
     * @tc.desc      ComponentFactory call flow getBar > toArray > toArray > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0163 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('1MYBqsx53n');
      logInfo(`step1 getBar("1MYBqsx53n"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('7cw');
      logInfo(`step4 getBar("7cw"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0163 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0164
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0164
     * @tc.desc      ComponentFactory call flow toArray > getBar > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0164 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('rlMC8');
      logInfo(`step2 getBar("rlMC8"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('njB9hbOH');
      logInfo(`step3 getBar("njB9hbOH"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('bsuWtl');
      logInfo(`step4 getBar("bsuWtl"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0164 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0165
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0165
     * @tc.desc      ComponentFactory call flow getBar > getBar > delete > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0165 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Uq96gDO3');
      logInfo(`step1 getBar("Uq96gDO3"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('b');
      logInfo(`step2 getBar("b"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('sta8M7k');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5 = subject.getBar('Zkfnj8M');
      logInfo(`step5 getBar("Zkfnj8M"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0165 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0166
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0166
     * @tc.desc      ComponentFactory call flow getBar > toArray > getParams > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0166 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('C4');
      logInfo(`step1 getBar("C4"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('jKT9Pt');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0166 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0167
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0167
     * @tc.desc      ComponentFactory call flow toArray > getContent > getBar > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0167 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('HPBKG1Df');
      const step3 = subject.getBar('6Tomqj');
      logInfo(`step3 getBar("6Tomqj"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('etSuf');
      logInfo(`step4 getBar("etSuf"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0167 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0168
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0168
     * @tc.desc      ComponentFactory call flow toArray > getBar > getBar > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0168 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('dqX9qYwm');
      logInfo(`step2 getBar("dqX9qYwm"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('cCiM');
      logInfo(`step3 getBar("cCiM"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('8Uzb2NI');
      const step5 = subject.getBar('cy');
      logInfo(`step5 getBar("cy"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0168 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0169
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0169
     * @tc.desc      ComponentFactory call flow getBar > toArray > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0169 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Dh');
      logInfo(`step1 getBar("Dh"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('P84ipO3HrA');
      logInfo(`step3 getBar("P84ipO3HrA"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('IXj4nI0');
      logInfo(`step4 getBar("IXj4nI0"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0169 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0170
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0170
     * @tc.desc      ComponentFactory call flow toArray > delete > getBar > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0170 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('JPpP');
      const step3 = subject.getBar('adwN3');
      logInfo(`step3 getBar("adwN3"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5 = subject.getBar('jFoCVxiA4Z');
      logInfo(`step5 getBar("jFoCVxiA4Z"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0170 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0171
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0171
     * @tc.desc      ComponentFactory call flow delete > getBar > getBar > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0171 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('mnsT');
      const step2 = subject.getBar('qMrW');
      logInfo(`step2 getBar("qMrW"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('a0Zw2D');
      logInfo(`step3 getBar("a0Zw2D"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('dqy7B');
      logInfo(`step4 getBar("dqy7B"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getBar('0FT');
      logInfo(`step5 getBar("0FT"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0171 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0172
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0172
     * @tc.desc      ComponentFactory call flow toArray > getBar > getBar > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0172 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('\u4e2d\u6587_1');
      logInfo(`step2 getBar("??_1"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('et');
      logInfo(`step3 getBar("et"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('A');
      logInfo(`step4 getBar("A"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getBar('9l');
      logInfo(`step5 getBar("9l"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0172 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0173
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0173
     * @tc.desc      ComponentFactory call flow toArray > toArray > delete > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0173 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('tC');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0173 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0174
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0174
     * @tc.desc      ComponentFactory call flow delete > toArray > getBar > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0174 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('FgDmNta9Bvr');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('AA');
      logInfo(`step3 getBar("AA"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('b0T');
      logInfo(`step4 getBar("b0T"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getBar('Sample Title 123Sample Title 123');
      logInfo(`step5 getBar("Sample Title 123Sample Titl...: step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0174 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0175
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0175
     * @tc.desc      ComponentFactory call flow toArray > delete > toArray > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0175 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('xTAb76rdloN');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5 = subject.getBar('Smhe70');
      logInfo(`step5 getBar("Smhe70"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0175 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0176
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0176
     * @tc.desc      ComponentFactory call flow getParams > getBar > getBar > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0176 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('HikHof1f');
      const step2 = subject.getBar('123123');
      logInfo(`step2 getBar("123123"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar(' abc ');
      logInfo(`step3 getBar(" abc "): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0176 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0177
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0177
     * @tc.desc      ComponentFactory call flow getBar > delete > getBar > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0177 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('mGe');
      logInfo(`step1 getBar("mGe"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete(' Sample Title 123 ');
      const step3 = subject.getBar('Hello World');
      logInfo(`step3 getBar("Hello World"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0177 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0178
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0178
     * @tc.desc      ComponentFactory call flow getBar > toArray > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0178 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('ICcp');
      logInfo(`step1 getBar("ICcp"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('n8oyYK');
      logInfo(`step3 getBar("n8oyYK"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0178 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0179
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0179
     * @tc.desc      ComponentFactory call flow toArray > getBar > getContent > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0179 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('ayCVc6W3E');
      logInfo(`step2 getBar("ayCVc6W3E"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent(' \u4e2d\u6587 ');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0179 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0180
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0180
     * @tc.desc      ComponentFactory call flow toArray > getBar > getContent > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0180 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('TnQBIQCiZGc');
      logInfo(`step2 getBar("TnQBIQCiZGc"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('x');
      const step4 = subject.getBar('2Iah91P');
      logInfo(`step4 getBar("2Iah91P"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0180 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0181
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0181
     * @tc.desc      ComponentFactory call flow getBar > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0181 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('WRd');
      logInfo(`step1 getBar("WRd"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('MedbmHHUIc');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0181 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0182
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0182
     * @tc.desc      ComponentFactory call flow delete > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0182 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('bSxeDoYBn');
      subject.getParams('yKIG4eakeO');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0182 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0183
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0183
     * @tc.desc      ComponentFactory call flow getContent > delete > getParams > toArray > getContent keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0183 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('2atXJqonx0');
      subject.delete('MTjLYu1O4y');
      subject.getParams('gZ');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getContent('HZYhpUbfgQ2');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0183 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0184
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0184
     * @tc.desc      ComponentFactory call flow toArray > getBar > delete > getContent > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0184 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('4emy0O7');
      logInfo(`step2 getBar("4emy0O7"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('HelloHello');
      subject.getContent('N7w');
      subject.delete('fTNSgriK74V');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0184 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0185
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0185
     * @tc.desc      ComponentFactory call flow toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0185 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('7ZjIEOmdPkOR');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0185 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0186
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0186
     * @tc.desc      ComponentFactory call flow getParams > getParams > toArray > getContent > delete keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0186 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('43n');
      subject.getParams('0KxxJOv9RNr5');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('S0HWBvzTs');
      subject.delete('HelloHello');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0186 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0187
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0187
     * @tc.desc      ComponentFactory call flow getBar > getParams > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0187 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('6');
      logInfo(`step1 getBar("6"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('Fl');
      subject.getParams('4i');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0187 end`);
    });
  });
}
