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

import dateTimeZeroCoreTest from './DateTimeZeroCore.test';
import dateTimeSecondsCoreTest from './DateTimeSecondsCore.test';
import dateTimeMinutesCoreTest from './DateTimeMinutesCore.test';
import dateTimeBoundaryCoreTest from './DateTimeBoundaryCore.test';
import dateTimeFormatCoreTest from './DateTimeFormatCore.test';
import dateTimeFillCoreTest from './DateTimeFillCore.test';
import concatTimeCoreTest from './ConcatTimeCore.test';
import concatDateCoreTest from './ConcatDateCore.test';
import resolutionDefaultsCoreTest from './ResolutionDefaultsCore.test';
import resolutionFieldsCoreTest from './ResolutionFieldsCore.test';
import resolutionIndependenceCoreTest from './ResolutionIndependenceCore.test';
import loggerDebugCoreTest from './LoggerDebugCore.test';
import loggerInfoCoreTest from './LoggerInfoCore.test';
import loggerWarnCoreTest from './LoggerWarnCore.test';
import loggerErrorCoreTest from './LoggerErrorCore.test';
import loggerEmptyCoreTest from './LoggerEmptyCore.test';
import dateTimeStabilityCoreTest from './DateTimeStabilityCore.test';
import dateTimePerfCoreTest from './DateTimePerfCore.test';
import dateTimeUniquenessCoreTest from './DateTimeUniquenessCore.test';
import dateTimeExtremesCoreTest from './DateTimeExtremesCore.test';

export default function testsuite() {
  abilityTest();
  dateTimeZeroCoreTest();
  dateTimeSecondsCoreTest();
  dateTimeMinutesCoreTest();
  dateTimeBoundaryCoreTest();
  dateTimeFormatCoreTest();
  dateTimeFillCoreTest();
  concatTimeCoreTest();
  concatDateCoreTest();
  resolutionDefaultsCoreTest();
  resolutionFieldsCoreTest();
  resolutionIndependenceCoreTest();
  loggerDebugCoreTest();
  loggerInfoCoreTest();
  loggerWarnCoreTest();
  loggerErrorCoreTest();
  loggerEmptyCoreTest();
  dateTimeStabilityCoreTest();
  dateTimePerfCoreTest();
  dateTimeUniquenessCoreTest();
  dateTimeExtremesCoreTest();
}