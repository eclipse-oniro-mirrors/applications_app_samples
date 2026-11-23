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
import breakpointMatrix01Test from './BreakpointMatrix01.test';
import breakpointMatrix02Test from './BreakpointMatrix02.test';
import breakpointMatrix03Test from './BreakpointMatrix03.test';
import breakpointMatrix04Test from './BreakpointMatrix04.test';
import breakpointMatrix05Test from './BreakpointMatrix05.test';
import breakpointMatrix06Test from './BreakpointMatrix06.test';
import breakpointMatrix07Test from './BreakpointMatrix07.test';
import breakpointMatrix08Test from './BreakpointMatrix08.test';
import breakpointMatrix09Test from './BreakpointMatrix09.test';
import breakpointMatrix10Test from './BreakpointMatrix10.test';
import breakpointMatrix11Test from './BreakpointMatrix11.test';
import breakpointMatrix12Test from './BreakpointMatrix12.test';
import breakpointState01Test from './BreakpointState01.test';
import breakpointState02Test from './BreakpointState02.test';
import modelMatrix01Test from './ModelMatrix01.test';
import modelMatrix02Test from './ModelMatrix02.test';
import modelMatrix03Test from './ModelMatrix03.test';
import modelMatrix04Test from './ModelMatrix04.test';
import modelMatrix05Test from './ModelMatrix05.test';
import modelMatrix06Test from './ModelMatrix06.test';
import modelMatrix07Test from './ModelMatrix07.test';
import songsDataMatrix01Test from './SongsDataMatrix01.test';
import songsDataMatrix02Test from './SongsDataMatrix02.test';
import songsDataMatrix03Test from './SongsDataMatrix03.test';
import songsDataMatrix04Test from './SongsDataMatrix04.test';
import resourceMatrix01Test from './ResourceMatrix01.test';
import resourceMatrix02Test from './ResourceMatrix02.test';
import resourceMatrix03Test from './ResourceMatrix03.test';
import layoutMatrix01Test from './LayoutMatrix01.test';
import breakpointRealTest from './BreakpointReal.test';
import modelRealTest from './ModelReal.test';
import songsDataRealTest from './SongsDataReal.test';
import resourceRealTest from './ResourceReal.test';
import layoutRealTest from './LayoutReal.test';
import uiTabsRealTest from './UiTabsReal.test';
import uiLayoutRealTest from './UiLayoutReal.test';
import musicDialogLifecycleSuite from './Core/MusicDialogLifecycle.test';
import musicOperationFlowSuite from './Core/MusicOperationFlow.test';
import musicLoggerValidationSuite from './Validation/MusicLoggerValidation.test';
import musicSessionValidationSuite from './Validation/MusicSessionValidation.test';
import musicEventPropagationSuite from './Interaction/MusicEventPropagation.test';
import musicCompatibilitySuite from './Integration/MusicCompatibility.test';
import musicCatalogAggregationSuite from './Integration/MusicCatalogAggregation.test';
import musicLifecycleSuite from './LifecycleState/MusicLifecycle.test';
import musicAnimationPerformanceSuite from './PerformanceStability/MusicAnimationPerformance.test';
import musicSecurityValidationSuite from './Security/MusicSecurityValidation.test';
import musicExtensionSuite from './MusicExtension.test';

export default function testsuite() {
  // L1 逻辑与数据用例（先跑，不依赖界面）
  abilityTest();
  breakpointMatrix01Test();
  breakpointMatrix02Test();
  breakpointMatrix03Test();
  breakpointMatrix04Test();
  breakpointMatrix05Test();
  breakpointMatrix06Test();
  breakpointMatrix07Test();
  breakpointMatrix08Test();
  breakpointMatrix09Test();
  breakpointMatrix10Test();
  breakpointMatrix11Test();
  breakpointMatrix12Test();
  breakpointState01Test();
  breakpointState02Test();
  modelMatrix01Test();
  modelMatrix02Test();
  modelMatrix03Test();
  modelMatrix04Test();
  modelMatrix05Test();
  modelMatrix06Test();
  modelMatrix07Test();
  songsDataMatrix01Test();
  songsDataMatrix02Test();
  songsDataMatrix03Test();
  songsDataMatrix04Test();
  resourceMatrix01Test();
  resourceMatrix02Test();
  resourceMatrix03Test();
  layoutMatrix01Test();
  breakpointRealTest();
  modelRealTest();
  songsDataRealTest();
  resourceRealTest();
  layoutRealTest();

  // L2 界面用例（放在最后，跑完把界面复位到首页）
  uiTabsRealTest();
  uiLayoutRealTest();
  musicDialogLifecycleSuite();
  musicOperationFlowSuite();
  musicLoggerValidationSuite();
  musicSessionValidationSuite();
  musicEventPropagationSuite();
  musicCompatibilitySuite();
  musicCatalogAggregationSuite();
  musicLifecycleSuite();
  musicAnimationPerformanceSuite();
  musicSecurityValidationSuite();
  musicExtensionSuite();
}
