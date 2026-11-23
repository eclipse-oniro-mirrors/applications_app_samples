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

import boundaryTest from './boundary/BoundaryTest.test';
import commonContractTest from './common/CommonContractTest.test';
import controllerContractTest from './controller/ControllerContractTest.test';
import controllerStateTest001 from './controller/ControllerStateTest001.test';
import controllerStateTest002 from './controller/ControllerStateTest002.test';
import controllerHoldGraphTest from './extended/ControllerHoldGraphTest.test';
import controllerStateTraversalTest from './extended/ControllerStateTraversalTest.test';
import editorAttributeExtremeTest from './extended/EditorAttributeExtremeTest.test';
import enduranceAggregateTest001 from './extended/EnduranceAggregateTest001.test';
import enduranceAggregateTest002 from './extended/EnduranceAggregateTest002.test';
import faultResilienceTest from './extended/FaultResilienceTest.test';
import handlerAsyncTimingTest from './extended/HandlerAsyncTimingTest.test';
import handlerClientMatrixTest from './extended/HandlerClientMatrixTest.test';
import handlerLifecycleDeepTest from './extended/HandlerLifecycleDeepTest.test';
import keyDataCrossCheckTest from './extended/KeyDataCrossCheckTest.test';
import keyDataOrderInvariantTest from './extended/KeyDataOrderInvariantTest.test';
import layoutRenderEdgeTest from './extended/LayoutRenderEdgeTest.test';
import modifierScenarioTest from './extended/ModifierScenarioTest.test';
import payloadVarietyTest from './extended/PayloadVarietyTest.test';
import styleResolutionTest from './extended/StyleResolutionTest.test';
import textEditingScenarioTest from './extended/TextEditingScenarioTest.test';
import inputHandlerClientFamilyTest from './handler/InputHandlerClientFamilyTest.test';
import inputHandlerContractFamilyTest from './handler/InputHandlerContractFamilyTest.test';
import inputHandlerDataFamilyTest from './handler/InputHandlerDataFamilyTest.test';
import inputHandlerPreviewEdgeTest from './handler/InputHandlerPreviewEdgeTest.test';
import hardKeyFunctionRoutingTest from './hardkey/HardKeyFunctionRoutingTest.test';
import hardKeyMappingTest from './hardkey/HardKeyMappingTest.test';
import hardKeyStageTest from './hardkey/HardKeyStageTest.test';
import hardKeyDetachedRoutingTest from './hardkey/HardKeyDetachedRoutingTest.test';
import keyClassPartitionTest from './keydata/KeyClassPartitionTest.test';
import keyDataAggregateFamilyTest from './keydata/KeyDataAggregateFamilyTest.test';
import keyDataMappingFamilyTest001 from './keydata/KeyDataMappingFamilyTest001.test';
import keyDataMappingFamilyTest002 from './keydata/KeyDataMappingFamilyTest002.test';
import keyDataTypeFamilyTest from './keydata/KeyDataTypeFamilyTest.test';
import layoutFamilyTest from './layout/LayoutFamilyTest.test';
import rowSumCompositionTest from './layout/RowSumCompositionTest.test';
import physicalKeyJourneyTest from './journeys/PhysicalKeyJourneyTest.test';
import refreshFieldReplacementTest from './handler/RefreshFieldReplacementTest.test';
import storageSnapshotConsistencyTest from './contract/StorageSnapshotConsistencyTest.test';
import correctionScenarioTest from './scenarios/CorrectionScenarioTest.test';
import wordScenarioTest from './scenarios/WordScenarioTest.test';
import sessionScenarioTest from './scenarios/SessionScenarioTest.test';
import integrationGapScenarioTest from './scenarios/IntegrationGapScenarioTest.test';
import syncExpansionScenarioTest from './scenarios/SyncExpansionScenarioTest.test';
import modifierFlowExpansionTest from './scenarios/ModifierFlowExpansionTest.test';
import shiftCommandExpansionTest from './scenarios/ShiftCommandExpansionTest.test';
import shiftPayloadExpansionTest from './scenarios/ShiftPayloadExpansionTest.test';
import commandMixExpansionTest from './scenarios/CommandMixExpansionTest.test';
import handlerSummaryStructureTest from './contract/HandlerSummaryStructureTest.test';
import keyTableStabilityTest from './contract/KeyTableStabilityTest.test';
import handlerStorageKeyTest from './contract/HandlerStorageKeyTest.test';
import clientJournalCapacityTest from './contract/ClientJournalCapacityTest.test';
import reattachKeyboardSwapTest from './contract/ReattachKeyboardSwapTest.test';
import stressSequenceTest from './performance/StressSequenceTest.test';
import sessionOrderTest from './lifecycle/SessionOrderTest.test';
import commandProtocolSequenceTest from './handler/CommandProtocolSequenceTest.test';
import menuTransitionTest from './contract/MenuTransitionTest.test';
import extremeArgumentTest from './validation/ExtremeArgumentTest.test';
import sessionStressTest from './performance/SessionStressTest.test';
import extremePayloadTest from './validation/ExtremePayloadTest.test';
import classificationRoutingCrossTest from './controller/ClassificationRoutingCrossTest.test';
import deleteOrderVariantTest from './handler/DeleteOrderVariantTest.test';
import tokenArgumentTest from './validation/TokenArgumentTest.test';
import clientPressureTest from './performance/ClientPressureTest.test';
import enterSequenceTest from './handler/EnterSequenceTest.test';
import hideSequenceTest from './handler/HideSequenceTest.test';
import extremeCountTest from './performance/ExtremeCountTest.test';
import commandQueueTest from './performance/CommandQueueTest.test';
import faultCombinationTest from './handler/FaultCombinationTest.test';
import classifierCountTest from './validation/ClassifierCountTest.test';

