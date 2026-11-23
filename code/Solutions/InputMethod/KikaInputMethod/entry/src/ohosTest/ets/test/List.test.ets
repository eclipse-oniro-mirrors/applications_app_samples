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

import keyTableInvariantTest from './contract/KeyTableInvariantTest.test';
import keyTableMappingConsistencyTest from './contract/KeyTableMappingConsistencyTest.test';
import menuStyleContractTest from './contract/MenuStyleContractTest.test';
import styleFieldRelationTest from './contract/StyleFieldRelationTest.test';
import altCombinationTest from './controller/AltCombinationTest.test';
import chordOrder1Test from './controller/ChordOrder1Test.test';
import chordOrder2Test from './controller/ChordOrder2Test.test';
import chordRelease1Test from './controller/ChordRelease1Test.test';
import chordRelease2Test from './controller/ChordRelease2Test.test';
import controllerSequenceTest from './controller/ControllerSequenceTest.test';
import controllerStatePolicy from './controller/ControllerStatePolicy.test';
import hardKeyCompletenessTest from './controller/HardKeyCompletenessTest.test';
import hardKeySpecialMappingTest from './controller/HardKeySpecialMappingTest.test';
import keyPredicateTest from './controller/KeyPredicateTest.test';
import modifierDepth1Test from './controller/ModifierDepth1Test.test';
import modifierRouteTest from './controller/ModifierRouteTest.test';
import orderedKeyPath1Test from './controller/OrderedKeyPath1Test.test';
import orderedKeyPath2Test from './controller/OrderedKeyPath2Test.test';
import publicMethodTest from './controller/PublicMethodTest.test';
import patternRoutingTest from './controller/PatternRoutingTest.test';
import commandArgumentExtremeTest from './editor/CommandArgumentExtremeTest.test';
import commandJournal1Test from './editor/CommandJournal1Test.test';
import commandJournal2Test from './editor/CommandJournal2Test.test';
import commandJournalDeep1Test from './editor/CommandJournalDeep1Test.test';
import commandJournalDeep2Test from './editor/CommandJournalDeep2Test.test';
import editorCommandTest from './editor/EditorCommandTest.test';
import selectMovementAxisTest from './editor/SelectMovementAxisTest.test';
import selectionCursorFallbackTest from './editor/SelectionCursorFallbackTest.test';
import attributeWindowTest from './handler/AttributeWindowTest.test';
import clientRoutingTest from './handler/ClientRoutingTest.test';
import commandPayloadTest from './handler/CommandPayloadTest.test';
import cursorInfoExtremeTest from './handler/CursorInfoExtremeTest.test';
import editorAttributeForwardingTest from './handler/EditorAttributeForwardingTest.test';
import handlerContractTest from './handler/HandlerContractTest.test';
import hideIsolationTest from './handler/HideIsolationTest.test';
import privateCommandTest from './handler/PrivateCommandTest.test';
import reattachPreviewTest from './handler/ReattachPreviewTest.test';
import refreshInfoTest from './handler/RefreshInfoTest.test';
import sessionMatrixTest from './handler/SessionMatrixTest.test';
import stressTest from './handler/StressTest.test';
import unicodePayloadTest from './handler/UnicodePayloadTest.test';
import previewJourney1Test from './journeys/PreviewJourney1Test.test';
import previewBoundaryTest from './preview/PreviewBoundaryTest.test';
import previewCommandBridgeTest from './preview/PreviewCommandBridgeTest.test';
import previewContractTest from './preview/PreviewContractTest.test';
import previewSupportFlagTest from './preview/PreviewSupportFlagTest.test';
import previewTransitionTest from './preview/PreviewTransitionTest.test';
import previewWindow1Test from './preview/PreviewWindow1Test.test';
import previewWindow2Test from './preview/PreviewWindow2Test.test';
import previewWindowDeep1Test from './preview/PreviewWindowDeep1Test.test';
import previewWindowDeep2Test from './preview/PreviewWindowDeep2Test.test';
import previewWindowExtraTest from './preview/PreviewWindowExtraTest.test';
import privatePreviewUsabilityTest from './ui/PrivatePreviewUsabilityTest.test';
import privatePreviewInteractionTest from './ui/PrivatePreviewInteractionTest.test';
import privatePreviewLayoutTest from './ui/PrivatePreviewLayoutTest.test';
import privatePreviewRotationTest from './ui/PrivatePreviewRotationTest.test';
import privatePreviewStateTest from './ui/PrivatePreviewStateTest.test';
import previewCaretCommandTest from './scenarios/PreviewCaretCommandTest.test';
import syncExpansionScenarioTest from './scenarios/SyncExpansionScenarioTest.test';
import previewPayloadExpansionTest from './scenarios/PreviewPayloadExpansionTest.test';
import previewSessionExpansionTest from './scenarios/PreviewSessionExpansionTest.test';
import previewFailureSessionExpansionTest from './scenarios/PreviewFailureSessionExpansionTest.test';
import previewDataCommandExpansionTest from './scenarios/PreviewDataCommandExpansionTest.test';
import summaryStructureTest from './handler/SummaryStructureTest.test';
import editorAttributeStorageTest from './handler/EditorAttributeStorageTest.test';
import keyTableStabilityTest from './contract/KeyTableStabilityTest.test';
import keyActionFieldTest from './contract/KeyActionFieldTest.test';
import previewSelectionCommandTest from './contract/PreviewSelectionCommandTest.test';
import stressSequenceTest from './performance/StressSequenceTest.test';
import sessionOrderTest from './lifecycle/SessionOrderTest.test';
import editorJourneyTest from './journeys/EditorJourneyTest.test';
import previewAfterDeletionTest from './preview/PreviewAfterDeletionTest.test';
import attributeCombinationTest from './preview/AttributeCombinationTest.test';
import menuRelationTest from './contract/MenuRelationTest.test';
import commandProtocolSequenceTest from './editor/CommandProtocolSequenceTest.test';
import extremeArgumentTest from './validation/ExtremeArgumentTest.test';
import sessionStressTest from './performance/SessionStressTest.test';
import extremePayloadTest from './validation/ExtremePayloadTest.test';
import zeroCommandTest from './validation/ZeroCommandTest.test';
import classificationRoutingCrossTest from './controller/ClassificationRoutingCrossTest.test';
import deleteOrderVariantTest from './editor/DeleteOrderVariantTest.test';
import previewPressureTest from './performance/PreviewPressureTest.test';
import enterSequenceTest from './editor/EnterSequenceTest.test';
import hideSequenceTest from './handler/HideSequenceTest.test';
import extremeCountTest from './performance/ExtremeCountTest.test';
import commandQueueTest from './performance/CommandQueueTest.test';
import faultCombinationTest from './handler/FaultCombinationTest.test';
import previewEditorInterlockTest from './preview/PreviewEditorInterlockTest.test';
import menuSymbolSuiteTest from './contract/MenuSymbolSuite.test';
import savedStyleSuiteTest from './contract/SavedStyleSuite.test';
import privatePreviewTextSuiteTest from './ui/PrivatePreviewTextSuite.test';
import shiftReleaseSuiteTest from './controller/ShiftReleaseSuite.test';
import faultRaceSuiteTest from './handler/FaultRaceSuite.test';
import previewFallbackSuiteTest from './preview/PreviewFallbackSuite.test';

