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
export default function temperatureTextOf2Test(): void {
  describe('TemperatureTextOf2Test', (): void => {
    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0097
     * @tc.name      FormExtAbility_TemperatureTextOf_0097
     * @tc.desc      temperatureTextOf(formId="abc", count=-88) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0097 begin`);
      const actual: string = temperatureTextOf('abc', -88);
      logInfo(`temperatureTextOf(formId="abc", count=-88): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0097 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0098
     * @tc.name      FormExtAbility_TemperatureTextOf_0098
     * @tc.desc      temperatureTextOf(formId="abc", count=-5) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0098 begin`);
      const actual: string = temperatureTextOf('abc', -5);
      logInfo(`temperatureTextOf(formId="abc", count=-5): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0098 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0099
     * @tc.name      FormExtAbility_TemperatureTextOf_0099
     * @tc.desc      temperatureTextOf(formId="abc", count=-61) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0099 begin`);
      const actual: string = temperatureTextOf('abc', -61);
      logInfo(`temperatureTextOf(formId="abc", count=-61): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0099 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0100
     * @tc.name      FormExtAbility_TemperatureTextOf_0100
     * @tc.desc      temperatureTextOf(formId="Hello World", count=0) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0100 begin`);
      const actual: string = temperatureTextOf('Hello World', 0);
      logInfo(`temperatureTextOf(formId="Hello World", c...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0100 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0101
     * @tc.name      FormExtAbility_TemperatureTextOf_0101
     * @tc.desc      temperatureTextOf(formId="Hello World", count=1) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0101 begin`);
      const actual: string = temperatureTextOf('Hello World', 1);
      logInfo(`temperatureTextOf(formId="Hello World", c...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0101 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0102
     * @tc.name      FormExtAbility_TemperatureTextOf_0102
     * @tc.desc      temperatureTextOf(formId="Hello World", count=2) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0102 begin`);
      const actual: string = temperatureTextOf('Hello World', 2);
      logInfo(`temperatureTextOf(formId="Hello World", c...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0102 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0103
     * @tc.name      FormExtAbility_TemperatureTextOf_0103
     * @tc.desc      temperatureTextOf(formId="Hello World", count=5) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0103 begin`);
      const actual: string = temperatureTextOf('Hello World', 5);
      logInfo(`temperatureTextOf(formId="Hello World", c...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0103 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0104
     * @tc.name      FormExtAbility_TemperatureTextOf_0104
     * @tc.desc      temperatureTextOf(formId="Hello World", count=10) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0104 begin`);
      const actual: string = temperatureTextOf('Hello World', 10);
      logInfo(`temperatureTextOf(formId="Hello World", c...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0104 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0105
     * @tc.name      FormExtAbility_TemperatureTextOf_0105
     * @tc.desc      temperatureTextOf(formId="Hello World", count=100) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0105 begin`);
      const actual: string = temperatureTextOf('Hello World', 100);
      logInfo(`temperatureTextOf(formId="Hello World", c...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0105 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0106
     * @tc.name      FormExtAbility_TemperatureTextOf_0106
     * @tc.desc      temperatureTextOf(formId="Hello World", count=-1) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0106 begin`);
      const actual: string = temperatureTextOf('Hello World', -1);
      logInfo(`temperatureTextOf(formId="Hello World", c...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0106 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0107
     * @tc.name      FormExtAbility_TemperatureTextOf_0107
     * @tc.desc      temperatureTextOf(formId="Hello World", count=3) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0107 begin`);
      const actual: string = temperatureTextOf('Hello World', 3);
      logInfo(`temperatureTextOf(formId="Hello World", c...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0107 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0108
     * @tc.name      FormExtAbility_TemperatureTextOf_0108
     * @tc.desc      temperatureTextOf(formId="Hello World", count=15) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0108 begin`);
      const actual: string = temperatureTextOf('Hello World', 15);
      logInfo(`temperatureTextOf(formId="Hello World", c...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0108 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0109
     * @tc.name      FormExtAbility_TemperatureTextOf_0109
     * @tc.desc      temperatureTextOf(formId="Hello World", count=20) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0109 begin`);
      const actual: string = temperatureTextOf('Hello World', 20);
      logInfo(`temperatureTextOf(formId="Hello World", c...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0109 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0110
     * @tc.name      FormExtAbility_TemperatureTextOf_0110
     * @tc.desc      temperatureTextOf(formId="Hello World", count=25) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0110 begin`);
      const actual: string = temperatureTextOf('Hello World', 25);
      logInfo(`temperatureTextOf(formId="Hello World", c...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0110 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0111
     * @tc.name      FormExtAbility_TemperatureTextOf_0111
     * @tc.desc      temperatureTextOf(formId="Hello World", count=30) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0111 begin`);
      const actual: string = temperatureTextOf('Hello World', 30);
      logInfo(`temperatureTextOf(formId="Hello World", c...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0111 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0112
     * @tc.name      FormExtAbility_TemperatureTextOf_0112
     * @tc.desc      temperatureTextOf(formId="Hello World", count=35) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0112 begin`);
      const actual: string = temperatureTextOf('Hello World', 35);
      logInfo(`temperatureTextOf(formId="Hello World", c...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0112 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0113
     * @tc.name      FormExtAbility_TemperatureTextOf_0113
     * @tc.desc      temperatureTextOf(formId="Hello World", count=40) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0113 begin`);
      const actual: string = temperatureTextOf('Hello World', 40);
      logInfo(`temperatureTextOf(formId="Hello World", c...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0113 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0114
     * @tc.name      FormExtAbility_TemperatureTextOf_0114
     * @tc.desc      temperatureTextOf(formId="Hello World", count=45) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0114 begin`);
      const actual: string = temperatureTextOf('Hello World', 45);
      logInfo(`temperatureTextOf(formId="Hello World", c...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0114 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0115
     * @tc.name      FormExtAbility_TemperatureTextOf_0115
     * @tc.desc      temperatureTextOf(formId="Hello World", count=50) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0115 begin`);
      const actual: string = temperatureTextOf('Hello World', 50);
      logInfo(`temperatureTextOf(formId="Hello World", c...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0115 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0116
     * @tc.name      FormExtAbility_TemperatureTextOf_0116
     * @tc.desc      temperatureTextOf(formId="Hello World", count=55) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0116 begin`);
      const actual: string = temperatureTextOf('Hello World', 55);
      logInfo(`temperatureTextOf(formId="Hello World", c...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0116 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0117
     * @tc.name      FormExtAbility_TemperatureTextOf_0117
     * @tc.desc      temperatureTextOf(formId="Hello World", count=60) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0117 begin`);
      const actual: string = temperatureTextOf('Hello World', 60);
      logInfo(`temperatureTextOf(formId="Hello World", c...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0117 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0118
     * @tc.name      FormExtAbility_TemperatureTextOf_0118
     * @tc.desc      temperatureTextOf(formId="Hello World", count=65) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0118 begin`);
      const actual: string = temperatureTextOf('Hello World', 65);
      logInfo(`temperatureTextOf(formId="Hello World", c...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0118 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0119
     * @tc.name      FormExtAbility_TemperatureTextOf_0119
     * @tc.desc      temperatureTextOf(formId="Hello World", count=70) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0119 begin`);
      const actual: string = temperatureTextOf('Hello World', 70);
      logInfo(`temperatureTextOf(formId="Hello World", c...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0119 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0120
     * @tc.name      FormExtAbility_TemperatureTextOf_0120
     * @tc.desc      temperatureTextOf(formId="Hello World", count=75) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0120 begin`);
      const actual: string = temperatureTextOf('Hello World', 75);
      logInfo(`temperatureTextOf(formId="Hello World", c...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0120 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0121
     * @tc.name      FormExtAbility_TemperatureTextOf_0121
     * @tc.desc      temperatureTextOf(formId="Hello World", count=80) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0121 begin`);
      const actual: string = temperatureTextOf('Hello World', 80);
      logInfo(`temperatureTextOf(formId="Hello World", c...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0121 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0122
     * @tc.name      FormExtAbility_TemperatureTextOf_0122
     * @tc.desc      temperatureTextOf(formId="Hello World", count=85) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0122 begin`);
      const actual: string = temperatureTextOf('Hello World', 85);
      logInfo(`temperatureTextOf(formId="Hello World", c...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0122 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0123
     * @tc.name      FormExtAbility_TemperatureTextOf_0123
     * @tc.desc      temperatureTextOf(formId="Hello World", count=90) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0123 begin`);
      const actual: string = temperatureTextOf('Hello World', 90);
      logInfo(`temperatureTextOf(formId="Hello World", c...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0123 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0124
     * @tc.name      FormExtAbility_TemperatureTextOf_0124
     * @tc.desc      temperatureTextOf(formId="Hello World", count=95) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0124 begin`);
      const actual: string = temperatureTextOf('Hello World', 95);
      logInfo(`temperatureTextOf(formId="Hello World", c...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0124 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0125
     * @tc.name      FormExtAbility_TemperatureTextOf_0125
     * @tc.desc      temperatureTextOf(formId="Hello World", count=105) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0125 begin`);
      const actual: string = temperatureTextOf('Hello World', 105);
      logInfo(`temperatureTextOf(formId="Hello World", c...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0125 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0126
     * @tc.name      FormExtAbility_TemperatureTextOf_0126
     * @tc.desc      temperatureTextOf(formId="Hello World", count=110) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0126 begin`);
      const actual: string = temperatureTextOf('Hello World', 110);
      logInfo(`temperatureTextOf(formId="Hello World", c...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0126 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0127
     * @tc.name      FormExtAbility_TemperatureTextOf_0127
     * @tc.desc      temperatureTextOf(formId="Hello World", count=-88) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0127 begin`);
      const actual: string = temperatureTextOf('Hello World', -88);
      logInfo(`temperatureTextOf(formId="Hello World", c...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0127 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0128
     * @tc.name      FormExtAbility_TemperatureTextOf_0128
     * @tc.desc      temperatureTextOf(formId="Hello World", count=-5) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0128 begin`);
      const actual: string = temperatureTextOf('Hello World', -5);
      logInfo(`temperatureTextOf(formId="Hello World", c...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0128 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0129
     * @tc.name      FormExtAbility_TemperatureTextOf_0129
     * @tc.desc      temperatureTextOf(formId="Hello World", count=-61) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0129 begin`);
      const actual: string = temperatureTextOf('Hello World', -61);
      logInfo(`temperatureTextOf(formId="Hello World", c...: actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0129 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0130
     * @tc.name      FormExtAbility_TemperatureTextOf_0130
     * @tc.desc      temperatureTextOf(formId=" ", count=0) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0130 begin`);
      const actual: string = temperatureTextOf(' ', 0);
      logInfo(`temperatureTextOf(formId=" ", count=0): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0130 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0131
     * @tc.name      FormExtAbility_TemperatureTextOf_0131
     * @tc.desc      temperatureTextOf(formId=" ", count=1) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0131', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0131 begin`);
      const actual: string = temperatureTextOf(' ', 1);
      logInfo(`temperatureTextOf(formId=" ", count=1): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0131 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0132
     * @tc.name      FormExtAbility_TemperatureTextOf_0132
     * @tc.desc      temperatureTextOf(formId=" ", count=2) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0132', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0132 begin`);
      const actual: string = temperatureTextOf(' ', 2);
      logInfo(`temperatureTextOf(formId=" ", count=2): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0132 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0133
     * @tc.name      FormExtAbility_TemperatureTextOf_0133
     * @tc.desc      temperatureTextOf(formId=" ", count=5) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0133', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0133 begin`);
      const actual: string = temperatureTextOf(' ', 5);
      logInfo(`temperatureTextOf(formId=" ", count=5): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0133 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0134
     * @tc.name      FormExtAbility_TemperatureTextOf_0134
     * @tc.desc      temperatureTextOf(formId=" ", count=10) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0134', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0134 begin`);
      const actual: string = temperatureTextOf(' ', 10);
      logInfo(`temperatureTextOf(formId=" ", count=10): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0134 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0135
     * @tc.name      FormExtAbility_TemperatureTextOf_0135
     * @tc.desc      temperatureTextOf(formId=" ", count=100) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0135', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0135 begin`);
      const actual: string = temperatureTextOf(' ', 100);
      logInfo(`temperatureTextOf(formId=" ", count=100): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0135 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0136
     * @tc.name      FormExtAbility_TemperatureTextOf_0136
     * @tc.desc      temperatureTextOf(formId=" ", count=-1) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0136', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0136 begin`);
      const actual: string = temperatureTextOf(' ', -1);
      logInfo(`temperatureTextOf(formId=" ", count=-1): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0136 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0137
     * @tc.name      FormExtAbility_TemperatureTextOf_0137
     * @tc.desc      temperatureTextOf(formId=" ", count=3) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0137', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0137 begin`);
      const actual: string = temperatureTextOf(' ', 3);
      logInfo(`temperatureTextOf(formId=" ", count=3): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0137 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0138
     * @tc.name      FormExtAbility_TemperatureTextOf_0138
     * @tc.desc      temperatureTextOf(formId=" ", count=15) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0138', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0138 begin`);
      const actual: string = temperatureTextOf(' ', 15);
      logInfo(`temperatureTextOf(formId=" ", count=15): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0138 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0139
     * @tc.name      FormExtAbility_TemperatureTextOf_0139
     * @tc.desc      temperatureTextOf(formId=" ", count=20) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0139', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0139 begin`);
      const actual: string = temperatureTextOf(' ', 20);
      logInfo(`temperatureTextOf(formId=" ", count=20): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0139 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0140
     * @tc.name      FormExtAbility_TemperatureTextOf_0140
     * @tc.desc      temperatureTextOf(formId=" ", count=25) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0140', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0140 begin`);
      const actual: string = temperatureTextOf(' ', 25);
      logInfo(`temperatureTextOf(formId=" ", count=25): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0140 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0141
     * @tc.name      FormExtAbility_TemperatureTextOf_0141
     * @tc.desc      temperatureTextOf(formId=" ", count=30) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0141', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0141 begin`);
      const actual: string = temperatureTextOf(' ', 30);
      logInfo(`temperatureTextOf(formId=" ", count=30): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0141 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0142
     * @tc.name      FormExtAbility_TemperatureTextOf_0142
     * @tc.desc      temperatureTextOf(formId=" ", count=35) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0142', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0142 begin`);
      const actual: string = temperatureTextOf(' ', 35);
      logInfo(`temperatureTextOf(formId=" ", count=35): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0142 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0143
     * @tc.name      FormExtAbility_TemperatureTextOf_0143
     * @tc.desc      temperatureTextOf(formId=" ", count=40) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0143', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0143 begin`);
      const actual: string = temperatureTextOf(' ', 40);
      logInfo(`temperatureTextOf(formId=" ", count=40): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0143 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0144
     * @tc.name      FormExtAbility_TemperatureTextOf_0144
     * @tc.desc      temperatureTextOf(formId=" ", count=45) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0144', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0144 begin`);
      const actual: string = temperatureTextOf(' ', 45);
      logInfo(`temperatureTextOf(formId=" ", count=45): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0144 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0145
     * @tc.name      FormExtAbility_TemperatureTextOf_0145
     * @tc.desc      temperatureTextOf(formId=" ", count=50) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0145', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0145 begin`);
      const actual: string = temperatureTextOf(' ', 50);
      logInfo(`temperatureTextOf(formId=" ", count=50): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0145 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0146
     * @tc.name      FormExtAbility_TemperatureTextOf_0146
     * @tc.desc      temperatureTextOf(formId=" ", count=55) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0146', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0146 begin`);
      const actual: string = temperatureTextOf(' ', 55);
      logInfo(`temperatureTextOf(formId=" ", count=55): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0146 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0147
     * @tc.name      FormExtAbility_TemperatureTextOf_0147
     * @tc.desc      temperatureTextOf(formId=" ", count=60) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0147', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0147 begin`);
      const actual: string = temperatureTextOf(' ', 60);
      logInfo(`temperatureTextOf(formId=" ", count=60): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0147 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0148
     * @tc.name      FormExtAbility_TemperatureTextOf_0148
     * @tc.desc      temperatureTextOf(formId=" ", count=65) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0148', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0148 begin`);
      const actual: string = temperatureTextOf(' ', 65);
      logInfo(`temperatureTextOf(formId=" ", count=65): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0148 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0149
     * @tc.name      FormExtAbility_TemperatureTextOf_0149
     * @tc.desc      temperatureTextOf(formId=" ", count=70) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0149', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0149 begin`);
      const actual: string = temperatureTextOf(' ', 70);
      logInfo(`temperatureTextOf(formId=" ", count=70): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0149 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0150
     * @tc.name      FormExtAbility_TemperatureTextOf_0150
     * @tc.desc      temperatureTextOf(formId=" ", count=75) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0150', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0150 begin`);
      const actual: string = temperatureTextOf(' ', 75);
      logInfo(`temperatureTextOf(formId=" ", count=75): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0150 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0151
     * @tc.name      FormExtAbility_TemperatureTextOf_0151
     * @tc.desc      temperatureTextOf(formId=" ", count=80) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0151', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0151 begin`);
      const actual: string = temperatureTextOf(' ', 80);
      logInfo(`temperatureTextOf(formId=" ", count=80): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0151 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0152
     * @tc.name      FormExtAbility_TemperatureTextOf_0152
     * @tc.desc      temperatureTextOf(formId=" ", count=85) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0152', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0152 begin`);
      const actual: string = temperatureTextOf(' ', 85);
      logInfo(`temperatureTextOf(formId=" ", count=85): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0152 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0153
     * @tc.name      FormExtAbility_TemperatureTextOf_0153
     * @tc.desc      temperatureTextOf(formId=" ", count=90) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0153', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0153 begin`);
      const actual: string = temperatureTextOf(' ', 90);
      logInfo(`temperatureTextOf(formId=" ", count=90): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0153 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0154
     * @tc.name      FormExtAbility_TemperatureTextOf_0154
     * @tc.desc      temperatureTextOf(formId=" ", count=95) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0154', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0154 begin`);
      const actual: string = temperatureTextOf(' ', 95);
      logInfo(`temperatureTextOf(formId=" ", count=95): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0154 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0155
     * @tc.name      FormExtAbility_TemperatureTextOf_0155
     * @tc.desc      temperatureTextOf(formId=" ", count=105) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0155', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0155 begin`);
      const actual: string = temperatureTextOf(' ', 105);
      logInfo(`temperatureTextOf(formId=" ", count=105): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0155 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0156
     * @tc.name      FormExtAbility_TemperatureTextOf_0156
     * @tc.desc      temperatureTextOf(formId=" ", count=110) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0156', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0156 begin`);
      const actual: string = temperatureTextOf(' ', 110);
      logInfo(`temperatureTextOf(formId=" ", count=110): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0156 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0157
     * @tc.name      FormExtAbility_TemperatureTextOf_0157
     * @tc.desc      temperatureTextOf(formId=" ", count=-88) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0157', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0157 begin`);
      const actual: string = temperatureTextOf(' ', -88);
      logInfo(`temperatureTextOf(formId=" ", count=-88): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0157 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0158
     * @tc.name      FormExtAbility_TemperatureTextOf_0158
     * @tc.desc      temperatureTextOf(formId=" ", count=-5) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0158', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0158 begin`);
      const actual: string = temperatureTextOf(' ', -5);
      logInfo(`temperatureTextOf(formId=" ", count=-5): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0158 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0159
     * @tc.name      FormExtAbility_TemperatureTextOf_0159
     * @tc.desc      temperatureTextOf(formId=" ", count=-61) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0159', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0159 begin`);
      const actual: string = temperatureTextOf(' ', -61);
      logInfo(`temperatureTextOf(formId=" ", count=-61): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0159 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0160
     * @tc.name      FormExtAbility_TemperatureTextOf_0160
     * @tc.desc      temperatureTextOf(formId="123", count=100) returns "13"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0160', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0160 begin`);
      const actual: string = temperatureTextOf('123', 100);
      logInfo(`temperatureTextOf(formId="123", count=100): actual=${actual}`);
      expect(actual).assertEqual('13');
      logInfo(`${BUNDLE}TemperatureTextOf_0160 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0161
     * @tc.name      FormExtAbility_TemperatureTextOf_0161
     * @tc.desc      temperatureTextOf(formId="123", count=15) returns "8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0161', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0161 begin`);
      const actual: string = temperatureTextOf('123', 15);
      logInfo(`temperatureTextOf(formId="123", count=15): actual=${actual}`);
      expect(actual).assertEqual('8');
      logInfo(`${BUNDLE}TemperatureTextOf_0161 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0162
     * @tc.name      FormExtAbility_TemperatureTextOf_0162
     * @tc.desc      temperatureTextOf(formId="123", count=20) returns "13"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0162', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0162 begin`);
      const actual: string = temperatureTextOf('123', 20);
      logInfo(`temperatureTextOf(formId="123", count=20): actual=${actual}`);
      expect(actual).assertEqual('13');
      logInfo(`${BUNDLE}TemperatureTextOf_0162 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0163
     * @tc.name      FormExtAbility_TemperatureTextOf_0163
     * @tc.desc      temperatureTextOf(formId="123", count=25) returns "8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0163', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0163 begin`);
      const actual: string = temperatureTextOf('123', 25);
      logInfo(`temperatureTextOf(formId="123", count=25): actual=${actual}`);
      expect(actual).assertEqual('8');
      logInfo(`${BUNDLE}TemperatureTextOf_0163 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0164
     * @tc.name      FormExtAbility_TemperatureTextOf_0164
     * @tc.desc      temperatureTextOf(formId="123", count=30) returns "3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0164', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0164 begin`);
      const actual: string = temperatureTextOf('123', 30);
      logInfo(`temperatureTextOf(formId="123", count=30): actual=${actual}`);
      expect(actual).assertEqual('3');
      logInfo(`${BUNDLE}TemperatureTextOf_0164 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0165
     * @tc.name      FormExtAbility_TemperatureTextOf_0165
     * @tc.desc      temperatureTextOf(formId="123", count=35) returns "8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0165', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0165 begin`);
      const actual: string = temperatureTextOf('123', 35);
      logInfo(`temperatureTextOf(formId="123", count=35): actual=${actual}`);
      expect(actual).assertEqual('8');
      logInfo(`${BUNDLE}TemperatureTextOf_0165 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0166
     * @tc.name      FormExtAbility_TemperatureTextOf_0166
     * @tc.desc      temperatureTextOf(formId="123", count=40) returns "13"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0166', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0166 begin`);
      const actual: string = temperatureTextOf('123', 40);
      logInfo(`temperatureTextOf(formId="123", count=40): actual=${actual}`);
      expect(actual).assertEqual('13');
      logInfo(`${BUNDLE}TemperatureTextOf_0166 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0167
     * @tc.name      FormExtAbility_TemperatureTextOf_0167
     * @tc.desc      temperatureTextOf(formId="123", count=45) returns "8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0167', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0167 begin`);
      const actual: string = temperatureTextOf('123', 45);
      logInfo(`temperatureTextOf(formId="123", count=45): actual=${actual}`);
      expect(actual).assertEqual('8');
      logInfo(`${BUNDLE}TemperatureTextOf_0167 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0168
     * @tc.name      FormExtAbility_TemperatureTextOf_0168
     * @tc.desc      temperatureTextOf(formId="123", count=50) returns "3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0168', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0168 begin`);
      const actual: string = temperatureTextOf('123', 50);
      logInfo(`temperatureTextOf(formId="123", count=50): actual=${actual}`);
      expect(actual).assertEqual('3');
      logInfo(`${BUNDLE}TemperatureTextOf_0168 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0169
     * @tc.name      FormExtAbility_TemperatureTextOf_0169
     * @tc.desc      temperatureTextOf(formId="123", count=55) returns "8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0169', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0169 begin`);
      const actual: string = temperatureTextOf('123', 55);
      logInfo(`temperatureTextOf(formId="123", count=55): actual=${actual}`);
      expect(actual).assertEqual('8');
      logInfo(`${BUNDLE}TemperatureTextOf_0169 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0170
     * @tc.name      FormExtAbility_TemperatureTextOf_0170
     * @tc.desc      temperatureTextOf(formId="123", count=60) returns "13"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0170', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0170 begin`);
      const actual: string = temperatureTextOf('123', 60);
      logInfo(`temperatureTextOf(formId="123", count=60): actual=${actual}`);
      expect(actual).assertEqual('13');
      logInfo(`${BUNDLE}TemperatureTextOf_0170 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0171
     * @tc.name      FormExtAbility_TemperatureTextOf_0171
     * @tc.desc      temperatureTextOf(formId="123", count=65) returns "8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0171', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0171 begin`);
      const actual: string = temperatureTextOf('123', 65);
      logInfo(`temperatureTextOf(formId="123", count=65): actual=${actual}`);
      expect(actual).assertEqual('8');
      logInfo(`${BUNDLE}TemperatureTextOf_0171 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0172
     * @tc.name      FormExtAbility_TemperatureTextOf_0172
     * @tc.desc      temperatureTextOf(formId="123", count=70) returns "3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0172', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0172 begin`);
      const actual: string = temperatureTextOf('123', 70);
      logInfo(`temperatureTextOf(formId="123", count=70): actual=${actual}`);
      expect(actual).assertEqual('3');
      logInfo(`${BUNDLE}TemperatureTextOf_0172 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0173
     * @tc.name      FormExtAbility_TemperatureTextOf_0173
     * @tc.desc      temperatureTextOf(formId="123", count=75) returns "8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0173', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0173 begin`);
      const actual: string = temperatureTextOf('123', 75);
      logInfo(`temperatureTextOf(formId="123", count=75): actual=${actual}`);
      expect(actual).assertEqual('8');
      logInfo(`${BUNDLE}TemperatureTextOf_0173 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0174
     * @tc.name      FormExtAbility_TemperatureTextOf_0174
     * @tc.desc      temperatureTextOf(formId="123", count=80) returns "13"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0174', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0174 begin`);
      const actual: string = temperatureTextOf('123', 80);
      logInfo(`temperatureTextOf(formId="123", count=80): actual=${actual}`);
      expect(actual).assertEqual('13');
      logInfo(`${BUNDLE}TemperatureTextOf_0174 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0175
     * @tc.name      FormExtAbility_TemperatureTextOf_0175
     * @tc.desc      temperatureTextOf(formId="123", count=85) returns "8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0175', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0175 begin`);
      const actual: string = temperatureTextOf('123', 85);
      logInfo(`temperatureTextOf(formId="123", count=85): actual=${actual}`);
      expect(actual).assertEqual('8');
      logInfo(`${BUNDLE}TemperatureTextOf_0175 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0176
     * @tc.name      FormExtAbility_TemperatureTextOf_0176
     * @tc.desc      temperatureTextOf(formId="123", count=90) returns "3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0176', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0176 begin`);
      const actual: string = temperatureTextOf('123', 90);
      logInfo(`temperatureTextOf(formId="123", count=90): actual=${actual}`);
      expect(actual).assertEqual('3');
      logInfo(`${BUNDLE}TemperatureTextOf_0176 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0177
     * @tc.name      FormExtAbility_TemperatureTextOf_0177
     * @tc.desc      temperatureTextOf(formId="123", count=95) returns "8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0177', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0177 begin`);
      const actual: string = temperatureTextOf('123', 95);
      logInfo(`temperatureTextOf(formId="123", count=95): actual=${actual}`);
      expect(actual).assertEqual('8');
      logInfo(`${BUNDLE}TemperatureTextOf_0177 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0178
     * @tc.name      FormExtAbility_TemperatureTextOf_0178
     * @tc.desc      temperatureTextOf(formId="123", count=105) returns "8"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0178', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0178 begin`);
      const actual: string = temperatureTextOf('123', 105);
      logInfo(`temperatureTextOf(formId="123", count=105): actual=${actual}`);
      expect(actual).assertEqual('8');
      logInfo(`${BUNDLE}TemperatureTextOf_0178 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0179
     * @tc.name      FormExtAbility_TemperatureTextOf_0179
     * @tc.desc      temperatureTextOf(formId="123", count=110) returns "3"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('FormExtAbility_TemperatureTextOf_0179', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0179 begin`);
      const actual: string = temperatureTextOf('123', 110);
      logInfo(`temperatureTextOf(formId="123", count=110): actual=${actual}`);
      expect(actual).assertEqual('3');
      logInfo(`${BUNDLE}TemperatureTextOf_0179 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0180
     * @tc.name      FormExtAbility_TemperatureTextOf_0180
     * @tc.desc      temperatureTextOf(formId="123", count=-61) returns "14"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0180', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0180 begin`);
      const actual: string = temperatureTextOf('123', -61);
      logInfo(`temperatureTextOf(formId="123", count=-61): actual=${actual}`);
      expect(actual).assertEqual('14');
      logInfo(`${BUNDLE}TemperatureTextOf_0180 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0181
     * @tc.name      FormExtAbility_TemperatureTextOf_0181
     * @tc.desc      temperatureTextOf(formId=" a ", count=0) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0181', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0181 begin`);
      const actual: string = temperatureTextOf(' a ', 0);
      logInfo(`temperatureTextOf(formId=" a ", count=0): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0181 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0182
     * @tc.name      FormExtAbility_TemperatureTextOf_0182
     * @tc.desc      temperatureTextOf(formId=" a ", count=1) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0182', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0182 begin`);
      const actual: string = temperatureTextOf(' a ', 1);
      logInfo(`temperatureTextOf(formId=" a ", count=1): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0182 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0183
     * @tc.name      FormExtAbility_TemperatureTextOf_0183
     * @tc.desc      temperatureTextOf(formId=" a ", count=2) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0183', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0183 begin`);
      const actual: string = temperatureTextOf(' a ', 2);
      logInfo(`temperatureTextOf(formId=" a ", count=2): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0183 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0184
     * @tc.name      FormExtAbility_TemperatureTextOf_0184
     * @tc.desc      temperatureTextOf(formId=" a ", count=5) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0184', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0184 begin`);
      const actual: string = temperatureTextOf(' a ', 5);
      logInfo(`temperatureTextOf(formId=" a ", count=5): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0184 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0185
     * @tc.name      FormExtAbility_TemperatureTextOf_0185
     * @tc.desc      temperatureTextOf(formId=" a ", count=10) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0185', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0185 begin`);
      const actual: string = temperatureTextOf(' a ', 10);
      logInfo(`temperatureTextOf(formId=" a ", count=10): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0185 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0186
     * @tc.name      FormExtAbility_TemperatureTextOf_0186
     * @tc.desc      temperatureTextOf(formId=" a ", count=100) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0186', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0186 begin`);
      const actual: string = temperatureTextOf(' a ', 100);
      logInfo(`temperatureTextOf(formId=" a ", count=100): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0186 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0187
     * @tc.name      FormExtAbility_TemperatureTextOf_0187
     * @tc.desc      temperatureTextOf(formId=" a ", count=-1) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0187', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0187 begin`);
      const actual: string = temperatureTextOf(' a ', -1);
      logInfo(`temperatureTextOf(formId=" a ", count=-1): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0187 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0188
     * @tc.name      FormExtAbility_TemperatureTextOf_0188
     * @tc.desc      temperatureTextOf(formId=" a ", count=3) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0188', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0188 begin`);
      const actual: string = temperatureTextOf(' a ', 3);
      logInfo(`temperatureTextOf(formId=" a ", count=3): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0188 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0189
     * @tc.name      FormExtAbility_TemperatureTextOf_0189
     * @tc.desc      temperatureTextOf(formId=" a ", count=15) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0189', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0189 begin`);
      const actual: string = temperatureTextOf(' a ', 15);
      logInfo(`temperatureTextOf(formId=" a ", count=15): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0189 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0190
     * @tc.name      FormExtAbility_TemperatureTextOf_0190
     * @tc.desc      temperatureTextOf(formId=" a ", count=20) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0190', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0190 begin`);
      const actual: string = temperatureTextOf(' a ', 20);
      logInfo(`temperatureTextOf(formId=" a ", count=20): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0190 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0191
     * @tc.name      FormExtAbility_TemperatureTextOf_0191
     * @tc.desc      temperatureTextOf(formId=" a ", count=25) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0191', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0191 begin`);
      const actual: string = temperatureTextOf(' a ', 25);
      logInfo(`temperatureTextOf(formId=" a ", count=25): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0191 end`);
    });

    /**
     * @tc.number    SUB_FORMEXTABILITY_TEMPERATURE_TEXT_OF_0192
     * @tc.name      FormExtAbility_TemperatureTextOf_0192
     * @tc.desc      temperatureTextOf(formId=" a ", count=30) returns "NaN"
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('FormExtAbility_TemperatureTextOf_0192', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, (): void => {
      logInfo(`${BUNDLE}TemperatureTextOf_0192 begin`);
      const actual: string = temperatureTextOf(' a ', 30);
      logInfo(`temperatureTextOf(formId=" a ", count=30): actual=${actual}`);
      expect(actual).assertEqual('NaN');
      logInfo(`${BUNDLE}TemperatureTextOf_0192 end`);
    });
  });
}
