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

import resourceUtilsDensityTest from './utils/ResourceUtilsDensityVolume01.test';
import resourceUtilsScaleTest from './utils/ResourceUtilsScaleVolume02.test';
import resourceUtilsBytesTest from './utils/ResourceUtilsBytesVolume03.test';
import resourceUtilsB64Test from './utils/ResourceUtilsB64Volume04.test';
import resourceUtilsPluralTest from './utils/ResourceUtilsPluralVolume05.test';
import resourceUtilsSanitizeTest from './utils/ResourceUtilsSanitizeVolume06.test';
import resourceUtilsKeyTest from './utils/ResourceUtilsKeyVolume07.test';
import resourceUtilsBytesB08Test from './utils/ResourceUtilsBytesVolume08.test';
import resourceUtilsBytesB09Test from './utils/ResourceUtilsBytesVolume09.test';
import resourceUtilsBytesB10Test from './utils/ResourceUtilsBytesVolume10.test';
import resourceUtilsB64B11Test from './utils/ResourceUtilsB64Volume11.test';
import resourceUtilsB64B12Test from './utils/ResourceUtilsB64Volume12.test';
import resourceUtilsB64B13Test from './utils/ResourceUtilsB64Volume13.test';
import resourceUtilsPluralB14Test from './utils/ResourceUtilsPluralVolume14.test';
import resourceUtilsPluralB15Test from './utils/ResourceUtilsPluralVolume15.test';
import resourceUtilsSanitizeB16Test from './utils/ResourceUtilsSanitizeVolume16.test';
import resourceUtilsSanitizeB17Test from './utils/ResourceUtilsSanitizeVolume17.test';
import resourceUtilsDensityB18Test from './utils/ResourceUtilsDensityVolume18.test';
import resourceUtilsDensityB19Test from './utils/ResourceUtilsDensityVolume19.test';
import resourceUtilsKeyB20Test from './utils/ResourceUtilsKeyVolume20.test';
import resourceUtilsKeyB21Test from './utils/ResourceUtilsKeyVolume21.test';
import resourceUtilsBytesV22Test from './utils/ResourceUtilsBytesVolume22.test';
import resourceUtilsB64V23Test from './utils/ResourceUtilsB64Volume23.test';
import resourceUtilsSanitizeV24Test from './utils/ResourceUtilsSanitizeVolume24.test';
import resourceUtilsKeyV25Test from './utils/ResourceUtilsKeyVolume25.test';
import resourceUtilsDensityV26Test from './utils/ResourceUtilsDensityVolume26.test';
import resourceUtilsSameResTest from './utils/ResourceUtilsSameResVolume27.test';
import resourceUtilsSanitizeUnicodeTest from './utils/ResourceUtilsSanitizeUnicodeVolume28.test';
import routeTablePageTest from './utils/RouteTablePageVolume01.test';
import routeTableCrossTest from './utils/RouteTableCrossVolume04.test';
import routeTablePageB02Test from './utils/RouteTablePageVolume02.test';
import routeTablePageB03Test from './utils/RouteTablePageVolume03.test';
import overlayCtrlSwitchTest from './service/OverlayCtrlSwitchVolume01.test';
import overlayCtrlResTest from './service/OverlayCtrlResVolume02.test';
import overlayCtrlMsgB03Test from './service/OverlayCtrlMsgVolume03.test';
import overlayCtrlParseB04Test from './service/OverlayCtrlParseVolume04.test';
import overlayCtrlStateSeqTest from './service/OverlayCtrlStateSeqVolume05.test';
import resourceUtilsReal01Test from './utils/ResourceUtilsReal01.test';
import resourceUtilsReal02Test from './utils/ResourceUtilsReal02.test';
import resourceUtilsReal03Test from './utils/ResourceUtilsReal03.test';
import resourceUtilsReal04Test from './utils/ResourceUtilsReal04.test';
import routeTableReal01Test from './utils/RouteTableReal01.test';
import routeTableReal02Test from './utils/RouteTableReal02.test';
import routeTableReal03Test from './utils/RouteTableReal03.test';
import accessServiceReal01Test from './service/AccessServiceReal01.test';
import appResAccessReal01Test from './appres/AppResAccessReal01.test';
import appResAccessReal02Test from './appres/AppResAccessReal02.test';
import overlayCtrlReal01Test from './service/OverlayCtrlReal01.test';
import overlayCtrlReal02Test from './service/OverlayCtrlReal02.test';
import overlayCtrlReal03Test from './service/OverlayCtrlReal03.test';
import indexUiReal01Test from './ui/IndexUiReal01.test';
import basicResourcesUiReal01Test from './ui/BasicResourcesUiReal01.test';
import overlayUiReal01Test from './ui/OverlayUiReal01.test';
import uiFlowReal02Test from './ui/UiFlowReal02.test';
import uiFlowReal03Test from './ui/UiFlowReal03.test';
import abilityTest from './Ability.test';

export default function testsuite() {
  // Logic suites run first, UI suites afterwards.
  resourceUtilsDensityTest();
  resourceUtilsScaleTest();
  resourceUtilsBytesTest();
  resourceUtilsB64Test();
  resourceUtilsPluralTest();
  resourceUtilsSanitizeTest();
  resourceUtilsKeyTest();
  resourceUtilsBytesB08Test();
  resourceUtilsBytesB09Test();
  resourceUtilsBytesB10Test();
  resourceUtilsB64B11Test();
  resourceUtilsB64B12Test();
  resourceUtilsB64B13Test();
  resourceUtilsPluralB14Test();
  resourceUtilsPluralB15Test();
  resourceUtilsSanitizeB16Test();
  resourceUtilsSanitizeB17Test();
  resourceUtilsDensityB18Test();
  resourceUtilsDensityB19Test();
  resourceUtilsKeyB20Test();
  resourceUtilsKeyB21Test();
  resourceUtilsBytesV22Test();
  resourceUtilsB64V23Test();
  resourceUtilsSanitizeV24Test();
  resourceUtilsKeyV25Test();
  resourceUtilsDensityV26Test();
  resourceUtilsSameResTest();
  resourceUtilsSanitizeUnicodeTest();
  routeTablePageTest();
  routeTablePageB02Test();
  routeTablePageB03Test();
  routeTableCrossTest();
  overlayCtrlSwitchTest();
  overlayCtrlResTest();
  overlayCtrlMsgB03Test();
  overlayCtrlParseB04Test();
  overlayCtrlStateSeqTest();
  resourceUtilsReal01Test();
  resourceUtilsReal02Test();
  resourceUtilsReal03Test();
  resourceUtilsReal04Test();
  routeTableReal01Test();
  routeTableReal02Test();
  routeTableReal03Test();
  accessServiceReal01Test();
  appResAccessReal01Test();
  appResAccessReal02Test();
  overlayCtrlReal01Test();
  overlayCtrlReal02Test();
  overlayCtrlReal03Test();
  indexUiReal01Test();
  basicResourcesUiReal01Test();
  overlayUiReal01Test();
  uiFlowReal02Test();
  uiFlowReal03Test();
  abilityTest();
}
