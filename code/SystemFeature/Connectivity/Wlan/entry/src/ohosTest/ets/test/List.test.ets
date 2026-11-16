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

import abilityTest from './Ability.test'

import wlanModelLogicTest from './WlanModelLogic.test';
import wlanDataSourceContractTest from './WlanDataSourceContract.test';
import wlanBundleContractTest from './WlanBundleContract.test';
import wlanResourceContractTest from './WlanResourceContract.test';
import wlanModelResolveExtraTest from './WlanModelResolveExtra.test';
import wlanConfigContractTest from './WlanConfigContract.test';
import wlanModelResolveBoundaryTest from './WlanModelResolveBoundary.test';
import wlanBundleSceneTest from './WlanBundleScene.test';
import wlanDataSourceDataTest from './WlanDataSourceData.test';
import wlanDataSourceListenerTest from './WlanDataSourceListener.test';
import wlanDataSourceEdgeTest from './WlanDataSourceEdge.test';
import wlanBundleConfigExtraTest from './WlanBundleConfigExtra.test';
import wlanModelResolveEdgeTest from './WlanModelResolveEdge.test';
import wlanDataSourceMultiListenerTest from './WlanDataSourceMultiListener.test';
import wlanBundleSkillsTest from './WlanBundleSkills.test';
import wlanResourceExtraTest from './WlanResourceExtra.test';
import wlanResourceRemainingTest from './WlanResourceRemaining.test';
import wlanDataSourceEdge2Test from './WlanDataSourceEdge2.test';
import wlanAbilityExtraTest from './WlanAbilityExtra.test';
import wlanWifiApiContractTest from './WlanWifiApiContract.test';
import wlanResourceLastTest from './WlanResourceLast.test';
import wlanModelMiscTest from './WlanModelMisc.test';
import wlanDataSourceMiscTest from './WlanDataSourceMisc.test';
import wlanBundleMiscTest from './WlanBundleMisc.test';
import wlanVolumeResolve01Test from './WlanVolumeResolve01.test';
import wlanVolumeResolve02Test from './WlanVolumeResolve02.test';
import wlanVolumeResolve03Test from './WlanVolumeResolve03.test';
import wlanVolumeResolve04Test from './WlanVolumeResolve04.test';
import wlanVolumeResolve05Test from './WlanVolumeResolve05.test';
import wlanVolumeResolve06Test from './WlanVolumeResolve06.test';
import wlanVolumeResolve07Test from './WlanVolumeResolve07.test';
import wlanVolumeResolve08Test from './WlanVolumeResolve08.test';
import wlanVolumeResolve09Test from './WlanVolumeResolve09.test';
import wlanVolumeResolve10Test from './WlanVolumeResolve10.test';
import wlanVolumeResolve11Test from './WlanVolumeResolve11.test';
import wlanVolumeResolve12Test from './WlanVolumeResolve12.test';
import wlanVolumeResolve13Test from './WlanVolumeResolve13.test';
import wlanVolumeResolve14Test from './WlanVolumeResolve14.test';
import wlanVolumeResolve15Test from './WlanVolumeResolve15.test';
import wlanVolumeResolve16Test from './WlanVolumeResolve16.test';
import wlanVolumeResolve17Test from './WlanVolumeResolve17.test';
import wlanVolumeResolve18Test from './WlanVolumeResolve18.test';
import wlanVolumeResolve19Test from './WlanVolumeResolve19.test';
import wlanVolumeResolve20Test from './WlanVolumeResolve20.test';
import wlanVolumeResolve21Test from './WlanVolumeResolve21.test';
import wlanVolumeResolve22Test from './WlanVolumeResolve22.test';
import wlanVolumeResolve23Test from './WlanVolumeResolve23.test';
import wlanVolumeResolve24Test from './WlanVolumeResolve24.test';
import wlanVolumeResolve25Test from './WlanVolumeResolve25.test';
import wlanVolumeResolve26Test from './WlanVolumeResolve26.test';
import wlanVolumeResolve27Test from './WlanVolumeResolve27.test';
import wlanVolumeResolve28Test from './WlanVolumeResolve28.test';
import wlanVolumeResolve29Test from './WlanVolumeResolve29.test';
import wlanVolumeResolve30Test from './WlanVolumeResolve30.test';
import wlanVolume2Resolve01Test from './WlanVolume2Resolve01.test';
import wlanVolume2Resolve02Test from './WlanVolume2Resolve02.test';
import wlanVolume2Resolve03Test from './WlanVolume2Resolve03.test';
import wlanVolume2Resolve04Test from './WlanVolume2Resolve04.test';
import wlanVolume2Resolve05Test from './WlanVolume2Resolve05.test';
import wlanVolume2Resolve06Test from './WlanVolume2Resolve06.test';
import wlanVolume2Resolve07Test from './WlanVolume2Resolve07.test';
import wlanVolume2Resolve08Test from './WlanVolume2Resolve08.test';
import wlanVolume2Resolve09Test from './WlanVolume2Resolve09.test';
import wlanVolume2Resolve10Test from './WlanVolume2Resolve10.test';
import wlanVolume2Resolve11Test from './WlanVolume2Resolve11.test';
import wlanVolume2Resolve12Test from './WlanVolume2Resolve12.test';
import wlanVolume2Resolve13Test from './WlanVolume2Resolve13.test';
import wlanVolume2Resolve14Test from './WlanVolume2Resolve14.test';
import wlanVolume2Resolve15Test from './WlanVolume2Resolve15.test';
import wlanVolume2Resolve16Test from './WlanVolume2Resolve16.test';
import wlanVolume2Resolve17Test from './WlanVolume2Resolve17.test';
import wlanVolume2Resolve18Test from './WlanVolume2Resolve18.test';
import wlanVolume2Resolve19Test from './WlanVolume2Resolve19.test';
import wlanVolume2Resolve20Test from './WlanVolume2Resolve20.test';
import wlanVolume2Resolve21Test from './WlanVolume2Resolve21.test';
import wlanVolume2Resolve22Test from './WlanVolume2Resolve22.test';
import wlanVolume2Resolve23Test from './WlanVolume2Resolve23.test';
import wlanVolume2Resolve24Test from './WlanVolume2Resolve24.test';
import wlanVolume2Resolve25Test from './WlanVolume2Resolve25.test';
import wlanVolume2Resolve26Test from './WlanVolume2Resolve26.test';
import wlanVolume2Resolve27Test from './WlanVolume2Resolve27.test';
import wlanVolume2Resolve28Test from './WlanVolume2Resolve28.test';
import wlanVolume2Resolve29Test from './WlanVolume2Resolve29.test';
import wlanVolume2Resolve30Test from './WlanVolume2Resolve30.test';
import wlanVolume3ResolveTest from './WlanVolume3Resolve.test';
import wlanDataSourceMatrixTest from './WlanDataSourceMatrix.test';
export default function testsuite() {
  abilityTest()
  wlanModelLogicTest();
  wlanDataSourceContractTest();
  wlanBundleContractTest();
  wlanResourceContractTest();
  wlanModelResolveExtraTest();
  wlanConfigContractTest();
  wlanModelResolveBoundaryTest();
  wlanBundleSceneTest();
  wlanDataSourceDataTest();
  wlanDataSourceListenerTest();
  wlanDataSourceEdgeTest();
  wlanBundleConfigExtraTest();
  wlanModelResolveEdgeTest();
  wlanDataSourceMultiListenerTest();
  wlanBundleSkillsTest();
  wlanResourceExtraTest();
  wlanResourceRemainingTest();
  wlanDataSourceEdge2Test();
  wlanAbilityExtraTest();
  wlanWifiApiContractTest();
  wlanResourceLastTest();
  wlanModelMiscTest();
  wlanDataSourceMiscTest();
  wlanBundleMiscTest();
  wlanVolumeResolve01Test();
  wlanVolumeResolve02Test();
  wlanVolumeResolve03Test();
  wlanVolumeResolve04Test();
  wlanVolumeResolve05Test();
  wlanVolumeResolve06Test();
  wlanVolumeResolve07Test();
  wlanVolumeResolve08Test();
  wlanVolumeResolve09Test();
  wlanVolumeResolve10Test();
  wlanVolumeResolve11Test();
  wlanVolumeResolve12Test();
  wlanVolumeResolve13Test();
  wlanVolumeResolve14Test();
  wlanVolumeResolve15Test();
  wlanVolumeResolve16Test();
  wlanVolumeResolve17Test();
  wlanVolumeResolve18Test();
  wlanVolumeResolve19Test();
  wlanVolumeResolve20Test();
  wlanVolumeResolve21Test();
  wlanVolumeResolve22Test();
  wlanVolumeResolve23Test();
  wlanVolumeResolve24Test();
  wlanVolumeResolve25Test();
  wlanVolumeResolve26Test();
  wlanVolumeResolve27Test();
  wlanVolumeResolve28Test();
  wlanVolumeResolve29Test();
  wlanVolumeResolve30Test();
  wlanVolume2Resolve01Test();
  wlanVolume2Resolve02Test();
  wlanVolume2Resolve03Test();
  wlanVolume2Resolve04Test();
  wlanVolume2Resolve05Test();
  wlanVolume2Resolve06Test();
  wlanVolume2Resolve07Test();
  wlanVolume2Resolve08Test();
  wlanVolume2Resolve09Test();
  wlanVolume2Resolve10Test();
  wlanVolume2Resolve11Test();
  wlanVolume2Resolve12Test();
  wlanVolume2Resolve13Test();
  wlanVolume2Resolve14Test();
  wlanVolume2Resolve15Test();
  wlanVolume2Resolve16Test();
  wlanVolume2Resolve17Test();
  wlanVolume2Resolve18Test();
  wlanVolume2Resolve19Test();
  wlanVolume2Resolve20Test();
  wlanVolume2Resolve21Test();
  wlanVolume2Resolve22Test();
  wlanVolume2Resolve23Test();
  wlanVolume2Resolve24Test();
  wlanVolume2Resolve25Test();
  wlanVolume2Resolve26Test();
  wlanVolume2Resolve27Test();
  wlanVolume2Resolve28Test();
  wlanVolume2Resolve29Test();
  wlanVolume2Resolve30Test();
  wlanVolume3ResolveTest();
  wlanDataSourceMatrixTest();
}
