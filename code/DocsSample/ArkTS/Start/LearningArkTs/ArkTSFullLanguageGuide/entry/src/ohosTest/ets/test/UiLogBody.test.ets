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

import { describe, it, expect, beforeEach } from '@ohos/hypium';
import {
  PAGE_BASICS, PAGE_FUNCTIONS, PAGE_CLASSES, PAGE_GENERICS, LOG_EMPTY,
  logBegin, logEnd, startApp, lockRecovery, navigate, clickLabel, delay,
  readLogRaw, readLogBody, runButtonCase
} from './ArkTSGuideUiSupport';

const STATIC_TOTAL_PREFIX: string = 'count: 1\ntotalInstances: ';

function totalInstancesOf(body: string): number {
  if (body.indexOf(STATIC_TOTAL_PREFIX) !== 0) {
    return -1;
  }
  return Number(body.substring(STATIC_TOTAL_PREFIX.length));
}

/**
 * 内容页日志文本（点击后）的精确契约。
 */
export default function ArkTSUiLogBodyTest(): void {
  describe('ArkTSUiLogBodyTest', () => {

    beforeEach(async () => {
      const started: boolean = await startApp();
      expect(started).assertTrue();
      await lockRecovery();
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_LOG_testBasicsVariableDeclarationBody0001
     * @tc.name      testBasicsVariableDeclarationBody0001
     * @tc.desc      Verify the Basics variable-declaration click logs the documented multi-line body
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testBasicsVariableDeclarationBody0001', 0, async () => {
      logBegin('testBasicsVariableDeclarationBody0001');
      await runButtonCase(PAGE_BASICS, 0);
      const raw: string = await readLogRaw();
      expect(raw).assertEqual(PAGE_BASICS.bodies[0]);
      expect(readLogBody(raw)).assertEqual('count: 10\nname: ArkTS\nisActive: true\nmessage: Hello, ArkTS');
      expect(raw.indexOf('\n')).assertEqual(9);
      logEnd('testBasicsVariableDeclarationBody0001');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_LOG_testBasicsTypeAnnotationBody0002
     * @tc.name      testBasicsTypeAnnotationBody0002
     * @tc.desc      Verify the Basics type-annotation click logs the reassigned union id
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testBasicsTypeAnnotationBody0002', 0, async () => {
      logBegin('testBasicsTypeAnnotationBody0002');
      await runButtonCase(PAGE_BASICS, 1);
      const body: string = await readLogRaw();
      expect(body).assertEqual(PAGE_BASICS.bodies[1]);
      expect(body.indexOf('id: ABC-123') > 0).assertTrue();
      expect(body.endsWith('ABC-123')).assertTrue();
      logEnd('testBasicsTypeAnnotationBody0002');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_LOG_testBasicsBigIntBody0003
     * @tc.name      testBasicsBigIntBody0003
     * @tc.desc      Verify the Basics BigInt click logs both the 36-digit value and its successor
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testBasicsBigIntBody0003', 0, async () => {
      logBegin('testBasicsBigIntBody0003');
      await runButtonCase(PAGE_BASICS, 2);
      const body: string = await readLogRaw();
      expect(body).assertEqual(PAGE_BASICS.bodies[2]);
      expect(body.indexOf('999999999999999999999999999999999999')).assertEqual(10);
      expect(body.split('\n').length).assertEqual(2);
      logEnd('testBasicsBigIntBody0003');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_LOG_testBasicsNullSafetyBody0004
     * @tc.name      testBasicsNullSafetyBody0004
     * @tc.desc      Verify the Basics null-safety click logs length 5 and the default fallback
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testBasicsNullSafetyBody0004', 0, async () => {
      logBegin('testBasicsNullSafetyBody0004');
      await runButtonCase(PAGE_BASICS, 3);
      const body: string = await readLogRaw();
      expect(body).assertEqual(PAGE_BASICS.bodies[3]);
      expect(body.indexOf('length: 5') > 0).assertTrue();
      expect(body.endsWith('display: default')).assertTrue();
      logEnd('testBasicsNullSafetyBody0004');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_LOG_testFunctionsDeclarationBody0005
     * @tc.name      testFunctionsDeclarationBody0005
     * @tc.desc      Verify the Functions declaration click logs add and multiply results
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testFunctionsDeclarationBody0005', 0, async () => {
      logBegin('testFunctionsDeclarationBody0005');
      await runButtonCase(PAGE_FUNCTIONS, 0);
      const body: string = await readLogRaw();
      expect(body).assertEqual('add(1, 2): 3\nmultiply(5, 3): 15');
      expect(body.startsWith('add(1, 2): 3')).assertTrue();
      expect(body.endsWith('15')).assertTrue();
      logEnd('testFunctionsDeclarationBody0005');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_LOG_testFunctionsOptionalParametersBody0006
     * @tc.name      testFunctionsOptionalParametersBody0006
     * @tc.desc      Verify the Functions optional-parameter click logs both call variants
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testFunctionsOptionalParametersBody0006', 0, async () => {
      logBegin('testFunctionsOptionalParametersBody0006');
      await runButtonCase(PAGE_FUNCTIONS, 1);
      const body: string = await readLogRaw();
      expect(body).assertEqual('greet(Alice): Hello, Alice\ngreet(Alice, Dr.): Hello, Dr. Alice');
      expect(body.split('\n').length).assertEqual(2);
      expect(body.indexOf('Dr. Alice') > 0).assertTrue();
      logEnd('testFunctionsOptionalParametersBody0006');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_LOG_testFunctionsClosureBody0008
     * @tc.name      testFunctionsClosureBody0008
     * @tc.desc      Verify the Functions closure click logs an incrementing counter 1 then 2
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testFunctionsClosureBody0008', 0, async () => {
      logBegin('testFunctionsClosureBody0008');
      await runButtonCase(PAGE_FUNCTIONS, 3);
      const body: string = await readLogRaw();
      expect(body).assertEqual('counter(): 1\ncounter(): 2');
      expect(body.indexOf('counter(): 1')).assertEqual(0);
      expect(body.endsWith('counter(): 2')).assertTrue();
      logEnd('testFunctionsClosureBody0008');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_LOG_testClassesDefinitionBody0009
     * @tc.name      testClassesDefinitionBody0009
     * @tc.desc      Verify the Classes definition click logs the constructed user fields
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testClassesDefinitionBody0009', 0, async () => {
      logBegin('testClassesDefinitionBody0009');
      await runButtonCase(PAGE_CLASSES, 0);
      const body: string = await readLogRaw();
      expect(body).assertEqual(PAGE_CLASSES.bodies[0]);
      expect(body.indexOf('age: 25') > 0).assertTrue();
      expect(body.split('\n').length).assertEqual(3);
      logEnd('testClassesDefinitionBody0009');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_LOG_testClassesStaticPropertiesBody0010
     * @tc.name      testClassesStaticPropertiesBody0010
     * @tc.desc      Verify the Classes static click logs instance count 1 and a positive totalInstances
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testClassesStaticPropertiesBody0010', 0, async () => {
      logBegin('testClassesStaticPropertiesBody0010');
      await runButtonCase(PAGE_CLASSES, 1);
      const raw: string = await readLogRaw();
      const body: string = readLogBody(raw);
      const total: number = totalInstancesOf(body);
      expect(body.startsWith(STATIC_TOTAL_PREFIX)).assertTrue();
      expect(total >= 1).assertTrue();
      expect(Number.isInteger(total)).assertTrue();
      logEnd('testClassesStaticPropertiesBody0010');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_LOG_testClassesStaticPropertiesIncrements0011
     * @tc.name      testClassesStaticPropertiesIncrements0011
     * @tc.desc      Verify totalInstances grows by exactly one on each static-property click
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testClassesStaticPropertiesIncrements0011', 0, async () => {
      logBegin('testClassesStaticPropertiesIncrements0011');
      await runButtonCase(PAGE_CLASSES, 1);
      const first: number = totalInstancesOf(readLogBody(await readLogRaw()));
      await clickLabel(PAGE_CLASSES.buttons[1]);
      await delay(200);
      const second: number = totalInstancesOf(readLogBody(await readLogRaw()));
      expect(first > 0).assertTrue();
      expect(second - first).assertEqual(1);
      expect(first).assertEqual(second - 1);
      logEnd('testClassesStaticPropertiesIncrements0011');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_LOG_testClassesGetterSetterBody0012
     * @tc.name      testClassesGetterSetterBody0012
     * @tc.desc      Verify the Classes getter/setter click logs the radius value 5
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testClassesGetterSetterBody0012', 0, async () => {
      logBegin('testClassesGetterSetterBody0012');
      await runButtonCase(PAGE_CLASSES, 2);
      const body: string = await readLogRaw();
      expect(body).assertEqual('radius: 5');
      expect(body.length).assertEqual(9);
      expect(body.indexOf('5')).assertEqual(8);
      logEnd('testClassesGetterSetterBody0012');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_LOG_testClassesInheritanceBody0013
     * @tc.name      testClassesInheritanceBody0013
     * @tc.desc      Verify the Classes inheritance click logs name, breed and overridden speak
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testClassesInheritanceBody0013', 0, async () => {
      logBegin('testClassesInheritanceBody0013');
      await runButtonCase(PAGE_CLASSES, 3);
      const body: string = await readLogRaw();
      expect(body).assertEqual(PAGE_CLASSES.bodies[3]);
      expect(body.indexOf('breed: Labrador') > 0).assertTrue();
      expect(body.endsWith('speak: Max barks')).assertTrue();
      logEnd('testClassesInheritanceBody0013');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_LOG_testGenericsIntroductionBody0014
     * @tc.name      testGenericsIntroductionBody0014
     * @tc.desc      Verify the Generics introduction click logs three identity instantiations
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testGenericsIntroductionBody0014', 0, async () => {
      logBegin('testGenericsIntroductionBody0014');
      await runButtonCase(PAGE_GENERICS, 0);
      const body: string = await readLogRaw();
      expect(body).assertEqual(PAGE_GENERICS.bodies[0]);
      expect(body.split('\n').length).assertEqual(3);
      expect(body.indexOf('identity<boolean>(true): true') > 0).assertTrue();
      logEnd('testGenericsIntroductionBody0014');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_LOG_testGenericsClassBody0015
     * @tc.name      testGenericsClassBody0015
     * @tc.desc      Verify the Generics class click logs stack pop and container value
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testGenericsClassBody0015', 0, async () => {
      logBegin('testGenericsClassBody0015');
      await runButtonCase(PAGE_GENERICS, 1);
      const body: string = await readLogRaw();
      expect(body).assertEqual('Stack.pop(): 2\nContainer.getValue(): World');
      expect(body.indexOf('2') > 0).assertTrue();
      expect(body.endsWith('World')).assertTrue();
      logEnd('testGenericsClassBody0015');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_LOG_testGenericsFunctionBody0016
     * @tc.name      testGenericsFunctionBody0016
     * @tc.desc      Verify the Generics function click logs wrapped number and string first elements
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testGenericsFunctionBody0016', 0, async () => {
      logBegin('testGenericsFunctionBody0016');
      await runButtonCase(PAGE_GENERICS, 2);
      const body: string = await readLogRaw();
      expect(body).assertEqual('wrap<number>(42)[0]: 42\nwrap<string>(Hello)[0]: Hello');
      expect(body.split('\n').length).assertEqual(2);
      expect(body.startsWith('wrap<number>(42)[0]: 42')).assertTrue();
      logEnd('testGenericsFunctionBody0016');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_LOG_testGenericsConstraintBody0017
     * @tc.name      testGenericsConstraintBody0017
     * @tc.desc      Verify the Generics constraint click logs the entity name found by id
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL0
     */
    it('testGenericsConstraintBody0017', 0, async () => {
      logBegin('testGenericsConstraintBody0017');
      await runButtonCase(PAGE_GENERICS, 3);
      const body: string = await readLogRaw();
      expect(body).assertEqual('findById(1).name: Alice');
      expect(body.endsWith(': Alice')).assertTrue();
      expect(body.length).assertEqual(23);
      logEnd('testGenericsConstraintBody0017');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_LOG_testLogBodyNeverKeepsPrefix0018
     * @tc.name      testLogBodyNeverKeepsPrefix0018
     * @tc.desc      Verify the logged text never exposes the timestamp/level prefix to the body reader
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL1
     */
    it('testLogBodyNeverKeepsPrefix0018', 0, async () => {
      logBegin('testLogBodyNeverKeepsPrefix0018');
      await runButtonCase(PAGE_FUNCTIONS, 0);
      const raw: string = await readLogRaw();
      const body: string = readLogBody(raw);
      expect(raw === body).assertTrue();
      expect(raw.indexOf('[INFO]')).assertEqual(-1);
      expect(raw.indexOf('[')).assertEqual(-1);
      logEnd('testLogBodyNeverKeepsPrefix0018');
    });

    /**
     * @tc.number    SUB_ARKTS_GUIDE_UI_LOG_testBodiesAcrossPagesDoNotLeak0019
     * @tc.name      testBodiesAcrossPagesDoNotLeak0019
     * @tc.desc      Verify a body logged on one page is not displayed after navigating to another page
     * @tc.type      Function
     * @tc.size      MediumTest
     * @tc.level     LEVEL2
     */
    it('testBodiesAcrossPagesDoNotLeak0019', 0, async () => {
      logBegin('testBodiesAcrossPagesDoNotLeak0019');
      await runButtonCase(PAGE_BASICS, 3);
      expect(await readLogRaw()).assertEqual(PAGE_BASICS.bodies[3]);
      expect(await navigate(PAGE_GENERICS)).assertTrue();
      const fresh: string = await readLogRaw();
      expect(fresh === PAGE_BASICS.bodies[3]).assertFalse();
      expect(fresh).assertEqual('暂无日志信息');
      logEnd('testBodiesAcrossPagesDoNotLeak0019');
    });

  });
}
