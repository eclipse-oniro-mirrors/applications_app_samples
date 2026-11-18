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
export default function componentFactoryFlow17Test(): void {
  describe('ComponentFactoryFlow17Test', () => {
    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1146
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1146
     * @tc.desc      ComponentFactory call flow delete > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1146 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('swH0Ep');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1146 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1147
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1147
     * @tc.desc      ComponentFactory call flow getContent > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1147 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('swys');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('PrQuLUQF');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1147 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1148
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1148
     * @tc.desc      ComponentFactory call flow delete > toArray > getContent > getParams > delete keeps state consis...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1148 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('YjHW');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('m');
      subject.getParams('MMdJ8dfisUy5');
      subject.delete('L4');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1148 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1149
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1149
     * @tc.desc      ComponentFactory call flow toArray > getBar > getContent > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1149 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('x123');
      logInfo(`step2 getBar("x123"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('mNtInRNHG');
      subject.getContent('xBKm');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1149 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1150
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1150
     * @tc.desc      ComponentFactory call flow toArray > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1150 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('0g9xwFN');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1150 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1151
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1151
     * @tc.desc      ComponentFactory call flow getBar > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1151 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('O6CfKF');
      logInfo(`step1 getBar("O6CfKF"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('zo');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1151 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1152
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1152
     * @tc.desc      ComponentFactory call flow delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1152 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('YRgTMZgh');
      const step2 = subject.getBar('cf3CZgYgp');
      logInfo(`step2 getBar("cf3CZgYgp"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1152 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1153
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1153
     * @tc.desc      ComponentFactory call flow getParams > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1153 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('2d');
      const step2 = subject.getBar(' Sample Title 123 ');
      logInfo(`step2 getBar(" Sample Title 123 "): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getParams('hello world_1');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1153 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1154
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1154
     * @tc.desc      ComponentFactory call flow toArray > getContent > getContent > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1154 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('mm6Fv');
      subject.getContent('3ZPW5');
      subject.delete('FR5gCJGQ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1154 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1155
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1155
     * @tc.desc      ComponentFactory call flow toArray > toArray > getContent > toArray > getContent keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1155 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('Sw7D9');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      subject.getContent('  ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1155 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1156
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1156
     * @tc.desc      ComponentFactory call flow getContent > delete > getBar > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1156 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('1GgCZRUHp');
      subject.delete('bSxeDoYBn');
      const step3 = subject.getBar('2');
      logInfo(`step3 getBar("2"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('upg');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1156 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1157
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1157
     * @tc.desc      ComponentFactory call flow getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1157 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('Si3Bh');
      const step2 = subject.getBar('8MUd8zV');
      logInfo(`step2 getBar("8MUd8zV"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1157 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1158
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1158
     * @tc.desc      ComponentFactory call flow toArray > toArray > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1158 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.getContent('pBJGLVMA');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1158 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1159
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1159
     * @tc.desc      ComponentFactory call flow getContent > delete > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1159 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('AA');
      subject.delete('bq2U');
      subject.getContent('JLyYfj');
      const step4 = subject.getBar('cf3CZgYgp');
      logInfo(`step4 getBar("cf3CZgYgp"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1159 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1160
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1160
     * @tc.desc      ComponentFactory call flow getParams > delete > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1160 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('W');
      subject.delete('iMCpJ1');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1160 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1161
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1161
     * @tc.desc      ComponentFactory call flow getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1161 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('a');
      logInfo(`step1 getBar("a"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.getParams('Hy3dX9N');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1161 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1162
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1162
     * @tc.desc      ComponentFactory call flow toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1162 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('3ZPW5');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1162 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1163
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1163
     * @tc.desc      ComponentFactory call flow getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1163 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('czXc4Bok');
      const step2 = subject.getBar('JyNJ4zExSmt');
      logInfo(`step2 getBar("JyNJ4zExSmt"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1163 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1164
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1164
     * @tc.desc      ComponentFactory call flow delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1164 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('x5bX');
      const step2 = subject.getBar('BA4U');
      logInfo(`step2 getBar("BA4U"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1164 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1165
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1165
     * @tc.desc      ComponentFactory call flow getParams > getContent > getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1165 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('abc_1');
      subject.getContent('TF6Zj');
      subject.getContent('TLzHYlbpE2');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1165 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1166
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1166
     * @tc.desc      ComponentFactory call flow getParams > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1166 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('ggSZnOTRvj9U');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('DDVCz5ydJ6G');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1166 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1167
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1167
     * @tc.desc      ComponentFactory call flow toArray > getBar > toArray > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1167 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('WCEOCcw2E2');
      logInfo(`step2 getBar("WCEOCcw2E2"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('FfIwdN');
      subject.getParams('si4CUr');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1167 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1168
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1168
     * @tc.desc      ComponentFactory call flow getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1168 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('8Uzb2NI');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1168 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1169
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1169
     * @tc.desc      ComponentFactory call flow getContent > getBar > getContent > getParams > getBar keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1169 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('mc');
      const step2 = subject.getBar('YM5A7JRomJP1');
      logInfo(`step2 getBar("YM5A7JRomJP1"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('V06sFwKy');
      subject.getParams('SaZUvlunWF');
      const step5 = subject.getBar('BA4U');
      logInfo(`step5 getBar("BA4U"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1169 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1170
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1170
     * @tc.desc      ComponentFactory call flow delete > delete > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1170 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('0VsvJoEp');
      subject.delete('xHello');
      const step3 = subject.getBar('Hello');
      logInfo(`step3 getBar("Hello"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1170 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1171
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1171
     * @tc.desc      ComponentFactory call flow toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1171 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1171 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1172
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1172
     * @tc.desc      ComponentFactory call flow getParams > toArray > delete > getParams > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1172 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams(' ');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('i7j2g8MMfd');
      subject.getParams('hloKKo4gyX');
      subject.delete('CuTzMjV');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1172 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1173
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1173
     * @tc.desc      ComponentFactory call flow getParams > toArray > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1173 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('HikHof1f');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('ZDKcZO');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1173 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1174
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1174
     * @tc.desc      ComponentFactory call flow getContent > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1174 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('zoYGeOB');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1174 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1175
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1175
     * @tc.desc      ComponentFactory call flow getParams > delete > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1175 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('3A6n');
      subject.delete('2cJ');
      const step3 = subject.getBar('zmnW');
      logInfo(`step3 getBar("zmnW"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1175 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1176
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1176
     * @tc.desc      ComponentFactory call flow getParams > getParams > getBar > getContent > delete keeps state cons...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1176 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('8jk');
      subject.getParams('iYuvcsbi');
      const step3 = subject.getBar('Ov');
      logInfo(`step3 getBar("Ov"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('ECtggVYxqC');
      subject.delete('U32wSwCuAI');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1176 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1177
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1177
     * @tc.desc      ComponentFactory call flow toArray > getParams > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1177 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('PMGOs7Xt');
      subject.getContent('s7CZvpnN5wE0');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1177 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1178
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1178
     * @tc.desc      ComponentFactory call flow toArray > getParams > getBar > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1178 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('ML4Kk6');
      const step3 = subject.getBar('A_1');
      logInfo(`step3 getBar("A_1"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4 = subject.getBar('eLADslckWNfW');
      logInfo(`step4 getBar("eLADslckWNfW"): step4=${step4}`);
      expect(step4).assertUndefined();
      subject.getParams('P5CfiBgO');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1178 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1179
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1179
     * @tc.desc      ComponentFactory call flow toArray > getContent > getBar > getContent > getBar keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1179 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('QjJmW');
      const step3 = subject.getBar('xA');
      logInfo(`step3 getBar("xA"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('Td7IPsx59Z');
      const step5 = subject.getBar('UxuoihOCz');
      logInfo(`step5 getBar("UxuoihOCz"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1179 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1180
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1180
     * @tc.desc      ComponentFactory call flow toArray > getBar > toArray > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1180 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('cy');
      logInfo(`step2 getBar("cy"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.delete('3O7FJ2Sv');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1180 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1181
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1181
     * @tc.desc      ComponentFactory call flow getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1181 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('S');
      const step2 = subject.getBar('mb');
      logInfo(`step2 getBar("mb"): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1181 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1182
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1182
     * @tc.desc      ComponentFactory call flow getParams > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1182 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('wGSFFV');
      subject.getContent('xSample Title 123');
      const step3 = subject.getBar('zBPStDSd46');
      logInfo(`step3 getBar("zBPStDSd46"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1182 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1183
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1183
     * @tc.desc      ComponentFactory call flow getParams > getBar > getContent > getParams > toArray keeps state con...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1183 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('ohKONXqD5');
      const step2 = subject.getBar('vRiQstPt7');
      logInfo(`step2 getBar("vRiQstPt7"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.getContent('ayKozb0tPG');
      subject.getParams('gR1IfSc79');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1183 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1184
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1184
     * @tc.desc      ComponentFactory call flow delete > toArray > toArray > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1184 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('H588SnQLlH');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getParams('PMGOs7Xt');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1184 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1185
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1185
     * @tc.desc      ComponentFactory call flow toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1185 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('xSample Title 123');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1185 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1186
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1186
     * @tc.desc      ComponentFactory call flow getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1186 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('AA');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1186 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1187
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1187
     * @tc.desc      ComponentFactory call flow getBar > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1187 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('GuYN');
      logInfo(`step1 getBar("GuYN"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('whOLzSN');
      logInfo(`step2 getBar("whOLzSN"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1187 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1188
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1188
     * @tc.desc      ComponentFactory call flow toArray > delete > getContent > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1188 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('FR5gCJGQ');
      subject.getContent('EzNIsPj');
      const step4 = subject.getBar('ae0');
      logInfo(`step4 getBar("ae0"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1188 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1189
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1189
     * @tc.desc      ComponentFactory call flow delete > toArray > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1189 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('fsnzJf2Zu');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1189 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1190
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1190
     * @tc.desc      ComponentFactory call flow delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1190 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('d');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1190 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1191
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1191
     * @tc.desc      ComponentFactory call flow toArray > getParams > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1191 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('mTrBYJTHox8');
      const step3 = subject.getBar('a0Zw2D');
      logInfo(`step3 getBar("a0Zw2D"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1191 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1192
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1192
     * @tc.desc      ComponentFactory call flow getParams > getContent > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1192 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('7bf6');
      subject.getContent('0s2nrz3zIDM');
      const step3 = subject.getBar('xSample Title 123');
      logInfo(`step3 getBar("xSample Title 123"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1192 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1193
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1193
     * @tc.desc      ComponentFactory call flow toArray > getContent > getBar > getParams > getContent keeps state co...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1193', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1193 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('EzNIsPj');
      const step3 = subject.getBar('VEn9iepX');
      logInfo(`step3 getBar("VEn9iepX"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('XVP');
      subject.getContent('ao1xPPVqGz');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1193 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1194
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1194
     * @tc.desc      ComponentFactory call flow toArray > getParams > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1194', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1194 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('MXmNvV');
      subject.getContent('gV5');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1194 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1195
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1195
     * @tc.desc      ComponentFactory call flow getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1195', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1195 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar(' A ');
      logInfo(`step1 getBar(" A "): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1195 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1196
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1196
     * @tc.desc      ComponentFactory call flow toArray > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1196', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1196 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('SWLsCaq76HZR');
      logInfo(`step3 getBar("SWLsCaq76HZR"): step3=${step3}`);
      expect(step3).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1196 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1197
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1197
     * @tc.desc      ComponentFactory call flow toArray > delete > getContent > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1197', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1197 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('9jfEVwbUxWSz');
      subject.getContent('ayKozb0tPG');
      subject.getContent('nThV0UM4');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1197 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1198
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1198
     * @tc.desc      ComponentFactory call flow toArray > getParams > getContent > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1198', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1198 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('3');
      subject.getContent('I');
      subject.getParams('\u4e2d\u6587\u4e2d\u6587');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1198 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1199
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1199
     * @tc.desc      ComponentFactory call flow getParams > delete > getBar > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1199', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1199 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('ZEqWn0MffB7');
      subject.delete('sm');
      const step3 = subject.getBar('123123');
      logInfo(`step3 getBar("123123"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('dAMA7s');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1199 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1200
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1200
     * @tc.desc      ComponentFactory call flow toArray > getBar > getBar > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1200 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('NW');
      logInfo(`step2 getBar("NW"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3 = subject.getBar('EdSsHK3Z');
      logInfo(`step3 getBar("EdSsHK3Z"): step3=${step3}`);
      expect(step3).assertUndefined();
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1200 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1201
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1201
     * @tc.desc      ComponentFactory call flow getContent > getParams > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1201 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('6Xzwmv0Kt');
      subject.getParams('VkwV');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1201 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1202
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1202
     * @tc.desc      ComponentFactory call flow getBar > delete > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1202 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('yzvnqAN');
      logInfo(`step1 getBar("yzvnqAN"): step1=${step1}`);
      expect(step1).assertUndefined();
      subject.delete('hello world');
      subject.delete('abc_1');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1202 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1203
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1203
     * @tc.desc      ComponentFactory call flow getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1203 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('U2xjZrluups');
      const step2 = subject.getBar(' Hello World ');
      logInfo(`step2 getBar(" Hello World "): step2=${step2}`);
      expect(step2).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1203 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1204
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1204
     * @tc.desc      ComponentFactory call flow getContent > getBar > toArray > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1204 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('lwaYIV8OC');
      const step2 = subject.getBar('mb');
      logInfo(`step2 getBar("mb"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1204 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1205
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1205
     * @tc.desc      ComponentFactory call flow delete > getBar > delete > getContent > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1205 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.delete('J');
      const step2 = subject.getBar('6Gs7');
      logInfo(`step2 getBar("6Gs7"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('FEDAmRPXge');
      subject.getContent('x\u4e2d\u6587');
      subject.delete('\u4e2d\u6587');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1205 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1206
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1206
     * @tc.desc      ComponentFactory call flow toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1206 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('mkGSzn');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1206 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1207
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1207
     * @tc.desc      ComponentFactory call flow getContent > getContent > getBar > getParams > getContent keeps state...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1207 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('llDFYCi');
      subject.getContent('Si3Bh');
      const step3 = subject.getBar('xSample Title 123');
      logInfo(`step3 getBar("xSample Title 123"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getParams('MO0ZHZa');
      subject.getContent('fT');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1207 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1208
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1208
     * @tc.desc      ComponentFactory call flow toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1208 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.delete('Hello WorldHello World');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1208 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1209
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1209
     * @tc.desc      ComponentFactory call flow getBar > toArray > getBar > delete > getParams keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1209 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('iKcNgHVHejEa');
      logInfo(`step1 getBar("iKcNgHVHejEa"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('mI');
      logInfo(`step3 getBar("mI"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.delete('dtxX86ijO8nY');
      subject.getParams('GKJ');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1209 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1210
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1210
     * @tc.desc      ComponentFactory call flow getParams > getBar > delete > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1210 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('PMGOs7Xt');
      const step2 = subject.getBar('v');
      logInfo(`step2 getBar("v"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('Sgol4pAe');
      const step4: string[] = subject.toArray();
      logInfo(`step4 toArray(): step4.length=${step4.length}`);
      expect(step4.length).assertEqual(0);
      const step5 = subject.getBar('mias4qIIlm');
      logInfo(`step5 getBar("mias4qIIlm"): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1210 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1211
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1211
     * @tc.desc      ComponentFactory call flow getBar > toArray > getBar > getContent > getContent keeps state consi...
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1211 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('XHj0');
      logInfo(`step1 getBar("XHj0"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3 = subject.getBar('hHx1r');
      logInfo(`step3 getBar("hHx1r"): step3=${step3}`);
      expect(step3).assertUndefined();
      subject.getContent('b8vshwWWo68');
      subject.getContent('S1KaTmmeYq6');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1211 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1212
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1212
     * @tc.desc      ComponentFactory call flow toArray > getContent > delete > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1212 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getContent('CrR');
      subject.delete('H588SnQLlH');
      subject.delete('6NbRySY');
      const step5: string[] = subject.toArray();
      logInfo(`step5 toArray(): step5.length=${step5.length}`);
      expect(step5.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1212 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1213
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1213
     * @tc.desc      ComponentFactory call flow toArray > getParams > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1213 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      subject.getParams('Ld');
      subject.delete('8j');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1213 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1214
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1214
     * @tc.desc      ComponentFactory call flow toArray > toArray > delete keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1214 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      subject.delete('6y5vRO');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1214 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1215
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1215
     * @tc.desc      ComponentFactory call flow getContent > toArray > toArray > getContent keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1215 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getContent('c4ZDLC');
      const step2: string[] = subject.toArray();
      logInfo(`step2 toArray(): step2.length=${step2.length}`);
      expect(step2.length).assertEqual(0);
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      subject.getContent('xyc');
      logInfo(`${BUNDLE}ComponentFactoryFlow_1215 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1216
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1216
     * @tc.desc      ComponentFactory call flow toArray > getBar > toArray > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1216 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1: string[] = subject.toArray();
      logInfo(`step1 toArray(): step1.length=${step1.length}`);
      expect(step1.length).assertEqual(0);
      const step2 = subject.getBar('s');
      logInfo(`step2 getBar("s"): step2=${step2}`);
      expect(step2).assertUndefined();
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      const step4 = subject.getBar('O805K7Y');
      logInfo(`step4 getBar("O805K7Y"): step4=${step4}`);
      expect(step4).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1216 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1217
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1217
     * @tc.desc      ComponentFactory call flow getBar > getBar > delete > getParams > getBar keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1217 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      const step1 = subject.getBar('XHj0');
      logInfo(`step1 getBar("XHj0"): step1=${step1}`);
      expect(step1).assertUndefined();
      const step2 = subject.getBar('7cw');
      logInfo(`step2 getBar("7cw"): step2=${step2}`);
      expect(step2).assertUndefined();
      subject.delete('R5hntg');
      subject.getParams('aog');
      const step5 = subject.getBar(' hello world ');
      logInfo(`step5 getBar(" hello world "): step5=${step5}`);
      expect(step5).assertUndefined();
      logInfo(`${BUNDLE}ComponentFactoryFlow_1217 end`);
    });

    /**
     * @tc.number    SUB_CUSTOMANIMATIONTAB_COMPONENT_FACTORY_FLOW_1218
     * @tc.name      CustomAnimationTab_ComponentFactoryFlow_1218
     * @tc.desc      ComponentFactory call flow getParams > delete > toArray keeps state consistent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('CustomAnimationTab_ComponentFactoryFlow_1218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ComponentFactoryFlow_1218 begin`);
      const subject: ComponentFactory = new ComponentFactory();
      subject.getParams('JeOKAGq9C4');
      subject.delete('XxY');
      const step3: string[] = subject.toArray();
      logInfo(`step3 toArray(): step3.length=${step3.length}`);
      expect(step3.length).assertEqual(0);
      logInfo(`${BUNDLE}ComponentFactoryFlow_1218 end`);
    });
  });
}
