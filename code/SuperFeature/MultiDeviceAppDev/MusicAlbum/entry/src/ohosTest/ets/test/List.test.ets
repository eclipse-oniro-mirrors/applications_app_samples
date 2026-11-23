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

import abilityTest from './Ability.test';
import dsSizeVolume01Test from './DsSizeVolume01.test';
import dsSizeVolume02Test from './DsSizeVolume02.test';
import dsSizeVolume03Test from './DsSizeVolume03.test';
import dsSizeVolume04Test from './DsSizeVolume04.test';
import dsGetVolume01Test from './DsGetVolume01.test';
import dsGetVolume02Test from './DsGetVolume02.test';
import dsGetVolume03Test from './DsGetVolume03.test';
import dsGetVolume04Test from './DsGetVolume04.test';
import dsGetVolume05Test from './DsGetVolume05.test';
import dsGetVolume06Test from './DsGetVolume06.test';
import dsGetVolume07Test from './DsGetVolume07.test';
import dsAddVolume01Test from './DsAddVolume01.test';
import dsAddVolume02Test from './DsAddVolume02.test';
import dsAddVolume03Test from './DsAddVolume03.test';
import dsAddVolume04Test from './DsAddVolume04.test';
import dsAddVolume05Test from './DsAddVolume05.test';
import dsPushVolume01Test from './DsPushVolume01.test';
import dsPushVolume02Test from './DsPushVolume02.test';
import dsPushVolume03Test from './DsPushVolume03.test';
import lsnRegVolume01Test from './LsnRegVolume01.test';
import lsnNotifyVolume01Test from './LsnNotifyVolume01.test';
import lsnNotifyVolume02Test from './LsnNotifyVolume02.test';
import lsnNotifyVolume03Test from './LsnNotifyVolume03.test';
import lsnNotifyVolume04Test from './LsnNotifyVolume04.test';
import lsnNotifyVolume05Test from './LsnNotifyVolume05.test';
import songTableVolume01Test from './SongTableVolume01.test';
import optionTableVolume01Test from './OptionTableVolume01.test';
import statsVolume01Test from './StatsVolume01.test';
import realDataCore01Test from './RealDataCore01.test';
import realListener01Test from './RealListener01.test';
import realSongTable01Test from './RealSongTable01.test';
import realOption01Test from './RealOption01.test';
import realStats01Test from './RealStats01.test';
import realEdge01Test from './RealEdge01.test';
import uiHome01Test from './UiHome01.test';
import uiList01Test from './UiList01.test';
import uiPlayer01Test from './UiPlayer01.test';
import uiBreakpoint01Test from './UiBreakpoint01.test';

export default function testsuite() {
  abilityTest();
  dsSizeVolume01Test();
  dsSizeVolume02Test();
  dsSizeVolume03Test();
  dsSizeVolume04Test();
  dsGetVolume01Test();
  dsGetVolume02Test();
  dsGetVolume03Test();
  dsGetVolume04Test();
  dsGetVolume05Test();
  dsGetVolume06Test();
  dsGetVolume07Test();
  dsAddVolume01Test();
  dsAddVolume02Test();
  dsAddVolume03Test();
  dsAddVolume04Test();
  dsAddVolume05Test();
  dsPushVolume01Test();
  dsPushVolume02Test();
  dsPushVolume03Test();
  lsnRegVolume01Test();
  lsnNotifyVolume01Test();
  lsnNotifyVolume02Test();
  lsnNotifyVolume03Test();
  lsnNotifyVolume04Test();
  lsnNotifyVolume05Test();
  songTableVolume01Test();
  optionTableVolume01Test();
  statsVolume01Test();
  realDataCore01Test();
  realListener01Test();
  realSongTable01Test();
  realOption01Test();
  realStats01Test();
  realEdge01Test();
  uiHome01Test();
  uiList01Test();
  uiPlayer01Test();
  uiBreakpoint01Test();
}
