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
export default function componentFactoryFlow27Test(): void {
  describe('ComponentFactoryFlow27Test', () => {
    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1873
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1873
     * @tc.desc      ComponentFactory call flow getParams > toArray > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1873', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1873 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('VkwV');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('xHello World');
      logInfo(`step3 getBar("xHello World"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1873 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1874
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1874
     * @tc.desc      ComponentFactory call flow getContent > delete > getBar > getParams > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1874', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1874 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('A2');
      subject.delete('PlJs');
      const step3 = subject.getBar('ED');
      logInfo(`step3 getBar("ED"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('UVLwtn');
      subject.delete('pgM');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1874 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1875
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1875
     * @tc.desc      ComponentFactory call flow getContent > getContent > getContent > delete > toArray keeps state c...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1875', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1875 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('Wy');
      subject.getContent(' Sample Title 123 ');
      subject.getContent('eJuIlW3Qr');
      subject.delete('jhT1oX');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1875 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1876
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1876
     * @tc.desc      ComponentFactory call flow getBar > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1876', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1876 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Uw56XMZCO');
      logInfo(`step1 getBar("Uw56XMZCO"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('YRgTMZgh');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1876 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1877
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1877
     * @tc.desc      ComponentFactory call flow delete > toArray > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1877', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1877 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('lV');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('Q4ZKk');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1877 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1878
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1878
     * @tc.desc      ComponentFactory call flow getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1878', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1878 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('0vSLrfP6Ad');
      logInfo(`step1 getBar("0vSLrfP6Ad"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('Hello World_1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1878 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1879
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1879
     * @tc.desc      ComponentFactory call flow getParams > getContent > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1879', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1879 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('qWYQl');
      subject.getContent('abc');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1879 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1880
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1880
     * @tc.desc      ComponentFactory call flow getBar > getContent > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1880', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1880 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Sample Title 123');
      logInfo(`step1 getBar("Sample Title 123"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('DK');
      subject.getContent('F');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1880 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1881
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1881
     * @tc.desc      ComponentFactory call flow getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1881', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1881 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('3');
      const step2 = subject.getBar(' a ');
      logInfo(`step2 getBar(" a "): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1881 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1882
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1882
     * @tc.desc      ComponentFactory call flow delete > delete > getParams > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1882', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1882 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('xabc');
      subject.delete('pSPd');
      subject.getParams('Hello_1');
      const step4 = subject.getBar('mI');
      logInfo(`step4 getBar("mI"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getBar('bxg');
      logInfo(`step5 getBar("bxg"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1882 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1883
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1883
     * @tc.desc      ComponentFactory call flow getContent > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1883', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1883 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('NGH');
      subject.getContent('7MmBfPvMALD');
      const step3 = subject.getBar('xZ');
      logInfo(`step3 getBar("xZ"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1883 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1884
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1884
     * @tc.desc      ComponentFactory call flow toArray > getBar > delete > delete > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1884', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1884 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('k');
      logInfo(`step2 getBar("k"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('Hello World');
      subject.delete('hello world');
      subject.getContent('aa');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1884 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1885
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1885
     * @tc.desc      ComponentFactory call flow toArray > toArray > getContent > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1885', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1885 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('1D8ajxTfZ');
      subject.getContent('KBhrxv');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1885 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1886
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1886
     * @tc.desc      ComponentFactory call flow toArray > getContent > delete > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1886', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1886 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('7NMMVN');
      subject.delete('8uYGsOLyg');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1886 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1887
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1887
     * @tc.desc      ComponentFactory call flow getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1887', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1887 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Sample Title 123Sample Title 123');
      logInfo(`step1 getBar("Sample Title 123Sample Titl...: step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('Hello WorldHello World');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1887 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1888
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1888
     * @tc.desc      ComponentFactory call flow getParams > toArray > getParams > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1888', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1888 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('iYuvcsbi');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('gR1IfSc79');
      subject.delete('P');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1888 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1889
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1889
     * @tc.desc      ComponentFactory call flow getParams > toArray > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1889', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1889 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('H');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar(' Hello World ');
      logInfo(`step3 getBar(" Hello World "): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('EzNIsPj');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1889 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1890
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1890
     * @tc.desc      ComponentFactory call flow getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1890', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1890 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('F39Oc1Z6TI');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1890 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1891
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1891
     * @tc.desc      ComponentFactory call flow getBar > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1891', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1891 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('1MYBqsx53n');
      logInfo(`step1 getBar("1MYBqsx53n"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('w7smXl');
      logInfo(`step3 getBar("w7smXl"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1891 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1892
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1892
     * @tc.desc      ComponentFactory call flow delete > getContent > toArray > delete > getContent keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1892', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1892 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete(' _1');
      subject.getContent('Zj3J0');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('d4NLzEvY6gQk');
      subject.getContent('HIs3Zc');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1892 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1893
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1893
     * @tc.desc      ComponentFactory call flow getBar > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1893', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1893 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('yL');
      logInfo(`step1 getBar("yL"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('123_1');
      const step3 = subject.getBar('6YBKgd');
      logInfo(`step3 getBar("6YBKgd"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1893 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1894
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1894
     * @tc.desc      ComponentFactory call flow toArray > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1894', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1894 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('d2e7M');
      logInfo(`step2 getBar("d2e7M"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1894 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1895
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1895
     * @tc.desc      ComponentFactory call flow getBar > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1895', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1895 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('PFOls05b2');
      logInfo(`step1 getBar("PFOls05b2"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1895 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1896
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1896
     * @tc.desc      ComponentFactory call flow delete > delete > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1896', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1896 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('wZwlOYmt6');
      subject.delete('go');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('qGYTjRIW');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1896 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1897
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1897
     * @tc.desc      ComponentFactory call flow getBar > toArray > getContent > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1897', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1897 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('AA');
      logInfo(`step1 getBar("AA"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('7wHIP1');
      subject.getParams('x ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1897 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1898
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1898
     * @tc.desc      ComponentFactory call flow delete > getContent > getBar > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1898', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1898 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('IaCwhx5MR');
      subject.getContent('ThmZoPQ0Nwk');
      const step3 = subject.getBar('bxg');
      logInfo(`step3 getBar("bxg"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('wZwlOYmt6');
      const step5 = subject.getBar('x ');
      logInfo(`step5 getBar("x "): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1898 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1899
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1899
     * @tc.desc      ComponentFactory call flow getParams > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1899', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1899 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('Qc');
      const step2 = subject.getBar('CDfrwdMnV');
      logInfo(`step2 getBar("CDfrwdMnV"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('Zn8gjRlr');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1899 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1900
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1900
     * @tc.desc      ComponentFactory call flow delete > getBar > getParams > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1900 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('vt7M08');
      const step2 = subject.getBar('miyb');
      logInfo(`step2 getBar("miyb"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('oLuRAg');
      subject.getParams('i');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1900 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1901
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1901
     * @tc.desc      ComponentFactory call flow toArray > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1901', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1901 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('sz4qZ6Y');
      subject.getParams('kt62Ld');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1901 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1902
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1902
     * @tc.desc      ComponentFactory call flow toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1902', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1902 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1902 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1903
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1903
     * @tc.desc      ComponentFactory call flow toArray > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1903', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1903 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('psf8l88I');
      const step3 = subject.getBar('7cw');
      logInfo(`step3 getBar("7cw"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1903 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1904
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1904
     * @tc.desc      ComponentFactory call flow getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1904', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1904 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('JLyYfj');
      const step2 = subject.getBar('ciB48JMXh');
      logInfo(`step2 getBar("ciB48JMXh"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1904 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1905
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1905
     * @tc.desc      ComponentFactory call flow getBar > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1905', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1905 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('zj');
      logInfo(`step1 getBar("zj"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('   ');
      logInfo(`step2 getBar("   "): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('Smhe70');
      logInfo(`step3 getBar("Smhe70"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1905 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1906
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1906
     * @tc.desc      ComponentFactory call flow delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1906', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1906 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('aZyPzQa7arm');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1906 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1907
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1907
     * @tc.desc      ComponentFactory call flow getBar > getBar > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1907', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1907 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('kbL1nDRH');
      logInfo(`step1 getBar("kbL1nDRH"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`step2 getBar("????"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('   ');
      subject.getParams('AlrP57tD6bQR');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1907 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1908
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1908
     * @tc.desc      ComponentFactory call flow getContent > getContent > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1908', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1908 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('9XJ');
      subject.getContent('S0HWBvzTs');
      subject.getParams('2pjqf');
      const step4 = subject.getBar('P7r5');
      logInfo(`step4 getBar("P7r5"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1908 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1909
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1909
     * @tc.desc      ComponentFactory call flow toArray > toArray > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1909', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1909 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('MedbmHHUIc');
      const step4 = subject.getBar('eLADslckWNfW');
      logInfo(`step4 getBar("eLADslckWNfW"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1909 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1910
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1910
     * @tc.desc      ComponentFactory call flow getBar > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1910', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1910 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('hCxdZO');
      logInfo(`step1 getBar("hCxdZO"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('FxlcWtnYctK');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1910 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1911
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1911
     * @tc.desc      ComponentFactory call flow getContent > getParams > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1911', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1911 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('l');
      subject.getParams('l0vCXsQi3');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getParams('qWYQl');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1911 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1912
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1912
     * @tc.desc      ComponentFactory call flow getBar > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1912', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1912 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('bd');
      logInfo(`step1 getBar("bd"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('I22XxBc');
      const step3 = subject.getBar('WCEOCcw2E2');
      logInfo(`step3 getBar("WCEOCcw2E2"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1912 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1913
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1913
     * @tc.desc      ComponentFactory call flow toArray > toArray > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1913', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1913 begin`);
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
      subject.getParams('kt62Ld');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1913 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1914
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1914
     * @tc.desc      ComponentFactory call flow getContent > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1914', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1914 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('0Tn8NJB7UG');
      const step2 = subject.getBar('yMeu11snR');
      logInfo(`step2 getBar("yMeu11snR"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('eyQTwU8DM7la');
      logInfo(`step3 getBar("eyQTwU8DM7la"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1914 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1915
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1915
     * @tc.desc      ComponentFactory call flow getParams > getContent > getBar > getContent > getBar keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1915', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1915 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('9YLrXjHx6t');
      subject.getContent(' _1');
      const step3 = subject.getBar('k');
      logInfo(`step3 getBar("k"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('2EqNO2X');
      const step5 = subject.getBar('cM5bxlXCGHnR');
      logInfo(`step5 getBar("cM5bxlXCGHnR"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1915 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1916
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1916
     * @tc.desc      ComponentFactory call flow toArray > delete > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1916', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1916 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('dtxX86ijO8nY');
      subject.getParams('hello world_1');
      const step4 = subject.getBar('ZrUU4j1Q62EK');
      logInfo(`step4 getBar("ZrUU4j1Q62EK"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1916 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1917
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1917
     * @tc.desc      ComponentFactory call flow getParams > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1917', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1917 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('sbxkifFIV');
      const step2 = subject.getBar('UZ1');
      logInfo(`step2 getBar("UZ1"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('0xoZWamAK');
      logInfo(`step3 getBar("0xoZWamAK"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1917 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1918
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1918
     * @tc.desc      ComponentFactory call flow getParams > delete > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1918', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1918 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('9kN7kfusjr');
      subject.delete('YjHW');
      const step3 = subject.getBar('adwN3');
      logInfo(`step3 getBar("adwN3"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('JLyYfj');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1918 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1919
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1919
     * @tc.desc      ComponentFactory call flow getBar > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1919', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1919 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('0vSLrfP6Ad');
      logInfo(`step1 getBar("0vSLrfP6Ad"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('qfh7xvfS5B');
      logInfo(`step2 getBar("qfh7xvfS5B"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('x123');
      logInfo(`step3 getBar("x123"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1919 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1920
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1920
     * @tc.desc      ComponentFactory call flow toArray > getParams > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1920', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1920 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('jxGacmhL');
      subject.getContent('TLzHYlbpE2');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1920 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1921
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1921
     * @tc.desc      ComponentFactory call flow toArray > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1921', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1921 begin`);
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
      logInfo(`${BUNDLE}ComponentFactoryFlow_1921 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1922
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1922
     * @tc.desc      ComponentFactory call flow getContent > delete > getParams > getContent > toArray keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1922', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1922 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('K2iW8');
      subject.delete('vWF3');
      subject.getParams('i685dQSQE');
      subject.getContent('Sample Title 123');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1922 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1923
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1923
     * @tc.desc      ComponentFactory call flow getBar > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1923', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1923 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('6Tomqj');
      logInfo(`step1 getBar("6Tomqj"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('eTf');
      const step3 = subject.getBar('G7OT8');
      logInfo(`step3 getBar("G7OT8"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1923 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1924
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1924
     * @tc.desc      ComponentFactory call flow getBar > getParams > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1924', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1924 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('MU');
      logInfo(`step1 getBar("MU"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('oLuRAg');
      subject.getContent('9XJ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1924 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1925
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1925
     * @tc.desc      ComponentFactory call flow toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1925', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1925 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('lcr8');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1925 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1926
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1926
     * @tc.desc      ComponentFactory call flow toArray > getParams > getParams > getContent > getContent keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1926', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1926 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('2pjqf');
      subject.getParams('8H');
      subject.getContent('RzPo4Flq7657');
      subject.getContent('Ie8vBhT');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1926 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1927
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1927
     * @tc.desc      ComponentFactory call flow getParams > getParams > getParams > getParams > getBar keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1927', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1927 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('Dn1OiUjJS6La');
      subject.getParams('W');
      subject.getParams('0g9xwFN');
      subject.getParams('EoLqcAlFu');
      const step5 = subject.getBar('3');
      logInfo(`step5 getBar("3"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1927 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1928
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1928
     * @tc.desc      ComponentFactory call flow delete > delete > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1928', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1928 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('YjHW');
      subject.delete('XKxsM0oJspL');
      const step3 = subject.getBar('GwrQCX');
      logInfo(`step3 getBar("GwrQCX"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('\u4e2d\u6587');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1928 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1929
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1929
     * @tc.desc      ComponentFactory call flow getParams > toArray > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1929', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1929 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('7ziCRIc');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('Bo4Qrnt');
      logInfo(`step3 getBar("Bo4Qrnt"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('yobXge');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1929 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1930
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1930
     * @tc.desc      ComponentFactory call flow getParams > getContent > getBar > getParams > getBar keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1930', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1930 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams(' abc ');
      subject.getContent('0wQcs');
      const step3 = subject.getBar('xHello');
      logInfo(`step3 getBar("xHello"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('Uc45f3');
      const step5 = subject.getBar('e4');
      logInfo(`step5 getBar("e4"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1930 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1931
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1931
     * @tc.desc      ComponentFactory call flow getBar > getParams > getContent > toArray > getParams keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1931', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1931 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('8MUd8zV');
      logInfo(`step1 getBar("8MUd8zV"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('8YGinqG');
      subject.getContent('I');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getParams('hfTcts');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1931 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1932
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1932
     * @tc.desc      ComponentFactory call flow toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1932', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1932 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('jh1xjQMI');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1932 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1933
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1933
     * @tc.desc      ComponentFactory call flow toArray > toArray > toArray > getParams > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1933', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1933 begin`);
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
      subject.getParams('yKIG4eakeO');
      subject.delete('aZyPzQa7arm');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1933 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1934
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1934
     * @tc.desc      ComponentFactory call flow getParams > delete > getContent > getContent > getBar keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1934', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1934 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('FTGcAQrqoI');
      subject.delete('x0');
      subject.getContent('eJuIlW3Qr');
      subject.getContent('h');
      const step5 = subject.getBar('CDfrwdMnV');
      logInfo(`step5 getBar("CDfrwdMnV"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1934 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1935
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1935
     * @tc.desc      ComponentFactory call flow toArray > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1935', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1935 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('3Pe');
      logInfo(`step2 getBar("3Pe"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent(' Sample Title 123 ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1935 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1936
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1936
     * @tc.desc      ComponentFactory call flow toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1936', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1936 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('0QU5');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1936 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1937
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1937
     * @tc.desc      ComponentFactory call flow getParams > getContent > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1937', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1937 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('Jq');
      subject.getContent('J4flKUQqwBH2');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('xyc');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1937 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1938
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1938
     * @tc.desc      ComponentFactory call flow delete > toArray > getBar > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1938', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1938 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('hello world_1');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('DKkkl');
      logInfo(`step3 getBar("DKkkl"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('A_1');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1938 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1939
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1939
     * @tc.desc      ComponentFactory call flow getContent > toArray > getParams > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1939', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1939 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('x123');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('7');
      subject.getContent('cm');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1939 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1940
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1940
     * @tc.desc      ComponentFactory call flow getContent > getParams > getBar > getContent > getParams keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1940', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1940 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('bysMUMdqfPdq');
      subject.getParams('kt62Ld');
      const step3 = subject.getBar('sEgYAx01NMC');
      logInfo(`step3 getBar("sEgYAx01NMC"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('Kf');
      subject.getParams('si4CUr');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1940 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1941
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1941
     * @tc.desc      ComponentFactory call flow getBar > toArray > getContent > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1941', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1941 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('EdSsHK3Z');
      logInfo(`step1 getBar("EdSsHK3Z"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('jk8tbuD');
      subject.delete('hFp');
      subject.delete('ASFrvK5j');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1941 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1942
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1942
     * @tc.desc      ComponentFactory call flow delete > toArray > delete > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1942', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1942 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('st');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('P6');
      subject.getContent('i');
      const step5 = subject.getBar('adwN3');
      logInfo(`step5 getBar("adwN3"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1942 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1943
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1943
     * @tc.desc      ComponentFactory call flow getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1943', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1943 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('onHMSlNH');
      logInfo(`step1 getBar("onHMSlNH"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('z8T4K');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1943 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1944
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1944
     * @tc.desc      ComponentFactory call flow toArray > toArray > delete > delete > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1944', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1944 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('k');
      subject.delete('7qHQfp4He');
      subject.delete('HhL62');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1944 end`);
    });
  });
}