export default function testsuite() {
  // 键表、菜单与样式契约
  keyTableInvariantTest();
  keyTableMappingConsistencyTest();
  menuStyleContractTest();
  styleFieldRelationTest();

  // 控制器组合键与序列
  altCombinationTest();
  chordOrder1Test();
  chordOrder2Test();
  chordRelease1Test();
  chordRelease2Test();
  controllerSequenceTest();
  controllerStatePolicy();

  // 控制器按键路径与谓词
  hardKeyCompletenessTest();
  hardKeySpecialMappingTest();
  keyPredicateTest();
  modifierDepth1Test();
  modifierRouteTest();
  orderedKeyPath1Test();
  orderedKeyPath2Test();
  publicMethodTest();
  patternRoutingTest();

  // 编辑器命令与日志
  commandArgumentExtremeTest();
  commandJournal1Test();
  commandJournal2Test();
  commandJournalDeep1Test();
  commandJournalDeep2Test();
  editorCommandTest();
  selectMovementAxisTest();
  selectionCursorFallbackTest();

  // 处理器属性与内容路由
  attributeWindowTest();
  clientRoutingTest();
  commandPayloadTest();
  cursorInfoExtremeTest();
  editorAttributeForwardingTest();

  // 处理器契约、隐藏与私有命令
  handlerContractTest();
  hideIsolationTest();
  privateCommandTest();
  reattachPreviewTest();
  refreshInfoTest();

  sessionMatrixTest();
  stressTest();
  unicodePayloadTest();
  previewJourney1Test();
  previewBoundaryTest();
  previewCommandBridgeTest();
  previewContractTest();

  // 预览模型、窗口与 UI
  previewSupportFlagTest();
  previewTransitionTest();
  previewWindow1Test();
  previewWindow2Test();
  previewWindowDeep1Test();
  previewWindowDeep2Test();
  previewWindowExtraTest();
  privatePreviewUsabilityTest();
  privatePreviewInteractionTest();
  privatePreviewLayoutTest();
  privatePreviewRotationTest();
  privatePreviewStateTest();
  // 场景、压力与生命周期
  previewCaretCommandTest();
  syncExpansionScenarioTest();
  previewPayloadExpansionTest();
  previewSessionExpansionTest();
  previewFailureSessionExpansionTest();
  previewDataCommandExpansionTest();
  // 摘要、属性存储与选择命令
  summaryStructureTest();
  editorAttributeStorageTest();
  keyTableStabilityTest();
  keyActionFieldTest();
  previewSelectionCommandTest();
  stressSequenceTest();
  sessionOrderTest();
  editorJourneyTest();
  previewAfterDeletionTest();
  attributeCombinationTest();
  menuRelationTest();
  commandProtocolSequenceTest();
  // 极值、零命令与压力
  extremeArgumentTest();
  sessionStressTest();
  extremePayloadTest();
  zeroCommandTest();
  // 分类路由、命令序列与故障
  classificationRoutingCrossTest();
  deleteOrderVariantTest();
  previewPressureTest();
  enterSequenceTest();
  hideSequenceTest();
  extremeCountTest();
  commandQueueTest();
  faultCombinationTest();
  previewEditorInterlockTest();
  // 合并套件（契约、控制器、处理器、预览、UI）
  menuSymbolSuiteTest();
  savedStyleSuiteTest();
  shiftReleaseSuiteTest();
  faultRaceSuiteTest();
  previewFallbackSuiteTest();
  privatePreviewTextSuiteTest();
}
