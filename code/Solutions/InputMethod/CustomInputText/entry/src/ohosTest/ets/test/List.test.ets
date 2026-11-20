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

import abilityLaunchTest from './ui/AbilityLaunchTest.test';
import homeLayoutUiTest from './ui/HomeLayoutUiTest.test';
import editingFlowUiTest from './ui/EditingFlowUiTest.test';
import insertTextEditingTest from './model/InsertTextEditingTest.test';
import deleteLeftEditingTest from './model/DeleteLeftEditingTest.test';
import deleteRightEditingTest from './model/DeleteRightEditingTest.test';
import moveCursorEditingTest from './model/MoveCursorEditingTest.test';
import selectByMovementTest from './model/SelectByMovementTest.test';
import selectByRangeTest from './model/SelectByRangeTest.test';
import extendActionCommandTest from './model/ExtendActionCommandTest.test';
import calculateCursorTest from './model/CalculateCursorTest.test';
import cursorGeometryAndWidthTest from './model/CursorGeometryAndWidthTest.test';
import cursorMeasurementTest from './model/CursorMeasurementTest.test';
import textCompositionContractTest001 from './model/TextCompositionContractTest001.test';
import textCompositionContractTest002 from './model/TextCompositionContractTest002.test';
import textCompositionContractTest003 from './model/TextCompositionContractTest003.test';
import textInvariantPropertyTest from './model/TextInvariantPropertyTest.test';
import textInvariantPropertyExtraTest from './model/TextInvariantPropertyExtraTest.test';
import textUnicodeEditingTest from './model/TextUnicodeEditingTest.test';
import textUnicodeEditingExtraTest from './model/TextUnicodeEditingExtraTest.test';
import textUnicodeEditingExtendedTest from './model/TextUnicodeEditingExtendedTest.test';
import attributeMappingTest from './model/AttributeMappingTest.test';
import pageControlsTest from './model/PageControlsTest.test';
import pageSessionLifecycleTest001 from './model/PageSessionLifecycleTest001.test';
import pageSessionLifecycleTest002 from './model/PageSessionLifecycleTest002.test';
import pageSessionLifecycleTest003 from './model/PageSessionLifecycleTest003.test';
import inputMethodApiContractTest from './api/InputMethodApiContractTest.test';
import inputMethodApiContractExtraTest from './api/InputMethodApiContractExtraTest.test';
import inputMethodApiContractExtendedTest from './api/InputMethodApiContractExtendedTest.test';
import bundleDisplayLoggerContractTest from './api/BundleDisplayLoggerContractTest.test';
import bundleDisplayLoggerContractExtraTest from './api/BundleDisplayLoggerContractExtraTest.test';

export default function testsuite() {
  // UI suites run first so that the initial-state assertions see a freshly launched app.
  abilityLaunchTest();
  homeLayoutUiTest();
  editingFlowUiTest();
  // Editing state machine suites.
  insertTextEditingTest();
  deleteLeftEditingTest();
  deleteRightEditingTest();
  moveCursorEditingTest();
  selectByMovementTest();
  selectByRangeTest();
  extendActionCommandTest();
  calculateCursorTest();
  cursorGeometryAndWidthTest();
  cursorMeasurementTest();
  textCompositionContractTest001();
  textCompositionContractTest002();
  textCompositionContractTest003();
  textInvariantPropertyTest();
  textInvariantPropertyExtraTest();
  textUnicodeEditingTest();
  textUnicodeEditingExtraTest();
  textUnicodeEditingExtendedTest();
  // Page state and attribute mapping suites.
  attributeMappingTest();
  pageControlsTest();
  pageSessionLifecycleTest001();
  pageSessionLifecycleTest002();
  pageSessionLifecycleTest003();
  // API contract suites.
  inputMethodApiContractTest();
  inputMethodApiContractExtraTest();
  inputMethodApiContractExtendedTest();
  bundleDisplayLoggerContractTest();
  bundleDisplayLoggerContractExtraTest();
}
