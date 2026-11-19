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
import { templateSqlOf } from './model/FormExtLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FormExtAbility]';
const BUNDLE: string = 'FormExtAbility_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for templateSqlOf (77 cases). */
export default function templateSqlOfTest(): void {
  describe('TemplateSqlOfTest', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0001
     * @tc.name      FormExtAbility_TemplateSqlOf_0001
     * @tc.desc      templateSqlOf(subscriberId="") returns "yName from TBL00 where cityId = "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_TemplateSqlOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0001 begin`);
      const actual: string = templateSqlOf('');
      logInfo(`templateSqlOf(subscriberId=""): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(90);
      logInfo(`templateSqlOf(subscriberId=""): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId=""): actual.substring(58)=${actual.substring(58)}`);
      expect(actual.substring(58)).assertEqual('yName from TBL00 where cityId = ');
      logInfo(`${BUNDLE}TemplateSqlOf_0001 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0002
     * @tc.name      FormExtAbility_TemplateSqlOf_0002
     * @tc.desc      templateSqlOf(subscriberId="a") returns "Name from TBL00 where cityId = a"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_TemplateSqlOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0002 begin`);
      const actual: string = templateSqlOf('a');
      logInfo(`templateSqlOf(subscriberId="a"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(91);
      logInfo(`templateSqlOf(subscriberId="a"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="a"): actual.substring(59)=${actual.substring(59)}`);
      expect(actual.substring(59)).assertEqual('Name from TBL00 where cityId = a');
      logInfo(`${BUNDLE}TemplateSqlOf_0002 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0003
     * @tc.name      FormExtAbility_TemplateSqlOf_0003
     * @tc.desc      templateSqlOf(subscriberId="abc") returns "me from TBL00 where cityId = abc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0003 begin`);
      const actual: string = templateSqlOf('abc');
      logInfo(`templateSqlOf(subscriberId="abc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(93);
      logInfo(`templateSqlOf(subscriberId="abc"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="abc"): actual.substring(61)=${actual.substring(61)}`);
      expect(actual.substring(61)).assertEqual('me from TBL00 where cityId = abc');
      logInfo(`${BUNDLE}TemplateSqlOf_0003 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0004
     * @tc.name      FormExtAbility_TemplateSqlOf_0004
     * @tc.desc      templateSqlOf(subscriberId="Hello World") returns "TBL00 where cityId = Hello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0004 begin`);
      const actual: string = templateSqlOf('Hello World');
      logInfo(`templateSqlOf(subscriberId="Hello World"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`templateSqlOf(subscriberId="Hello World"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="Hello World"): actual.substring(69)=${actual.substring(69)}`);
      expect(actual.substring(69)).assertEqual('TBL00 where cityId = Hello World');
      logInfo(`${BUNDLE}TemplateSqlOf_0004 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0005
     * @tc.name      FormExtAbility_TemplateSqlOf_0005
     * @tc.desc      templateSqlOf(subscriberId=" ") returns "Name from TBL00 where cityId =  "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0005 begin`);
      const actual: string = templateSqlOf(' ');
      logInfo(`templateSqlOf(subscriberId=" "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(91);
      logInfo(`templateSqlOf(subscriberId=" "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId=" "): actual.substring(59)=${actual.substring(59)}`);
      expect(actual.substring(59)).assertEqual('Name from TBL00 where cityId =  ');
      logInfo(`${BUNDLE}TemplateSqlOf_0005 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0006
     * @tc.name      FormExtAbility_TemplateSqlOf_0006
     * @tc.desc      templateSqlOf(subscriberId="123") returns "me from TBL00 where cityId = 123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0006 begin`);
      const actual: string = templateSqlOf('123');
      logInfo(`templateSqlOf(subscriberId="123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(93);
      logInfo(`templateSqlOf(subscriberId="123"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="123"): actual.substring(61)=${actual.substring(61)}`);
      expect(actual.substring(61)).assertEqual('me from TBL00 where cityId = 123');
      logInfo(`${BUNDLE}TemplateSqlOf_0006 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0007
     * @tc.name      FormExtAbility_TemplateSqlOf_0007
     * @tc.desc      templateSqlOf(subscriberId=" a ") returns "me from TBL00 where cityId =  a "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemplateSqlOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0007 begin`);
      const actual: string = templateSqlOf(' a ');
      logInfo(`templateSqlOf(subscriberId=" a "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(93);
      logInfo(`templateSqlOf(subscriberId=" a "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId=" a "): actual.substring(61)=${actual.substring(61)}`);
      expect(actual.substring(61)).assertEqual('me from TBL00 where cityId =  a ');
      logInfo(`${BUNDLE}TemplateSqlOf_0007 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0008
     * @tc.name      FormExtAbility_TemplateSqlOf_0008
     * @tc.desc      templateSqlOf(subscriberId="aa") returns "ame from TBL00 where cityId = aa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0008 begin`);
      const actual: string = templateSqlOf('aa');
      logInfo(`templateSqlOf(subscriberId="aa"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(92);
      logInfo(`templateSqlOf(subscriberId="aa"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="aa"): actual.substring(60)=${actual.substring(60)}`);
      expect(actual.substring(60)).assertEqual('ame from TBL00 where cityId = aa');
      logInfo(`${BUNDLE}TemplateSqlOf_0008 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0009
     * @tc.name      FormExtAbility_TemplateSqlOf_0009
     * @tc.desc      templateSqlOf(subscriberId="a_1") returns "me from TBL00 where cityId = a_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0009 begin`);
      const actual: string = templateSqlOf('a_1');
      logInfo(`templateSqlOf(subscriberId="a_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(93);
      logInfo(`templateSqlOf(subscriberId="a_1"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="a_1"): actual.substring(61)=${actual.substring(61)}`);
      expect(actual.substring(61)).assertEqual('me from TBL00 where cityId = a_1');
      logInfo(`${BUNDLE}TemplateSqlOf_0009 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0010
     * @tc.name      FormExtAbility_TemplateSqlOf_0010
     * @tc.desc      templateSqlOf(subscriberId="xa") returns "ame from TBL00 where cityId = xa"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemplateSqlOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0010 begin`);
      const actual: string = templateSqlOf('xa');
      logInfo(`templateSqlOf(subscriberId="xa"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(92);
      logInfo(`templateSqlOf(subscriberId="xa"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="xa"): actual.substring(60)=${actual.substring(60)}`);
      expect(actual.substring(60)).assertEqual('ame from TBL00 where cityId = xa');
      logInfo(`${BUNDLE}TemplateSqlOf_0010 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0011
     * @tc.name      FormExtAbility_TemplateSqlOf_0011
     * @tc.desc      templateSqlOf(subscriberId=" abc ") returns " from TBL00 where cityId =  abc "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemplateSqlOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0011 begin`);
      const actual: string = templateSqlOf(' abc ');
      logInfo(`templateSqlOf(subscriberId=" abc "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(95);
      logInfo(`templateSqlOf(subscriberId=" abc "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId=" abc "): actual.substring(63)=${actual.substring(63)}`);
      expect(actual.substring(63)).assertEqual(' from TBL00 where cityId =  abc ');
      logInfo(`${BUNDLE}TemplateSqlOf_0011 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0012
     * @tc.name      FormExtAbility_TemplateSqlOf_0012
     * @tc.desc      templateSqlOf(subscriberId="abcabc") returns "from TBL00 where cityId = abcabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0012 begin`);
      const actual: string = templateSqlOf('abcabc');
      logInfo(`templateSqlOf(subscriberId="abcabc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(96);
      logInfo(`templateSqlOf(subscriberId="abcabc"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="abcabc"): actual.substring(64)=${actual.substring(64)}`);
      expect(actual.substring(64)).assertEqual('from TBL00 where cityId = abcabc');
      logInfo(`${BUNDLE}TemplateSqlOf_0012 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0013
     * @tc.name      FormExtAbility_TemplateSqlOf_0013
     * @tc.desc      templateSqlOf(subscriberId="abc_1") returns " from TBL00 where cityId = abc_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0013 begin`);
      const actual: string = templateSqlOf('abc_1');
      logInfo(`templateSqlOf(subscriberId="abc_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(95);
      logInfo(`templateSqlOf(subscriberId="abc_1"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="abc_1"): actual.substring(63)=${actual.substring(63)}`);
      expect(actual.substring(63)).assertEqual(' from TBL00 where cityId = abc_1');
      logInfo(`${BUNDLE}TemplateSqlOf_0013 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0014
     * @tc.name      FormExtAbility_TemplateSqlOf_0014
     * @tc.desc      templateSqlOf(subscriberId="xabc") returns "e from TBL00 where cityId = xabc"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemplateSqlOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0014 begin`);
      const actual: string = templateSqlOf('xabc');
      logInfo(`templateSqlOf(subscriberId="xabc"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(94);
      logInfo(`templateSqlOf(subscriberId="xabc"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="xabc"): actual.substring(62)=${actual.substring(62)}`);
      expect(actual.substring(62)).assertEqual('e from TBL00 where cityId = xabc');
      logInfo(`${BUNDLE}TemplateSqlOf_0014 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0015
     * @tc.name      FormExtAbility_TemplateSqlOf_0015
     * @tc.desc      templateSqlOf(subscriberId=" Hello World ") returns "L00 where cityId =  Hello World "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemplateSqlOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0015 begin`);
      const actual: string = templateSqlOf(' Hello World ');
      logInfo(`templateSqlOf(subscriberId=" Hello World "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(103);
      logInfo(`templateSqlOf(subscriberId=" Hello World "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId=" Hello World "): actual.substring(71)=${actual.substring(71)}`);
      expect(actual.substring(71)).assertEqual('L00 where cityId =  Hello World ');
      logInfo(`${BUNDLE}TemplateSqlOf_0015 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0016
     * @tc.name      FormExtAbility_TemplateSqlOf_0016
     * @tc.desc      templateSqlOf(subscriberId="Hello WorldHello World") returns " cityId = Hello WorldHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0016 begin`);
      const actual: string = templateSqlOf('Hello WorldHello World');
      logInfo(`templateSqlOf(subscriberId="Hello WorldHe...: actual.length=${actual.length}`);
      expect(actual.length).assertEqual(112);
      logInfo(`templateSqlOf(subscriberId="Hello WorldHe...: actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="Hello WorldHe...: actual.substring(80)=${actual.substring(80)}`);
      expect(actual.substring(80)).assertEqual(' cityId = Hello WorldHello World');
      logInfo(`${BUNDLE}TemplateSqlOf_0016 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0017
     * @tc.name      FormExtAbility_TemplateSqlOf_0017
     * @tc.desc      templateSqlOf(subscriberId="Hello World_1") returns "L00 where cityId = Hello World_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0017 begin`);
      const actual: string = templateSqlOf('Hello World_1');
      logInfo(`templateSqlOf(subscriberId="Hello World_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(103);
      logInfo(`templateSqlOf(subscriberId="Hello World_1"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="Hello World_1"): actual.substring(71)=${actual.substring(71)}`);
      expect(actual.substring(71)).assertEqual('L00 where cityId = Hello World_1');
      logInfo(`${BUNDLE}TemplateSqlOf_0017 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0018
     * @tc.name      FormExtAbility_TemplateSqlOf_0018
     * @tc.desc      templateSqlOf(subscriberId="xHello World") returns "BL00 where cityId = xHello World"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemplateSqlOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0018 begin`);
      const actual: string = templateSqlOf('xHello World');
      logInfo(`templateSqlOf(subscriberId="xHello World"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(102);
      logInfo(`templateSqlOf(subscriberId="xHello World"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="xHello World"): actual.substring(70)=${actual.substring(70)}`);
      expect(actual.substring(70)).assertEqual('BL00 where cityId = xHello World');
      logInfo(`${BUNDLE}TemplateSqlOf_0018 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0019
     * @tc.name      FormExtAbility_TemplateSqlOf_0019
     * @tc.desc      templateSqlOf(subscriberId="   ") returns "me from TBL00 where cityId =    "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemplateSqlOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0019 begin`);
      const actual: string = templateSqlOf('   ');
      logInfo(`templateSqlOf(subscriberId="   "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(93);
      logInfo(`templateSqlOf(subscriberId="   "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="   "): actual.substring(61)=${actual.substring(61)}`);
      expect(actual.substring(61)).assertEqual('me from TBL00 where cityId =    ');
      logInfo(`${BUNDLE}TemplateSqlOf_0019 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0020
     * @tc.name      FormExtAbility_TemplateSqlOf_0020
     * @tc.desc      templateSqlOf(subscriberId="  ") returns "ame from TBL00 where cityId =   "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0020 begin`);
      const actual: string = templateSqlOf('  ');
      logInfo(`templateSqlOf(subscriberId="  "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(92);
      logInfo(`templateSqlOf(subscriberId="  "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="  "): actual.substring(60)=${actual.substring(60)}`);
      expect(actual.substring(60)).assertEqual('ame from TBL00 where cityId =   ');
      logInfo(`${BUNDLE}TemplateSqlOf_0020 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0021
     * @tc.name      FormExtAbility_TemplateSqlOf_0021
     * @tc.desc      templateSqlOf(subscriberId=" _1") returns "me from TBL00 where cityId =  _1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0021 begin`);
      const actual: string = templateSqlOf(' _1');
      logInfo(`templateSqlOf(subscriberId=" _1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(93);
      logInfo(`templateSqlOf(subscriberId=" _1"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId=" _1"): actual.substring(61)=${actual.substring(61)}`);
      expect(actual.substring(61)).assertEqual('me from TBL00 where cityId =  _1');
      logInfo(`${BUNDLE}TemplateSqlOf_0021 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0022
     * @tc.name      FormExtAbility_TemplateSqlOf_0022
     * @tc.desc      templateSqlOf(subscriberId="x ") returns "ame from TBL00 where cityId = x "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemplateSqlOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0022 begin`);
      const actual: string = templateSqlOf('x ');
      logInfo(`templateSqlOf(subscriberId="x "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(92);
      logInfo(`templateSqlOf(subscriberId="x "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="x "): actual.substring(60)=${actual.substring(60)}`);
      expect(actual.substring(60)).assertEqual('ame from TBL00 where cityId = x ');
      logInfo(`${BUNDLE}TemplateSqlOf_0022 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0023
     * @tc.name      FormExtAbility_TemplateSqlOf_0023
     * @tc.desc      templateSqlOf(subscriberId=" 123 ") returns " from TBL00 where cityId =  123 "
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemplateSqlOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0023 begin`);
      const actual: string = templateSqlOf(' 123 ');
      logInfo(`templateSqlOf(subscriberId=" 123 "): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(95);
      logInfo(`templateSqlOf(subscriberId=" 123 "): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId=" 123 "): actual.substring(63)=${actual.substring(63)}`);
      expect(actual.substring(63)).assertEqual(' from TBL00 where cityId =  123 ');
      logInfo(`${BUNDLE}TemplateSqlOf_0023 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0024
     * @tc.name      FormExtAbility_TemplateSqlOf_0024
     * @tc.desc      templateSqlOf(subscriberId="123123") returns "from TBL00 where cityId = 123123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0024 begin`);
      const actual: string = templateSqlOf('123123');
      logInfo(`templateSqlOf(subscriberId="123123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(96);
      logInfo(`templateSqlOf(subscriberId="123123"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="123123"): actual.substring(64)=${actual.substring(64)}`);
      expect(actual.substring(64)).assertEqual('from TBL00 where cityId = 123123');
      logInfo(`${BUNDLE}TemplateSqlOf_0024 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0025
     * @tc.name      FormExtAbility_TemplateSqlOf_0025
     * @tc.desc      templateSqlOf(subscriberId="123_1") returns " from TBL00 where cityId = 123_1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0025 begin`);
      const actual: string = templateSqlOf('123_1');
      logInfo(`templateSqlOf(subscriberId="123_1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(95);
      logInfo(`templateSqlOf(subscriberId="123_1"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="123_1"): actual.substring(63)=${actual.substring(63)}`);
      expect(actual.substring(63)).assertEqual(' from TBL00 where cityId = 123_1');
      logInfo(`${BUNDLE}TemplateSqlOf_0025 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0026
     * @tc.name      FormExtAbility_TemplateSqlOf_0026
     * @tc.desc      templateSqlOf(subscriberId="x123") returns "e from TBL00 where cityId = x123"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemplateSqlOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0026 begin`);
      const actual: string = templateSqlOf('x123');
      logInfo(`templateSqlOf(subscriberId="x123"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(94);
      logInfo(`templateSqlOf(subscriberId="x123"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="x123"): actual.substring(62)=${actual.substring(62)}`);
      expect(actual.substring(62)).assertEqual('e from TBL00 where cityId = x123');
      logInfo(`${BUNDLE}TemplateSqlOf_0026 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0027
     * @tc.name      FormExtAbility_TemplateSqlOf_0027
     * @tc.desc      templateSqlOf(subscriberId="7AHirXj") returns "rom TBL00 where cityId = 7AHirXj"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0027 begin`);
      const actual: string = templateSqlOf('7AHirXj');
      logInfo(`templateSqlOf(subscriberId="7AHirXj"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(97);
      logInfo(`templateSqlOf(subscriberId="7AHirXj"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="7AHirXj"): actual.substring(65)=${actual.substring(65)}`);
      expect(actual.substring(65)).assertEqual('rom TBL00 where cityId = 7AHirXj');
      logInfo(`${BUNDLE}TemplateSqlOf_0027 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0028
     * @tc.name      FormExtAbility_TemplateSqlOf_0028
     * @tc.desc      templateSqlOf(subscriberId="b9T8rGZKNx") returns " TBL00 where cityId = b9T8rGZKNx"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0028 begin`);
      const actual: string = templateSqlOf('b9T8rGZKNx');
      logInfo(`templateSqlOf(subscriberId="b9T8rGZKNx"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(100);
      logInfo(`templateSqlOf(subscriberId="b9T8rGZKNx"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="b9T8rGZKNx"): actual.substring(68)=${actual.substring(68)}`);
      expect(actual.substring(68)).assertEqual(' TBL00 where cityId = b9T8rGZKNx');
      logInfo(`${BUNDLE}TemplateSqlOf_0028 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0029
     * @tc.name      FormExtAbility_TemplateSqlOf_0029
     * @tc.desc      templateSqlOf(subscriberId="n4sP") returns "e from TBL00 where cityId = n4sP"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0029 begin`);
      const actual: string = templateSqlOf('n4sP');
      logInfo(`templateSqlOf(subscriberId="n4sP"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(94);
      logInfo(`templateSqlOf(subscriberId="n4sP"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="n4sP"): actual.substring(62)=${actual.substring(62)}`);
      expect(actual.substring(62)).assertEqual('e from TBL00 where cityId = n4sP');
      logInfo(`${BUNDLE}TemplateSqlOf_0029 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0030
     * @tc.name      FormExtAbility_TemplateSqlOf_0030
     * @tc.desc      templateSqlOf(subscriberId="noJSK") returns " from TBL00 where cityId = noJSK"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0030 begin`);
      const actual: string = templateSqlOf('noJSK');
      logInfo(`templateSqlOf(subscriberId="noJSK"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(95);
      logInfo(`templateSqlOf(subscriberId="noJSK"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="noJSK"): actual.substring(63)=${actual.substring(63)}`);
      expect(actual.substring(63)).assertEqual(' from TBL00 where cityId = noJSK');
      logInfo(`${BUNDLE}TemplateSqlOf_0030 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0031
     * @tc.name      FormExtAbility_TemplateSqlOf_0031
     * @tc.desc      templateSqlOf(subscriberId="nGRbIRojQgS") returns "TBL00 where cityId = nGRbIRojQgS"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0031 begin`);
      const actual: string = templateSqlOf('nGRbIRojQgS');
      logInfo(`templateSqlOf(subscriberId="nGRbIRojQgS"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`templateSqlOf(subscriberId="nGRbIRojQgS"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="nGRbIRojQgS"): actual.substring(69)=${actual.substring(69)}`);
      expect(actual.substring(69)).assertEqual('TBL00 where cityId = nGRbIRojQgS');
      logInfo(`${BUNDLE}TemplateSqlOf_0031 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0032
     * @tc.name      FormExtAbility_TemplateSqlOf_0032
     * @tc.desc      templateSqlOf(subscriberId="u2UVHf") returns "from TBL00 where cityId = u2UVHf"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0032 begin`);
      const actual: string = templateSqlOf('u2UVHf');
      logInfo(`templateSqlOf(subscriberId="u2UVHf"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(96);
      logInfo(`templateSqlOf(subscriberId="u2UVHf"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="u2UVHf"): actual.substring(64)=${actual.substring(64)}`);
      expect(actual.substring(64)).assertEqual('from TBL00 where cityId = u2UVHf');
      logInfo(`${BUNDLE}TemplateSqlOf_0032 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0033
     * @tc.name      FormExtAbility_TemplateSqlOf_0033
     * @tc.desc      templateSqlOf(subscriberId="i") returns "Name from TBL00 where cityId = i"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0033 begin`);
      const actual: string = templateSqlOf('i');
      logInfo(`templateSqlOf(subscriberId="i"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(91);
      logInfo(`templateSqlOf(subscriberId="i"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="i"): actual.substring(59)=${actual.substring(59)}`);
      expect(actual.substring(59)).assertEqual('Name from TBL00 where cityId = i');
      logInfo(`${BUNDLE}TemplateSqlOf_0033 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0034
     * @tc.name      FormExtAbility_TemplateSqlOf_0034
     * @tc.desc      templateSqlOf(subscriberId="vAqc4v") returns "from TBL00 where cityId = vAqc4v"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0034 begin`);
      const actual: string = templateSqlOf('vAqc4v');
      logInfo(`templateSqlOf(subscriberId="vAqc4v"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(96);
      logInfo(`templateSqlOf(subscriberId="vAqc4v"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="vAqc4v"): actual.substring(64)=${actual.substring(64)}`);
      expect(actual.substring(64)).assertEqual('from TBL00 where cityId = vAqc4v');
      logInfo(`${BUNDLE}TemplateSqlOf_0034 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0035
     * @tc.name      FormExtAbility_TemplateSqlOf_0035
     * @tc.desc      templateSqlOf(subscriberId="grob41b") returns "rom TBL00 where cityId = grob41b"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0035 begin`);
      const actual: string = templateSqlOf('grob41b');
      logInfo(`templateSqlOf(subscriberId="grob41b"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(97);
      logInfo(`templateSqlOf(subscriberId="grob41b"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="grob41b"): actual.substring(65)=${actual.substring(65)}`);
      expect(actual.substring(65)).assertEqual('rom TBL00 where cityId = grob41b');
      logInfo(`${BUNDLE}TemplateSqlOf_0035 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0036
     * @tc.name      FormExtAbility_TemplateSqlOf_0036
     * @tc.desc      templateSqlOf(subscriberId="z7e1fz") returns "from TBL00 where cityId = z7e1fz"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0036 begin`);
      const actual: string = templateSqlOf('z7e1fz');
      logInfo(`templateSqlOf(subscriberId="z7e1fz"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(96);
      logInfo(`templateSqlOf(subscriberId="z7e1fz"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="z7e1fz"): actual.substring(64)=${actual.substring(64)}`);
      expect(actual.substring(64)).assertEqual('from TBL00 where cityId = z7e1fz');
      logInfo(`${BUNDLE}TemplateSqlOf_0036 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0037
     * @tc.name      FormExtAbility_TemplateSqlOf_0037
     * @tc.desc      templateSqlOf(subscriberId="ijEmlR") returns "from TBL00 where cityId = ijEmlR"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0037 begin`);
      const actual: string = templateSqlOf('ijEmlR');
      logInfo(`templateSqlOf(subscriberId="ijEmlR"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(96);
      logInfo(`templateSqlOf(subscriberId="ijEmlR"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="ijEmlR"): actual.substring(64)=${actual.substring(64)}`);
      expect(actual.substring(64)).assertEqual('from TBL00 where cityId = ijEmlR');
      logInfo(`${BUNDLE}TemplateSqlOf_0037 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0038
     * @tc.name      FormExtAbility_TemplateSqlOf_0038
     * @tc.desc      templateSqlOf(subscriberId="P") returns "Name from TBL00 where cityId = P"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0038 begin`);
      const actual: string = templateSqlOf('P');
      logInfo(`templateSqlOf(subscriberId="P"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(91);
      logInfo(`templateSqlOf(subscriberId="P"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="P"): actual.substring(59)=${actual.substring(59)}`);
      expect(actual.substring(59)).assertEqual('Name from TBL00 where cityId = P');
      logInfo(`${BUNDLE}TemplateSqlOf_0038 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0039
     * @tc.name      FormExtAbility_TemplateSqlOf_0039
     * @tc.desc      templateSqlOf(subscriberId="0nvOKvkKye") returns " TBL00 where cityId = 0nvOKvkKye"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0039 begin`);
      const actual: string = templateSqlOf('0nvOKvkKye');
      logInfo(`templateSqlOf(subscriberId="0nvOKvkKye"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(100);
      logInfo(`templateSqlOf(subscriberId="0nvOKvkKye"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="0nvOKvkKye"): actual.substring(68)=${actual.substring(68)}`);
      expect(actual.substring(68)).assertEqual(' TBL00 where cityId = 0nvOKvkKye');
      logInfo(`${BUNDLE}TemplateSqlOf_0039 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0040
     * @tc.name      FormExtAbility_TemplateSqlOf_0040
     * @tc.desc      templateSqlOf(subscriberId="O") returns "Name from TBL00 where cityId = O"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0040 begin`);
      const actual: string = templateSqlOf('O');
      logInfo(`templateSqlOf(subscriberId="O"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(91);
      logInfo(`templateSqlOf(subscriberId="O"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="O"): actual.substring(59)=${actual.substring(59)}`);
      expect(actual.substring(59)).assertEqual('Name from TBL00 where cityId = O');
      logInfo(`${BUNDLE}TemplateSqlOf_0040 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0041
     * @tc.name      FormExtAbility_TemplateSqlOf_0041
     * @tc.desc      templateSqlOf(subscriberId="5tgy6QyTJH") returns " TBL00 where cityId = 5tgy6QyTJH"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0041 begin`);
      const actual: string = templateSqlOf('5tgy6QyTJH');
      logInfo(`templateSqlOf(subscriberId="5tgy6QyTJH"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(100);
      logInfo(`templateSqlOf(subscriberId="5tgy6QyTJH"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="5tgy6QyTJH"): actual.substring(68)=${actual.substring(68)}`);
      expect(actual.substring(68)).assertEqual(' TBL00 where cityId = 5tgy6QyTJH');
      logInfo(`${BUNDLE}TemplateSqlOf_0041 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0042
     * @tc.name      FormExtAbility_TemplateSqlOf_0042
     * @tc.desc      templateSqlOf(subscriberId="IOo") returns "me from TBL00 where cityId = IOo"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0042 begin`);
      const actual: string = templateSqlOf('IOo');
      logInfo(`templateSqlOf(subscriberId="IOo"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(93);
      logInfo(`templateSqlOf(subscriberId="IOo"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="IOo"): actual.substring(61)=${actual.substring(61)}`);
      expect(actual.substring(61)).assertEqual('me from TBL00 where cityId = IOo');
      logInfo(`${BUNDLE}TemplateSqlOf_0042 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0043
     * @tc.name      FormExtAbility_TemplateSqlOf_0043
     * @tc.desc      templateSqlOf(subscriberId="lMh0lURDpz0b") returns "BL00 where cityId = lMh0lURDpz0b"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0043 begin`);
      const actual: string = templateSqlOf('lMh0lURDpz0b');
      logInfo(`templateSqlOf(subscriberId="lMh0lURDpz0b"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(102);
      logInfo(`templateSqlOf(subscriberId="lMh0lURDpz0b"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="lMh0lURDpz0b"): actual.substring(70)=${actual.substring(70)}`);
      expect(actual.substring(70)).assertEqual('BL00 where cityId = lMh0lURDpz0b');
      logInfo(`${BUNDLE}TemplateSqlOf_0043 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0044
     * @tc.name      FormExtAbility_TemplateSqlOf_0044
     * @tc.desc      templateSqlOf(subscriberId="r0rl9wVdX") returns "m TBL00 where cityId = r0rl9wVdX"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0044 begin`);
      const actual: string = templateSqlOf('r0rl9wVdX');
      logInfo(`templateSqlOf(subscriberId="r0rl9wVdX"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(99);
      logInfo(`templateSqlOf(subscriberId="r0rl9wVdX"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="r0rl9wVdX"): actual.substring(67)=${actual.substring(67)}`);
      expect(actual.substring(67)).assertEqual('m TBL00 where cityId = r0rl9wVdX');
      logInfo(`${BUNDLE}TemplateSqlOf_0044 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0045
     * @tc.name      FormExtAbility_TemplateSqlOf_0045
     * @tc.desc      templateSqlOf(subscriberId="ji4AMLn0p") returns "m TBL00 where cityId = ji4AMLn0p"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0045 begin`);
      const actual: string = templateSqlOf('ji4AMLn0p');
      logInfo(`templateSqlOf(subscriberId="ji4AMLn0p"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(99);
      logInfo(`templateSqlOf(subscriberId="ji4AMLn0p"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="ji4AMLn0p"): actual.substring(67)=${actual.substring(67)}`);
      expect(actual.substring(67)).assertEqual('m TBL00 where cityId = ji4AMLn0p');
      logInfo(`${BUNDLE}TemplateSqlOf_0045 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0046
     * @tc.name      FormExtAbility_TemplateSqlOf_0046
     * @tc.desc      templateSqlOf(subscriberId="gGT9Rm0") returns "rom TBL00 where cityId = gGT9Rm0"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0046 begin`);
      const actual: string = templateSqlOf('gGT9Rm0');
      logInfo(`templateSqlOf(subscriberId="gGT9Rm0"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(97);
      logInfo(`templateSqlOf(subscriberId="gGT9Rm0"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="gGT9Rm0"): actual.substring(65)=${actual.substring(65)}`);
      expect(actual.substring(65)).assertEqual('rom TBL00 where cityId = gGT9Rm0');
      logInfo(`${BUNDLE}TemplateSqlOf_0046 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0047
     * @tc.name      FormExtAbility_TemplateSqlOf_0047
     * @tc.desc      templateSqlOf(subscriberId="Iihuk") returns " from TBL00 where cityId = Iihuk"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0047 begin`);
      const actual: string = templateSqlOf('Iihuk');
      logInfo(`templateSqlOf(subscriberId="Iihuk"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(95);
      logInfo(`templateSqlOf(subscriberId="Iihuk"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="Iihuk"): actual.substring(63)=${actual.substring(63)}`);
      expect(actual.substring(63)).assertEqual(' from TBL00 where cityId = Iihuk');
      logInfo(`${BUNDLE}TemplateSqlOf_0047 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0048
     * @tc.name      FormExtAbility_TemplateSqlOf_0048
     * @tc.desc      templateSqlOf(subscriberId="qu88DZOANdEn") returns "BL00 where cityId = qu88DZOANdEn"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0048 begin`);
      const actual: string = templateSqlOf('qu88DZOANdEn');
      logInfo(`templateSqlOf(subscriberId="qu88DZOANdEn"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(102);
      logInfo(`templateSqlOf(subscriberId="qu88DZOANdEn"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="qu88DZOANdEn"): actual.substring(70)=${actual.substring(70)}`);
      expect(actual.substring(70)).assertEqual('BL00 where cityId = qu88DZOANdEn');
      logInfo(`${BUNDLE}TemplateSqlOf_0048 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0049
     * @tc.name      FormExtAbility_TemplateSqlOf_0049
     * @tc.desc      templateSqlOf(subscriberId="261q92jOco0U") returns "BL00 where cityId = 261q92jOco0U"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0049 begin`);
      const actual: string = templateSqlOf('261q92jOco0U');
      logInfo(`templateSqlOf(subscriberId="261q92jOco0U"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(102);
      logInfo(`templateSqlOf(subscriberId="261q92jOco0U"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="261q92jOco0U"): actual.substring(70)=${actual.substring(70)}`);
      expect(actual.substring(70)).assertEqual('BL00 where cityId = 261q92jOco0U');
      logInfo(`${BUNDLE}TemplateSqlOf_0049 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0050
     * @tc.name      FormExtAbility_TemplateSqlOf_0050
     * @tc.desc      templateSqlOf(subscriberId="F") returns "Name from TBL00 where cityId = F"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0050 begin`);
      const actual: string = templateSqlOf('F');
      logInfo(`templateSqlOf(subscriberId="F"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(91);
      logInfo(`templateSqlOf(subscriberId="F"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="F"): actual.substring(59)=${actual.substring(59)}`);
      expect(actual.substring(59)).assertEqual('Name from TBL00 where cityId = F');
      logInfo(`${BUNDLE}TemplateSqlOf_0050 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0051
     * @tc.name      FormExtAbility_TemplateSqlOf_0051
     * @tc.desc      templateSqlOf(subscriberId="0BHMSFkHo7") returns " TBL00 where cityId = 0BHMSFkHo7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0051 begin`);
      const actual: string = templateSqlOf('0BHMSFkHo7');
      logInfo(`templateSqlOf(subscriberId="0BHMSFkHo7"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(100);
      logInfo(`templateSqlOf(subscriberId="0BHMSFkHo7"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="0BHMSFkHo7"): actual.substring(68)=${actual.substring(68)}`);
      expect(actual.substring(68)).assertEqual(' TBL00 where cityId = 0BHMSFkHo7');
      logInfo(`${BUNDLE}TemplateSqlOf_0051 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0052
     * @tc.name      FormExtAbility_TemplateSqlOf_0052
     * @tc.desc      templateSqlOf(subscriberId="0ZZqZ") returns " from TBL00 where cityId = 0ZZqZ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0052 begin`);
      const actual: string = templateSqlOf('0ZZqZ');
      logInfo(`templateSqlOf(subscriberId="0ZZqZ"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(95);
      logInfo(`templateSqlOf(subscriberId="0ZZqZ"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="0ZZqZ"): actual.substring(63)=${actual.substring(63)}`);
      expect(actual.substring(63)).assertEqual(' from TBL00 where cityId = 0ZZqZ');
      logInfo(`${BUNDLE}TemplateSqlOf_0052 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0053
     * @tc.name      FormExtAbility_TemplateSqlOf_0053
     * @tc.desc      templateSqlOf(subscriberId="fjGo") returns "e from TBL00 where cityId = fjGo"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0053 begin`);
      const actual: string = templateSqlOf('fjGo');
      logInfo(`templateSqlOf(subscriberId="fjGo"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(94);
      logInfo(`templateSqlOf(subscriberId="fjGo"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="fjGo"): actual.substring(62)=${actual.substring(62)}`);
      expect(actual.substring(62)).assertEqual('e from TBL00 where cityId = fjGo');
      logInfo(`${BUNDLE}TemplateSqlOf_0053 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0054
     * @tc.name      FormExtAbility_TemplateSqlOf_0054
     * @tc.desc      templateSqlOf(subscriberId="FU") returns "ame from TBL00 where cityId = FU"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0054 begin`);
      const actual: string = templateSqlOf('FU');
      logInfo(`templateSqlOf(subscriberId="FU"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(92);
      logInfo(`templateSqlOf(subscriberId="FU"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="FU"): actual.substring(60)=${actual.substring(60)}`);
      expect(actual.substring(60)).assertEqual('ame from TBL00 where cityId = FU');
      logInfo(`${BUNDLE}TemplateSqlOf_0054 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0055
     * @tc.name      FormExtAbility_TemplateSqlOf_0055
     * @tc.desc      templateSqlOf(subscriberId="cgrE") returns "e from TBL00 where cityId = cgrE"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0055 begin`);
      const actual: string = templateSqlOf('cgrE');
      logInfo(`templateSqlOf(subscriberId="cgrE"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(94);
      logInfo(`templateSqlOf(subscriberId="cgrE"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="cgrE"): actual.substring(62)=${actual.substring(62)}`);
      expect(actual.substring(62)).assertEqual('e from TBL00 where cityId = cgrE');
      logInfo(`${BUNDLE}TemplateSqlOf_0055 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0056
     * @tc.name      FormExtAbility_TemplateSqlOf_0056
     * @tc.desc      templateSqlOf(subscriberId="zpWpMJT") returns "rom TBL00 where cityId = zpWpMJT"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0056 begin`);
      const actual: string = templateSqlOf('zpWpMJT');
      logInfo(`templateSqlOf(subscriberId="zpWpMJT"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(97);
      logInfo(`templateSqlOf(subscriberId="zpWpMJT"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="zpWpMJT"): actual.substring(65)=${actual.substring(65)}`);
      expect(actual.substring(65)).assertEqual('rom TBL00 where cityId = zpWpMJT');
      logInfo(`${BUNDLE}TemplateSqlOf_0056 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0057
     * @tc.name      FormExtAbility_TemplateSqlOf_0057
     * @tc.desc      templateSqlOf(subscriberId="kQanzL3U") returns "om TBL00 where cityId = kQanzL3U"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0057 begin`);
      const actual: string = templateSqlOf('kQanzL3U');
      logInfo(`templateSqlOf(subscriberId="kQanzL3U"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(98);
      logInfo(`templateSqlOf(subscriberId="kQanzL3U"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="kQanzL3U"): actual.substring(66)=${actual.substring(66)}`);
      expect(actual.substring(66)).assertEqual('om TBL00 where cityId = kQanzL3U');
      logInfo(`${BUNDLE}TemplateSqlOf_0057 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0058
     * @tc.name      FormExtAbility_TemplateSqlOf_0058
     * @tc.desc      templateSqlOf(subscriberId="AurYXCni6Eg") returns "TBL00 where cityId = AurYXCni6Eg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0058 begin`);
      const actual: string = templateSqlOf('AurYXCni6Eg');
      logInfo(`templateSqlOf(subscriberId="AurYXCni6Eg"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`templateSqlOf(subscriberId="AurYXCni6Eg"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="AurYXCni6Eg"): actual.substring(69)=${actual.substring(69)}`);
      expect(actual.substring(69)).assertEqual('TBL00 where cityId = AurYXCni6Eg');
      logInfo(`${BUNDLE}TemplateSqlOf_0058 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0059
     * @tc.name      FormExtAbility_TemplateSqlOf_0059
     * @tc.desc      templateSqlOf(subscriberId="hqGsBXEAM") returns "m TBL00 where cityId = hqGsBXEAM"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0059 begin`);
      const actual: string = templateSqlOf('hqGsBXEAM');
      logInfo(`templateSqlOf(subscriberId="hqGsBXEAM"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(99);
      logInfo(`templateSqlOf(subscriberId="hqGsBXEAM"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="hqGsBXEAM"): actual.substring(67)=${actual.substring(67)}`);
      expect(actual.substring(67)).assertEqual('m TBL00 where cityId = hqGsBXEAM');
      logInfo(`${BUNDLE}TemplateSqlOf_0059 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0060
     * @tc.name      FormExtAbility_TemplateSqlOf_0060
     * @tc.desc      templateSqlOf(subscriberId="Rs3qVhdjN7") returns " TBL00 where cityId = Rs3qVhdjN7"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0060 begin`);
      const actual: string = templateSqlOf('Rs3qVhdjN7');
      logInfo(`templateSqlOf(subscriberId="Rs3qVhdjN7"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(100);
      logInfo(`templateSqlOf(subscriberId="Rs3qVhdjN7"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="Rs3qVhdjN7"): actual.substring(68)=${actual.substring(68)}`);
      expect(actual.substring(68)).assertEqual(' TBL00 where cityId = Rs3qVhdjN7');
      logInfo(`${BUNDLE}TemplateSqlOf_0060 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0061
     * @tc.name      FormExtAbility_TemplateSqlOf_0061
     * @tc.desc      templateSqlOf(subscriberId="z44Tdg30") returns "om TBL00 where cityId = z44Tdg30"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0061 begin`);
      const actual: string = templateSqlOf('z44Tdg30');
      logInfo(`templateSqlOf(subscriberId="z44Tdg30"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(98);
      logInfo(`templateSqlOf(subscriberId="z44Tdg30"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="z44Tdg30"): actual.substring(66)=${actual.substring(66)}`);
      expect(actual.substring(66)).assertEqual('om TBL00 where cityId = z44Tdg30');
      logInfo(`${BUNDLE}TemplateSqlOf_0061 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0062
     * @tc.name      FormExtAbility_TemplateSqlOf_0062
     * @tc.desc      templateSqlOf(subscriberId="71lzVMjgxUG") returns "TBL00 where cityId = 71lzVMjgxUG"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0062 begin`);
      const actual: string = templateSqlOf('71lzVMjgxUG');
      logInfo(`templateSqlOf(subscriberId="71lzVMjgxUG"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`templateSqlOf(subscriberId="71lzVMjgxUG"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="71lzVMjgxUG"): actual.substring(69)=${actual.substring(69)}`);
      expect(actual.substring(69)).assertEqual('TBL00 where cityId = 71lzVMjgxUG');
      logInfo(`${BUNDLE}TemplateSqlOf_0062 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0063
     * @tc.name      FormExtAbility_TemplateSqlOf_0063
     * @tc.desc      templateSqlOf(subscriberId="ywe") returns "me from TBL00 where cityId = ywe"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0063 begin`);
      const actual: string = templateSqlOf('ywe');
      logInfo(`templateSqlOf(subscriberId="ywe"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(93);
      logInfo(`templateSqlOf(subscriberId="ywe"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="ywe"): actual.substring(61)=${actual.substring(61)}`);
      expect(actual.substring(61)).assertEqual('me from TBL00 where cityId = ywe');
      logInfo(`${BUNDLE}TemplateSqlOf_0063 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0064
     * @tc.name      FormExtAbility_TemplateSqlOf_0064
     * @tc.desc      templateSqlOf(subscriberId="bInrSQ") returns "from TBL00 where cityId = bInrSQ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0064 begin`);
      const actual: string = templateSqlOf('bInrSQ');
      logInfo(`templateSqlOf(subscriberId="bInrSQ"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(96);
      logInfo(`templateSqlOf(subscriberId="bInrSQ"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="bInrSQ"): actual.substring(64)=${actual.substring(64)}`);
      expect(actual.substring(64)).assertEqual('from TBL00 where cityId = bInrSQ');
      logInfo(`${BUNDLE}TemplateSqlOf_0064 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0065
     * @tc.name      FormExtAbility_TemplateSqlOf_0065
     * @tc.desc      templateSqlOf(subscriberId="ErU0v9afBd") returns " TBL00 where cityId = ErU0v9afBd"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0065 begin`);
      const actual: string = templateSqlOf('ErU0v9afBd');
      logInfo(`templateSqlOf(subscriberId="ErU0v9afBd"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(100);
      logInfo(`templateSqlOf(subscriberId="ErU0v9afBd"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="ErU0v9afBd"): actual.substring(68)=${actual.substring(68)}`);
      expect(actual.substring(68)).assertEqual(' TBL00 where cityId = ErU0v9afBd');
      logInfo(`${BUNDLE}TemplateSqlOf_0065 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0066
     * @tc.name      FormExtAbility_TemplateSqlOf_0066
     * @tc.desc      templateSqlOf(subscriberId="bXM6wyUHGQ") returns " TBL00 where cityId = bXM6wyUHGQ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0066 begin`);
      const actual: string = templateSqlOf('bXM6wyUHGQ');
      logInfo(`templateSqlOf(subscriberId="bXM6wyUHGQ"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(100);
      logInfo(`templateSqlOf(subscriberId="bXM6wyUHGQ"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="bXM6wyUHGQ"): actual.substring(68)=${actual.substring(68)}`);
      expect(actual.substring(68)).assertEqual(' TBL00 where cityId = bXM6wyUHGQ');
      logInfo(`${BUNDLE}TemplateSqlOf_0066 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0067
     * @tc.name      FormExtAbility_TemplateSqlOf_0067
     * @tc.desc      templateSqlOf(subscriberId="3iVw1") returns " from TBL00 where cityId = 3iVw1"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0067 begin`);
      const actual: string = templateSqlOf('3iVw1');
      logInfo(`templateSqlOf(subscriberId="3iVw1"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(95);
      logInfo(`templateSqlOf(subscriberId="3iVw1"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="3iVw1"): actual.substring(63)=${actual.substring(63)}`);
      expect(actual.substring(63)).assertEqual(' from TBL00 where cityId = 3iVw1');
      logInfo(`${BUNDLE}TemplateSqlOf_0067 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0068
     * @tc.name      FormExtAbility_TemplateSqlOf_0068
     * @tc.desc      templateSqlOf(subscriberId="uYMM") returns "e from TBL00 where cityId = uYMM"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0068 begin`);
      const actual: string = templateSqlOf('uYMM');
      logInfo(`templateSqlOf(subscriberId="uYMM"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(94);
      logInfo(`templateSqlOf(subscriberId="uYMM"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="uYMM"): actual.substring(62)=${actual.substring(62)}`);
      expect(actual.substring(62)).assertEqual('e from TBL00 where cityId = uYMM');
      logInfo(`${BUNDLE}TemplateSqlOf_0068 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0069
     * @tc.name      FormExtAbility_TemplateSqlOf_0069
     * @tc.desc      templateSqlOf(subscriberId="j") returns "Name from TBL00 where cityId = j"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0069 begin`);
      const actual: string = templateSqlOf('j');
      logInfo(`templateSqlOf(subscriberId="j"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(91);
      logInfo(`templateSqlOf(subscriberId="j"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="j"): actual.substring(59)=${actual.substring(59)}`);
      expect(actual.substring(59)).assertEqual('Name from TBL00 where cityId = j');
      logInfo(`${BUNDLE}TemplateSqlOf_0069 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0070
     * @tc.name      FormExtAbility_TemplateSqlOf_0070
     * @tc.desc      templateSqlOf(subscriberId="uWr89xkkEhn") returns "TBL00 where cityId = uWr89xkkEhn"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0070 begin`);
      const actual: string = templateSqlOf('uWr89xkkEhn');
      logInfo(`templateSqlOf(subscriberId="uWr89xkkEhn"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(101);
      logInfo(`templateSqlOf(subscriberId="uWr89xkkEhn"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="uWr89xkkEhn"): actual.substring(69)=${actual.substring(69)}`);
      expect(actual.substring(69)).assertEqual('TBL00 where cityId = uWr89xkkEhn');
      logInfo(`${BUNDLE}TemplateSqlOf_0070 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0071
     * @tc.name      FormExtAbility_TemplateSqlOf_0071
     * @tc.desc      templateSqlOf(subscriberId="JdROgFvyC") returns "m TBL00 where cityId = JdROgFvyC"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0071 begin`);
      const actual: string = templateSqlOf('JdROgFvyC');
      logInfo(`templateSqlOf(subscriberId="JdROgFvyC"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(99);
      logInfo(`templateSqlOf(subscriberId="JdROgFvyC"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="JdROgFvyC"): actual.substring(67)=${actual.substring(67)}`);
      expect(actual.substring(67)).assertEqual('m TBL00 where cityId = JdROgFvyC');
      logInfo(`${BUNDLE}TemplateSqlOf_0071 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0072
     * @tc.name      FormExtAbility_TemplateSqlOf_0072
     * @tc.desc      templateSqlOf(subscriberId="HC602e") returns "from TBL00 where cityId = HC602e"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0072 begin`);
      const actual: string = templateSqlOf('HC602e');
      logInfo(`templateSqlOf(subscriberId="HC602e"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(96);
      logInfo(`templateSqlOf(subscriberId="HC602e"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="HC602e"): actual.substring(64)=${actual.substring(64)}`);
      expect(actual.substring(64)).assertEqual('from TBL00 where cityId = HC602e');
      logInfo(`${BUNDLE}TemplateSqlOf_0072 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0073
     * @tc.name      FormExtAbility_TemplateSqlOf_0073
     * @tc.desc      templateSqlOf(subscriberId="qRYV") returns "e from TBL00 where cityId = qRYV"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0073 begin`);
      const actual: string = templateSqlOf('qRYV');
      logInfo(`templateSqlOf(subscriberId="qRYV"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(94);
      logInfo(`templateSqlOf(subscriberId="qRYV"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="qRYV"): actual.substring(62)=${actual.substring(62)}`);
      expect(actual.substring(62)).assertEqual('e from TBL00 where cityId = qRYV');
      logInfo(`${BUNDLE}TemplateSqlOf_0073 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0074
     * @tc.name      FormExtAbility_TemplateSqlOf_0074
     * @tc.desc      templateSqlOf(subscriberId="2VLWeK") returns "from TBL00 where cityId = 2VLWeK"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0074 begin`);
      const actual: string = templateSqlOf('2VLWeK');
      logInfo(`templateSqlOf(subscriberId="2VLWeK"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(96);
      logInfo(`templateSqlOf(subscriberId="2VLWeK"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="2VLWeK"): actual.substring(64)=${actual.substring(64)}`);
      expect(actual.substring(64)).assertEqual('from TBL00 where cityId = 2VLWeK');
      logInfo(`${BUNDLE}TemplateSqlOf_0074 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0075
     * @tc.name      FormExtAbility_TemplateSqlOf_0075
     * @tc.desc      templateSqlOf(subscriberId="C1miiJPLg") returns "m TBL00 where cityId = C1miiJPLg"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0075 begin`);
      const actual: string = templateSqlOf('C1miiJPLg');
      logInfo(`templateSqlOf(subscriberId="C1miiJPLg"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(99);
      logInfo(`templateSqlOf(subscriberId="C1miiJPLg"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="C1miiJPLg"): actual.substring(67)=${actual.substring(67)}`);
      expect(actual.substring(67)).assertEqual('m TBL00 where cityId = C1miiJPLg');
      logInfo(`${BUNDLE}TemplateSqlOf_0075 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0076
     * @tc.name      FormExtAbility_TemplateSqlOf_0076
     * @tc.desc      templateSqlOf(subscriberId="htZ") returns "me from TBL00 where cityId = htZ"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0076 begin`);
      const actual: string = templateSqlOf('htZ');
      logInfo(`templateSqlOf(subscriberId="htZ"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(93);
      logInfo(`templateSqlOf(subscriberId="htZ"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="htZ"): actual.substring(61)=${actual.substring(61)}`);
      expect(actual.substring(61)).assertEqual('me from TBL00 where cityId = htZ');
      logInfo(`${BUNDLE}TemplateSqlOf_0076 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0077
     * @tc.name      FormExtAbility_TemplateSqlOf_0077
     * @tc.desc      templateSqlOf(subscriberId="jENb") returns "e from TBL00 where cityId = jENb"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0077 begin`);
      const actual: string = templateSqlOf('jENb');
      logInfo(`templateSqlOf(subscriberId="jENb"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(94);
      logInfo(`templateSqlOf(subscriberId="jENb"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="jENb"): actual.substring(62)=${actual.substring(62)}`);
      expect(actual.substring(62)).assertEqual('e from TBL00 where cityId = jENb');
      logInfo(`${BUNDLE}TemplateSqlOf_0077 end`);
    });
  });
}
