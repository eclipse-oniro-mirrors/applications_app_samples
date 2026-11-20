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
export default function componentFactoryFlow24Test(): void {
  describe('ComponentFactoryFlow24Test', () => {
    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1654
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1654
     * @tc.desc      ComponentFactory call flow delete > getContent > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1654', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1654 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete(' ');
      subject.getContent('cuWW2qVH');
      const step3 = subject.getBar('n4BBP');
      logInfo(`step3 getBar("n4BBP"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1654 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1655
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1655
     * @tc.desc      ComponentFactory call flow getParams > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1655', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1655 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('IhXNf');
      const step2 = subject.getBar('5Qvn');
      logInfo(`step2 getBar("5Qvn"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('S0HWBvzTs');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1655 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1656
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1656
     * @tc.desc      ComponentFactory call flow toArray > getParams > getContent > toArray > toArray keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1656', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1656 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('9p');
      subject.getContent('nq');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1656 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1657
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1657
     * @tc.desc      ComponentFactory call flow getBar > getContent > getBar > getContent > delete keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1657', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1657 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('yL');
      logInfo(`step1 getBar("yL"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('1D8ajxTfZ');
      const step3 = subject.getBar('DM9T23Gtl2');
      logInfo(`step3 getBar("DM9T23Gtl2"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('krKBqDAeu');
      subject.delete('hello world_1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1657 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1658
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1658
     * @tc.desc      ComponentFactory call flow getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1658', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1658 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('1YW3Xow');
      logInfo(`step1 getBar("1YW3Xow"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1658 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1659
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1659
     * @tc.desc      ComponentFactory call flow getContent > getParams > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1659', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1659 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('Q4ZKk');
      subject.getParams('A_1');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('OxSA80TGVBGf');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1659 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1660
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1660
     * @tc.desc      ComponentFactory call flow delete > getBar > getBar > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1660', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1660 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('tROh17M');
      const step2 = subject.getBar('BYHPHkdoCTWS');
      logInfo(`step2 getBar("BYHPHkdoCTWS"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('zj');
      logInfo(`step3 getBar("zj"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('UizjmYBE');
      subject.getParams('dEkGT');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1660 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1661
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1661
     * @tc.desc      ComponentFactory call flow getBar > getContent > getContent > getParams > getParams keeps state ...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1661', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1661 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Rv1MAGc');
      logInfo(`step1 getBar("Rv1MAGc"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('9XJ');
      subject.getContent('2atXJqonx0');
      subject.getParams('   ');
      subject.getParams('4i');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1661 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1662
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1662
     * @tc.desc      ComponentFactory call flow delete > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1662', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1662 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('bSxeDoYBn');
      const step2 = subject.getBar('bd');
      logInfo(`step2 getBar("bd"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('oKLdk67uzs');
      logInfo(`step3 getBar("oKLdk67uzs"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1662 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1663
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1663
     * @tc.desc      ComponentFactory call flow delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1663', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1663 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('gsD6x');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1663 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1664
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1664
     * @tc.desc      ComponentFactory call flow getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1664', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1664 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('x123');
      logInfo(`step1 getBar("x123"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('PFOls05b2');
      logInfo(`step2 getBar("PFOls05b2"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1664 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1665
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1665
     * @tc.desc      ComponentFactory call flow getParams > getBar > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1665', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1665 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('b5WJMy');
      const step2 = subject.getBar('cf3CZgYgp');
      logInfo(`step2 getBar("cf3CZgYgp"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('hiTxVp');
      logInfo(`step3 getBar("hiTxVp"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('futic8JODso');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1665 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1666
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1666
     * @tc.desc      ComponentFactory call flow delete > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1666', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1666 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('abcabc');
      const step2 = subject.getBar('hiTxVp');
      logInfo(`step2 getBar("hiTxVp"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('EMZcrnNG9m');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1666 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1667
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1667
     * @tc.desc      ComponentFactory call flow getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1667', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1667 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('9XJ');
      const step2 = subject.getBar('L7LmJ9G');
      logInfo(`step2 getBar("L7LmJ9G"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1667 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1668
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1668
     * @tc.desc      ComponentFactory call flow getContent > delete > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1668', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1668 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('TFwsjyaX1xUR');
      subject.delete('IaCwhx5MR');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getParams('3A6n');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1668 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1669
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1669
     * @tc.desc      ComponentFactory call flow getBar > getContent > getParams > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1669', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1669 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('FdLnD6');
      logInfo(`step1 getBar("FdLnD6"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('KFP01CXhPy');
      subject.getParams('AQQtOTN');
      subject.getContent('4UPwWZl');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1669 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1670
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1670
     * @tc.desc      ComponentFactory call flow getBar > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1670', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1670 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('xA');
      logInfo(`step1 getBar("xA"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1670 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1671
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1671
     * @tc.desc      ComponentFactory call flow getParams > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1671', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1671 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('   ');
      const step2 = subject.getBar('Hello World_1');
      logInfo(`step2 getBar("Hello World_1"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('x5bX');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1671 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1672
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1672
     * @tc.desc      ComponentFactory call flow getBar > toArray > getParams > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1672', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1672 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('N7OAv');
      logInfo(`step1 getBar("N7OAv"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('psf8l88I');
      subject.delete('');
      const step5 = subject.getBar('aa');
      logInfo(`step5 getBar("aa"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1672 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1673
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1673
     * @tc.desc      ComponentFactory call flow getBar > delete > getContent > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1673', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1673 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('qfh7xvfS5B');
      logInfo(`step1 getBar("qfh7xvfS5B"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('fTNSgriK74V');
      subject.getContent('ZjpMfS');
      subject.getParams('Vw');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1673 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1674
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1674
     * @tc.desc      ComponentFactory call flow getContent > getBar > delete > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1674', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1674 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('jk8tbuD');
      const step2 = subject.getBar('bB7TmFt');
      logInfo(`step2 getBar("bB7TmFt"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete(' ');
      const step4 = subject.getBar('X');
      logInfo(`step4 getBar("X"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getParams('');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1674 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1675
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1675
     * @tc.desc      ComponentFactory call flow getBar > toArray > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1675', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1675 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('TnQBIQCiZGc');
      logInfo(`step1 getBar("TnQBIQCiZGc"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getParams('dSl33ylyGdF');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1675 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1676
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1676
     * @tc.desc      ComponentFactory call flow delete > getParams > getBar > toArray > getContent keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1676', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1676 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('g9');
      subject.getParams('mr5lRFhAZjpp');
      const step3 = subject.getBar('L');
      logInfo(`step3 getBar("L"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getContent('vW8IZb2km');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1676 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1677
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1677
     * @tc.desc      ComponentFactory call flow toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1677', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1677 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('03cx');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1677 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1678
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1678
     * @tc.desc      ComponentFactory call flow toArray > delete > getBar > getParams > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1678', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1678 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('oazDxlK9Y');
      const step3 = subject.getBar('MZEv8J');
      logInfo(`step3 getBar("MZEv8J"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('1UvjpL');
      subject.delete('jhT1oX');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1678 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1679
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1679
     * @tc.desc      ComponentFactory call flow getBar > delete > getParams > getBar > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1679', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1679 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('EdSsHK3Z');
      logInfo(`step1 getBar("EdSsHK3Z"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('LLMFSrqCpLY');
      subject.getParams('ML4Kk6');
      const step4 = subject.getBar('mdL');
      logInfo(`step4 getBar("mdL"): step4=${step4}`);
      expect(step4).assertUndefined();
      const step5 = subject.getBar('BA4U');
      logInfo(`step5 getBar("BA4U"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1679 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1680
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1680
     * @tc.desc      ComponentFactory call flow getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1680', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1680 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('A');
      logInfo(`step1 getBar("A"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('EMgUpK6s');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1680 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1681
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1681
     * @tc.desc      ComponentFactory call flow toArray > getParams > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1681', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1681 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('43n');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1681 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1682
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1682
     * @tc.desc      ComponentFactory call flow delete > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1682', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1682 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('0VsvJoEp');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('3');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1682 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1683
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1683
     * @tc.desc      ComponentFactory call flow getParams > getParams > toArray > getBar > getContent keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1683', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1683 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('GcdSixwo');
      subject.getParams('sbxkifFIV');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('q2Y');
      logInfo(`step4 getBar("q2Y"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getContent('zoYGeOB');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1683 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1684
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1684
     * @tc.desc      ComponentFactory call flow getParams > getParams > getBar > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1684', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1684 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('si4CUr');
      subject.getParams('0');
      const step3 = subject.getBar('7cw');
      logInfo(`step3 getBar("7cw"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('oiIClbtP6');
      const step5 = subject.getBar('cM5bxlXCGHnR');
      logInfo(`step5 getBar("cM5bxlXCGHnR"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1684 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1685
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1685
     * @tc.desc      ComponentFactory call flow toArray > delete > toArray > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1685', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1685 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('HZDvRFP9g');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getParams('2bFK3uf');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1685 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1686
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1686
     * @tc.desc      ComponentFactory call flow delete > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1686', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1686 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete(' ');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('As0kvJU');
      logInfo(`step3 getBar("As0kvJU"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1686 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1687
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1687
     * @tc.desc      ComponentFactory call flow getBar > getBar > getContent > getContent > getContent keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1687', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1687 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('P7r5');
      logInfo(`step1 getBar("P7r5"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('eLKhA');
      logInfo(`step2 getBar("eLKhA"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('ghu5YI9wHEI');
      subject.getContent('123_1');
      subject.getContent('Y6eQwtY');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1687 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1688
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1688
     * @tc.desc      ComponentFactory call flow toArray > delete > getParams > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1688', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1688 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('xTkzdKaT');
      subject.getParams('7ziCRIc');
      subject.delete('3mmJMh');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1688 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1689
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1689
     * @tc.desc      ComponentFactory call flow toArray > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1689', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1689 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('MDzjvi6c');
      const step3 = subject.getBar('jIDfJlAGM1zc');
      logInfo(`step3 getBar("jIDfJlAGM1zc"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1689 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1690
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1690
     * @tc.desc      ComponentFactory call flow getContent > toArray > toArray > getContent > toArray keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1690', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1690 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('rtwMg6lz6JPm');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('wBF');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1690 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1691
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1691
     * @tc.desc      ComponentFactory call flow toArray > getParams > getBar > delete > getContent keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1691', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1691 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('3b0EBZ');
      const step3 = subject.getBar('lEdaAGGIE');
      logInfo(`step3 getBar("lEdaAGGIE"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('rh2f6yPSgIA');
      subject.getContent('suJIqPBMsZ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1691 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1692
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1692
     * @tc.desc      ComponentFactory call flow delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1692', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1692 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('Sgol4pAe');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1692 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1693
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1693
     * @tc.desc      ComponentFactory call flow delete > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1693', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1693 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('5dhNrgKRA');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('xa');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1693 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1694
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1694
     * @tc.desc      ComponentFactory call flow getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1694', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1694 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('w');
      logInfo(`step1 getBar("w"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1694 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1695
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1695
     * @tc.desc      ComponentFactory call flow getParams > getBar > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1695', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1695 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('p02yi');
      const step2 = subject.getBar('3Pe');
      logInfo(`step2 getBar("3Pe"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('eIU9y');
      const step4 = subject.getBar('rlMC8');
      logInfo(`step4 getBar("rlMC8"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1695 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1696
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1696
     * @tc.desc      ComponentFactory call flow getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1696', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1696 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('2atXJqonx0');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1696 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1697
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1697
     * @tc.desc      ComponentFactory call flow getContent > getParams > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1697', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1697 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('gCMaP7');
      subject.getParams('9YLrXjHx6t');
      subject.delete('lV');
      const step4 = subject.getBar('4dnloBNO2xf');
      logInfo(`step4 getBar("4dnloBNO2xf"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1697 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1698
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1698
     * @tc.desc      ComponentFactory call flow getContent > getParams > getBar > delete > getParams keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1698', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1698 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('Fzf');
      subject.getParams('\u4e2d\u6587_1');
      const step3 = subject.getBar(' hello world ');
      logInfo(`step3 getBar(" hello world "): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete(' Sample Title 123 ');
      subject.getParams('QHpy');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1698 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1699
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1699
     * @tc.desc      ComponentFactory call flow toArray > delete > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1699', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1699 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('3');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getParams('UVLwtn');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1699 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1700
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1700
     * @tc.desc      ComponentFactory call flow getBar > getContent > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1700 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Ov');
      logInfo(`step1 getBar("Ov"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('Y6eQwtY');
      const step3 = subject.getBar('3LN2SuKY4');
      logInfo(`step3 getBar("3LN2SuKY4"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1700 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1701
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1701
     * @tc.desc      ComponentFactory call flow getContent > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1701', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1701 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('fAN');
      const step2 = subject.getBar('WG4eeWlpGG');
      logInfo(`step2 getBar("WG4eeWlpGG"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1701 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1702
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1702
     * @tc.desc      ComponentFactory call flow delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1702', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1702 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('jUa7k1vO');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1702 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1703
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1703
     * @tc.desc      ComponentFactory call flow getParams > toArray > toArray > getParams > getBar keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1703', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1703 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('VkwV');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getParams(' 123 ');
      const step5 = subject.getBar('hello world');
      logInfo(`step5 getBar("hello world"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1703 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1704
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1704
     * @tc.desc      ComponentFactory call flow getParams > delete > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1704', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1704 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('PMGOs7Xt');
      subject.delete('T2Bl');
      subject.getContent('ZcJyDJ');
      const step4 = subject.getBar('jlxGvRARmD5f');
      logInfo(`step4 getBar("jlxGvRARmD5f"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1704 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1705
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1705
     * @tc.desc      ComponentFactory call flow getContent > delete > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1705', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1705 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('hello world_1');
      subject.delete('faUbD2HRbLah');
      const step3 = subject.getBar('qfh7xvfS5B');
      logInfo(`step3 getBar("qfh7xvfS5B"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('   ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1705 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1706
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1706
     * @tc.desc      ComponentFactory call flow getBar > delete > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1706', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1706 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('a_1');
      logInfo(`step1 getBar("a_1"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('EOoK1xnV');
      subject.delete('x\u4e2d\u6587');
      subject.getParams('a_1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1706 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1707
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1707
     * @tc.desc      ComponentFactory call flow getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1707', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1707 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('2OUPICNTu');
      logInfo(`step1 getBar("2OUPICNTu"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1707 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1708
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1708
     * @tc.desc      ComponentFactory call flow toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1708', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1708 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('eAYcBjsH');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1708 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1709
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1709
     * @tc.desc      ComponentFactory call flow getBar > toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1709', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1709 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('xZ');
      logInfo(`step1 getBar("xZ"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getParams('U2xjZrluups');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1709 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1710
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1710
     * @tc.desc      ComponentFactory call flow delete > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1710', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1710 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('H588SnQLlH');
      const step2 = subject.getBar('x\u4e2d\u6587');
      logInfo(`step2 getBar("x??"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('DK');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1710 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1711
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1711
     * @tc.desc      ComponentFactory call flow getContent > getBar > getParams > getContent > getBar keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1711', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1711 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('DpuswFSnb');
      const step2 = subject.getBar('jIDfJlAGM1zc');
      logInfo(`step2 getBar("jIDfJlAGM1zc"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('gZ');
      subject.getContent('9FRWZAoj8b');
      const step5 = subject.getBar('hO3w7f');
      logInfo(`step5 getBar("hO3w7f"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1711 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1712
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1712
     * @tc.desc      ComponentFactory call flow toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1712', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1712 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1712 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1713
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1713
     * @tc.desc      ComponentFactory call flow delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1713', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1713 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('uNmx');
      const step2 = subject.getBar('G');
      logInfo(`step2 getBar("G"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1713 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1714
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1714
     * @tc.desc      ComponentFactory call flow getParams > getContent > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1714', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1714 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('R');
      subject.getContent('3ZPW5');
      subject.getParams('Fl');
      const step4 = subject.getBar('gx4');
      logInfo(`step4 getBar("gx4"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1714 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1715
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1715
     * @tc.desc      ComponentFactory call flow getContent > getBar > getBar > toArray > getContent keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1715', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1715 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('B');
      const step2 = subject.getBar('Hello World_1');
      logInfo(`step2 getBar("Hello World_1"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('L');
      logInfo(`step3 getBar("L"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getContent('HPBKG1Df');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1715 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1716
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1716
     * @tc.desc      ComponentFactory call flow getBar > delete > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1716', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1716 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('Rv1MAGc');
      logInfo(`step1 getBar("Rv1MAGc"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('DPhTh');
      subject.getContent('ik');
      const step4 = subject.getBar('upjzRMbiEoc');
      logInfo(`step4 getBar("upjzRMbiEoc"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1716 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1717
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1717
     * @tc.desc      ComponentFactory call flow getBar > getParams > getBar > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1717', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1717 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('jjBHMnIshV3');
      logInfo(`step1 getBar("jjBHMnIshV3"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('u28YtwC8GrPf');
      const step3 = subject.getBar('ae0');
      logInfo(`step3 getBar("ae0"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('mm6Fv');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1717 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1718
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1718
     * @tc.desc      ComponentFactory call flow delete > delete > getParams > toArray > getContent keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1718', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1718 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('AA');
      subject.delete('77jE');
      subject.getParams('3qmJH2Q');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getContent('123123');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1718 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1719
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1719
     * @tc.desc      ComponentFactory call flow getContent > toArray > delete > getBar > getContent keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1719', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1719 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('p57pLqj4iPEd');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('GP5aw8ge9U');
      const step4 = subject.getBar('28cZ2bB4z5g');
      logInfo(`step4 getBar("28cZ2bB4z5g"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getContent('xSample Title 123');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1719 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1720
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1720
     * @tc.desc      ComponentFactory call flow delete > getBar > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1720', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1720 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('chSGAb3Lmu');
      const step2 = subject.getBar(' Hello World ');
      logInfo(`step2 getBar(" Hello World "): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('hNll');
      logInfo(`step4 getBar("hNll"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1720 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1721
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1721
     * @tc.desc      ComponentFactory call flow getBar > getContent > getParams > delete > getParams keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1721', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1721 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('xNP');
      logInfo(`step1 getBar("xNP"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getContent('v4bZi4a546ta');
      subject.getParams('qXFp');
      subject.delete('Sample Title 123_1');
      subject.getParams('m');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1721 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1722
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1722
     * @tc.desc      ComponentFactory call flow getContent > getParams > getBar > toArray > delete keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1722', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1722 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('S6FkWO');
      subject.getParams('VbhNLb5mKXOX');
      const step3 = subject.getBar('G7OT8');
      logInfo(`step3 getBar("G7OT8"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.delete('gbZBiNl');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1722 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1723
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1723
     * @tc.desc      ComponentFactory call flow getParams > getBar > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1723', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1723 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('iE');
      const step2 = subject.getBar('4dnloBNO2xf');
      logInfo(`step2 getBar("4dnloBNO2xf"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('1YW3Xow');
      logInfo(`step3 getBar("1YW3Xow"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('dSl33ylyGdF');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1723 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1724
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1724
     * @tc.desc      ComponentFactory call flow toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1724', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1724 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('pmm');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1724 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1725
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1725
     * @tc.desc      ComponentFactory call flow getParams > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1725', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1725 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('2JPijen1b');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1725 end`);
    });
  });
}
