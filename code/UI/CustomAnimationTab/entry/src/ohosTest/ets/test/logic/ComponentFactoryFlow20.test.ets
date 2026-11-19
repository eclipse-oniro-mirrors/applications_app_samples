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
export default function componentFactoryFlow20Test(): void {
  describe('ComponentFactoryFlow20Test', () => {
    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1363
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1363
     * @tc.desc      ComponentFactory call flow getBar > delete > toArray > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1363', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1363 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('YM5A7JRomJP1');
      logInfo(`step1 getBar("YM5A7JRomJP1"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('K');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('VHU');
      logInfo(`step4 getBar("VHU"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getContent('GEBoiIHk96');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1363 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1364
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1364
     * @tc.desc      ComponentFactory call flow toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1364', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1364 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1364 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1365
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1365
     * @tc.desc      ComponentFactory call flow toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1365', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1365 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1365 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1366
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1366
     * @tc.desc      ComponentFactory call flow getContent > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1366', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1366 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('uR');
      const step2 = subject.getBar('cf3CZgYgp');
      logInfo(`step2 getBar("cf3CZgYgp"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('K2iW8');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1366 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1367
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1367
     * @tc.desc      ComponentFactory call flow getParams > getBar > getBar > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1367', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1367 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('Dn1OiUjJS6La');
      const step2 = subject.getBar('N7OAv');
      logInfo(`step2 getBar("N7OAv"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('ED');
      logInfo(`step3 getBar("ED"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('bSLL7S');
      const step5 = subject.getBar('n8oyYK');
      logInfo(`step5 getBar("n8oyYK"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1367 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1368
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1368
     * @tc.desc      ComponentFactory call flow getContent > getParams > delete > getContent > toArray keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1368', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1368 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('xabc');
      subject.getParams('yobXge');
      subject.delete('ND4pgmV2');
      subject.getContent('xyc');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1368 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1369
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1369
     * @tc.desc      ComponentFactory call flow getBar > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1369', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1369 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Ov');
      logInfo(`step1 getBar("Ov"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('7v');
      subject.delete('chSGAb3Lmu');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1369 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1370
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1370
     * @tc.desc      ComponentFactory call flow toArray > getParams > getBar > getContent > delete keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1370', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1370 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('Fl');
      const step3 = subject.getBar('AV913N');
      logInfo(`step3 getBar("AV913N"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('ZI');
      subject.delete('HQ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1370 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1371
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1371
     * @tc.desc      ComponentFactory call flow getParams > toArray > toArray > delete > getContent keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1371', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1371 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('x123');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('aNv6D');
      subject.getContent('vW8IZb2km');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1371 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1372
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1372
     * @tc.desc      ComponentFactory call flow toArray > getContent > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1372', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1372 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('nq');
      const step3 = subject.getBar('SWLsCaq76HZR');
      logInfo(`step3 getBar("SWLsCaq76HZR"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('xhello world');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1372 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1373
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1373
     * @tc.desc      ComponentFactory call flow getBar > getContent > getBar > delete > getContent keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1373', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1373 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('\u4e2d\u6587');
      logInfo(`step1 getBar("??"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('abcabc');
      const step3 = subject.getBar('Zkfnj8M');
      logInfo(`step3 getBar("Zkfnj8M"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('3mmJMh');
      subject.getContent('RJ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1373 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1374
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1374
     * @tc.desc      ComponentFactory call flow toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1374', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1374 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('9l');
      logInfo(`step2 getBar("9l"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1374 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1375
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1375
     * @tc.desc      ComponentFactory call flow getContent > getContent > getBar > toArray > getContent keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1375', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1375 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('eTf');
      subject.getContent('v26Xu');
      const step3 = subject.getBar('yhkABd');
      logInfo(`step3 getBar("yhkABd"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getContent('9shlXE');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1375 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1376
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1376
     * @tc.desc      ComponentFactory call flow getContent > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1376', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1376 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('mkWE');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1376 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1377
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1377
     * @tc.desc      ComponentFactory call flow getBar > getBar > getContent > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1377', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1377 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('P7r5');
      logInfo(`step1 getBar("P7r5"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('0l');
      logInfo(`step2 getBar("0l"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('DK');
      subject.getContent('vW8IZb2km');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1377 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1378
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1378
     * @tc.desc      ComponentFactory call flow getBar > getBar > delete > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1378', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1378 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('ae0');
      logInfo(`step1 getBar("ae0"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('jL8OO8aOM');
      logInfo(`step2 getBar("jL8OO8aOM"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('A_1');
      subject.getParams('Oeh3Zti');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1378 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1379
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1379
     * @tc.desc      ComponentFactory call flow delete > getContent > getBar > toArray > getContent keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1379', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1379 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('FTyU38');
      subject.getContent(' A ');
      const step3 = subject.getBar('HxnhpHwZpVKv');
      logInfo(`step3 getBar("HxnhpHwZpVKv"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getContent('123_1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1379 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1380
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1380
     * @tc.desc      ComponentFactory call flow getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1380', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1380 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('3Pe');
      logInfo(`step1 getBar("3Pe"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('mkGSzn');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1380 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1381
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1381
     * @tc.desc      ComponentFactory call flow toArray > getParams > getBar > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1381', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1381 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('g4I3eAi8Zp4f');
      const step3 = subject.getBar(' A ');
      logInfo(`step3 getBar(" A "): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('wZwlOYmt6');
      subject.delete('fy');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1381 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1382
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1382
     * @tc.desc      ComponentFactory call flow getBar > toArray > getContent > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1382', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1382 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('DKkkl');
      logInfo(`step1 getBar("DKkkl"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('uR');
      subject.delete('Ccw2Zqi2ZIS');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1382 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1383
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1383
     * @tc.desc      ComponentFactory call flow toArray > toArray > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1383', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1383 begin`);
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
      subject.delete('7qHQfp4He');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1383 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1384
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1384
     * @tc.desc      ComponentFactory call flow delete > getBar > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1384', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1384 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('kpnzYx8IKIJ8');
      const step2 = subject.getBar('a_1');
      logInfo(`step2 getBar("a_1"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('o3');
      logInfo(`step3 getBar("o3"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('6emR6k');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1384 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1385
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1385
     * @tc.desc      ComponentFactory call flow getContent > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1385', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1385 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('suJIqPBMsZ');
      const step2 = subject.getBar('As0kvJU');
      logInfo(`step2 getBar("As0kvJU"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('eU6Lz');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1385 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1386
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1386
     * @tc.desc      ComponentFactory call flow delete > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1386', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1386 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('UizjmYBE');
      subject.getContent('dQmNqBlh');
      const step3 = subject.getBar('hello worldhello world');
      logInfo(`step3 getBar("hello worldhello world"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1386 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1387
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1387
     * @tc.desc      ComponentFactory call flow getContent > delete > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1387', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1387 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('hello world');
      subject.delete('8uYGsOLyg');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('mGe');
      logInfo(`step4 getBar("mGe"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1387 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1388
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1388
     * @tc.desc      ComponentFactory call flow getContent > delete > getBar > toArray > getContent keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1388', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1388 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('mkGSzn');
      subject.delete('lIklZ7h');
      const step3 = subject.getBar('5f');
      logInfo(`step3 getBar("5f"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getContent('l');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1388 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1389
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1389
     * @tc.desc      ComponentFactory call flow getBar > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1389', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1389 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('6');
      logInfo(`step1 getBar("6"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('F39Oc1Z6TI');
      const step3 = subject.getBar('DSBnmbthJ');
      logInfo(`step3 getBar("DSBnmbthJ"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1389 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1390
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1390
     * @tc.desc      ComponentFactory call flow getBar > getContent > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1390', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1390 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('0xoZWamAK');
      logInfo(`step1 getBar("0xoZWamAK"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('TLzHYlbpE2');
      subject.delete('ND4pgmV2');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1390 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1391
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1391
     * @tc.desc      ComponentFactory call flow getContent > getBar > getContent > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1391', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1391 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('x\u4e2d\u6587');
      const step2 = subject.getBar('ydWDS');
      logInfo(`step2 getBar("ydWDS"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('xA');
      subject.getParams('8');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1391 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1392
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1392
     * @tc.desc      ComponentFactory call flow getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1392', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1392 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('FdLnD6');
      logInfo(`step1 getBar("FdLnD6"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('x ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1392 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1393
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1393
     * @tc.desc      ComponentFactory call flow getContent > delete > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1393', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1393 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('x ');
      subject.delete('Eb1lOOT');
      const step3 = subject.getBar('IkSzXDcXT');
      logInfo(`step3 getBar("IkSzXDcXT"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('DSfb');
      logInfo(`step4 getBar("DSfb"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1393 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1394
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1394
     * @tc.desc      ComponentFactory call flow getContent > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1394', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1394 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('i');
      subject.getContent('sGzPsbc');
      const step3 = subject.getBar('123');
      logInfo(`step3 getBar("123"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1394 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1395
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1395
     * @tc.desc      ComponentFactory call flow getBar > getBar > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1395', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1395 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('FYXMiUxa');
      logInfo(`step1 getBar("FYXMiUxa"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('JyNJ4zExSmt');
      logInfo(`step2 getBar("JyNJ4zExSmt"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('pB0KQflQ');
      logInfo(`step3 getBar("pB0KQflQ"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('cdJj6PFv3xK');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1395 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1396
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1396
     * @tc.desc      ComponentFactory call flow delete > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1396', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1396 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('Hello World');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('xabc');
      logInfo(`step3 getBar("xabc"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1396 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1397
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1397
     * @tc.desc      ComponentFactory call flow delete > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1397', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1397 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('8IkTkQ6');
      const step2 = subject.getBar('pwKq2PGxlZ9E');
      logInfo(`step2 getBar("pwKq2PGxlZ9E"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('uhEdJ8TYI');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1397 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1398
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1398
     * @tc.desc      ComponentFactory call flow getBar > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1398', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1398 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('v');
      logInfo(`step1 getBar("v"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('EuOAOYf');
      logInfo(`step2 getBar("EuOAOYf"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1398 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1399
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1399
     * @tc.desc      ComponentFactory call flow toArray > delete > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1399', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1399 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('IaCwhx5MR');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('I');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1399 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1400
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1400
     * @tc.desc      ComponentFactory call flow getParams > getParams > getContent > getParams > toArray keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1400 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('m');
      subject.getParams('MedbmHHUIc');
      subject.getContent('7ZjIEOmdPkOR');
      subject.getParams('j6zPJTMw');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1400 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1401
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1401
     * @tc.desc      ComponentFactory call flow delete > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1401 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('TUiZ');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('xA');
      logInfo(`step3 getBar("xA"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1401 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1402
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1402
     * @tc.desc      ComponentFactory call flow delete > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1402 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('Zn8gjRlr');
      const step2 = subject.getBar('Uw56XMZCO');
      logInfo(`step2 getBar("Uw56XMZCO"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams(' a ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1402 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1403
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1403
     * @tc.desc      ComponentFactory call flow getBar > getParams > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1403 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('bB7TmFt');
      logInfo(`step1 getBar("bB7TmFt"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('Rx79u5I');
      subject.delete('Hello WorldHello World');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1403 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1404
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1404
     * @tc.desc      ComponentFactory call flow getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1404 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('n8oyYK');
      logInfo(`step1 getBar("n8oyYK"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('YEaX');
      logInfo(`step2 getBar("YEaX"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1404 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1405
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1405
     * @tc.desc      ComponentFactory call flow toArray > toArray > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1405 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent(' abc ');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1405 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1406
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1406
     * @tc.desc      ComponentFactory call flow getContent > getContent > getBar > getParams > getBar keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1406 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('Kf');
      subject.getContent('xyc');
      const step3 = subject.getBar('BYHPHkdoCTWS');
      logInfo(`step3 getBar("BYHPHkdoCTWS"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams(' abc ');
      const step5 = subject.getBar('T3gG4OsbMtFD');
      logInfo(`step5 getBar("T3gG4OsbMtFD"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1406 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1407
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1407
     * @tc.desc      ComponentFactory call flow getParams > toArray > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1407 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('aEZCm');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('2');
      logInfo(`step3 getBar("2"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('nThV0UM4');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1407 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1408
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1408
     * @tc.desc      ComponentFactory call flow getParams > getBar > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1408 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('uz95ONKCdfl');
      const step2 = subject.getBar('x123');
      logInfo(`step2 getBar("x123"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('C4');
      logInfo(`step3 getBar("C4"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('et');
      logInfo(`step4 getBar("et"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1408 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1409
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1409
     * @tc.desc      ComponentFactory call flow getBar > getBar > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1409 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('jL8OO8aOM');
      logInfo(`step1 getBar("jL8OO8aOM"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('a0Zw2D');
      logInfo(`step2 getBar("a0Zw2D"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('d2e7M');
      logInfo(`step3 getBar("d2e7M"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1409 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1410
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1410
     * @tc.desc      ComponentFactory call flow getContent > delete > toArray > getContent > getBar keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1410 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('V06sFwKy');
      subject.delete('0VsvJoEp');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('B');
      const step5 = subject.getBar('EuOAOYf');
      logInfo(`step5 getBar("EuOAOYf"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1410 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1411
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1411
     * @tc.desc      ComponentFactory call flow getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1411 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('MOWr');
      logInfo(`step1 getBar("MOWr"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('h6o');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1411 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1412
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1412
     * @tc.desc      ComponentFactory call flow delete > getContent > delete > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1412 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('q5wUacf5Ddpq');
      subject.getContent('I');
      subject.delete('bZ4l');
      subject.delete('U32wSwCuAI');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1412 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1413
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1413
     * @tc.desc      ComponentFactory call flow toArray > getParams > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1413 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('thJK');
      subject.delete('aHkr');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1413 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1414
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1414
     * @tc.desc      ComponentFactory call flow toArray > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1414 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('1HZGi8Qa0');
      const step3 = subject.getBar('NW');
      logInfo(`step3 getBar("NW"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1414 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1415
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1415
     * @tc.desc      ComponentFactory call flow getParams > toArray > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1415 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('H7QASzBFrfnn');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('UlpblCT');
      subject.delete('NvoNa');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1415 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1416
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1416
     * @tc.desc      ComponentFactory call flow getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1416 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('dsc6Ba0');
      logInfo(`step1 getBar("dsc6Ba0"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1416 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1417
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1417
     * @tc.desc      ComponentFactory call flow getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1417 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('ZhT9z0B');
      logInfo(`step1 getBar("ZhT9z0B"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('bsuWtl');
      logInfo(`step2 getBar("bsuWtl"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1417 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1418
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1418
     * @tc.desc      ComponentFactory call flow getParams > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1418 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('4UYNOjK');
      const step2 = subject.getBar('hello worldhello world');
      logInfo(`step2 getBar("hello worldhello world"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('OxSA80TGVBGf');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1418 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1419
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1419
     * @tc.desc      ComponentFactory call flow toArray > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1419 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('a0Zw2D');
      logInfo(`step2 getBar("a0Zw2D"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('Hello WorldHello World');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1419 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1420
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1420
     * @tc.desc      ComponentFactory call flow toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1420 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('7aoKnwP');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1420 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1421
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1421
     * @tc.desc      ComponentFactory call flow getBar > getContent > getContent > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1421 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('x\u4e2d\u6587');
      logInfo(`step1 getBar("x??"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('Tair');
      subject.getContent('7Fn4');
      subject.delete('x ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1421 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1422
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1422
     * @tc.desc      ComponentFactory call flow getContent > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1422 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('eAN');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('xhello world');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1422 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1423
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1423
     * @tc.desc      ComponentFactory call flow getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1423 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('ZhT9z0B');
      logInfo(`step1 getBar("ZhT9z0B"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1423 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1424
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1424
     * @tc.desc      ComponentFactory call flow getParams > toArray > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1424 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('xSample Title 123');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1424 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1425
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1425
     * @tc.desc      ComponentFactory call flow getBar > getParams > toArray > getParams > getParams keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1425', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1425 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('oJ');
      logInfo(`step1 getBar("oJ"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('h6o');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getParams('i');
      subject.getParams('pwoK7bO1YT');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1425 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1426
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1426
     * @tc.desc      ComponentFactory call flow getBar > getContent > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1426 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('HelloHello');
      logInfo(`step1 getBar("HelloHello"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('9jAL');
      subject.getContent('cQIHk1oqt');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1426 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1427
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1427
     * @tc.desc      ComponentFactory call flow toArray > delete > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1427 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('YTQNvDFZ');
      const step3 = subject.getBar('123_1');
      logInfo(`step3 getBar("123_1"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('LLMFSrqCpLY');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1427 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1428
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1428
     * @tc.desc      ComponentFactory call flow toArray > getBar > getContent > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1428 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('hO3w7f');
      logInfo(`step2 getBar("hO3w7f"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('v26Xu');
      subject.delete('FgDmNta9Bvr');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1428 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1429
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1429
     * @tc.desc      ComponentFactory call flow getContent > getParams > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1429 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('FtoCiTdI');
      subject.getParams('tiCdW');
      subject.delete('Ccw2Zqi2ZIS');
      const step4 = subject.getBar('dqX9qYwm');
      logInfo(`step4 getBar("dqX9qYwm"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1429 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1430
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1430
     * @tc.desc      ComponentFactory call flow toArray > getContent > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1430 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('N7w');
      const step3 = subject.getBar('FYQfAafcAT');
      logInfo(`step3 getBar("FYQfAafcAT"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1430 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1431
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1431
     * @tc.desc      ComponentFactory call flow getContent > toArray > getContent > getBar > toArray keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1431', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1431 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('9WYSYc9Q');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('CnX');
      const step4 = subject.getBar('yL');
      logInfo(`step4 getBar("yL"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1431 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1432
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1432
     * @tc.desc      ComponentFactory call flow getBar > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1432', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1432 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('OiBfZNAar');
      logInfo(`step1 getBar("OiBfZNAar"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('abcabc');
      const step3 = subject.getBar('WRd');
      logInfo(`step3 getBar("WRd"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1432 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1433
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1433
     * @tc.desc      ComponentFactory call flow delete > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1433', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1433 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('JPpP');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('ik');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1433 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1434
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1434
     * @tc.desc      ComponentFactory call flow getContent > delete > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1434', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1434 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('qg11IZpfs9');
      subject.delete('zo');
      subject.delete('gsD6x');
      const step4 = subject.getBar('WRd');
      logInfo(`step4 getBar("WRd"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1434 end`);
    });
  });
}
