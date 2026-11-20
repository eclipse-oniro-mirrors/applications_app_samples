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

/** Logic checks for ComponentFactory flow (76 cases). */
export default function componentFactoryFlow5Test(): void {
  describe('ComponentFactoryFlow5Test', () => {
    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0263
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0263
     * @tc.desc      ComponentFactory call flow getBar > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0263 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Uzh40JIxi9r5');
      logInfo(`step1 getBar("Uzh40JIxi9r5"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('MDzjvi6c');
      const step3 = subject.getBar('  ');
      logInfo(`step3 getBar("  "): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0263 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0264
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0264
     * @tc.desc      ComponentFactory call flow getBar > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0264 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('6');
      logInfo(`step1 getBar("6"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('ti2UlpzkdM2');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0264 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0265
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0265
     * @tc.desc      ComponentFactory call flow getContent > delete > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0265 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent(' 123 ');
      subject.delete('  ');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('oY00LNDxwC');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0265 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0266
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0266
     * @tc.desc      ComponentFactory call flow getParams > toArray > delete > getContent > getParams keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0266 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('xHello World');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('XVkfLk');
      subject.getContent('4mRCIp6Bk0k4');
      subject.getParams('khSGEyk2yQy');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0266 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0267
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0267
     * @tc.desc      ComponentFactory call flow delete > toArray > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0267 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('VRHQckRveA6e');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0267 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0268
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0268
     * @tc.desc      ComponentFactory call flow delete > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0268 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete(' abc ');
      subject.delete(' hello world ');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0268 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0269
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0269
     * @tc.desc      ComponentFactory call flow delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0269 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete(' \u4e2d\u6587 ');
      const step2 = subject.getBar('2Q');
      logInfo(`step2 getBar("2Q"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0269 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0270
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0270
     * @tc.desc      ComponentFactory call flow toArray > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0270 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('tC');
      subject.getParams('eIU9y');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0270 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0271
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0271
     * @tc.desc      ComponentFactory call flow getBar > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0271 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('cCiM');
      logInfo(`step1 getBar("cCiM"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('  ');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0271 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0272
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0272
     * @tc.desc      ComponentFactory call flow getContent > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0272 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('a');
      const step2 = subject.getBar('ay6');
      logInfo(`step2 getBar("ay6"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('x\u4e2d\u6587');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0272 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0273
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0273
     * @tc.desc      ComponentFactory call flow getBar > getParams > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0273 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('BeFW5WczN');
      logInfo(`step1 getBar("BeFW5WczN"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('\u4e2d\u6587_1');
      subject.getParams('II9');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0273 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0274
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0274
     * @tc.desc      ComponentFactory call flow getBar > getContent > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0274 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('hO3w7f');
      logInfo(`step1 getBar("hO3w7f"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('QErN1rSThJLd');
      const step3 = subject.getBar('w7smXl');
      logInfo(`step3 getBar("w7smXl"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('47lak6JVXRR');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0274 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0275
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0275
     * @tc.desc      ComponentFactory call flow getParams > getParams > toArray > toArray > getContent keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0275 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('xhello world');
      subject.getParams('EIF5t2O2ZVpJ');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getContent('bysMUMdqfPdq');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0275 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0276
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0276
     * @tc.desc      ComponentFactory call flow toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0276 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('2tIMNtcNOL');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0276 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0277
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0277
     * @tc.desc      ComponentFactory call flow getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0277 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('03cx');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0277 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0278
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0278
     * @tc.desc      ComponentFactory call flow getBar > getBar > toArray > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0278 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Dh');
      logInfo(`step1 getBar("Dh"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('YEaX');
      logInfo(`step2 getBar("YEaX"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('45C0Rbxg');
      logInfo(`step4 getBar("45C0Rbxg"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getParams('wsq7rmEOO');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0278 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0279
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0279
     * @tc.desc      ComponentFactory call flow getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0279 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('6Tomqj');
      logInfo(`step1 getBar("6Tomqj"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0279 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0280
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0280
     * @tc.desc      ComponentFactory call flow toArray > getParams > getContent > toArray > getParams keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0280 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('\u4e2d\u6587_1');
      subject.getContent('s7CZvpnN5wE0');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getParams('thJK');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0280 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0281
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0281
     * @tc.desc      ComponentFactory call flow getBar > delete > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0281 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('jtnn3');
      logInfo(`step1 getBar("jtnn3"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('YRgTMZgh');
      const step3 = subject.getBar('p9vA3Qd');
      logInfo(`step3 getBar("p9vA3Qd"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('K7EGmG7Pak');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0281 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0282
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0282
     * @tc.desc      ComponentFactory call flow toArray > getContent > getContent > toArray > getParams keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0282 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('I');
      subject.getContent('\u4e2d\u6587_1');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getParams('0KxxJOv9RNr5');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0282 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0283
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0283
     * @tc.desc      ComponentFactory call flow getParams > delete > getParams > getContent > getBar keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0283 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('2tIMNtcNOL');
      subject.delete('R');
      subject.getParams('MO0ZHZa');
      subject.getContent('o7ehL');
      const step5 = subject.getBar('CyPe');
      logInfo(`step5 getBar("CyPe"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0283 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0284
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0284
     * @tc.desc      ComponentFactory call flow delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0284 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('GMuQcDUSD0D');
      const step2 = subject.getBar('GuYN');
      logInfo(`step2 getBar("GuYN"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0284 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0285
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0285
     * @tc.desc      ComponentFactory call flow getContent > getBar > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0285 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('h');
      const step2 = subject.getBar('upjzRMbiEoc');
      logInfo(`step2 getBar("upjzRMbiEoc"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('go');
      subject.delete('DFXlTccFsR');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0285 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0286
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0286
     * @tc.desc      ComponentFactory call flow delete > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0286 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('U32wSwCuAI');
      subject.delete('NvoNa');
      const step3 = subject.getBar('NW');
      logInfo(`step3 getBar("NW"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0286 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0287
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0287
     * @tc.desc      ComponentFactory call flow delete > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0287 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('P6');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('Xard8Kss3VC');
      logInfo(`step3 getBar("Xard8Kss3VC"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0287 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0288
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0288
     * @tc.desc      ComponentFactory call flow getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0288 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('c');
      logInfo(`step1 getBar("c"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('Y81DfEBjzC');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0288 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0289
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0289
     * @tc.desc      ComponentFactory call flow getParams > getBar > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0289 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('IhXNf');
      const step2 = subject.getBar('s');
      logInfo(`step2 getBar("s"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('2m06');
      subject.getParams('l0vCXsQi3');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0289 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0290
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0290
     * @tc.desc      ComponentFactory call flow toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0290 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('thJK');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0290 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0291
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0291
     * @tc.desc      ComponentFactory call flow delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0291 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('fhptq9vtxk6');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0291 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0292
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0292
     * @tc.desc      ComponentFactory call flow delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0292 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('J6uwV');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0292 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0293
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0293
     * @tc.desc      ComponentFactory call flow toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0293 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('ix');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0293 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0294
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0294
     * @tc.desc      ComponentFactory call flow getBar > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0294 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('N7OAv');
      logInfo(`step1 getBar("N7OAv"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('SsohOcYTVMY');
      subject.delete('oY00LNDxwC');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0294 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0295
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0295
     * @tc.desc      ComponentFactory call flow delete > delete > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0295 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('8uYGsOLyg');
      subject.delete('st');
      subject.getParams('Rx79u5I');
      const step4 = subject.getBar('eLKhA');
      logInfo(`step4 getBar("eLKhA"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0295 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0296
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0296
     * @tc.desc      ComponentFactory call flow getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0296 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('123_1');
      logInfo(`step1 getBar("123_1"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('Bwig9b9gr');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0296 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0297
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0297
     * @tc.desc      ComponentFactory call flow getParams > getParams > getBar > getContent > getContent keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0297 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('3b0EBZ');
      subject.getParams('Hello World_1');
      const step3 = subject.getBar('BWZOfF6GDY');
      logInfo(`step3 getBar("BWZOfF6GDY"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('xHello World');
      subject.getContent('dJIIvl');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0297 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0298
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0298
     * @tc.desc      ComponentFactory call flow delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0298 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('6DHUOhqDg8');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0298 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0299
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0299
     * @tc.desc      ComponentFactory call flow toArray > delete > delete > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0299 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('UDi285Ncj');
      subject.delete('0f2lJSgLEE');
      subject.delete('xSample Title 123');
      subject.getParams(' a ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0299 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0300
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0300
     * @tc.desc      ComponentFactory call flow toArray > getContent > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0300 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('HelloHello');
      const step3 = subject.getBar('O6CfKF');
      logInfo(`step3 getBar("O6CfKF"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0300 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0301
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0301
     * @tc.desc      ComponentFactory call flow getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0301 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('IHZz2H');
      logInfo(`step1 getBar("IHZz2H"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('9JNMtgePsoc');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0301 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0302
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0302
     * @tc.desc      ComponentFactory call flow getBar > getParams > toArray > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0302 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('WCEOCcw2E2');
      logInfo(`step1 getBar("WCEOCcw2E2"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('Oeh3Zti');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('J');
      subject.delete('o52ed3k1i');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0302 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0303
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0303
     * @tc.desc      ComponentFactory call flow getContent > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0303 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('JLyYfj');
      const step2 = subject.getBar('NW');
      logInfo(`step2 getBar("NW"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('lEdaAGGIE');
      logInfo(`step3 getBar("lEdaAGGIE"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0303 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0304
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0304
     * @tc.desc      ComponentFactory call flow getBar > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0304 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('G7OT8');
      logInfo(`step1 getBar("G7OT8"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('vYLFZm');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0304 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0305
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0305
     * @tc.desc      ComponentFactory call flow getParams > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0305 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('lq5');
      const step2 = subject.getBar('mdL');
      logInfo(`step2 getBar("mdL"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('SDo92I7HlZ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0305 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0306
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0306
     * @tc.desc      ComponentFactory call flow delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0306 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('z');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0306 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0307
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0307
     * @tc.desc      ComponentFactory call flow getContent > getParams > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0307 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('NwT');
      subject.getParams('SkVafRDpC8U');
      subject.delete(' ');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0307 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0308
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0308
     * @tc.desc      ComponentFactory call flow getContent > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0308 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('J');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('xBKm');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0308 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0309
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0309
     * @tc.desc      ComponentFactory call flow getContent > getParams > getContent > getBar > getParams keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0309 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('2Hl3ViT');
      subject.getParams('WTUedcyGAZ1');
      subject.getContent('mkGSzn');
      const step4 = subject.getBar('ZhkaZi8GuZK');
      logInfo(`step4 getBar("ZhkaZi8GuZK"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getParams('9JNMtgePsoc');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0309 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0310
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0310
     * @tc.desc      ComponentFactory call flow toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0310 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('lk1i');
      logInfo(`step2 getBar("lk1i"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0310 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0311
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0311
     * @tc.desc      ComponentFactory call flow toArray > getParams > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0311 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('2tIMNtcNOL');
      subject.delete('xa');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0311 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0312
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0312
     * @tc.desc      ComponentFactory call flow delete > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0312 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('x0');
      const step2 = subject.getBar('w7smXl');
      logInfo(`step2 getBar("w7smXl"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0312 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0313
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0313
     * @tc.desc      ComponentFactory call flow toArray > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0313 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('FfIwdN');
      subject.delete('znM');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0313 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0314
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0314
     * @tc.desc      ComponentFactory call flow getBar > delete > toArray > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0314 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('123123');
      logInfo(`step1 getBar("123123"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('chSGAb3Lmu');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('P6');
      subject.delete('ofTfIEGv');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0314 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0315
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0315
     * @tc.desc      ComponentFactory call flow delete > toArray > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0315 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('aZyPzQa7arm');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('CyPe');
      logInfo(`step3 getBar("CyPe"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('xZK');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0315 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0316
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0316
     * @tc.desc      ComponentFactory call flow getParams > getContent > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0316 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('bSLL7S');
      subject.getContent('8LIv');
      const step3 = subject.getBar('cX2');
      logInfo(`step3 getBar("cX2"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('Pwt6zZsPyvP');
      logInfo(`step4 getBar("Pwt6zZsPyvP"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0316 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0317
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0317
     * @tc.desc      ComponentFactory call flow getBar > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0317 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('2Iah91P');
      logInfo(`step1 getBar("2Iah91P"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('GKJ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0317 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0318
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0318
     * @tc.desc      ComponentFactory call flow toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0318 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0318 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0319
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0319
     * @tc.desc      ComponentFactory call flow getBar > toArray > getParams > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0319 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('uLvz1');
      logInfo(`step1 getBar("uLvz1"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('AlrP57tD6bQR');
      subject.getParams('B');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0319 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0320
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0320
     * @tc.desc      ComponentFactory call flow getBar > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0320 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('vRiQstPt7');
      logInfo(`step1 getBar("vRiQstPt7"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('Lsqkixb');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0320 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0321
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0321
     * @tc.desc      ComponentFactory call flow getContent > getBar > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0321 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('R6Cty5d');
      const step2 = subject.getBar('9l');
      logInfo(`step2 getBar("9l"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('p7H');
      const step4 = subject.getBar('ay6');
      logInfo(`step4 getBar("ay6"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0321 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0322
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0322
     * @tc.desc      ComponentFactory call flow delete > getContent > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0322 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('1JQNTOALvYj1');
      subject.getContent('KBhrxv');
      subject.getParams('5XuEUUej4hE');
      const step4 = subject.getBar('O81E1pRljiV');
      logInfo(`step4 getBar("O81E1pRljiV"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0322 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0323
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0323
     * @tc.desc      ComponentFactory call flow getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0323 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('hello world');
      const step2 = subject.getBar('\u4e2d\u6587');
      logInfo(`step2 getBar("??"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0323 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0324
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0324
     * @tc.desc      ComponentFactory call flow getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0324 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('s');
      logInfo(`step1 getBar("s"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('bCFxYHlz');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0324 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0325
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0325
     * @tc.desc      ComponentFactory call flow getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0325 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('xHello');
      const step2 = subject.getBar('6Tomqj');
      logInfo(`step2 getBar("6Tomqj"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0325 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0326
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0326
     * @tc.desc      ComponentFactory call flow delete > getParams > getBar > getParams > getParams keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0326 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('k');
      subject.getParams('03cx');
      const step3 = subject.getBar('IkSzXDcXT');
      logInfo(`step3 getBar("IkSzXDcXT"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('VkwV');
      subject.getParams(' Sample Title 123 ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0326 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0327
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0327
     * @tc.desc      ComponentFactory call flow getBar > getContent > getParams > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0327 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('O81E1pRljiV');
      logInfo(`step1 getBar("O81E1pRljiV"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('A_1');
      subject.getParams(' 123 ');
      subject.getParams('xA');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0327 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0328
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0328
     * @tc.desc      ComponentFactory call flow delete > delete > toArray > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0328 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('fy');
      subject.delete('xA');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('abc_1');
      const step5 = subject.getBar('Bo4Qrnt');
      logInfo(`step5 getBar("Bo4Qrnt"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0328 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0329
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0329
     * @tc.desc      ComponentFactory call flow delete > getParams > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0329 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('ZDKcZO');
      subject.getParams('abcabc');
      subject.delete('A');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0329 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0330
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0330
     * @tc.desc      ComponentFactory call flow getBar > getParams > getContent > delete > getContent keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0330 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('IHZz2H');
      logInfo(`step1 getBar("IHZz2H"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('SaZUvlunWF');
      subject.getContent('bozXXgG72');
      subject.delete('1JQNTOALvYj1');
      subject.getContent('a');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0330 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0331
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0331
     * @tc.desc      ComponentFactory call flow getContent > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0331 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('AA');
      subject.delete('z');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0331 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0332
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0332
     * @tc.desc      ComponentFactory call flow getBar > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0332 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('WG4eeWlpGG');
      logInfo(`step1 getBar("WG4eeWlpGG"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('hello world');
      const step3 = subject.getBar('Uq96gDO3');
      logInfo(`step3 getBar("Uq96gDO3"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0332 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0333
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0333
     * @tc.desc      ComponentFactory call flow getBar > delete > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0333 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('AA');
      logInfo(`step1 getBar("AA"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('bCFxYHlz');
      subject.getContent(' Sample Title 123 ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0333 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0334
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0334
     * @tc.desc      ComponentFactory call flow getBar > delete > getParams > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0334 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('w7smXl');
      logInfo(`step1 getBar("w7smXl"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete(' hello world ');
      subject.getParams('a_1');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getParams('f1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0334 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0335
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0335
     * @tc.desc      ComponentFactory call flow getBar > getContent > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0335 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('abc_1');
      logInfo(`step1 getBar("abc_1"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('KUCQL');
      subject.delete('HelloHello');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0335 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0336
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0336
     * @tc.desc      ComponentFactory call flow getParams > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0336 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('tye5mQmEDCCM');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0336 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0337
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0337
     * @tc.desc      ComponentFactory call flow toArray > getContent > getParams > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0337 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('bOd9mOl0Fwly');
      subject.getParams(' \u4e2d\u6587 ');
      subject.getParams('u28YtwC8GrPf');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0337 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0338
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0338
     * @tc.desc      ComponentFactory call flow toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0338 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('aa');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0338 end`);
    });
  });
}
