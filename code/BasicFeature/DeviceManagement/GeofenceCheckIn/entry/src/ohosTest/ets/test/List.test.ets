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


import { beforeEachIt } from '@ohos/hypium';

// Logic suites run first, then the storage and UI suites, so the page flows
// always start from the clean device state prepared by the logic suites.
import typesLogicTest from './GeofenceTypes.test.ets';
import timeUtilLogicTest from './TimeUtil.test.ets';
import basicUtilLogicTest from './BasicUtil.test.ets';
import geofenceValidationLogicTest from './GeofenceValidation.test.ets';
import fileSecurityLogicTest from './FileSecurityUtil.test.ets';
import runtimeNetLogicTest from './RuntimeNetUtil.test.ets';
import recordStoreLogicTest from './RecordStore.test.ets';
import basicUtilArrayMatrixTest from './BasicUtilArrayMatrix.test.ets';
import basicUtilNumberExhaustiveTest from './BasicUtilNumberExhaustive.test.ets';
import basicUtilStringDeepExhaustiveTest from './BasicUtilStringDeepExhaustive.test.ets';
import basicUtilStringExhaustiveTest from './BasicUtilStringExhaustive.test.ets';
import basicUtilStringMatrixTest from './BasicUtilStringMatrix.test.ets';
import basicUtilValidationMatrixTest from './BasicUtilValidationMatrix.test.ets';
import fileSecurityEncodingExhaustiveTest from './FileSecurityEncodingExhaustive.test.ets';
import fileSecurityEncodingMatrixTest from './FileSecurityEncodingMatrix.test.ets';
import fixtureFactoryTest from './FixtureFactory.test.ets';
import geoGridMatrixTest from './GeoGrid.test.ets';
import geoGridDeepExhaustiveTest from './GeoGridDeepExhaustive.test.ets';
import geoGridExhaustiveTest from './GeoGridExhaustive.test.ets';
import geofenceConfigCartesianMatrixTest from './GeofenceConfigCartesianMatrix.test.ets';
import numberFormatMatrixTest from './NumberFormat.test.ets';
import numberFormatDeepExhaustiveTest from './NumberFormatDeepExhaustive.test.ets';
import numberFormatExhaustiveTest from './NumberFormatExhaustive.test.ets';
import numberPuzzleMatrixTest from './NumberPuzzle.test.ets';
import numberPuzzleDeepExhaustiveTest from './NumberPuzzleDeepExhaustive.test.ets';
import numberPuzzleExhaustiveTest from './NumberPuzzleExhaustive.test.ets';
import numberSequenceMatrixTest from './NumberSequence.test.ets';
import numberStatisticsMatrixTest from './NumberStatistics.test.ets';
import numberStatisticsExhaustiveTest from './NumberStatisticsExhaustive.test.ets';
import numericMatrixTest from './NumericMatrix.test.ets';
import numericStringMatrixTest from './NumericString.test.ets';
import numericStringExhaustiveTest from './NumericStringExhaustive.test.ets';
import recordStoreMatrixTest from './RecordStoreMatrix.test.ets';
import timeCombinationMatrixTest from './TimeCombinationMatrix.test.ets';
import timeDurationDeepExhaustiveTest from './TimeDurationDeepExhaustive.test.ets';
import timeExhaustiveMatrixTest from './TimeExhaustiveMatrix.test.ets';
import timeFormatDeepExhaustiveTest from './TimeFormatDeepExhaustive.test.ets';
import timePadMatrixTest from './TimePadMatrix.test.ets';
import validationDeepExhaustiveTest from './ValidationDeepExhaustive.test.ets';
import validationExhaustiveMatrixTest from './ValidationExhaustiveMatrix.test.ets';
import geofenceCheckInTest from './GeofenceCheckIn.test.ets';

// 1 ms, not 0: libuv may run a 0 ms timer in the same pass, which would not yield.
const EVENT_LOOP_YIELD_MS: number = 1;

// Hypium chains sync cases via microtasks only; yielding before each lets the main-thread watchdog run.
async function yieldToEventLoop(): Promise<void> {
  await new Promise<void>((resolve: () => void) => {
    setTimeout(resolve, EVENT_LOOP_YIELD_MS);
  });
}

export default function testsuite() {
  // DevEco's static case scan drops every suite if testsuite() holds anything but plain calls.
  beforeEachIt(yieldToEventLoop);
  typesLogicTest();
  timeUtilLogicTest();
  basicUtilLogicTest();
  geofenceValidationLogicTest();
  fileSecurityLogicTest();
  runtimeNetLogicTest();
  recordStoreLogicTest();
  basicUtilArrayMatrixTest();
  basicUtilNumberExhaustiveTest();
  basicUtilStringDeepExhaustiveTest();
  basicUtilStringExhaustiveTest();
  basicUtilStringMatrixTest();
  basicUtilValidationMatrixTest();
  fileSecurityEncodingExhaustiveTest();
  fileSecurityEncodingMatrixTest();
  fixtureFactoryTest();
  geoGridMatrixTest();
  geoGridDeepExhaustiveTest();
  geoGridExhaustiveTest();
  geofenceConfigCartesianMatrixTest();
  numberFormatMatrixTest();
  numberFormatDeepExhaustiveTest();
  numberFormatExhaustiveTest();
  numberPuzzleMatrixTest();
  numberPuzzleDeepExhaustiveTest();
  numberPuzzleExhaustiveTest();
  numberSequenceMatrixTest();
  numberStatisticsMatrixTest();
  numberStatisticsExhaustiveTest();
  numericMatrixTest();
  numericStringMatrixTest();
  numericStringExhaustiveTest();
  recordStoreMatrixTest();
  timeCombinationMatrixTest();
  timeDurationDeepExhaustiveTest();
  timeExhaustiveMatrixTest();
  timeFormatDeepExhaustiveTest();
  timePadMatrixTest();
  validationDeepExhaustiveTest();
  validationExhaustiveMatrixTest();
  geofenceCheckInTest();
}
