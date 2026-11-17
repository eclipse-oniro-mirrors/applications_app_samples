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
import dlpSandboxTest from './DlpSandbox.test';
import dlpApiContractTest from './DlpApiContract.test';
import dlpApiReadOnlyPart01Test from './DlpApiReadOnlyPart01.test';
import dlpApiReadOnlyPart02Test from './DlpApiReadOnlyPart02.test';
import dlpApiStateTest from './DlpApiState.test';
import dlpApiFinalTest from './DlpApiFinal.test';
import dlpApiVolumePart01Test from './DlpApiVolumePart01.test';
import dlpApiVolumePart02Test from './DlpApiVolumePart02.test';
import dlpApiVolumePart03Test from './DlpApiVolumePart03.test';

export default function testsuite() {
  abilityTest();
  dlpSandboxTest();
  dlpApiContractTest();
  dlpApiReadOnlyPart01Test();
  dlpApiReadOnlyPart02Test();
  dlpApiStateTest();
  dlpApiFinalTest();
  dlpApiVolumePart01Test();
  dlpApiVolumePart02Test();
  dlpApiVolumePart03Test();
}

