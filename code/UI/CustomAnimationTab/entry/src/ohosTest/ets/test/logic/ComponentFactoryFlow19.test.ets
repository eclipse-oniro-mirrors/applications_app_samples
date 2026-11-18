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
export default function componentFactoryFlow19Test(): void {
  describe('ComponentFactoryFlow19Test', () => {
    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1290
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1290
     * @tc.desc      ComponentFactory call flow getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1290', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1290 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('qMrW');
      logInfo(`step1 getBar("qMrW"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('et');
      logInfo(`step2 getBar("et"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1290 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1291
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1291
     * @tc.desc      ComponentFactory call flow toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1291', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1291 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('UV7n36');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1291 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1292
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1292
     * @tc.desc      ComponentFactory call flow toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1292', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1292 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1292 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1293
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1293
     * @tc.desc      ComponentFactory call flow getContent > delete > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1293', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1293 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('bISQH7qPL');
      subject.delete('oazDxlK9Y');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1293 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1294
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1294
     * @tc.desc      ComponentFactory call flow getBar > delete > getParams > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1294', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1294 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('C4');
      logInfo(`step1 getBar("C4"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('123');
      subject.getParams('qWYQl');
      subject.getParams('bSLL7S');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1294 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1295
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1295
     * @tc.desc      ComponentFactory call flow getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1295', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1295 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('mias4qIIlm');
      logInfo(`step1 getBar("mias4qIIlm"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1295 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1296
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1296
     * @tc.desc      ComponentFactory call flow getBar > delete > getContent > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1296', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1296 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('4dnloBNO2xf');
      logInfo(`step1 getBar("4dnloBNO2xf"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('abcabc');
      subject.getContent(' \u4e2d\u6587 ');
      subject.getParams('7');
      const step5 = subject.getBar('XkrydQBO');
      logInfo(`step5 getBar("XkrydQBO"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1296 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1297
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1297
     * @tc.desc      ComponentFactory call flow toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1297', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1297 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('Aw2U6KL');
      logInfo(`step2 getBar("Aw2U6KL"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1297 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1298
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1298
     * @tc.desc      ComponentFactory call flow delete > getContent > getBar > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1298', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1298 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete(' ');
      subject.getContent('J4flKUQqwBH2');
      const step3 = subject.getBar('3Pe');
      logInfo(`step3 getBar("3Pe"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('ND4pgmV2');
      subject.getParams('x123');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1298 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1299
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1299
     * @tc.desc      ComponentFactory call flow getContent > toArray > getContent > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1299', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1299 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('Sw7D9');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('otBya');
      subject.getContent('A_1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1299 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1300
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1300
     * @tc.desc      ComponentFactory call flow delete > toArray > getParams > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1300 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('Xcw36Vv5MFT');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('123');
      subject.getContent('BpzH');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1300 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1301
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1301
     * @tc.desc      ComponentFactory call flow getParams > getBar > getContent > toArray > getContent keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1301 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('65H');
      const step2 = subject.getBar('ydWDS');
      logInfo(`step2 getBar("ydWDS"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('iUES6yl3kHWU');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getContent('sPR');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1301 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1302
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1302
     * @tc.desc      ComponentFactory call flow getContent > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1302 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('mkGSzn');
      subject.getContent('123');
      const step3 = subject.getBar('jIDfJlAGM1zc');
      logInfo(`step3 getBar("jIDfJlAGM1zc"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1302 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1303
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1303
     * @tc.desc      ComponentFactory call flow getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1303 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('czXc4Bok');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1303 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1304
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1304
     * @tc.desc      ComponentFactory call flow getBar > getContent > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1304 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('sEgYAx01NMC');
      logInfo(`step1 getBar("sEgYAx01NMC"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('0pudv5fpUF');
      const step3 = subject.getBar('Xard8Kss3VC');
      logInfo(`step3 getBar("Xard8Kss3VC"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('FYXMiUxa');
      logInfo(`step4 getBar("FYXMiUxa"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1304 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1305
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1305
     * @tc.desc      ComponentFactory call flow getContent > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1305 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('qg11IZpfs9');
      subject.getParams('ML4Kk6');
      const step3 = subject.getBar('i4VJdShfk');
      logInfo(`step3 getBar("i4VJdShfk"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1305 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1306
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1306
     * @tc.desc      ComponentFactory call flow toArray > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1306 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('xHello World');
      subject.getParams('mTrBYJTHox8');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1306 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1307
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1307
     * @tc.desc      ComponentFactory call flow toArray > toArray > delete > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1307 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('Z2de');
      subject.getContent(' 123 ');
      const step5 = subject.getBar('CbhFUa9Bi');
      logInfo(`step5 getBar("CbhFUa9Bi"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1307 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1308
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1308
     * @tc.desc      ComponentFactory call flow getParams > getContent > delete > toArray > getBar keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1308 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('dSl33ylyGdF');
      subject.getContent('p57pLqj4iPEd');
      subject.delete('DDVCz5ydJ6G');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5 = subject.getBar(' Hello World ');
      logInfo(`step5 getBar(" Hello World "): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1308 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1309
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1309
     * @tc.desc      ComponentFactory call flow getParams > getContent > getParams > getBar > toArray keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1309 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('aEZCm');
      subject.getContent('eJuIlW3Qr');
      subject.getParams('Y');
      const step4 = subject.getBar('eyQTwU8DM7la');
      logInfo(`step4 getBar("eyQTwU8DM7la"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1309 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1310
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1310
     * @tc.desc      ComponentFactory call flow toArray > getParams > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1310 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('II9');
      const step3 = subject.getBar('xNP');
      logInfo(`step3 getBar("xNP"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1310 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1311
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1311
     * @tc.desc      ComponentFactory call flow getParams > getParams > getBar > getContent > getParams keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1311 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('i9fjd');
      subject.getParams('Sample Title 123');
      const step3 = subject.getBar('Yz3');
      logInfo(`step3 getBar("Yz3"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('dh1PdJ');
      subject.getParams('tB9R1yPEr');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1311 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1312
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1312
     * @tc.desc      ComponentFactory call flow getContent > delete > getParams > toArray > getContent keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1312 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent(' \u4e2d\u6587 ');
      subject.delete('p7H');
      subject.getParams('zLhiI');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getContent(' Hello ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1312 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1313
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1313
     * @tc.desc      ComponentFactory call flow getParams > getParams > getBar > getParams > delete keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1313 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('MedbmHHUIc');
      subject.getParams('5C');
      const step3 = subject.getBar('6Gs7');
      logInfo(`step3 getBar("6Gs7"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('dSl33ylyGdF');
      subject.delete('Q1ANx2oPtq');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1313 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1314
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1314
     * @tc.desc      ComponentFactory call flow getParams > getBar > delete > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1314 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('   ');
      const step2 = subject.getBar('xNP');
      logInfo(`step2 getBar("xNP"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('ea4GvMxX');
      subject.getContent('CrR');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1314 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1315
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1315
     * @tc.desc      ComponentFactory call flow toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1315 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('YEaX');
      logInfo(`step2 getBar("YEaX"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1315 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1316
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1316
     * @tc.desc      ComponentFactory call flow delete > getBar > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1316 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('NvoNa');
      const step2 = subject.getBar('zj');
      logInfo(`step2 getBar("zj"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('RAcfl');
      subject.delete(' a ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1316 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1317
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1317
     * @tc.desc      ComponentFactory call flow getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1317 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent(' Hello ');
      const step2 = subject.getBar('iKcNgHVHejEa');
      logInfo(`step2 getBar("iKcNgHVHejEa"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1317 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1318
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1318
     * @tc.desc      ComponentFactory call flow toArray > getContent > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1318 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('ij84GYmvSI39');
      const step3 = subject.getBar('b0T');
      logInfo(`step3 getBar("b0T"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1318 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1319
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1319
     * @tc.desc      ComponentFactory call flow getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1319 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('AV913N');
      logInfo(`step1 getBar("AV913N"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('xa');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1319 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1320
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1320
     * @tc.desc      ComponentFactory call flow getBar > getContent > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1320 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('9wuRQd0r');
      logInfo(`step1 getBar("9wuRQd0r"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('FLQOuZsk');
      subject.getContent('otBya');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1320 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1321
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1321
     * @tc.desc      ComponentFactory call flow getBar > getParams > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1321 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('WF2dJw');
      logInfo(`step1 getBar("WF2dJw"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams(' Hello ');
      subject.delete('NUoPD1VLVZWo');
      subject.getParams('Hello');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1321 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1322
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1322
     * @tc.desc      ComponentFactory call flow getContent > toArray > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1322 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('r6');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('abc');
      const step4 = subject.getBar('5Qvn');
      logInfo(`step4 getBar("5Qvn"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1322 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1323
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1323
     * @tc.desc      ComponentFactory call flow delete > getParams > toArray > getContent > getContent keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1323 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete(' A ');
      subject.getParams('wGSFFV');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('a');
      subject.getContent('4XSs');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1323 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1324
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1324
     * @tc.desc      ComponentFactory call flow getContent > getContent > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1324 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('Sample Title 123');
      subject.getContent('t4a');
      subject.getParams('Kr4Ng');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1324 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1325
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1325
     * @tc.desc      ComponentFactory call flow getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1325 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('aEZCm');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1325 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1326
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1326
     * @tc.desc      ComponentFactory call flow getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1326 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('2');
      logInfo(`step1 getBar("2"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1326 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1327
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1327
     * @tc.desc      ComponentFactory call flow delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1327 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('WpQJnmG3F');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1327 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1328
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1328
     * @tc.desc      ComponentFactory call flow getBar > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1328 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar(' Sample Title 123 ');
      logInfo(`step1 getBar(" Sample Title 123 "): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('3');
      subject.delete('qhse');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1328 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1329
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1329
     * @tc.desc      ComponentFactory call flow getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1329 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('eECT3Cnise1I');
      logInfo(`step1 getBar("eECT3Cnise1I"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('Y81DfEBjzC');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1329 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1330
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1330
     * @tc.desc      ComponentFactory call flow getContent > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1330 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('R6Cty5d');
      subject.delete('fhptq9vtxk6');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1330 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1331
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1331
     * @tc.desc      ComponentFactory call flow delete > getParams > getContent > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1331', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1331 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('hello world_1');
      subject.getParams('2pjqf');
      subject.getContent('QErN1rSThJLd');
      const step4 = subject.getBar('IkSzXDcXT');
      logInfo(`step4 getBar("IkSzXDcXT"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.delete('JPpP');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1331 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1332
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1332
     * @tc.desc      ComponentFactory call flow getContent > getContent > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1332', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1332 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('sp67XTpnyJGQ');
      subject.getContent('FLQOuZsk');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('jL8OO8aOM');
      logInfo(`step4 getBar("jL8OO8aOM"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1332 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1333
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1333
     * @tc.desc      ComponentFactory call flow getContent > delete > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1333', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1333 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('B');
      subject.delete('U32wSwCuAI');
      subject.getContent('KR');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1333 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1334
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1334
     * @tc.desc      ComponentFactory call flow getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1334', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1334 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('c4ZDLC');
      const step2 = subject.getBar('  ');
      logInfo(`step2 getBar("  "): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1334 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1335
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1335
     * @tc.desc      ComponentFactory call flow toArray > getParams > delete > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1335', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1335 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('dEkCFIvXd');
      subject.delete('lV');
      subject.getContent('c7lMng8ZM');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1335 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1336
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1336
     * @tc.desc      ComponentFactory call flow getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1336', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1336 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('B');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1336 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1337
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1337
     * @tc.desc      ComponentFactory call flow delete > getContent > delete > getBar > getContent keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1337', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1337 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('zo');
      subject.getContent('TLBDIj0F7Coe');
      subject.delete('lV');
      const step4 = subject.getBar('8k');
      logInfo(`step4 getBar("8k"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getContent('xHello');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1337 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1338
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1338
     * @tc.desc      ComponentFactory call flow getParams > toArray > getContent > getContent > getParams keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1338', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1338 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('a_1');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('Wi6jAzzq6AL7');
      subject.getContent('S');
      subject.getParams('Oeh3Zti');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1338 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1339
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1339
     * @tc.desc      ComponentFactory call flow getParams > getBar > getContent > toArray > getBar keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1339', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1339 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('Hello');
      const step2 = subject.getBar('ZhT9z0B');
      logInfo(`step2 getBar("ZhT9z0B"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('OxSA80TGVBGf');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5 = subject.getBar('Pwt6zZsPyvP');
      logInfo(`step5 getBar("Pwt6zZsPyvP"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1339 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1340
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1340
     * @tc.desc      ComponentFactory call flow getBar > getParams > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1340', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1340 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('MOWr');
      logInfo(`step1 getBar("MOWr"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('7ziCRIc');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1340 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1341
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1341
     * @tc.desc      ComponentFactory call flow delete > getBar > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1341', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1341 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('FEDAmRPXge');
      const step2 = subject.getBar(' Hello ');
      logInfo(`step2 getBar(" Hello "): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('A');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1341 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1342
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1342
     * @tc.desc      ComponentFactory call flow delete > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1342', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1342 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete(' ');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('0vSLrfP6Ad');
      logInfo(`step3 getBar("0vSLrfP6Ad"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1342 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1343
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1343
     * @tc.desc      ComponentFactory call flow getContent > delete > toArray > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1343', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1343 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('wMr');
      subject.delete('earF3');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1343 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1344
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1344
     * @tc.desc      ComponentFactory call flow getParams > getBar > toArray > getBar > getContent keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1344', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1344 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('MO0ZHZa');
      const step2 = subject.getBar('7J8');
      logInfo(`step2 getBar("7J8"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('xMtWdQu6');
      logInfo(`step4 getBar("xMtWdQu6"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getContent('9TEfZrL');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1344 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1345
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1345
     * @tc.desc      ComponentFactory call flow getContent > delete > getContent > getBar > getBar keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1345', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1345 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('ECtggVYxqC');
      subject.delete(' \u4e2d\u6587 ');
      subject.getContent('KCLPWyUfIW');
      const step4 = subject.getBar('EdSsHK3Z');
      logInfo(`step4 getBar("EdSsHK3Z"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getBar('xA');
      logInfo(`step5 getBar("xA"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1345 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1346
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1346
     * @tc.desc      ComponentFactory call flow getContent > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1346', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1346 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('abc_1');
      const step2 = subject.getBar('e7qxFXB9Kbb');
      logInfo(`step2 getBar("e7qxFXB9Kbb"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('gx4');
      logInfo(`step3 getBar("gx4"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1346 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1347
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1347
     * @tc.desc      ComponentFactory call flow toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1347', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1347 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent(' A ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1347 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1348
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1348
     * @tc.desc      ComponentFactory call flow toArray > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1348', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1348 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('cX2');
      logInfo(`step3 getBar("cX2"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1348 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1349
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1349
     * @tc.desc      ComponentFactory call flow getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1349', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1349 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('hello worldhello world');
      logInfo(`step1 getBar("hello worldhello world"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('YYQlkKt5AN');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1349 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1350
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1350
     * @tc.desc      ComponentFactory call flow delete > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1350', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1350 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('fYygLBY7');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('H7QASzBFrfnn');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1350 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1351
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1351
     * @tc.desc      ComponentFactory call flow getContent > getContent > delete > getBar > toArray keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1351', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1351 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('J4flKUQqwBH2');
      subject.getContent('UUfRskW');
      subject.delete('inIQz');
      const step4 = subject.getBar('whOLzSN');
      logInfo(`step4 getBar("whOLzSN"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1351 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1352
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1352
     * @tc.desc      ComponentFactory call flow getParams > toArray > toArray > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1352', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1352 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('AY2h8Amd3uN');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.delete('xXOmAO1G');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1352 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1353
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1353
     * @tc.desc      ComponentFactory call flow getContent > delete > getBar > toArray > getParams keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1353', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1353 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('9FRWZAoj8b');
      subject.delete('D2it480C1XI');
      const step3 = subject.getBar('onHMSlNH');
      logInfo(`step3 getBar("onHMSlNH"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getParams('LISDV');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1353 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1354
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1354
     * @tc.desc      ComponentFactory call flow getContent > getBar > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1354', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1354 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('K2iW8');
      const step2 = subject.getBar('oZpLOiX');
      logInfo(`step2 getBar("oZpLOiX"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('UlpblCT');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1354 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1355
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1355
     * @tc.desc      ComponentFactory call flow toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1355', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1355 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('3qmJH2Q');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1355 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1356
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1356
     * @tc.desc      ComponentFactory call flow toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1356', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1356 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1356 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1357
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1357
     * @tc.desc      ComponentFactory call flow getParams > getContent > toArray > getParams > getBar keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1357', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1357 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('fxsZv');
      subject.getContent('7aoKnwP');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getParams('i685dQSQE');
      const step5 = subject.getBar('IXj4nI0');
      logInfo(`step5 getBar("IXj4nI0"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1357 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1358
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1358
     * @tc.desc      ComponentFactory call flow getParams > getContent > toArray > getParams > getContent keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1358', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1358 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('GWc8T0X');
      subject.getContent('ZKMKI');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getParams('MnI2Nm8ZFH');
      subject.getContent('N1zGx4HsEP');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1358 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1359
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1359
     * @tc.desc      ComponentFactory call flow getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1359', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1359 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('xNP');
      logInfo(`step1 getBar("xNP"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1359 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1360
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1360
     * @tc.desc      ComponentFactory call flow toArray > getContent > delete > delete > getContent keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1360', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1360 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('hello worldhello world');
      subject.delete('UDi285Ncj');
      subject.delete(' abc ');
      subject.getContent('Hello World');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1360 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1361
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1361
     * @tc.desc      ComponentFactory call flow getParams > delete > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1361', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1361 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('LISDV');
      subject.delete(' hello world ');
      const step3 = subject.getBar('HelloHello');
      logInfo(`step3 getBar("HelloHello"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('3mmJMh');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1361 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1362
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1362
     * @tc.desc      ComponentFactory call flow getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1362', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1362 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('xA');
      logInfo(`step1 getBar("xA"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1362 end`);
    });
  });
}
