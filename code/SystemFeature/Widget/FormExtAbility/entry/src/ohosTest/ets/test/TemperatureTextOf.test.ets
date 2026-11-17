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
import { temperatureTextOf } from './model/FormExtLogic';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_FormExtAbility]';
const BUNDLE: string = 'FormExtAbility_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for temperatureTextOf (96 cases). */
export default function temperatureTextOfTest(): void {
  describe('TemperatureTextOfTest', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0001
     * @tc.name      FormExtAbility_TemperatureTextOf_0001
     * @tc.desc      temperatureTextOf(formId="", count=0) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_TemperatureTextOf_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0001 begin`);
      const actual: string = temperatureTextOf('', 0);
      logInfo(`temperatureTextOf(formId="", count=0): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0001 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0002
     * @tc.name      FormExtAbility_TemperatureTextOf_0002
     * @tc.desc      temperatureTextOf(formId="123", count=0) returns "13"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('FormExtAbility_TemperatureTextOf_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0002 begin`);
      const actual: string = temperatureTextOf('123', 0);
      logInfo(`temperatureTextOf(formId="123", count=0): actual=${actual}`);
      expect(actual).assertEqual('13');
      logInfo(`${BUNDLE}TemperatureTextOf_0002 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0003
     * @tc.name      FormExtAbility_TemperatureTextOf_0003
     * @tc.desc      temperatureTextOf(formId="123", count=1) returns "12"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0003 begin`);
      const actual: string = temperatureTextOf('123', 1);
      logInfo(`temperatureTextOf(formId="123", count=1): actual=${actual}`);
      expect(actual).assertEqual('12');
      logInfo(`${BUNDLE}TemperatureTextOf_0003 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0004
     * @tc.name      FormExtAbility_TemperatureTextOf_0004
     * @tc.desc      temperatureTextOf(formId="123", count=2) returns "11"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0004 begin`);
      const actual: string = temperatureTextOf('123', 2);
      logInfo(`temperatureTextOf(formId="123", count=2): actual=${actual}`);
      expect(actual).assertEqual('11');
      logInfo(`${BUNDLE}TemperatureTextOf_0004 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0005
     * @tc.name      FormExtAbility_TemperatureTextOf_0005
     * @tc.desc      temperatureTextOf(formId="123", count=5) returns "8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0005 begin`);
      const actual: string = temperatureTextOf('123', 5);
      logInfo(`temperatureTextOf(formId="123", count=5): actual=${actual}`);
      expect(actual).assertEqual('8');
      logInfo(`${BUNDLE}TemperatureTextOf_0005 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0006
     * @tc.name      FormExtAbility_TemperatureTextOf_0006
     * @tc.desc      temperatureTextOf(formId="123", count=10) returns "3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0006 begin`);
      const actual: string = temperatureTextOf('123', 10);
      logInfo(`temperatureTextOf(formId="123", count=10): actual=${actual}`);
      expect(actual).assertEqual('3');
      logInfo(`${BUNDLE}TemperatureTextOf_0006 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0007
     * @tc.name      FormExtAbility_TemperatureTextOf_0007
     * @tc.desc      temperatureTextOf(formId="123", count=-1) returns "14"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0007 begin`);
      const actual: string = temperatureTextOf('123', -1);
      logInfo(`temperatureTextOf(formId="123", count=-1): actual=${actual}`);
      expect(actual).assertEqual('14');
      logInfo(`${BUNDLE}TemperatureTextOf_0007 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0008
     * @tc.name      FormExtAbility_TemperatureTextOf_0008
     * @tc.desc      temperatureTextOf(formId="123", count=3) returns "10"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0008 begin`);
      const actual: string = temperatureTextOf('123', 3);
      logInfo(`temperatureTextOf(formId="123", count=3): actual=${actual}`);
      expect(actual).assertEqual('10');
      logInfo(`${BUNDLE}TemperatureTextOf_0008 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0009
     * @tc.name      FormExtAbility_TemperatureTextOf_0009
     * @tc.desc      temperatureTextOf(formId="123", count=-88) returns "21"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0009 begin`);
      const actual: string = temperatureTextOf('123', -88);
      logInfo(`temperatureTextOf(formId="123", count=-88): actual=${actual}`);
      expect(actual).assertEqual('21');
      logInfo(`${BUNDLE}TemperatureTextOf_0009 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0010
     * @tc.name      FormExtAbility_TemperatureTextOf_0010
     * @tc.desc      temperatureTextOf(formId="123", count=-5) returns "18"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0010 begin`);
      const actual: string = temperatureTextOf('123', -5);
      logInfo(`temperatureTextOf(formId="123", count=-5): actual=${actual}`);
      expect(actual).assertEqual('18');
      logInfo(`${BUNDLE}TemperatureTextOf_0010 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0011
     * @tc.name      FormExtAbility_TemperatureTextOf_0011
     * @tc.desc      temperatureTextOf(formId="", count=1) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0011 begin`);
      const actual: string = temperatureTextOf('', 1);
      logInfo(`temperatureTextOf(formId="", count=1): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0011 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0012
     * @tc.name      FormExtAbility_TemperatureTextOf_0012
     * @tc.desc      temperatureTextOf(formId="", count=2) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0012 begin`);
      const actual: string = temperatureTextOf('', 2);
      logInfo(`temperatureTextOf(formId="", count=2): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0012 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0013
     * @tc.name      FormExtAbility_TemperatureTextOf_0013
     * @tc.desc      temperatureTextOf(formId="", count=5) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0013 begin`);
      const actual: string = temperatureTextOf('', 5);
      logInfo(`temperatureTextOf(formId="", count=5): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0013 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0014
     * @tc.name      FormExtAbility_TemperatureTextOf_0014
     * @tc.desc      temperatureTextOf(formId="", count=10) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0014 begin`);
      const actual: string = temperatureTextOf('', 10);
      logInfo(`temperatureTextOf(formId="", count=10): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0014 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0015
     * @tc.name      FormExtAbility_TemperatureTextOf_0015
     * @tc.desc      temperatureTextOf(formId="", count=100) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0015 begin`);
      const actual: string = temperatureTextOf('', 100);
      logInfo(`temperatureTextOf(formId="", count=100): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0015 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0016
     * @tc.name      FormExtAbility_TemperatureTextOf_0016
     * @tc.desc      temperatureTextOf(formId="", count=-1) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0016 begin`);
      const actual: string = temperatureTextOf('', -1);
      logInfo(`temperatureTextOf(formId="", count=-1): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0016 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0017
     * @tc.name      FormExtAbility_TemperatureTextOf_0017
     * @tc.desc      temperatureTextOf(formId="", count=3) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0017 begin`);
      const actual: string = temperatureTextOf('', 3);
      logInfo(`temperatureTextOf(formId="", count=3): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0017 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0018
     * @tc.name      FormExtAbility_TemperatureTextOf_0018
     * @tc.desc      temperatureTextOf(formId="", count=15) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0018 begin`);
      const actual: string = temperatureTextOf('', 15);
      logInfo(`temperatureTextOf(formId="", count=15): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0018 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0019
     * @tc.name      FormExtAbility_TemperatureTextOf_0019
     * @tc.desc      temperatureTextOf(formId="", count=20) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0019 begin`);
      const actual: string = temperatureTextOf('', 20);
      logInfo(`temperatureTextOf(formId="", count=20): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0019 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0020
     * @tc.name      FormExtAbility_TemperatureTextOf_0020
     * @tc.desc      temperatureTextOf(formId="", count=25) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0020 begin`);
      const actual: string = temperatureTextOf('', 25);
      logInfo(`temperatureTextOf(formId="", count=25): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0020 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0021
     * @tc.name      FormExtAbility_TemperatureTextOf_0021
     * @tc.desc      temperatureTextOf(formId="", count=30) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0021 begin`);
      const actual: string = temperatureTextOf('', 30);
      logInfo(`temperatureTextOf(formId="", count=30): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0021 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0022
     * @tc.name      FormExtAbility_TemperatureTextOf_0022
     * @tc.desc      temperatureTextOf(formId="", count=35) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0022 begin`);
      const actual: string = temperatureTextOf('', 35);
      logInfo(`temperatureTextOf(formId="", count=35): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0022 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0023
     * @tc.name      FormExtAbility_TemperatureTextOf_0023
     * @tc.desc      temperatureTextOf(formId="", count=40) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0023 begin`);
      const actual: string = temperatureTextOf('', 40);
      logInfo(`temperatureTextOf(formId="", count=40): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0023 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0024
     * @tc.name      FormExtAbility_TemperatureTextOf_0024
     * @tc.desc      temperatureTextOf(formId="", count=45) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0024 begin`);
      const actual: string = temperatureTextOf('', 45);
      logInfo(`temperatureTextOf(formId="", count=45): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0024 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0025
     * @tc.name      FormExtAbility_TemperatureTextOf_0025
     * @tc.desc      temperatureTextOf(formId="", count=50) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0025 begin`);
      const actual: string = temperatureTextOf('', 50);
      logInfo(`temperatureTextOf(formId="", count=50): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0025 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0026
     * @tc.name      FormExtAbility_TemperatureTextOf_0026
     * @tc.desc      temperatureTextOf(formId="", count=55) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0026 begin`);
      const actual: string = temperatureTextOf('', 55);
      logInfo(`temperatureTextOf(formId="", count=55): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0026 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0027
     * @tc.name      FormExtAbility_TemperatureTextOf_0027
     * @tc.desc      temperatureTextOf(formId="", count=60) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0027 begin`);
      const actual: string = temperatureTextOf('', 60);
      logInfo(`temperatureTextOf(formId="", count=60): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0027 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0028
     * @tc.name      FormExtAbility_TemperatureTextOf_0028
     * @tc.desc      temperatureTextOf(formId="", count=65) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0028 begin`);
      const actual: string = temperatureTextOf('', 65);
      logInfo(`temperatureTextOf(formId="", count=65): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0028 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0029
     * @tc.name      FormExtAbility_TemperatureTextOf_0029
     * @tc.desc      temperatureTextOf(formId="", count=70) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0029 begin`);
      const actual: string = temperatureTextOf('', 70);
      logInfo(`temperatureTextOf(formId="", count=70): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0029 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0030
     * @tc.name      FormExtAbility_TemperatureTextOf_0030
     * @tc.desc      temperatureTextOf(formId="", count=75) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0030 begin`);
      const actual: string = temperatureTextOf('', 75);
      logInfo(`temperatureTextOf(formId="", count=75): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0030 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0031
     * @tc.name      FormExtAbility_TemperatureTextOf_0031
     * @tc.desc      temperatureTextOf(formId="", count=80) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0031 begin`);
      const actual: string = temperatureTextOf('', 80);
      logInfo(`temperatureTextOf(formId="", count=80): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0031 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0032
     * @tc.name      FormExtAbility_TemperatureTextOf_0032
     * @tc.desc      temperatureTextOf(formId="", count=85) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0032 begin`);
      const actual: string = temperatureTextOf('', 85);
      logInfo(`temperatureTextOf(formId="", count=85): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0032 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0033
     * @tc.name      FormExtAbility_TemperatureTextOf_0033
     * @tc.desc      temperatureTextOf(formId="", count=90) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0033 begin`);
      const actual: string = temperatureTextOf('', 90);
      logInfo(`temperatureTextOf(formId="", count=90): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0033 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0034
     * @tc.name      FormExtAbility_TemperatureTextOf_0034
     * @tc.desc      temperatureTextOf(formId="", count=95) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0034 begin`);
      const actual: string = temperatureTextOf('', 95);
      logInfo(`temperatureTextOf(formId="", count=95): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0034 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0035
     * @tc.name      FormExtAbility_TemperatureTextOf_0035
     * @tc.desc      temperatureTextOf(formId="", count=105) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0035 begin`);
      const actual: string = temperatureTextOf('', 105);
      logInfo(`temperatureTextOf(formId="", count=105): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0035 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0036
     * @tc.name      FormExtAbility_TemperatureTextOf_0036
     * @tc.desc      temperatureTextOf(formId="", count=110) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0036 begin`);
      const actual: string = temperatureTextOf('', 110);
      logInfo(`temperatureTextOf(formId="", count=110): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0036 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0037
     * @tc.name      FormExtAbility_TemperatureTextOf_0037
     * @tc.desc      temperatureTextOf(formId="", count=-88) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0037 begin`);
      const actual: string = temperatureTextOf('', -88);
      logInfo(`temperatureTextOf(formId="", count=-88): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0037 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0038
     * @tc.name      FormExtAbility_TemperatureTextOf_0038
     * @tc.desc      temperatureTextOf(formId="", count=-5) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0038 begin`);
      const actual: string = temperatureTextOf('', -5);
      logInfo(`temperatureTextOf(formId="", count=-5): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0038 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0039
     * @tc.name      FormExtAbility_TemperatureTextOf_0039
     * @tc.desc      temperatureTextOf(formId="", count=-61) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0039 begin`);
      const actual: string = temperatureTextOf('', -61);
      logInfo(`temperatureTextOf(formId="", count=-61): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0039 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0040
     * @tc.name      FormExtAbility_TemperatureTextOf_0040
     * @tc.desc      temperatureTextOf(formId="a", count=0) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0040 begin`);
      const actual: string = temperatureTextOf('a', 0);
      logInfo(`temperatureTextOf(formId="a", count=0): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0040 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0041
     * @tc.name      FormExtAbility_TemperatureTextOf_0041
     * @tc.desc      temperatureTextOf(formId="a", count=1) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0041 begin`);
      const actual: string = temperatureTextOf('a', 1);
      logInfo(`temperatureTextOf(formId="a", count=1): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0041 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0042
     * @tc.name      FormExtAbility_TemperatureTextOf_0042
     * @tc.desc      temperatureTextOf(formId="a", count=2) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0042 begin`);
      const actual: string = temperatureTextOf('a', 2);
      logInfo(`temperatureTextOf(formId="a", count=2): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0042 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0043
     * @tc.name      FormExtAbility_TemperatureTextOf_0043
     * @tc.desc      temperatureTextOf(formId="a", count=5) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0043 begin`);
      const actual: string = temperatureTextOf('a', 5);
      logInfo(`temperatureTextOf(formId="a", count=5): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0043 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0044
     * @tc.name      FormExtAbility_TemperatureTextOf_0044
     * @tc.desc      temperatureTextOf(formId="a", count=10) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0044 begin`);
      const actual: string = temperatureTextOf('a', 10);
      logInfo(`temperatureTextOf(formId="a", count=10): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0044 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0045
     * @tc.name      FormExtAbility_TemperatureTextOf_0045
     * @tc.desc      temperatureTextOf(formId="a", count=100) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0045 begin`);
      const actual: string = temperatureTextOf('a', 100);
      logInfo(`temperatureTextOf(formId="a", count=100): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0045 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0046
     * @tc.name      FormExtAbility_TemperatureTextOf_0046
     * @tc.desc      temperatureTextOf(formId="a", count=-1) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0046 begin`);
      const actual: string = temperatureTextOf('a', -1);
      logInfo(`temperatureTextOf(formId="a", count=-1): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0046 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0047
     * @tc.name      FormExtAbility_TemperatureTextOf_0047
     * @tc.desc      temperatureTextOf(formId="a", count=3) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0047 begin`);
      const actual: string = temperatureTextOf('a', 3);
      logInfo(`temperatureTextOf(formId="a", count=3): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0047 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0048
     * @tc.name      FormExtAbility_TemperatureTextOf_0048
     * @tc.desc      temperatureTextOf(formId="a", count=15) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0048 begin`);
      const actual: string = temperatureTextOf('a', 15);
      logInfo(`temperatureTextOf(formId="a", count=15): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0048 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0049
     * @tc.name      FormExtAbility_TemperatureTextOf_0049
     * @tc.desc      temperatureTextOf(formId="a", count=20) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0049 begin`);
      const actual: string = temperatureTextOf('a', 20);
      logInfo(`temperatureTextOf(formId="a", count=20): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0049 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0050
     * @tc.name      FormExtAbility_TemperatureTextOf_0050
     * @tc.desc      temperatureTextOf(formId="a", count=25) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0050 begin`);
      const actual: string = temperatureTextOf('a', 25);
      logInfo(`temperatureTextOf(formId="a", count=25): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0050 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0051
     * @tc.name      FormExtAbility_TemperatureTextOf_0051
     * @tc.desc      temperatureTextOf(formId="a", count=30) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0051 begin`);
      const actual: string = temperatureTextOf('a', 30);
      logInfo(`temperatureTextOf(formId="a", count=30): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0051 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0052
     * @tc.name      FormExtAbility_TemperatureTextOf_0052
     * @tc.desc      temperatureTextOf(formId="a", count=35) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0052 begin`);
      const actual: string = temperatureTextOf('a', 35);
      logInfo(`temperatureTextOf(formId="a", count=35): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0052 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0053
     * @tc.name      FormExtAbility_TemperatureTextOf_0053
     * @tc.desc      temperatureTextOf(formId="a", count=40) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0053 begin`);
      const actual: string = temperatureTextOf('a', 40);
      logInfo(`temperatureTextOf(formId="a", count=40): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0053 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0054
     * @tc.name      FormExtAbility_TemperatureTextOf_0054
     * @tc.desc      temperatureTextOf(formId="a", count=45) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0054 begin`);
      const actual: string = temperatureTextOf('a', 45);
      logInfo(`temperatureTextOf(formId="a", count=45): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0054 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0055
     * @tc.name      FormExtAbility_TemperatureTextOf_0055
     * @tc.desc      temperatureTextOf(formId="a", count=50) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0055 begin`);
      const actual: string = temperatureTextOf('a', 50);
      logInfo(`temperatureTextOf(formId="a", count=50): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0055 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0056
     * @tc.name      FormExtAbility_TemperatureTextOf_0056
     * @tc.desc      temperatureTextOf(formId="a", count=55) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0056 begin`);
      const actual: string = temperatureTextOf('a', 55);
      logInfo(`temperatureTextOf(formId="a", count=55): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0056 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0057
     * @tc.name      FormExtAbility_TemperatureTextOf_0057
     * @tc.desc      temperatureTextOf(formId="a", count=60) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0057 begin`);
      const actual: string = temperatureTextOf('a', 60);
      logInfo(`temperatureTextOf(formId="a", count=60): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0057 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0058
     * @tc.name      FormExtAbility_TemperatureTextOf_0058
     * @tc.desc      temperatureTextOf(formId="a", count=65) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0058 begin`);
      const actual: string = temperatureTextOf('a', 65);
      logInfo(`temperatureTextOf(formId="a", count=65): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0058 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0059
     * @tc.name      FormExtAbility_TemperatureTextOf_0059
     * @tc.desc      temperatureTextOf(formId="a", count=70) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0059 begin`);
      const actual: string = temperatureTextOf('a', 70);
      logInfo(`temperatureTextOf(formId="a", count=70): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0059 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0060
     * @tc.name      FormExtAbility_TemperatureTextOf_0060
     * @tc.desc      temperatureTextOf(formId="a", count=75) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0060 begin`);
      const actual: string = temperatureTextOf('a', 75);
      logInfo(`temperatureTextOf(formId="a", count=75): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0060 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0061
     * @tc.name      FormExtAbility_TemperatureTextOf_0061
     * @tc.desc      temperatureTextOf(formId="a", count=80) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0061 begin`);
      const actual: string = temperatureTextOf('a', 80);
      logInfo(`temperatureTextOf(formId="a", count=80): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0061 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0062
     * @tc.name      FormExtAbility_TemperatureTextOf_0062
     * @tc.desc      temperatureTextOf(formId="a", count=85) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0062 begin`);
      const actual: string = temperatureTextOf('a', 85);
      logInfo(`temperatureTextOf(formId="a", count=85): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0062 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0063
     * @tc.name      FormExtAbility_TemperatureTextOf_0063
     * @tc.desc      temperatureTextOf(formId="a", count=90) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0063 begin`);
      const actual: string = temperatureTextOf('a', 90);
      logInfo(`temperatureTextOf(formId="a", count=90): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0063 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0064
     * @tc.name      FormExtAbility_TemperatureTextOf_0064
     * @tc.desc      temperatureTextOf(formId="a", count=95) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0064 begin`);
      const actual: string = temperatureTextOf('a', 95);
      logInfo(`temperatureTextOf(formId="a", count=95): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0064 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0065
     * @tc.name      FormExtAbility_TemperatureTextOf_0065
     * @tc.desc      temperatureTextOf(formId="a", count=105) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0065 begin`);
      const actual: string = temperatureTextOf('a', 105);
      logInfo(`temperatureTextOf(formId="a", count=105): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0065 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0066
     * @tc.name      FormExtAbility_TemperatureTextOf_0066
     * @tc.desc      temperatureTextOf(formId="a", count=110) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0066 begin`);
      const actual: string = temperatureTextOf('a', 110);
      logInfo(`temperatureTextOf(formId="a", count=110): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0066 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0067
     * @tc.name      FormExtAbility_TemperatureTextOf_0067
     * @tc.desc      temperatureTextOf(formId="a", count=-88) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0067 begin`);
      const actual: string = temperatureTextOf('a', -88);
      logInfo(`temperatureTextOf(formId="a", count=-88): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0067 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0068
     * @tc.name      FormExtAbility_TemperatureTextOf_0068
     * @tc.desc      temperatureTextOf(formId="a", count=-5) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0068 begin`);
      const actual: string = temperatureTextOf('a', -5);
      logInfo(`temperatureTextOf(formId="a", count=-5): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0068 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0069
     * @tc.name      FormExtAbility_TemperatureTextOf_0069
     * @tc.desc      temperatureTextOf(formId="a", count=-61) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0069 begin`);
      const actual: string = temperatureTextOf('a', -61);
      logInfo(`temperatureTextOf(formId="a", count=-61): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0069 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0070
     * @tc.name      FormExtAbility_TemperatureTextOf_0070
     * @tc.desc      temperatureTextOf(formId="abc", count=0) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0070 begin`);
      const actual: string = temperatureTextOf('abc', 0);
      logInfo(`temperatureTextOf(formId="abc", count=0): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0070 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0071
     * @tc.name      FormExtAbility_TemperatureTextOf_0071
     * @tc.desc      temperatureTextOf(formId="abc", count=1) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0071 begin`);
      const actual: string = temperatureTextOf('abc', 1);
      logInfo(`temperatureTextOf(formId="abc", count=1): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0071 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0072
     * @tc.name      FormExtAbility_TemperatureTextOf_0072
     * @tc.desc      temperatureTextOf(formId="abc", count=2) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0072 begin`);
      const actual: string = temperatureTextOf('abc', 2);
      logInfo(`temperatureTextOf(formId="abc", count=2): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0072 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0073
     * @tc.name      FormExtAbility_TemperatureTextOf_0073
     * @tc.desc      temperatureTextOf(formId="abc", count=5) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0073 begin`);
      const actual: string = temperatureTextOf('abc', 5);
      logInfo(`temperatureTextOf(formId="abc", count=5): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0073 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0074
     * @tc.name      FormExtAbility_TemperatureTextOf_0074
     * @tc.desc      temperatureTextOf(formId="abc", count=10) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0074 begin`);
      const actual: string = temperatureTextOf('abc', 10);
      logInfo(`temperatureTextOf(formId="abc", count=10): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0074 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0075
     * @tc.name      FormExtAbility_TemperatureTextOf_0075
     * @tc.desc      temperatureTextOf(formId="abc", count=100) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0075 begin`);
      const actual: string = temperatureTextOf('abc', 100);
      logInfo(`temperatureTextOf(formId="abc", count=100): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0075 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0076
     * @tc.name      FormExtAbility_TemperatureTextOf_0076
     * @tc.desc      temperatureTextOf(formId="abc", count=-1) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0076 begin`);
      const actual: string = temperatureTextOf('abc', -1);
      logInfo(`temperatureTextOf(formId="abc", count=-1): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0076 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0077
     * @tc.name      FormExtAbility_TemperatureTextOf_0077
     * @tc.desc      temperatureTextOf(formId="abc", count=3) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0077 begin`);
      const actual: string = temperatureTextOf('abc', 3);
      logInfo(`temperatureTextOf(formId="abc", count=3): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0077 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0078
     * @tc.name      FormExtAbility_TemperatureTextOf_0078
     * @tc.desc      temperatureTextOf(formId="abc", count=15) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0078 begin`);
      const actual: string = temperatureTextOf('abc', 15);
      logInfo(`temperatureTextOf(formId="abc", count=15): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0078 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0079
     * @tc.name      FormExtAbility_TemperatureTextOf_0079
     * @tc.desc      temperatureTextOf(formId="abc", count=20) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0079 begin`);
      const actual: string = temperatureTextOf('abc', 20);
      logInfo(`temperatureTextOf(formId="abc", count=20): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0079 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0080
     * @tc.name      FormExtAbility_TemperatureTextOf_0080
     * @tc.desc      temperatureTextOf(formId="abc", count=25) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0080 begin`);
      const actual: string = temperatureTextOf('abc', 25);
      logInfo(`temperatureTextOf(formId="abc", count=25): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0080 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0081
     * @tc.name      FormExtAbility_TemperatureTextOf_0081
     * @tc.desc      temperatureTextOf(formId="abc", count=30) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0081 begin`);
      const actual: string = temperatureTextOf('abc', 30);
      logInfo(`temperatureTextOf(formId="abc", count=30): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0081 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0082
     * @tc.name      FormExtAbility_TemperatureTextOf_0082
     * @tc.desc      temperatureTextOf(formId="abc", count=35) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0082 begin`);
      const actual: string = temperatureTextOf('abc', 35);
      logInfo(`temperatureTextOf(formId="abc", count=35): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0082 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0083
     * @tc.name      FormExtAbility_TemperatureTextOf_0083
     * @tc.desc      temperatureTextOf(formId="abc", count=40) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0083 begin`);
      const actual: string = temperatureTextOf('abc', 40);
      logInfo(`temperatureTextOf(formId="abc", count=40): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0083 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0084
     * @tc.name      FormExtAbility_TemperatureTextOf_0084
     * @tc.desc      temperatureTextOf(formId="abc", count=45) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0084 begin`);
      const actual: string = temperatureTextOf('abc', 45);
      logInfo(`temperatureTextOf(formId="abc", count=45): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0084 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0085
     * @tc.name      FormExtAbility_TemperatureTextOf_0085
     * @tc.desc      temperatureTextOf(formId="abc", count=50) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0085 begin`);
      const actual: string = temperatureTextOf('abc', 50);
      logInfo(`temperatureTextOf(formId="abc", count=50): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0085 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0086
     * @tc.name      FormExtAbility_TemperatureTextOf_0086
     * @tc.desc      temperatureTextOf(formId="abc", count=55) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0086 begin`);
      const actual: string = temperatureTextOf('abc', 55);
      logInfo(`temperatureTextOf(formId="abc", count=55): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0086 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0087
     * @tc.name      FormExtAbility_TemperatureTextOf_0087
     * @tc.desc      temperatureTextOf(formId="abc", count=60) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0087 begin`);
      const actual: string = temperatureTextOf('abc', 60);
      logInfo(`temperatureTextOf(formId="abc", count=60): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0087 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0088
     * @tc.name      FormExtAbility_TemperatureTextOf_0088
     * @tc.desc      temperatureTextOf(formId="abc", count=65) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0088 begin`);
      const actual: string = temperatureTextOf('abc', 65);
      logInfo(`temperatureTextOf(formId="abc", count=65): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0088 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0089
     * @tc.name      FormExtAbility_TemperatureTextOf_0089
     * @tc.desc      temperatureTextOf(formId="abc", count=70) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0089 begin`);
      const actual: string = temperatureTextOf('abc', 70);
      logInfo(`temperatureTextOf(formId="abc", count=70): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0089 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0090
     * @tc.name      FormExtAbility_TemperatureTextOf_0090
     * @tc.desc      temperatureTextOf(formId="abc", count=75) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0090 begin`);
      const actual: string = temperatureTextOf('abc', 75);
      logInfo(`temperatureTextOf(formId="abc", count=75): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0090 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0091
     * @tc.name      FormExtAbility_TemperatureTextOf_0091
     * @tc.desc      temperatureTextOf(formId="abc", count=80) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0091 begin`);
      const actual: string = temperatureTextOf('abc', 80);
      logInfo(`temperatureTextOf(formId="abc", count=80): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0091 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0092
     * @tc.name      FormExtAbility_TemperatureTextOf_0092
     * @tc.desc      temperatureTextOf(formId="abc", count=85) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0092 begin`);
      const actual: string = temperatureTextOf('abc', 85);
      logInfo(`temperatureTextOf(formId="abc", count=85): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0092 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0093
     * @tc.name      FormExtAbility_TemperatureTextOf_0093
     * @tc.desc      temperatureTextOf(formId="abc", count=90) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0093 begin`);
      const actual: string = temperatureTextOf('abc', 90);
      logInfo(`temperatureTextOf(formId="abc", count=90): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0093 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0094
     * @tc.name      FormExtAbility_TemperatureTextOf_0094
     * @tc.desc      temperatureTextOf(formId="abc", count=95) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0094 begin`);
      const actual: string = temperatureTextOf('abc', 95);
      logInfo(`temperatureTextOf(formId="abc", count=95): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0094 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0095
     * @tc.name      FormExtAbility_TemperatureTextOf_0095
     * @tc.desc      temperatureTextOf(formId="abc", count=105) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0095 begin`);
      const actual: string = temperatureTextOf('abc', 105);
      logInfo(`temperatureTextOf(formId="abc", count=105): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0095 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0096
     * @tc.name      FormExtAbility_TemperatureTextOf_0096
     * @tc.desc      temperatureTextOf(formId="abc", count=110) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0096 begin`);
      const actual: string = temperatureTextOf('abc', 110);
      logInfo(`temperatureTextOf(formId="abc", count=110): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0096 end`);
    });
  });
}
