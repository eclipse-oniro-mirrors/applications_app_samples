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

import radioNetStateReal01Suite from './RadioNetStateReal01.test';
import radioTechReal01Suite from './RadioTechReal01.test';
import radioSignalReal01Suite from './RadioSignalReal01.test';
import radioSimInfoReal01Suite from './RadioSimInfoReal01.test';
import radioSlotReal01Suite from './RadioSlotReal01.test';
import radioIntegrationReal01Suite from './RadioIntegrationReal01.test';
import radioBoundaryReal01Suite from './RadioBoundaryReal01.test';
import radioIsoInvalid01Suite from './RadioIsoInvalid01.test';
import radioIsoLower04Suite from './RadioIsoLower04.test';
import radioIsoLower05Suite from './RadioIsoLower05.test';
import radioIsoLower06Suite from './RadioIsoLower06.test';
import radioIsoUpper01Suite from './RadioIsoUpper01.test';
import radioIsoUpper02Suite from './RadioIsoUpper02.test';
import radioIsoUpper03Suite from './RadioIsoUpper03.test';
import radioNetStateFormat01Suite from './RadioNetStateFormat01.test';
import radioNetStateFormat02Suite from './RadioNetStateFormat02.test';
import radioNetStateFormat03Suite from './RadioNetStateFormat03.test';
import radioNetStateNsa01Suite from './RadioNetStateNsa01.test';
import radioNetStateOperator01Suite from './RadioNetStateOperator01.test';
import radioNetStatePlmn01Suite from './RadioNetStatePlmn01.test';
import radioNetStateReg01Suite from './RadioNetStateReg01.test';
import radioSelectionMode01Suite from './RadioSelectionMode01.test';
import radioSignalFormat01Suite from './RadioSignalFormat01.test';
import radioSignalLevel01Suite from './RadioSignalLevel01.test';
import radioSignalList04Suite from './RadioSignalList04.test';
import radioSignalList05Suite from './RadioSignalList05.test';
import radioSignalType01Suite from './RadioSignalType01.test';
import radioSlotParse01Suite from './RadioSlotParse01.test';
import radioSlotTitle01Suite from './RadioSlotTitle01.test';
import radioSlotValid01Suite from './RadioSlotValid01.test';
import radioSpn01Suite from './RadioSpn01.test';
import radioSpn02Suite from './RadioSpn02.test';
import radioTechName01Suite from './RadioTechName01.test';
import radioTechPair02Suite from './RadioTechPair02.test';
import radioTechPair03Suite from './RadioTechPair03.test';

export default function testsuite() {
  radioNetStateReal01Suite();
  radioTechReal01Suite();
  radioSignalReal01Suite();
  radioSimInfoReal01Suite();
  radioSlotReal01Suite();
  radioIntegrationReal01Suite();
  radioBoundaryReal01Suite();
  radioIsoInvalid01Suite();
  radioIsoLower04Suite();
  radioIsoLower05Suite();
  radioIsoLower06Suite();
  radioIsoUpper01Suite();
  radioIsoUpper02Suite();
  radioIsoUpper03Suite();
  radioNetStateFormat01Suite();
  radioNetStateFormat02Suite();
  radioNetStateFormat03Suite();
  radioNetStateNsa01Suite();
  radioNetStateOperator01Suite();
  radioNetStatePlmn01Suite();
  radioNetStateReg01Suite();
  radioSelectionMode01Suite();
  radioSignalFormat01Suite();
  radioSignalLevel01Suite();
  radioSignalList04Suite();
  radioSignalList05Suite();
  radioSignalType01Suite();
  radioSlotParse01Suite();
  radioSlotTitle01Suite();
  radioSlotValid01Suite();
  radioSpn01Suite();
  radioSpn02Suite();
  radioTechName01Suite();
  radioTechPair02Suite();
  radioTechPair03Suite();
}