export default function testsuite() {
  // 边界与公共契约
  boundaryTest();
  commonContractTest();

  // 控制器契约与状态
  controllerContractTest();
  controllerStateTest001();
  controllerStateTest002();

  // 扩展场景（控制器、处理器、键表、布局）
  controllerHoldGraphTest();
  controllerStateTraversalTest();
  editorAttributeExtremeTest();
  enduranceAggregateTest001();
  enduranceAggregateTest002();
  faultResilienceTest();
  handlerAsyncTimingTest();
  handlerClientMatrixTest();
  handlerLifecycleDeepTest();
  keyDataCrossCheckTest();
  keyDataOrderInvariantTest();
  layoutRenderEdgeTest();
  modifierScenarioTest();
  payloadVarietyTest();
  styleResolutionTest();
  textEditingScenarioTest();

  // 输入处理器族
  inputHandlerClientFamilyTest();
  inputHandlerContractFamilyTest();
  inputHandlerDataFamilyTest();
  inputHandlerPreviewEdgeTest();

  // 硬键映射与路由
  hardKeyFunctionRoutingTest();
  hardKeyMappingTest();
  hardKeyStageTest();
  hardKeyDetachedRoutingTest();

  // 键表数据与布局
  keyClassPartitionTest();
  keyDataAggregateFamilyTest();
  keyDataMappingFamilyTest001();
  keyDataMappingFamilyTest002();
  keyDataTypeFamilyTest();
  layoutFamilyTest();

  // 旅程、刷新与存储
  physicalKeyJourneyTest();
  refreshFieldReplacementTest();
  storageSnapshotConsistencyTest();
  rowSumCompositionTest();

  // 场景组合
  correctionScenarioTest();
  wordScenarioTest();
  sessionScenarioTest();
  integrationGapScenarioTest();
  syncExpansionScenarioTest();
  modifierFlowExpansionTest();
  shiftCommandExpansionTest();
  shiftPayloadExpansionTest();
  commandMixExpansionTest();

  // 契约、存储与菜单
  handlerSummaryStructureTest();
  keyTableStabilityTest();
  handlerStorageKeyTest();
  clientJournalCapacityTest();
  reattachKeyboardSwapTest();

  // 压力、生命周期与命令序列
  stressSequenceTest();
  sessionOrderTest();
  commandProtocolSequenceTest();
  menuTransitionTest();

  // 极值与校验
  extremeArgumentTest();
  sessionStressTest();
  extremePayloadTest();

  // 分类路由与编辑序列
  classificationRoutingCrossTest();
  deleteOrderVariantTest();
  tokenArgumentTest();

  // 压力与故障组合
  clientPressureTest();
  enterSequenceTest();
  hideSequenceTest();
  extremeCountTest();
  commandQueueTest();
  faultCombinationTest();
  classifierCountTest();
}
