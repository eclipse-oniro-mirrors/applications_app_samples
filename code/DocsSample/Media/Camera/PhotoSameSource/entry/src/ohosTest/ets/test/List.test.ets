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
import dateTimeFormatMatrixPart1Test from './DateTimeFormatMatrixPart1.test';
import dateTimeFormatMatrixPart2Test from './DateTimeFormatMatrixPart2.test';
import dateTimeVideoMatrixPart1Test from './DateTimeVideoMatrixPart1.test';
import globalContextMatrixPart1Test from './GlobalContextMatrixPart1.test';
import cameraServiceStateMatrixPart1Test from './CameraServiceStateMatrixPart1.test';
import loggerContractMatrixPart1Test from './LoggerContractMatrixPart1.test';
import photoUiCatalogPart1Test from './PhotoUiCatalogPart1.test';

import cameraProfileMatrixPart1Test from './CameraProfileMatrixPart1.test';
import dateTimeExtremeMatrixPart1Test from './DateTimeExtremeMatrixPart1.test';
import globalContextExtendPart1Test from './GlobalContextExtendPart1.test';
import cameraGuardMatrixPart1Test from './CameraGuardMatrixPart1.test';
import blurAnimateStateMatrixPart1Test from './BlurAnimateStateMatrixPart1.test';
import photoUiInteractionPart1Test from './PhotoUiInteractionPart1.test';

export default function testsuite() {
  abilityTest();
  dateTimeFormatMatrixPart1Test();
  dateTimeFormatMatrixPart2Test();
  dateTimeVideoMatrixPart1Test();
  globalContextMatrixPart1Test();
  cameraServiceStateMatrixPart1Test();
  loggerContractMatrixPart1Test();
  cameraProfileMatrixPart1Test();
  dateTimeExtremeMatrixPart1Test();
  globalContextExtendPart1Test();
  cameraGuardMatrixPart1Test();
  blurAnimateStateMatrixPart1Test();
  photoUiCatalogPart1Test();
  photoUiInteractionPart1Test();
}