/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import utilsCoreTest from './UtilsCore.test'
import constEventsCoreTest from './ConstEventsCore.test'
import mainFeatureCoreTest from './MainFeatureCore.test'
import settingFeatureCoreTest from './SettingFeatureCore.test'
import historyFeatureCoreTest from './HistoryFeatureCore.test'
import launchFeatureCoreTest from './LaunchFeatureCore.test'
import cardEventCoreTest from './CardEventCore.test'
import loggerCoreTest from './LoggerCore.test'
import surveillanceEdgeCoreTest from './SurveillanceEdgeCore.test'
import cardEventVolume01Test from './CardEventVolume01.test'
import cardEventVolume02Test from './CardEventVolume02.test'
import utilVolume01Test from './UtilVolume01.test'
import utilVolume02Test from './UtilVolume02.test'
import utilVolume03Test from './UtilVolume03.test'
import utilVolume04Test from './UtilVolume04.test'
import utilVolume05Test from './UtilVolume05.test'
import utilVolume06Test from './UtilVolume06.test'
import utilVolume07Test from './UtilVolume07.test'
import utilVolume08Test from './UtilVolume08.test'
import utilVolume09Test from './UtilVolume09.test'
import utilVolume10Test from './UtilVolume10.test'
import utilVolume11Test from './UtilVolume11.test'
import utilVolume12Test from './UtilVolume12.test'
import utilVolume13Test from './UtilVolume13.test'
import stateVolume01Test from './StateVolume01.test'
import stateVolume02Test from './StateVolume02.test'
import stateVolume03Test from './StateVolume03.test'
import stateVolume04Test from './StateVolume04.test'
import stateVolume05Test from './StateVolume05.test'
import stateVolume06Test from './StateVolume06.test'
import stateVolume07Test from './StateVolume07.test'
import stateVolume08Test from './StateVolume08.test'
import stateVolume09Test from './StateVolume09.test'
import stateVolume10Test from './StateVolume10.test'
import stateVolume11Test from './StateVolume11.test'
import stateVolume12Test from './StateVolume12.test'
import stateVolume13Test from './StateVolume13.test'
import stateVolume14Test from './StateVolume14.test'
import stateVolume15Test from './StateVolume15.test'
import stateVolume16Test from './StateVolume16.test'
import settingVolume01Test from './SettingVolume01.test'
import settingVolume02Test from './SettingVolume02.test'
import settingVolume03Test from './SettingVolume03.test'
import historyKeepVolume01Test from './HistoryKeepVolume01.test'
import historyAssembleVolume01Test from './HistoryAssembleVolume01.test'
import launchTrimVolume01Test from './LaunchTrimVolume01.test'
import mainCompactVolume01Test from './MainCompactVolume01.test'
import launchDetailVolume01Test from './LaunchDetailVolume01.test'
import launchLimitVolume01Test from './LaunchLimitVolume01.test'
import historyCompleteVolume01Test from './HistoryCompleteVolume01.test'
import settingNormalizeVolume01Test from './SettingNormalizeVolume01.test'
import settingNormalizeVolume02Test from './SettingNormalizeVolume02.test'
import settingNormalizeVolume03Test from './SettingNormalizeVolume03.test'
import historyKeepVolume02Test from './HistoryKeepVolume02.test'
import historyAssembleVolume02Test from './HistoryAssembleVolume02.test'
import historyCompleteVolume02Test from './HistoryCompleteVolume02.test'
import historyCompleteVolume03Test from './HistoryCompleteVolume03.test'
import launchTrimVolume02Test from './LaunchTrimVolume02.test'
import launchTrimVolume03Test from './LaunchTrimVolume03.test'
import mainCompactVolume02Test from './MainCompactVolume02.test'
import launchDetailVolume02Test from './LaunchDetailVolume02.test'
import launchLimitVolume02Test from './LaunchLimitVolume02.test'
import detailUiTest from './DetailUi.test'
import customCommonEventUiTest from './CustomCommonEventUi.test'

export default function testsuite() {
  // 功能层 Core 套件
  utilsCoreTest()
  constEventsCoreTest()
  mainFeatureCoreTest()
  settingFeatureCoreTest()
  historyFeatureCoreTest()
  launchFeatureCoreTest()
  cardEventCoreTest()
  loggerCoreTest()
  surveillanceEdgeCoreTest()
  cardEventVolume01Test()
  cardEventVolume02Test()
  // 功能层扫描套件（按 UTIL → STATE → SETTING 号段）
  utilVolume01Test()
  utilVolume02Test()
  utilVolume03Test()
  utilVolume04Test()
  utilVolume05Test()
  utilVolume06Test()
  utilVolume07Test()
  utilVolume08Test()
  utilVolume09Test()
  utilVolume10Test()
  utilVolume11Test()
  utilVolume12Test()
  utilVolume13Test()
  stateVolume01Test()
  stateVolume02Test()
  stateVolume03Test()
  stateVolume04Test()
  stateVolume05Test()
  stateVolume06Test()
  stateVolume07Test()
  stateVolume08Test()
  stateVolume09Test()
  stateVolume10Test()
  stateVolume11Test()
  stateVolume12Test()
  stateVolume13Test()
  stateVolume14Test()
  stateVolume15Test()
  stateVolume16Test()
  settingVolume01Test()
  settingVolume02Test()
  settingVolume03Test()
  // 功能层扫描套件（HISTORY → LAUNCH 号段）
  historyKeepVolume01Test()
  historyAssembleVolume01Test()
  launchTrimVolume01Test()
  mainCompactVolume01Test()
  launchDetailVolume01Test()
  launchLimitVolume01Test()
  historyCompleteVolume01Test()
  settingNormalizeVolume01Test()
  settingNormalizeVolume02Test()
  settingNormalizeVolume03Test()
  historyKeepVolume02Test()
  historyAssembleVolume02Test()
  historyCompleteVolume02Test()
  historyCompleteVolume03Test()
  launchTrimVolume02Test()
  launchTrimVolume03Test()
  mainCompactVolume02Test()
  launchDetailVolume02Test()
  launchLimitVolume02Test()
  // 界面层套件
  detailUiTest()
  customCommonEventUiTest()
}
