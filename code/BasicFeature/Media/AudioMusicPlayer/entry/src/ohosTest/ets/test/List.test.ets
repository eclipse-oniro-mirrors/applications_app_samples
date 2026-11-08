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
import { ensureAppContext } from './TestContext';
import LrcParseMatrixTest from './LrcParseMatrix.test';import KrcParseMatrixTest from './KrcParseMatrix.test';
import TimeFormatEdgeTest from './TimeFormatEdge.test';
import DataSourceSequenceTest from './DataSourceSequence.test';
import GeometryEdgeTest from './GeometryEdge.test';
import ConstantsTableTest from './ConstantsTable.test';
import ResourceRawEdgeTest from './ResourceRawEdge.test';
import NativePlayerGuardTest from './NativePlayerGuard.test';
import FavoriteSequenceTest from './FavoriteSequence.test';
import LyricLocateEdgeTest from './LyricLocateEdge.test';
import TimeFormatUnitMatrixTest from './TimeFormatUnitMatrix.test';
import LrcUtilsFunctionTest from './LrcUtilsFunctionTest.test';
import SongModelSuiteTest from './SongModelSuite.test';
import PlaybackStateSuiteTest from './PlaybackStateSuite.test';
import NativeTimeoutsSuiteTest from './NativeTimeoutsSuite.test';
import LyricPipelineIntegrationTest from './LyricPipelineIntegration.test';
import LyricSwitchIntegrationTest from './LyricSwitchIntegration.test';
import ResponsiveLayoutSuiteTest from './ResponsiveLayoutSuite.test';
import AudioMusicPlayer01Test from './AudioMusicPlayer';
import DataSource01Test from './DataSourceTest.test';
import Lyric01Test from './LyricTest.test';
import PlayerControl01Test from './PlayerControlTest.test';
import Tools01Test from './ToolsTest.test';
import LrcParserRobustTest from './LrcParserRobust.test';
import KrcParserRobustTest from './KrcParserRobust.test';
import MediaToolsOracleTest from './MediaToolsOracle.test';
import ColorConversionMatrixTest from './ColorConversionMatrix.test';
import BreakpointCombinationTest from './BreakpointCombination.test';
import LrcTableTest from './LrcTable.test';
import KrcTableTest from './KrcTable.test';
import PureUtilsExtraTest from './PureUtilsExtra.test';
import TimeFormatMatrixProTest from './TimeFormatMatrixPro.test';
import LrcParseMatrixProTest from './LrcParseMatrixPro.test';
import KrcParseMatrixProTest from './KrcParseMatrixPro.test';
import ColorPropertyMatrixProTest from './ColorPropertyMatrixPro.test';
import GeometryConstMatrixProTest from './GeometryConstMatrixPro.test';
import TimeFormatMatrixPro2Test from './TimeFormatMatrixPro2.test';
import LrcParseMatrixPro2Test from './LrcParseMatrixPro2.test';
import ColorPropertyMatrixPro2Test from './ColorPropertyMatrixPro2.test';
import GeometryConstMatrixPro2Test from './GeometryConstMatrixPro2.test';

export default function testsuite() {
  abilityTest();
  ensureAppContext();
  LrcParseMatrixTest();
  KrcParseMatrixTest();
  TimeFormatEdgeTest();
  DataSourceSequenceTest();
  GeometryEdgeTest();
  ConstantsTableTest();
  ResourceRawEdgeTest();
  NativePlayerGuardTest();
  FavoriteSequenceTest();
  LyricLocateEdgeTest();

  TimeFormatUnitMatrixTest();
  LrcUtilsFunctionTest();
  SongModelSuiteTest();
  PlaybackStateSuiteTest();
  NativeTimeoutsSuiteTest();
  LyricPipelineIntegrationTest();
  LyricSwitchIntegrationTest();
  ResponsiveLayoutSuiteTest();
  LrcParserRobustTest();
  KrcParserRobustTest();
  MediaToolsOracleTest();
  ColorConversionMatrixTest();
  BreakpointCombinationTest();
  LrcTableTest();
  KrcTableTest();
  PureUtilsExtraTest();
  TimeFormatMatrixProTest();
  LrcParseMatrixProTest();
  KrcParseMatrixProTest();
  ColorPropertyMatrixProTest();
  GeometryConstMatrixProTest();
  TimeFormatMatrixPro2Test();
  LrcParseMatrixPro2Test();
  ColorPropertyMatrixPro2Test();
  GeometryConstMatrixPro2Test();
  AudioMusicPlayer01Test();
  DataSource01Test();
  Lyric01Test();
  PlayerControl01Test();
  Tools01Test();
}