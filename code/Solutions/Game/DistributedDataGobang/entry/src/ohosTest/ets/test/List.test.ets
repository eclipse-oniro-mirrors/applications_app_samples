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

/**
 * Registers every self-contained suite. Pure suites run first; the UI suites
 * come last because they keep a live ability and its canvas resident.
 *
 * Package layout (1,560 cases):
 *   geometry      322  coordinate mapping, tolerance, boundary and line wins
 *   boardstate    302  board state, snapshot, serialization, payload and fleet
 *   behavior      556  contracts, UI, sync/undo/win and error flows
 *   gamesequence  380  ordered move, undo and restart sequences
 */

import boundaryMatrixTest from './geometry/BoundaryMatrixTest.test';
import clickToleranceMatrixTest from './geometry/ClickToleranceMatrixTest.test';
import coordinateCellMatrixTest from './geometry/CoordinateCellMatrixTest.test';
import coordinateOffsetMatrixTest from './geometry/CoordinateOffsetMatrixTest.test';
import geometryMatrixTest from './geometry/GeometryMatrixTest.test';
import winAntiDiagonalMatrixTest from './geometry/WinAntiDiagonalMatrixTest.test';
import winColumnMatrixTest from './geometry/WinColumnMatrixTest.test';
import winDiagonalMatrixTest from './geometry/WinDiagonalMatrixTest.test';
import winPatternMatrixTest from './geometry/WinPatternMatrixTest.test';
import winRowMatrixTest from './geometry/WinRowMatrixTest.test';
import boardCellMatrixTest from './boardstate/BoardCellMatrixTest.test';
import boardPatternMatrixTest from './boardstate/BoardPatternMatrixTest.test';
import colourBalanceMatrixTest from './boardstate/ColourBalanceMatrixTest.test';
import deviceActionMatrixTest from './boardstate/DeviceActionMatrixTest.test';
import deviceCountMatrixTest from './boardstate/DeviceCountMatrixTest.test';
import kvSequenceMatrixTest from './boardstate/KvSequenceMatrixTest.test';
import movePayloadMatrixTest from './boardstate/MovePayloadMatrixTest.test';
import protocolKeyMatrixTest from './boardstate/ProtocolKeyMatrixTest.test';
import protocolStepMatrixTest from './boardstate/ProtocolStepMatrixTest.test';
import serializationCellMatrixTest from './boardstate/SerializationCellMatrixTest.test';
import serializationMultiMatrixTest from './boardstate/SerializationMultiMatrixTest.test';
import snapshotApplyMatrixTest from './boardstate/SnapshotApplyMatrixTest.test';
import stressMatrixTest from './boardstate/StressMatrixTest.test';
import turnStateMatrixTest from './boardstate/TurnStateMatrixTest.test';
import undoDepthMatrixTest from './boardstate/UndoDepthMatrixTest.test';
import winGapMatrixTest from './boardstate/WinGapMatrixTest.test';
import boardInvariantContractTest from './behavior/BoardInvariantContractTest.test';
import boardRulesContractTest from './behavior/BoardRulesContractTest.test';
import deviceDiscoveryContractTest from './behavior/DeviceDiscoveryContractTest.test';
import deviceFlowTest from './behavior/DeviceFlowTest.test';
import gobangConstContractTest from './behavior/GobangConstContractTest.test';
import kvEventFlowTest from './behavior/KvEventFlowTest.test';
import kvStoreContractTest from './behavior/KvStoreContractTest.test';
import protocolContractTest from './behavior/ProtocolContractTest.test';
import protocolErrorFlowTest from './behavior/ProtocolErrorFlowTest.test';
import resourceContractTest from './behavior/ResourceContractTest.test';
import serializationContractTest from './behavior/SerializationContractTest.test';
import syncFlowTest from './behavior/SyncFlowTest.test';
import undoContractTest from './behavior/UndoContractTest.test';
import undoFlowTest from './behavior/UndoFlowTest.test';
import winCheckContractTest from './behavior/WinCheckContractTest.test';
import winFlowTest from './behavior/WinFlowTest.test';
import gameSequenceFlowTest from './behavior/GameSequenceFlowTest.test';
import abilityTest from './behavior/AbilityTest.test';
import deviceDialogUiTest from './behavior/DeviceDialogUiTest.test';
import indexBoardUiTest from './behavior/IndexBoardUiTest.test';
import titleBarUiTest from './behavior/TitleBarUiTest.test';

export default function testsuite() {
  boundaryMatrixTest();
  clickToleranceMatrixTest();
  coordinateCellMatrixTest();
  coordinateOffsetMatrixTest();
  geometryMatrixTest();
  winAntiDiagonalMatrixTest();
  winColumnMatrixTest();
  winDiagonalMatrixTest();
  winPatternMatrixTest();
  winRowMatrixTest();
  boardCellMatrixTest();
  boardPatternMatrixTest();
  colourBalanceMatrixTest();
  deviceActionMatrixTest();
  deviceCountMatrixTest();
  kvSequenceMatrixTest();
  movePayloadMatrixTest();
  protocolKeyMatrixTest();
  protocolStepMatrixTest();
  serializationCellMatrixTest();
  serializationMultiMatrixTest();
  snapshotApplyMatrixTest();
  stressMatrixTest();
  turnStateMatrixTest();
  undoDepthMatrixTest();
  winGapMatrixTest();
  boardInvariantContractTest();
  boardRulesContractTest();
  deviceDiscoveryContractTest();
  deviceFlowTest();
  gobangConstContractTest();
  kvEventFlowTest();
  kvStoreContractTest();
  protocolContractTest();
  protocolErrorFlowTest();
  resourceContractTest();
  serializationContractTest();
  syncFlowTest();
  undoContractTest();
  undoFlowTest();
  winCheckContractTest();
  winFlowTest();
  gameSequenceFlowTest();
  abilityTest();
  deviceDialogUiTest();
  indexBoardUiTest();
  titleBarUiTest();
}
