/*
 * Copyright (c) 2022-2026 Huawei Device Co., Ltd.
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
import phoneVolume01Test from './PhoneVolume01.test';
import phoneVolume02Test from './PhoneVolume02.test';
import phoneVolume03Test from './PhoneVolume03.test';
import phoneVolume04Test from './PhoneVolume04.test';
import phoneVolume05Test from './PhoneVolume05.test';
import phoneVolume06Test from './PhoneVolume06.test';
import phoneVolume07Test from './PhoneVolume07.test';
import phoneVolume08Test from './PhoneVolume08.test';
import phoneVolume09Test from './PhoneVolume09.test';
import phoneBoundaryVolume01Test from './PhoneBoundaryVolume01.test';
import phoneInvalidVolume01Test from './PhoneInvalidVolume01.test';
import phoneExtremeVolume01Test from './PhoneExtremeVolume01.test';
import compareVolume01Test from './CompareVolume01.test';
import compareVolume02Test from './CompareVolume02.test';
import compareVolume03Test from './CompareVolume03.test';
import compareVolume04Test from './CompareVolume04.test';
import compareVolume05Test from './CompareVolume05.test';
import fieldVolume01Test from './FieldVolume01.test';
import fieldVolume02Test from './FieldVolume02.test';
import fieldVolume03Test from './FieldVolume03.test';
import fieldVolume04Test from './FieldVolume04.test';
import fieldVolume05Test from './FieldVolume05.test';
import fieldVolume06Test from './FieldVolume06.test';
import apiVolume01Test from './ApiVolume01.test';
import phoneReal01Test from './PhoneReal01.test';
import phoneReal02Test from './PhoneReal02.test';
import compareReal01Test from './CompareReal01.test';
import fieldReal01Test from './FieldReal01.test';
import tabReal01Test from './TabReal01.test';
import paramReal01Test from './ParamReal01.test';
import apiReal01Test from './ApiReal01.test';
import formUiTest from './FormUi.test';
import flowUiTest from './FlowUi.test';

export default function testsuite() {
  abilityTest();
  phoneVolume01Test();
  phoneVolume02Test();
  phoneVolume03Test();
  phoneVolume04Test();
  phoneVolume05Test();
  phoneVolume06Test();
  phoneVolume07Test();
  phoneVolume08Test();
  phoneVolume09Test();
  phoneBoundaryVolume01Test();
  phoneInvalidVolume01Test();
  phoneExtremeVolume01Test();
  compareVolume01Test();
  compareVolume02Test();
  compareVolume03Test();
  compareVolume04Test();
  compareVolume05Test();
  fieldVolume01Test();
  fieldVolume02Test();
  fieldVolume03Test();
  fieldVolume04Test();
  fieldVolume05Test();
  fieldVolume06Test();
  apiVolume01Test();
  phoneReal01Test();
  phoneReal02Test();
  compareReal01Test();
  fieldReal01Test();
  tabReal01Test();
  paramReal01Test();
  apiReal01Test();
  formUiTest();
  flowUiTest();
}
