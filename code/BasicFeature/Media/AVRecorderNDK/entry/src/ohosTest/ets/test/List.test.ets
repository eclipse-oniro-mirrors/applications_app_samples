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

import abilityTest from './Ability.test';
import dateTimeFillMatrixPart1Test from './DateTimeFillMatrixPart1.test';
import dateTimeFillMatrixPart2Test from './DateTimeFillMatrixPart2.test';
import dateTimeFillMatrixPart3Test from './DateTimeFillMatrixPart3.test';
import dateTimeFillMatrixPart4Test from './DateTimeFillMatrixPart4.test';
import dateTimeConcatDateMatrixPart1Test from './DateTimeConcatDateMatrixPart1.test';
import dateTimeConcatDateMatrixPart2Test from './DateTimeConcatDateMatrixPart2.test';
import dateTimeConcatDateMatrixPart3Test from './DateTimeConcatDateMatrixPart3.test';
import dateTimeConcatDateMatrixPart4Test from './DateTimeConcatDateMatrixPart4.test';
import dateTimeConcatTimeMatrixPart1Test from './DateTimeConcatTimeMatrixPart1.test';
import dateTimeConcatTimeMatrixPart2Test from './DateTimeConcatTimeMatrixPart2.test';
import dateTimeConcatTimeMatrixPart3Test from './DateTimeConcatTimeMatrixPart3.test';
import dateTimeConcatTimeMatrixPart4Test from './DateTimeConcatTimeMatrixPart4.test';
import dateTimeCountdownMatrixPart1Test from './DateTimeCountdownMatrixPart1.test';
import dateTimeCountdownMatrixPart2Test from './DateTimeCountdownMatrixPart2.test';
import dateTimeCountdownMatrixPart3Test from './DateTimeCountdownMatrixPart3.test';
import dateTimeCountdownMatrixPart4Test from './DateTimeCountdownMatrixPart4.test';
import dateTimeBoundaryPart1Test from './DateTimeBoundaryPart1.test';
import dateTimePerfPart1Test from './DateTimePerfPart1.test';
import dateTimeStabilityPart1Test from './DateTimeStabilityPart1.test';
import dateTimeIntegrationPart1Test from './DateTimeIntegrationPart1.test';
import dateTimeIntegrationPart2Test from './DateTimeIntegrationPart2.test';
import resolutionCompatibilityPart1Test from './ResolutionCompatibilityPart1.test';
import loggerI18nPart1Test from './LoggerI18nPart1.test';

export default function testsuite() {
  abilityTest();
  dateTimeFillMatrixPart1Test();
  dateTimeFillMatrixPart2Test();
  dateTimeFillMatrixPart3Test();
  dateTimeFillMatrixPart4Test();
  dateTimeConcatDateMatrixPart1Test();
  dateTimeConcatDateMatrixPart2Test();
  dateTimeConcatDateMatrixPart3Test();
  dateTimeConcatDateMatrixPart4Test();
  dateTimeConcatTimeMatrixPart1Test();
  dateTimeConcatTimeMatrixPart2Test();
  dateTimeConcatTimeMatrixPart3Test();
  dateTimeConcatTimeMatrixPart4Test();
  dateTimeCountdownMatrixPart1Test();
  dateTimeCountdownMatrixPart2Test();
  dateTimeCountdownMatrixPart3Test();
  dateTimeCountdownMatrixPart4Test();
  dateTimeBoundaryPart1Test();
  dateTimePerfPart1Test();
  dateTimeStabilityPart1Test();
  dateTimeIntegrationPart1Test();
  dateTimeIntegrationPart2Test();
  resolutionCompatibilityPart1Test();
  loggerI18nPart1Test();
}