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

/** Logic checks for templateSqlOf (13 cases). */
export default function templateSqlOf2Test(): void {
  describe('TemplateSqlOf2Test', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0078
     * @tc.name      FormExtAbility_TemplateSqlOf_0078
     * @tc.desc      templateSqlOf(subscriberId="an0nTo0V") returns "om TBL00 where cityId = an0nTo0V"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0078 begin`);
      const actual: string = templateSqlOf('an0nTo0V');
      logInfo(`templateSqlOf(subscriberId="an0nTo0V"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(98);
      logInfo(`templateSqlOf(subscriberId="an0nTo0V"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="an0nTo0V"): actual.substring(66)=${actual.substring(66)}`);
      expect(actual.substring(66)).assertEqual('om TBL00 where cityId = an0nTo0V');
      logInfo(`${BUNDLE}TemplateSqlOf_0078 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0079
     * @tc.name      FormExtAbility_TemplateSqlOf_0079
     * @tc.desc      templateSqlOf(subscriberId="3BSTLN9ElKDO") returns "BL00 where cityId = 3BSTLN9ElKDO"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0079 begin`);
      const actual: string = templateSqlOf('3BSTLN9ElKDO');
      logInfo(`templateSqlOf(subscriberId="3BSTLN9ElKDO"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(102);
      logInfo(`templateSqlOf(subscriberId="3BSTLN9ElKDO"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="3BSTLN9ElKDO"): actual.substring(70)=${actual.substring(70)}`);
      expect(actual.substring(70)).assertEqual('BL00 where cityId = 3BSTLN9ElKDO');
      logInfo(`${BUNDLE}TemplateSqlOf_0079 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0080
     * @tc.name      FormExtAbility_TemplateSqlOf_0080
     * @tc.desc      templateSqlOf(subscriberId="Et9zE94") returns "rom TBL00 where cityId = Et9zE94"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0080 begin`);
      const actual: string = templateSqlOf('Et9zE94');
      logInfo(`templateSqlOf(subscriberId="Et9zE94"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(97);
      logInfo(`templateSqlOf(subscriberId="Et9zE94"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="Et9zE94"): actual.substring(65)=${actual.substring(65)}`);
      expect(actual.substring(65)).assertEqual('rom TBL00 where cityId = Et9zE94');
      logInfo(`${BUNDLE}TemplateSqlOf_0080 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0081
     * @tc.name      FormExtAbility_TemplateSqlOf_0081
     * @tc.desc      templateSqlOf(subscriberId="zE") returns "ame from TBL00 where cityId = zE"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0081 begin`);
      const actual: string = templateSqlOf('zE');
      logInfo(`templateSqlOf(subscriberId="zE"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(92);
      logInfo(`templateSqlOf(subscriberId="zE"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="zE"): actual.substring(60)=${actual.substring(60)}`);
      expect(actual.substring(60)).assertEqual('ame from TBL00 where cityId = zE');
      logInfo(`${BUNDLE}TemplateSqlOf_0081 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0082
     * @tc.name      FormExtAbility_TemplateSqlOf_0082
     * @tc.desc      templateSqlOf(subscriberId="5Qs8hhfDhGUu") returns "BL00 where cityId = 5Qs8hhfDhGUu"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0082 begin`);
      const actual: string = templateSqlOf('5Qs8hhfDhGUu');
      logInfo(`templateSqlOf(subscriberId="5Qs8hhfDhGUu"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(102);
      logInfo(`templateSqlOf(subscriberId="5Qs8hhfDhGUu"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="5Qs8hhfDhGUu"): actual.substring(70)=${actual.substring(70)}`);
      expect(actual.substring(70)).assertEqual('BL00 where cityId = 5Qs8hhfDhGUu');
      logInfo(`${BUNDLE}TemplateSqlOf_0082 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0083
     * @tc.name      FormExtAbility_TemplateSqlOf_0083
     * @tc.desc      templateSqlOf(subscriberId="7X") returns "ame from TBL00 where cityId = 7X"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0083 begin`);
      const actual: string = templateSqlOf('7X');
      logInfo(`templateSqlOf(subscriberId="7X"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(92);
      logInfo(`templateSqlOf(subscriberId="7X"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="7X"): actual.substring(60)=${actual.substring(60)}`);
      expect(actual.substring(60)).assertEqual('ame from TBL00 where cityId = 7X');
      logInfo(`${BUNDLE}TemplateSqlOf_0083 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0084
     * @tc.name      FormExtAbility_TemplateSqlOf_0084
     * @tc.desc      templateSqlOf(subscriberId="Pbdjp1AxQV") returns " TBL00 where cityId = Pbdjp1AxQV"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0084 begin`);
      const actual: string = templateSqlOf('Pbdjp1AxQV');
      logInfo(`templateSqlOf(subscriberId="Pbdjp1AxQV"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(100);
      logInfo(`templateSqlOf(subscriberId="Pbdjp1AxQV"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="Pbdjp1AxQV"): actual.substring(68)=${actual.substring(68)}`);
      expect(actual.substring(68)).assertEqual(' TBL00 where cityId = Pbdjp1AxQV');
      logInfo(`${BUNDLE}TemplateSqlOf_0084 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0085
     * @tc.name      FormExtAbility_TemplateSqlOf_0085
     * @tc.desc      templateSqlOf(subscriberId="XbxZRL9jt") returns "m TBL00 where cityId = XbxZRL9jt"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0085 begin`);
      const actual: string = templateSqlOf('XbxZRL9jt');
      logInfo(`templateSqlOf(subscriberId="XbxZRL9jt"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(99);
      logInfo(`templateSqlOf(subscriberId="XbxZRL9jt"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="XbxZRL9jt"): actual.substring(67)=${actual.substring(67)}`);
      expect(actual.substring(67)).assertEqual('m TBL00 where cityId = XbxZRL9jt');
      logInfo(`${BUNDLE}TemplateSqlOf_0085 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0086
     * @tc.name      FormExtAbility_TemplateSqlOf_0086
     * @tc.desc      templateSqlOf(subscriberId="3f") returns "ame from TBL00 where cityId = 3f"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0086 begin`);
      const actual: string = templateSqlOf('3f');
      logInfo(`templateSqlOf(subscriberId="3f"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(92);
      logInfo(`templateSqlOf(subscriberId="3f"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="3f"): actual.substring(60)=${actual.substring(60)}`);
      expect(actual.substring(60)).assertEqual('ame from TBL00 where cityId = 3f');
      logInfo(`${BUNDLE}TemplateSqlOf_0086 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0087
     * @tc.name      FormExtAbility_TemplateSqlOf_0087
     * @tc.desc      templateSqlOf(subscriberId="Ww") returns "ame from TBL00 where cityId = Ww"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0087 begin`);
      const actual: string = templateSqlOf('Ww');
      logInfo(`templateSqlOf(subscriberId="Ww"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(92);
      logInfo(`templateSqlOf(subscriberId="Ww"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="Ww"): actual.substring(60)=${actual.substring(60)}`);
      expect(actual.substring(60)).assertEqual('ame from TBL00 where cityId = Ww');
      logInfo(`${BUNDLE}TemplateSqlOf_0087 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0088
     * @tc.name      FormExtAbility_TemplateSqlOf_0088
     * @tc.desc      templateSqlOf(subscriberId="Uy") returns "ame from TBL00 where cityId = Uy"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0088 begin`);
      const actual: string = templateSqlOf('Uy');
      logInfo(`templateSqlOf(subscriberId="Uy"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(92);
      logInfo(`templateSqlOf(subscriberId="Uy"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="Uy"): actual.substring(60)=${actual.substring(60)}`);
      expect(actual.substring(60)).assertEqual('ame from TBL00 where cityId = Uy');
      logInfo(`${BUNDLE}TemplateSqlOf_0088 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0089
     * @tc.name      FormExtAbility_TemplateSqlOf_0089
     * @tc.desc      templateSqlOf(subscriberId="z21kRG") returns "from TBL00 where cityId = z21kRG"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0089 begin`);
      const actual: string = templateSqlOf('z21kRG');
      logInfo(`templateSqlOf(subscriberId="z21kRG"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(96);
      logInfo(`templateSqlOf(subscriberId="z21kRG"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="z21kRG"): actual.substring(64)=${actual.substring(64)}`);
      expect(actual.substring(64)).assertEqual('from TBL00 where cityId = z21kRG');
      logInfo(`${BUNDLE}TemplateSqlOf_0089 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPLATE_SQL_OF_0090
     * @tc.name      FormExtAbility_TemplateSqlOf_0090
     * @tc.desc      templateSqlOf(subscriberId="ae") returns "ame from TBL00 where cityId = ae"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemplateSqlOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemplateSqlOf_0090 begin`);
      const actual: string = templateSqlOf('ae');
      logInfo(`templateSqlOf(subscriberId="ae"): actual.length=${actual.length}`);
      expect(actual.length).assertEqual(92);
      logInfo(`templateSqlOf(subscriberId="ae"): actual.substring(0, 32)=${actual.substring(0, 32)}`);
      expect(actual.substring(0, 32)).assertEqual('select cityTemperature as cityTe');
      logInfo(`templateSqlOf(subscriberId="ae"): actual.substring(60)=${actual.substring(60)}`);
      expect(actual.substring(60)).assertEqual('ame from TBL00 where cityId = ae');
      logInfo(`${BUNDLE}TemplateSqlOf_0090 end`);
    });
  });
}
