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

/** Logic checks for ComponentFactory flow (71 cases). */
export default function componentFactoryFlow18Test(): void {
  describe('ComponentFactoryFlow18Test', () => {
    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1219
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1219
     * @tc.desc      ComponentFactory call flow getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1219 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('teOgE50');
      logInfo(`step1 getBar("teOgE50"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('oj0tXh1T');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1219 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1220
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1220
     * @tc.desc      ComponentFactory call flow getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1220 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('TLBDIj0F7Coe');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1220 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1221
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1221
     * @tc.desc      ComponentFactory call flow getBar > getParams > getBar > getParams > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1221 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('OvsjRINx');
      logInfo(`step1 getBar("OvsjRINx"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('MedbmHHUIc');
      const step3 = subject.getBar('IXj4nI0');
      logInfo(`step3 getBar("IXj4nI0"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('f1');
      subject.delete('CGZhNcAL');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1221 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1222
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1222
     * @tc.desc      ComponentFactory call flow toArray > getContent > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1222 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('0wQcs');
      subject.getContent('J');
      const step4 = subject.getBar(' hello world ');
      logInfo(`step4 getBar(" hello world "): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1222 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1223
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1223
     * @tc.desc      ComponentFactory call flow getBar > getParams > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1223 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('rlMC8');
      logInfo(`step1 getBar("rlMC8"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('lq5');
      subject.delete('8uYGsOLyg');
      subject.delete('opAhnX5KXD2M');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1223 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1224
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1224
     * @tc.desc      ComponentFactory call flow getParams > delete > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1224 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('v20t6bh');
      subject.delete('znM');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('9l');
      logInfo(`step4 getBar("9l"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1224 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1225
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1225
     * @tc.desc      ComponentFactory call flow getBar > getContent > delete > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1225 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('OvsjRINx');
      logInfo(`step1 getBar("OvsjRINx"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('HPBKG1Df');
      subject.delete('pmm');
      subject.delete('EMZcrnNG9m');
      const step5 = subject.getBar('HelloHello');
      logInfo(`step5 getBar("HelloHello"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1225 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1226
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1226
     * @tc.desc      ComponentFactory call flow getParams > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1226 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('QEugm4vLp');
      subject.delete('aJ7v0hYfWUW8');
      const step3 = subject.getBar('Rv1MAGc');
      logInfo(`step3 getBar("Rv1MAGc"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1226 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1227
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1227
     * @tc.desc      ComponentFactory call flow delete > delete > toArray > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1227 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('123123');
      subject.delete('Hello World_1');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('pgM');
      const step5 = subject.getBar('x\u4e2d\u6587');
      logInfo(`step5 getBar("x??"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1227 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1228
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1228
     * @tc.desc      ComponentFactory call flow getParams > getBar > getBar > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1228 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('3');
      const step2 = subject.getBar('49k1A7YOxx');
      logInfo(`step2 getBar("49k1A7YOxx"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('28cZ2bB4z5g');
      logInfo(`step3 getBar("28cZ2bB4z5g"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('uNmx');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1228 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1229
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1229
     * @tc.desc      ComponentFactory call flow delete > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1229 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('ScNobGpvdWM');
      subject.getContent('OxSA80TGVBGf');
      const step3 = subject.getBar('upjzRMbiEoc');
      logInfo(`step3 getBar("upjzRMbiEoc"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1229 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1230
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1230
     * @tc.desc      ComponentFactory call flow delete > getBar > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1230 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('NLeLY');
      const step2 = subject.getBar('L');
      logInfo(`step2 getBar("L"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('futic8JODso');
      subject.delete('3gUvtNLzuSKO');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1230 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1231
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1231
     * @tc.desc      ComponentFactory call flow getParams > toArray > getBar > getContent > toArray keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1231', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1231 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('si4CUr');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('MU');
      logInfo(`step3 getBar("MU"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('Ie8vBhT');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1231 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1232
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1232
     * @tc.desc      ComponentFactory call flow getContent > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1232', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1232 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent(' Hello World ');
      subject.delete('XKxsM0oJspL');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1232 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1233
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1233
     * @tc.desc      ComponentFactory call flow getContent > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1233', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1233 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('9WYSYc9Q');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('WF2dJw');
      logInfo(`step3 getBar("WF2dJw"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1233 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1234
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1234
     * @tc.desc      ComponentFactory call flow toArray > toArray > toArray > getParams > getContent keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1234', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1234 begin`);
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
      subject.getParams('II9');
      subject.getContent('gV5');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1234 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1235
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1235
     * @tc.desc      ComponentFactory call flow getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1235', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1235 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('DK');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1235 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1236
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1236
     * @tc.desc      ComponentFactory call flow getContent > getBar > getBar > toArray > getContent keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1236', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1236 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('Cxfm40FDJmt');
      const step2 = subject.getBar('y3BmY2P9');
      logInfo(`step2 getBar("y3BmY2P9"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('n6t');
      logInfo(`step3 getBar("n6t"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getContent('N0LNNgqRbt1k');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1236 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1237
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1237
     * @tc.desc      ComponentFactory call flow toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1237', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1237 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('xHello World');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1237 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1238
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1238
     * @tc.desc      ComponentFactory call flow toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1238', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1238 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete(' A ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1238 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1239
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1239
     * @tc.desc      ComponentFactory call flow getContent > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1239', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1239 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('ghu5YI9wHEI');
      subject.getParams('VnaypZA');
      const step3 = subject.getBar('lvXxnAa8l');
      logInfo(`step3 getBar("lvXxnAa8l"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1239 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1240
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1240
     * @tc.desc      ComponentFactory call flow toArray > toArray > getContent > getParams > getContent keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1240', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1240 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('DK');
      subject.getParams('Dn1OiUjJS6La');
      subject.getContent('mVOnDM');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1240 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1241
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1241
     * @tc.desc      ComponentFactory call flow getContent > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1241', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1241 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('RzPo4Flq7657');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('Hello_1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1241 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1242
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1242
     * @tc.desc      ComponentFactory call flow getBar > getContent > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1242', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1242 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('T3gG4OsbMtFD');
      logInfo(`step1 getBar("T3gG4OsbMtFD"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('iUES6yl3kHWU');
      subject.delete('lV');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1242 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1243
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1243
     * @tc.desc      ComponentFactory call flow toArray > delete > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1243', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1243 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('xhello world');
      const step3 = subject.getBar('h3tUUCmMN');
      logInfo(`step3 getBar("h3tUUCmMN"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('IUi');
      logInfo(`step4 getBar("IUi"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1243 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1244
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1244
     * @tc.desc      ComponentFactory call flow getBar > getBar > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1244', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1244 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Zkfnj8M');
      logInfo(`step1 getBar("Zkfnj8M"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('Aw2U6KL');
      logInfo(`step2 getBar("Aw2U6KL"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1244 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1245
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1245
     * @tc.desc      ComponentFactory call flow delete > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1245', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1245 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('DA2UJZ0');
      subject.getContent('Wy');
      const step3 = subject.getBar('AFLB4sG');
      logInfo(`step3 getBar("AFLB4sG"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1245 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1246
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1246
     * @tc.desc      ComponentFactory call flow toArray > toArray > delete > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1246', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1246 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('6y5vRO');
      subject.delete('LLMFSrqCpLY');
      subject.getParams(' ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1246 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1247
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1247
     * @tc.desc      ComponentFactory call flow getContent > getBar > getParams > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1247', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1247 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('U1lXp');
      const step2 = subject.getBar('2Iah91P');
      logInfo(`step2 getBar("2Iah91P"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('qWYQl');
      subject.getParams('r');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1247 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1248
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1248
     * @tc.desc      ComponentFactory call flow toArray > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1248', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1248 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('KUCQL');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1248 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1249
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1249
     * @tc.desc      ComponentFactory call flow toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1249', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1249 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('v4bZi4a546ta');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1249 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1250
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1250
     * @tc.desc      ComponentFactory call flow getParams > toArray > getContent > getContent > getParams keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1250', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1250 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('cN2zDR83ns');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('Q4ZKk');
      subject.getContent('Hello');
      subject.getParams('eddPIBKPwf');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1250 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1251
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1251
     * @tc.desc      ComponentFactory call flow toArray > getContent > getBar > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1251', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1251 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('1D8ajxTfZ');
      const step3 = subject.getBar('xoCXqWLigfEo');
      logInfo(`step3 getBar("xoCXqWLigfEo"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('AFLB4sG');
      logInfo(`step4 getBar("AFLB4sG"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.delete('jh1xjQMI');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1251 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1252
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1252
     * @tc.desc      ComponentFactory call flow toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1252', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1252 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('QoK4');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1252 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1253
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1253
     * @tc.desc      ComponentFactory call flow getContent > getParams > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1253', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1253 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('bVeasKn6');
      subject.getParams(' hello world ');
      const step3 = subject.getBar('bxg');
      logInfo(`step3 getBar("bxg"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('xSample Title 123');
      logInfo(`step4 getBar("xSample Title 123"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1253 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1254
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1254
     * @tc.desc      ComponentFactory call flow toArray > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1254', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1254 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('x1MxmKa5');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1254 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1255
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1255
     * @tc.desc      ComponentFactory call flow getContent > getParams > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1255', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1255 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('hello world');
      subject.getParams('MXmNvV');
      const step3 = subject.getBar('qLnzx');
      logInfo(`step3 getBar("qLnzx"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('XkrydQBO');
      logInfo(`step4 getBar("XkrydQBO"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1255 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1256
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1256
     * @tc.desc      ComponentFactory call flow getBar > delete > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1256', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1256 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('yzvnqAN');
      logInfo(`step1 getBar("yzvnqAN"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('AA');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1256 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1257
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1257
     * @tc.desc      ComponentFactory call flow getContent > delete > getBar > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1257', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1257 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('S1KaTmmeYq6');
      subject.delete('Ccw2Zqi2ZIS');
      const step3 = subject.getBar('whOLzSN');
      logInfo(`step3 getBar("whOLzSN"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('rRj8x6YM6');
      logInfo(`step4 getBar("rRj8x6YM6"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getBar('X');
      logInfo(`step5 getBar("X"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1257 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1258
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1258
     * @tc.desc      ComponentFactory call flow getBar > getBar > toArray > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1258', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1258 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('e7qxFXB9Kbb');
      logInfo(`step1 getBar("e7qxFXB9Kbb"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('etSuf');
      logInfo(`step2 getBar("etSuf"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('3');
      subject.getParams('VkwV');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1258 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1259
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1259
     * @tc.desc      ComponentFactory call flow getBar > getBar > getBar > getContent > getContent keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1259', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1259 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('O6CfKF');
      logInfo(`step1 getBar("O6CfKF"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('IBRvXI');
      logInfo(`step2 getBar("IBRvXI"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('miyb');
      logInfo(`step3 getBar("miyb"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('xSample Title 123');
      subject.getContent('Fu');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1259 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1260
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1260
     * @tc.desc      ComponentFactory call flow getContent > getContent > delete > toArray > getParams keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1260', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1260 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('P7wBLpfLbLB');
      subject.getContent('abc');
      subject.delete('vHA');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getParams('MDzjvi6c');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1260 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1261
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1261
     * @tc.desc      ComponentFactory call flow toArray > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1261', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1261 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('KQe6F');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1261 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1262
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1262
     * @tc.desc      ComponentFactory call flow getBar > getContent > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1262', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1262 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('NW');
      logInfo(`step1 getBar("NW"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('HIs3Zc');
      subject.getContent('abcabc');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1262 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1263
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1263
     * @tc.desc      ComponentFactory call flow delete > getContent > getParams > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1263', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1263 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('9eokJW');
      subject.getContent('rtwMg6lz6JPm');
      subject.getParams('cN2zDR83ns');
      const step4 = subject.getBar('e7qxFXB9Kbb');
      logInfo(`step4 getBar("e7qxFXB9Kbb"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.delete('PrQuLUQF');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1263 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1264
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1264
     * @tc.desc      ComponentFactory call flow toArray > getContent > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1264', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1264 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('7C');
      subject.getParams('2d');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1264 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1265
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1265
     * @tc.desc      ComponentFactory call flow delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1265', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1265 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('oazDxlK9Y');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1265 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1266
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1266
     * @tc.desc      ComponentFactory call flow toArray > getParams > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1266', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1266 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('0KxxJOv9RNr5');
      const step3 = subject.getBar('PFOls05b2');
      logInfo(`step3 getBar("PFOls05b2"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('yL');
      logInfo(`step4 getBar("yL"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1266 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1267
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1267
     * @tc.desc      ComponentFactory call flow toArray > getBar > getContent > getBar > getParams keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1267', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1267 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('Sample Title 123_1');
      logInfo(`step2 getBar("Sample Title 123_1"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('F');
      const step4 = subject.getBar('A_1');
      logInfo(`step4 getBar("A_1"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getParams('WygLQEV');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1267 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1268
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1268
     * @tc.desc      ComponentFactory call flow getBar > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1268', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1268 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('EuOAOYf');
      logInfo(`step1 getBar("EuOAOYf"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('nq');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1268 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1269
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1269
     * @tc.desc      ComponentFactory call flow toArray > getBar > getParams > getParams > getContent keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1269', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1269 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('3LN2SuKY4');
      logInfo(`step2 getBar("3LN2SuKY4"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('AA');
      subject.getParams('j6zPJTMw');
      subject.getContent('A2');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1269 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1270
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1270
     * @tc.desc      ComponentFactory call flow toArray > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1270', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1270 begin`);
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
      logInfo(`${BUNDLE}ComponentFactoryFlow_1270 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1271
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1271
     * @tc.desc      ComponentFactory call flow getContent > getBar > toArray > getBar > getContent keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1271', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1271 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('2Hl3ViT');
      const step2 = subject.getBar('123_1');
      logInfo(`step2 getBar("123_1"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('oZpLOiX');
      logInfo(`step4 getBar("oZpLOiX"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getContent('AllDljI');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1271 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1272
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1272
     * @tc.desc      ComponentFactory call flow getBar > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1272', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1272 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('GuYN');
      logInfo(`step1 getBar("GuYN"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('hNll');
      logInfo(`step2 getBar("hNll"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar(' ');
      logInfo(`step3 getBar(" "): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1272 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1273
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1273
     * @tc.desc      ComponentFactory call flow toArray > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1273', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1273 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('jKT9Pt');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1273 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1274
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1274
     * @tc.desc      ComponentFactory call flow toArray > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1274', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1274 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('mb');
      logInfo(`step2 getBar("mb"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('MOWr');
      logInfo(`step3 getBar("MOWr"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1274 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1275
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1275
     * @tc.desc      ComponentFactory call flow getContent > toArray > getParams > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1275', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1275 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('x');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('xHello World');
      subject.getContent('i');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1275 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1276
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1276
     * @tc.desc      ComponentFactory call flow toArray > getParams > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1276', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1276 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('oLuRAg');
      subject.getContent('FLQOuZsk');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1276 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1277
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1277
     * @tc.desc      ComponentFactory call flow toArray > toArray > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1277', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1277 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('FYXMiUxa');
      logInfo(`step3 getBar("FYXMiUxa"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('T2T');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1277 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1278
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1278
     * @tc.desc      ComponentFactory call flow getContent > getContent > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1278', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1278 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('xyc');
      subject.getContent('ZI');
      subject.getContent('VySbhZ2Tc');
      const step4 = subject.getBar('xabc');
      logInfo(`step4 getBar("xabc"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1278 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1279
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1279
     * @tc.desc      ComponentFactory call flow getBar > getContent > getContent > getBar > delete keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1279', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1279 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('dsc6Ba0');
      logInfo(`step1 getBar("dsc6Ba0"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('EzNIsPj');
      subject.getContent('CXu8');
      const step4 = subject.getBar('ayCVc6W3E');
      logInfo(`step4 getBar("ayCVc6W3E"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.delete('2ihOb0dE7ue');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1279 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1280
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1280
     * @tc.desc      ComponentFactory call flow getParams > delete > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1280', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1280 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('Hello WorldHello World');
      subject.delete('JPpP');
      const step3 = subject.getBar('G7OT8');
      logInfo(`step3 getBar("G7OT8"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1280 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1281
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1281
     * @tc.desc      ComponentFactory call flow getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1281', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1281 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('123123');
      logInfo(`step1 getBar("123123"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('MOWr');
      logInfo(`step2 getBar("MOWr"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1281 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1282
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1282
     * @tc.desc      ComponentFactory call flow getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1282', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1282 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('6');
      logInfo(`step1 getBar("6"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('RJ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1282 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1283
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1283
     * @tc.desc      ComponentFactory call flow delete > toArray > getContent > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1283', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1283 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('MtkshFv9v');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('C3bqpZ7GLYr');
      subject.getContent('F39Oc1Z6TI');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1283 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1284
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1284
     * @tc.desc      ComponentFactory call flow delete > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1284', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1284 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('p7H');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1284 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1285
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1285
     * @tc.desc      ComponentFactory call flow getBar > toArray > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1285', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1285 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('O805K7Y');
      logInfo(`step1 getBar("O805K7Y"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('qr3Vm7rLf7E');
      logInfo(`step3 getBar("qr3Vm7rLf7E"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('2d');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1285 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1286
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1286
     * @tc.desc      ComponentFactory call flow delete > getBar > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1286', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1286 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('');
      const step2 = subject.getBar('CyPe');
      logInfo(`step2 getBar("CyPe"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('OvsjRINx');
      logInfo(`step3 getBar("OvsjRINx"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1286 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1287
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1287
     * @tc.desc      ComponentFactory call flow delete > getContent > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1287', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1287 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('Ccw2Zqi2ZIS');
      subject.getContent('mc');
      subject.delete('YTQNvDFZ');
      const step4 = subject.getBar('ndk');
      logInfo(`step4 getBar("ndk"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1287 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1288
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1288
     * @tc.desc      ComponentFactory call flow toArray > toArray > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1288', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1288 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('ck72LRrke');
      logInfo(`step3 getBar("ck72LRrke"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('mb');
      logInfo(`step4 getBar("mb"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1288 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1289
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1289
     * @tc.desc      ComponentFactory call flow getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1289', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1289 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('mwmaw1');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1289 end`);
    });
  });
}
