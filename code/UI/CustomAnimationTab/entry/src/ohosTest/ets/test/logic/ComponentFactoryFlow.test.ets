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

/** Logic checks for ComponentFactory flow (66 cases). */
export default function componentFactoryFlowTest(): void {
  describe('ComponentFactoryFlowTest', () => {
    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0001
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0001
     * @tc.desc      ComponentFactory call flow getBar > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0001 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('oJ');
      logInfo(`step1 getBar("oJ"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('pAISptGN');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0001 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0002
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0002
     * @tc.desc      ComponentFactory call flow getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0002 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('ij84GYmvSI39');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0002 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0003
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0003
     * @tc.desc      ComponentFactory call flow getBar > getBar > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0003 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('ayCVc6W3E');
      logInfo(`step1 getBar("ayCVc6W3E"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('bxg');
      logInfo(`step2 getBar("bxg"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('3Pe');
      logInfo(`step4 getBar("3Pe"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0003 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0004
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0004
     * @tc.desc      ComponentFactory call flow getContent > delete > getBar > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0004 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('swys');
      subject.delete('x\u4e2d\u6587');
      const step3 = subject.getBar('n4BBP');
      logInfo(`step3 getBar("n4BBP"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('YRgTMZgh');
      const step5 = subject.getBar('eLKhA');
      logInfo(`step5 getBar("eLKhA"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0004 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0005
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0005
     * @tc.desc      ComponentFactory call flow toArray > getParams > getContent > delete > getContent keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0005 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('2bFK3uf');
      subject.getContent(' 123 ');
      subject.delete('g9');
      subject.getContent('yf');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0005 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0006
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0006
     * @tc.desc      ComponentFactory call flow delete > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0006 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('QGcHwzD3R');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0006 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0007
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0007
     * @tc.desc      ComponentFactory call flow getParams > delete > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0007 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('HN0');
      subject.delete('6emR6k');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('ea4GvMxX');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0007 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0008
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0008
     * @tc.desc      ComponentFactory call flow getContent > delete > getParams > toArray > getContent keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0008 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('XsspxL');
      subject.delete('TUiZ');
      subject.getParams('tCv1p8');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getContent('DK');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0008 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0009
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0009
     * @tc.desc      ComponentFactory call flow delete > getBar > toArray > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0009 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('ZDKcZO');
      const step2 = subject.getBar('mI');
      logInfo(`step2 getBar("mI"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('\u4e2d\u6587_1');
      logInfo(`step4 getBar("??_1"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getContent('7MmBfPvMALD');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0009 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0010
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0010
     * @tc.desc      ComponentFactory call flow getContent > getContent > getParams > getContent > toArray keeps stat...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0010 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('Si3Bh');
      subject.getContent('xA');
      subject.getParams('A_1');
      subject.getContent('Ep');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0010 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0011
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0011
     * @tc.desc      ComponentFactory call flow toArray > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0011 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar(' 123 ');
      logInfo(`step2 getBar(" 123 "): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('4MRCZ3RVhU');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0011 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0012
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0012
     * @tc.desc      ComponentFactory call flow delete > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0012 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('inIQz');
      const step2 = subject.getBar('n8oyYK');
      logInfo(`step2 getBar("n8oyYK"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('dEkCFIvXd');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0012 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0013
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0013
     * @tc.desc      ComponentFactory call flow delete > toArray > toArray > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0013 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('1JQNTOALvYj1');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.delete('HQ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0013 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0014
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0014
     * @tc.desc      ComponentFactory call flow toArray > delete > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0014 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('g9');
      subject.getContent('A');
      const step4 = subject.getBar('ck72LRrke');
      logInfo(`step4 getBar("ck72LRrke"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0014 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0015
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0015
     * @tc.desc      ComponentFactory call flow toArray > getParams > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0015 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('qJVpmab5mq');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('8j');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0015 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0016
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0016
     * @tc.desc      ComponentFactory call flow getParams > getContent > getBar > getContent > getContent keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0016 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('wGSFFV');
      subject.getContent('eAN');
      const step3 = subject.getBar('1MYBqsx53n');
      logInfo(`step3 getBar("1MYBqsx53n"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('1D8ajxTfZ');
      subject.getContent('3Ymm5m7acs');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0016 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0017
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0017
     * @tc.desc      ComponentFactory call flow getBar > getParams > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0017 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('UxuoihOCz');
      logInfo(`step1 getBar("UxuoihOCz"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('IhXNf');
      subject.getParams('1UvjpL');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0017 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0018
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0018
     * @tc.desc      ComponentFactory call flow getBar > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0018 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('5f');
      logInfo(`step1 getBar("5f"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('d4NLzEvY6gQk');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0018 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0019
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0019
     * @tc.desc      ComponentFactory call flow toArray > getParams > delete > getContent > toArray keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0019 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('8YGinqG');
      subject.delete('VvICRs58S');
      subject.getContent(' Hello World ');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0019 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0020
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0020
     * @tc.desc      ComponentFactory call flow delete > toArray > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0020 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete(' abc ');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('  ');
      const step4 = subject.getBar('IXj4nI0');
      logInfo(`step4 getBar("IXj4nI0"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0020 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0021
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0021
     * @tc.desc      ComponentFactory call flow getBar > getContent > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0021 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('N7OAv');
      logInfo(`step1 getBar("N7OAv"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('7MmBfPvMALD');
      subject.delete('XNdC3ThDoNg');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0021 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0022
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0022
     * @tc.desc      ComponentFactory call flow getContent > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0022 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('ZI');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('Ov');
      logInfo(`step3 getBar("Ov"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0022 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0023
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0023
     * @tc.desc      ComponentFactory call flow getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0023 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('A');
      logInfo(`step1 getBar("A"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('VEn9iepX');
      logInfo(`step2 getBar("VEn9iepX"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0023 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0024
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0024
     * @tc.desc      ComponentFactory call flow getParams > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0024 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('SDo92I7HlZ');
      const step2 = subject.getBar('d2e7M');
      logInfo(`step2 getBar("d2e7M"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('MZEv8J');
      logInfo(`step3 getBar("MZEv8J"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0024 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0025
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0025
     * @tc.desc      ComponentFactory call flow delete > delete > getParams > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0025 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('u63n86V');
      subject.delete('ScNobGpvdWM');
      subject.getParams('Bwig9b9gr');
      subject.getParams('Tjb');
      const step5 = subject.getBar(' hello world ');
      logInfo(`step5 getBar(" hello world "): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0025 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0026
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0026
     * @tc.desc      ComponentFactory call flow getParams > getBar > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0026 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('5C');
      const step2 = subject.getBar('xHello World');
      logInfo(`step2 getBar("xHello World"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('PlJs');
      const step4 = subject.getBar('UZ1');
      logInfo(`step4 getBar("UZ1"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0026 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0027
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0027
     * @tc.desc      ComponentFactory call flow delete > getBar > toArray > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0027 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('nbtrrK6');
      const step2 = subject.getBar('N7OAv');
      logInfo(`step2 getBar("N7OAv"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('R');
      subject.getParams('Rx79u5I');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0027 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0028
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0028
     * @tc.desc      ComponentFactory call flow toArray > toArray > getContent > getContent > getContent keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0028 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('7cMM5LUlu');
      subject.getContent('TLBDIj0F7Coe');
      subject.getContent('rMiexP');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0028 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0029
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0029
     * @tc.desc      ComponentFactory call flow getBar > delete > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0029 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('DSfb');
      logInfo(`step1 getBar("DSfb"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('p7H');
      subject.getParams('M2ShSF15');
      const step4 = subject.getBar('6');
      logInfo(`step4 getBar("6"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0029 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0030
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0030
     * @tc.desc      ComponentFactory call flow getParams > delete > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0030 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('2tIMNtcNOL');
      subject.delete('vv08DE');
      const step3 = subject.getBar('A_1');
      logInfo(`step3 getBar("A_1"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('A_1');
      logInfo(`step4 getBar("A_1"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0030 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0031
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0031
     * @tc.desc      ComponentFactory call flow toArray > getBar > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0031 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('kRhUbvP8S');
      logInfo(`step2 getBar("kRhUbvP8S"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('njB9hbOH');
      logInfo(`step3 getBar("njB9hbOH"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('b5WJMy');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0031 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0032
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0032
     * @tc.desc      ComponentFactory call flow toArray > getContent > getParams > getContent > getBar keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0032 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent(' hello world ');
      subject.getParams('123_1');
      subject.getContent('OxSA80TGVBGf');
      const step5 = subject.getBar(' Sample Title 123 ');
      logInfo(`step5 getBar(" Sample Title 123 "): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0032 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0033
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0033
     * @tc.desc      ComponentFactory call flow getContent > delete > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0033 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('UUfRskW');
      subject.delete('U5ac1t');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0033 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0034
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0034
     * @tc.desc      ComponentFactory call flow toArray > getContent > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0034 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('\u4e2d\u6587');
      const step3 = subject.getBar('n6t');
      logInfo(`step3 getBar("n6t"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0034 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0035
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0035
     * @tc.desc      ComponentFactory call flow toArray > toArray > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0035 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('hHx1r');
      logInfo(`step3 getBar("hHx1r"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0035 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0036
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0036
     * @tc.desc      ComponentFactory call flow getContent > getBar > delete > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0036 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('lB5m');
      const step2 = subject.getBar('VEn9iepX');
      logInfo(`step2 getBar("VEn9iepX"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('HQ');
      const step4 = subject.getBar('hiTxVp');
      logInfo(`step4 getBar("hiTxVp"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0036 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0037
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0037
     * @tc.desc      ComponentFactory call flow toArray > getBar > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0037 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('kbL1nDRH');
      logInfo(`step2 getBar("kbL1nDRH"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('slmFzqKNFkHC');
      const step4 = subject.getBar('n8ki');
      logInfo(`step4 getBar("n8ki"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0037 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0038
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0038
     * @tc.desc      ComponentFactory call flow getBar > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0038 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Hello_1');
      logInfo(`step1 getBar("Hello_1"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('z');
      const step3 = subject.getBar('A');
      logInfo(`step3 getBar("A"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0038 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0039
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0039
     * @tc.desc      ComponentFactory call flow getBar > getBar > getBar > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0039 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('njB9hbOH');
      logInfo(`step1 getBar("njB9hbOH"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('Hello_1');
      logInfo(`step2 getBar("Hello_1"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('AV913N');
      logInfo(`step3 getBar("AV913N"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getContent('7MmBfPvMALD');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0039 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0040
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0040
     * @tc.desc      ComponentFactory call flow delete > getParams > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0040 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('3');
      subject.getParams('ICl');
      const step3 = subject.getBar('eECT3Cnise1I');
      logInfo(`step3 getBar("eECT3Cnise1I"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0040 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0041
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0041
     * @tc.desc      ComponentFactory call flow toArray > toArray > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0041 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('tiCdW');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0041 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0042
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0042
     * @tc.desc      ComponentFactory call flow toArray > getBar > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0042 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('GwrQCX');
      logInfo(`step2 getBar("GwrQCX"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('jFoCVxiA4Z');
      logInfo(`step3 getBar("jFoCVxiA4Z"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0042 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0043
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0043
     * @tc.desc      ComponentFactory call flow getParams > getContent > getContent > getBar > toArray keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0043 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('Jq');
      subject.getContent(' 123 ');
      subject.getContent('KBhrxv');
      const step4 = subject.getBar('miyb');
      logInfo(`step4 getBar("miyb"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0043 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0044
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0044
     * @tc.desc      ComponentFactory call flow delete > delete > toArray > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0044 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('77jE');
      subject.delete('xa');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('xSample Title 123');
      logInfo(`step4 getBar("xSample Title 123"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0044 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0045
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0045
     * @tc.desc      ComponentFactory call flow getParams > getBar > getBar > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0045 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('MedbmHHUIc');
      const step2 = subject.getBar('tGx');
      logInfo(`step2 getBar("tGx"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('b');
      logInfo(`step3 getBar("b"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('sp67XTpnyJGQ');
      const step5 = subject.getBar('jlxGvRARmD5f');
      logInfo(`step5 getBar("jlxGvRARmD5f"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0045 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0046
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0046
     * @tc.desc      ComponentFactory call flow delete > toArray > toArray > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0046 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('GMuQcDUSD0D');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('Hello_1');
      const step5 = subject.getBar('3LN2SuKY4');
      logInfo(`step5 getBar("3LN2SuKY4"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0046 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0047
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0047
     * @tc.desc      ComponentFactory call flow delete > getParams > delete > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0047 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('IYDn');
      subject.getParams('si4CUr');
      subject.delete('XKxsM0oJspL');
      const step4 = subject.getBar('Ov');
      logInfo(`step4 getBar("Ov"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getBar('0FT');
      logInfo(`step5 getBar("0FT"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0047 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0048
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0048
     * @tc.desc      ComponentFactory call flow getBar > getParams > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0048 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('uG2');
      logInfo(`step1 getBar("uG2"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('W');
      const step3 = subject.getBar('Hello_1');
      logInfo(`step3 getBar("Hello_1"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0048 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0049
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0049
     * @tc.desc      ComponentFactory call flow toArray > toArray > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0049 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('y3BmY2P9');
      logInfo(`step3 getBar("y3BmY2P9"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('eIU9y');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0049 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0050
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0050
     * @tc.desc      ComponentFactory call flow toArray > getParams > getParams > toArray > getParams keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0050 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('b5WJMy');
      subject.getParams('Ld');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getParams('Hy3dX9N');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0050 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0051
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0051
     * @tc.desc      ComponentFactory call flow toArray > getBar > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0051 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('cX2');
      logInfo(`step2 getBar("cX2"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getParams('mY5pW6J');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0051 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0052
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0052
     * @tc.desc      ComponentFactory call flow getBar > getParams > toArray > getContent > getBar keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0052 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('As0kvJU');
      logInfo(`step1 getBar("As0kvJU"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('3b0EBZ');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('c7lMng8ZM');
      const step5 = subject.getBar('bd');
      logInfo(`step5 getBar("bd"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0052 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0053
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0053
     * @tc.desc      ComponentFactory call flow toArray > delete > getBar > getContent > getParams keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0053 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('xa');
      const step3 = subject.getBar('dqX9qYwm');
      logInfo(`step3 getBar("dqX9qYwm"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('PEM4');
      subject.getParams('rF0zI0O');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0053 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0054
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0054
     * @tc.desc      ComponentFactory call flow getContent > delete > getContent > getBar > delete keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0054 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('EzNIsPj');
      subject.delete('K');
      subject.getContent('Hello World_1');
      const step4 = subject.getBar('dqy7B');
      logInfo(`step4 getBar("dqy7B"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.delete('8IkTkQ6');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0054 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0055
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0055
     * @tc.desc      ComponentFactory call flow getContent > delete > toArray > getContent > getBar keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0055 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('cm');
      subject.delete('bq2U');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('VQ');
      const step5 = subject.getBar('Hello World');
      logInfo(`step5 getBar("Hello World"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0055 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0056
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0056
     * @tc.desc      ComponentFactory call flow getBar > getContent > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0056 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('123');
      logInfo(`step1 getBar("123"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('AA');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0056 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0057
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0057
     * @tc.desc      ComponentFactory call flow getBar > delete > getBar > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0057 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar(' \u4e2d\u6587 ');
      logInfo(`step1 getBar(" ?? "): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('BaRzkvGihLV');
      const step3 = subject.getBar('FYXMiUxa');
      logInfo(`step3 getBar("FYXMiUxa"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5 = subject.getBar('WRd');
      logInfo(`step5 getBar("WRd"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0057 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0058
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0058
     * @tc.desc      ComponentFactory call flow getParams > getBar > getBar > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0058 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('a_1');
      const step2 = subject.getBar('CyPe');
      logInfo(`step2 getBar("CyPe"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('l');
      logInfo(`step3 getBar("l"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('P');
      logInfo(`step4 getBar("P"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0058 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0059
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0059
     * @tc.desc      ComponentFactory call flow toArray > getParams > toArray > toArray > getContent keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0059 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('v7wMsz894');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getContent('ZjpMfS');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0059 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0060
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0060
     * @tc.desc      ComponentFactory call flow getBar > delete > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0060 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('\u4e2d\u6587');
      logInfo(`step1 getBar("??"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('Z2de');
      const step3 = subject.getBar('PIGR');
      logInfo(`step3 getBar("PIGR"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('A_1');
      logInfo(`step4 getBar("A_1"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0060 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0061
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0061
     * @tc.desc      ComponentFactory call flow getContent > getContent > toArray > toArray > toArray keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0061 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('2Hl3ViT');
      subject.getContent('eAYcBjsH');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0061 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0062
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0062
     * @tc.desc      ComponentFactory call flow getBar > toArray > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0062 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('6');
      logInfo(`step1 getBar("6"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('8YGinqG');
      const step4 = subject.getBar('thaeTW');
      logInfo(`step4 getBar("thaeTW"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0062 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0063
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0063
     * @tc.desc      ComponentFactory call flow delete > toArray > getContent > getContent > toArray keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0063 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('123123');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('rMiexP');
      subject.getContent('xBKm');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0063 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0064
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0064
     * @tc.desc      ComponentFactory call flow getBar > getBar > toArray > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0064 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('mI');
      logInfo(`step1 getBar("mI"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('CDfrwdMnV');
      logInfo(`step2 getBar("CDfrwdMnV"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getParams('UI');
      const step5 = subject.getBar('ZhT9z0B');
      logInfo(`step5 getBar("ZhT9z0B"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_0064 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0065
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0065
     * @tc.desc      ComponentFactory call flow getBar > toArray > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0065 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('AA');
      logInfo(`step1 getBar("AA"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('8MUd8zV');
      logInfo(`step3 getBar("8MUd8zV"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('DFXlTccFsR');
      logInfo(`${BUNDLE}ComponentFactoryFlow_0065 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_0066
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_0066
     * @tc.desc      ComponentFactory call flow getContent > getBar > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_0066 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('Wi6jAzzq6AL7');
      const step2 = subject.getBar('CDfrwdMnV');
      logInfo(`step2 getBar("CDfrwdMnV"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('FYQfAafcAT');
      logInfo(`step3 getBar("FYQfAafcAT"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_0066 end`);
    });
  });
}
