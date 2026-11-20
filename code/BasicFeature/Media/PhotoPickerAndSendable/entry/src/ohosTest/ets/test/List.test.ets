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

import photoPickerAndSendableTest from './PhotoPickerAndSendable.test';
import formatUtilMatrixTest from './FormatUtilMatrix.test';
import sceneEntryModelTest from './SceneEntryModel.test';
import selectionStoreTestsuite from './SelectionStoreState.test';
import stringUtilsSuiteTest from './StringUtilsSuite.test';
import numberArrayUtilsTest from './NumberArrayUtils.test';
import dateColorUtilsTest from './DateColorUtils.test';
import jsonValidateUtilsTest from './JsonValidateUtils.test';
import objectRandomUtilsTest from './ObjectRandomUtils.test';
import throttleUtilsSuiteTest from './ThrottleUtilsSuite.test';
import pickerOptionFactorySuiteTest from './PickerOptionFactorySuite.test';
import mediaModelsSuiteTest from './MediaModelsSuite.test';
import colorMatrixBoundaryTest from './ColorMatrixBoundary.test';
import arrayUtilsMatrixTest from './ArrayUtilsMatrix.test';
import arrayUtilsEdgeTest from './ArrayUtilsEdge.test';
import colorUtilsMatrixTest from './ColorUtilsMatrix.test';
import colorUtilsEdgeTest from './ColorUtilsEdge.test';
import colorMatrixUtilMatrixTest from './ColorMatrixUtilMatrix.test';
import dateUtilsMatrixTest from './DateUtilsMatrix.test';
import preferencesUtilsMatrixTest from './PreferencesUtilsMatrix.test';
import preferencesUtilsEdgeTest from './PreferencesUtilsEdge.test';
import sandboxStoreMatrixTest from './SandboxStoreMatrix.test';
import selectionStoreMatrixTest from './SelectionStoreMatrix.test';
import sceneEntryFormatMatrixTest from './SceneEntryFormatMatrix.test';
import dataModelEdgeTest from './DataModelEdge.test';
import numberUtilsMatrixTest from './NumberUtilsMatrix.test';
import numberUtilsEdgeTest from './NumberUtilsEdge.test';
import randomUtilsMatrixTest from './RandomUtilsMatrix.test';
import objectUtilsMatrixTest from './ObjectUtilsMatrix.test';
import deviceUtilsMatrixTest from './DeviceUtilsMatrix.test';
import loggerTraceMatrixTest from './LoggerTraceMatrix.test';
import validateUtilsMatrixTest from './ValidateUtilsMatrix.test';
import validateUtilsEdgeTest from './ValidateUtilsEdge.test';
import jsonUtilsMatrixTest from './JsonUtilsMatrix.test';
import jsonUtilsEdgeTest from './JsonUtilsEdge.test';
import fileUtilsMatrixTest from './FileUtilsMatrix.test';
import fileUtilsEdgeTest from './FileUtilsEdge.test';
import stringUtilsMatrixTest from './StringUtilsMatrix.test';
import stringUtilsEdgeTest from './StringUtilsEdge.test';
import throttleUtilsMatrixTest from './ThrottleUtilsMatrix.test';
import mediaModelsExtraTest from './MediaModelsExtra.test';
import pickerOptionFactoryEdgeTest from './PickerOptionFactoryEdge.test';
import imageTaskMatrixTest from './ImageTaskMatrix.test';

/**
 * Entry point of the ohosTest suite, called by hyperscorp/hypium through the test runner.
 */
export default function testsuite() {
  // Register every case of the single suite owned by this module.
  photoPickerAndSendableTest();
  // Entry data layer: byte/time/percent formatting and scene route models.
  formatUtilMatrixTest();
  sceneEntryModelTest();
  // Cross-scene selection state machine.
  selectionStoreTestsuite();
  // Library utility suites: strings, numbers, arrays, dates and colors.
  stringUtilsSuiteTest();
  numberArrayUtilsTest();
  dateColorUtilsTest();
  // Library validation-oriented suites: json, object, random and throttle helpers.
  jsonValidateUtilsTest();
  objectRandomUtilsTest();
  throttleUtilsSuiteTest();
  // Library feature suites: picker option factory, media models and color matrix edges.
  pickerOptionFactorySuiteTest();
  mediaModelsSuiteTest();
  colorMatrixBoundaryTest();
  // Matrix/edge suites for array, color, date and color-matrix helpers.
  arrayUtilsMatrixTest();
  arrayUtilsEdgeTest();
  colorUtilsMatrixTest();
  colorUtilsEdgeTest();
  colorMatrixUtilMatrixTest();
  dateUtilsMatrixTest();
  // Matrix/edge suites for preferences, sandbox store, selection store and data models.
  preferencesUtilsMatrixTest();
  preferencesUtilsEdgeTest();
  sandboxStoreMatrixTest();
  selectionStoreMatrixTest();
  sceneEntryFormatMatrixTest();
  dataModelEdgeTest();
  // Matrix/edge suites for number, random, object, device, logger and trace helpers.
  numberUtilsMatrixTest();
  numberUtilsEdgeTest();
  randomUtilsMatrixTest();
  objectUtilsMatrixTest();
  deviceUtilsMatrixTest();
  loggerTraceMatrixTest();
  // Matrix/edge suites for validation, json and file helpers.
  validateUtilsMatrixTest();
  validateUtilsEdgeTest();
  jsonUtilsMatrixTest();
  jsonUtilsEdgeTest();
  fileUtilsMatrixTest();
  fileUtilsEdgeTest();
  // Matrix/edge suites for string, throttle, media models, picker options and image tasks.
  stringUtilsMatrixTest();
  stringUtilsEdgeTest();
  throttleUtilsMatrixTest();
  mediaModelsExtraTest();
  pickerOptionFactoryEdgeTest();
  imageTaskMatrixTest();
}
