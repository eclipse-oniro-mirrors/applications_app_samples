/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import breakpointTypeCoreTest from './BreakpointTypeCore.test';
import modelSpecCoreTest from './ModelSpecCore.test';
import bpNumVol01Test from './BpNumVol01.test';
import bpNumVol02Test from './BpNumVol02.test';
import bpStrVol01Test from './BpStrVol01.test';
import bpStrVol02Test from './BpStrVol02.test';
import bpResVol01Test from './BpResVol01.test';
import bpResVol02Test from './BpResVol02.test';
import bpArrVol01Test from './BpArrVol01.test';
import bpArrVol02Test from './BpArrVol02.test';
import bpInvVol01Test from './BpInvVol01.test';
import modelVol01Test from './ModelVol01.test';
import modelVol02Test from './ModelVol02.test';
import bpEdgeRealTest from './BpEdgeReal.test';
import navStackCoreTest from './NavStackCore.test';
import navStackVol01Test from './NavStackVol01.test';
import navStackVol02Test from './NavStackVol02.test';
import abilityTest from './Ability.test';
import responsiveUiTest from './ResponsiveUi.test';

export default function testsuite() {
  // L1 逻辑用例在前
  breakpointTypeCoreTest();
  modelSpecCoreTest();
  bpNumVol01Test();
  bpNumVol02Test();
  bpStrVol01Test();
  bpStrVol02Test();
  bpResVol01Test();
  bpResVol02Test();
  bpArrVol01Test();
  bpArrVol02Test();
  bpInvVol01Test();
  modelVol01Test();
  modelVol02Test();
  bpEdgeRealTest();
  navStackCoreTest();
  navStackVol01Test();
  navStackVol02Test();
  // L2 UI 用例在后
  abilityTest();
  responsiveUiTest();
}
