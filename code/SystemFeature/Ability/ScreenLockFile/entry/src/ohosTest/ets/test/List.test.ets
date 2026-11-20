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

import { hilog } from '@kit.PerformanceAnalysisKit';
import abilityLifecycleTest from './AbilityLifecycle.test';
import apiStatesTest from './ApiStates.test';
import uiInteractionTest from './UiInteraction.test';
import edgeCasesTest from './EdgeCases.test';
import queryAppKeyStateTest from './QueryAppKeyState.test';
import acquireAccessTest from './AcquireAccess.test';
import releaseAccessTest from './ReleaseAccess.test';
import queryAllStatesTest from './QueryAllStates.test';
import enumValuesTest from './EnumValues.test';
import apiReturnTypeTest from './ApiReturnType.test';
import apiSequenceTest from './ApiSequence.test';
import apiIdempotencyTest from './ApiIdempotency.test';
import keyStatusEnumTest from './KeyStatusEnum.test';
import accessStatusEnumTest from './AccessStatusEnum.test';
import releaseStatusEnumTest from './ReleaseStatusEnum.test';
import constantsValidationTest from './ConstantsValidation.test';
import buttonClickTest from './ButtonClick.test';
import resultDisplayTest from './ResultDisplay.test';
import pairingStatusDisplayTest from './PairingStatusDisplay.test';
import historyListTest from './HistoryList.test';
import pageLayoutTest from './PageLayout.test';
import buttonStyleTest from './ButtonStyle.test';
import scrollBehaviorTest from './ScrollBehavior.test';
import cardStyleTest from './CardStyle.test';
import fontHierarchyTest from './FontHierarchy.test';
import textContentTest from './TextContent.test';
import pageStructureTest from './PageStructure.test';
import sectionLayoutTest from './SectionLayout.test';
import componentSpacingTest from './ComponentSpacing.test';
import responsiveLayoutTest from './ResponsiveLayout.test';
import visualConsistencyTest from './VisualConsistency.test';
import keyStateTransitionTest from './KeyStateTransition.test';
import lifecycleStateTest from './LifecycleState.test';
import foregroundBackgroundTest from './ForegroundBackground.test';
import stateConsistencyTest from './StateConsistency.test';
import pendingStateTest from './PendingState.test';
import restartRecoveryTest from './RestartRecovery.test';
import apiErrorHandlingTest from './ApiErrorHandling.test';
import errorInfoValidationTest from './ErrorInfoValidation.test';
import errorRecoveryTest from './ErrorRecovery.test';
import errorUIImpactTest from './ErrorUIImpact.test';
import sequentialErrorsTest from './SequentialErrors.test';
import errorBoundaryTest from './ErrorBoundary.test';
import historyRecordTest from './HistoryRecord.test';
import historyLimitTest from './HistoryLimit.test';
import historyClearTest from './HistoryClear.test';
import historyMixedOpsTest from './HistoryMixedOps.test';
import historyAfterRestartTest from './HistoryAfterRestart.test';
import acquireCountTest from './AcquireCount.test';
import releaseCountTest from './ReleaseCount.test';
import pendingCountTest from './PendingCount.test';
import pairingSymmetryTest from './PairingSymmetry.test';
import counterOverflowTest from './CounterOverflow.test';

import { DOMAIN, TAG } from './TestConstants';

interface SuiteInfo {
  name: string;
  domain: string;
  category: string;
  description: string;
}

const SUITE_INFO: SuiteInfo[] = [
  { name: 'AbilityLifecycle', domain: 'D00', category: 'Ability', description: '应用启动与页面元素完整性验证' },
  { name: 'ApiStates', domain: 'D01', category: 'State', description: 'screenLockFileManager API 状态机与枚举值验证' },
  { name: 'UiInteraction', domain: 'D02', category: 'UI', description: '按钮交互与结果展示验证' },
  { name: 'EdgeCases', domain: 'D04', category: 'Edge', description: '重复调用、异常顺序与边界场景验证' },
  { name: 'QueryAppKeyState', domain: 'D01', category: 'API', description: 'queryAppKeyState API 基础功能验证' },
  { name: 'AcquireAccess', domain: 'D01', category: 'API', description: 'acquireAccess API 基础功能验证' },
  { name: 'ReleaseAccess', domain: 'D01', category: 'API', description: 'releaseAccess API 基础功能验证' },
  { name: 'QueryAllStates', domain: 'D01', category: 'API', description: '全状态查询 API 基础功能验证' },
  { name: 'EnumValues', domain: 'D01', category: 'API', description: '枚举值定义与 API 一致性验证' },
  { name: 'ApiReturnType', domain: 'D01', category: 'API', description: 'API 返回值类型验证' },
  { name: 'ApiSequence', domain: 'D01', category: 'API', description: 'API 调用顺序验证' },
  { name: 'ApiIdempotency', domain: 'D01', category: 'API', description: 'API 幂等性验证' },
  { name: 'KeyStatusEnum', domain: 'D09', category: 'State', description: 'KeyStatus 枚举值完整性验证' },
  { name: 'AccessStatusEnum', domain: 'D09', category: 'State', description: 'AccessStatus 枚举值完整性验证' },
  { name: 'ReleaseStatusEnum', domain: 'D09', category: 'State', description: 'ReleaseStatus 枚举值完整性验证' },
  { name: 'ConstantsValidation', domain: 'D09', category: 'Config', description: '常量定义与 API 枚举一致性验证' },
  { name: 'ButtonClick', domain: 'D02', category: 'UI', description: '按钮点击交互功能验证' },
  { name: 'ResultDisplay', domain: 'D02', category: 'UI', description: '操作结果展示内容验证' },
  { name: 'PairingStatusDisplay', domain: 'D02', category: 'UI', description: '配对状态计数展示验证' },
  { name: 'HistoryList', domain: 'D02', category: 'UI', description: '历史记录列表功能验证' },
  { name: 'PageLayout', domain: 'D02', category: 'UI', description: '页面布局与组件排列验证' },
  { name: 'ButtonStyle', domain: 'D02', category: 'UI', description: '按钮样式与外观验证' },
  { name: 'ScrollBehavior', domain: 'D02', category: 'UI', description: '滚动容器行为验证' },
  { name: 'CardStyle', domain: 'D02', category: 'UI', description: '卡片样式与圆角验证' },
  { name: 'FontHierarchy', domain: 'D02', category: 'UI', description: '字体层级与大小关系验证' },
  { name: 'TextContent', domain: 'D02', category: 'UI', description: '文本内容与标签验证' },
  { name: 'PageStructure', domain: 'D12', category: 'Layout', description: '页面整体结构验证' },
  { name: 'SectionLayout', domain: 'D12', category: 'Layout', description: '分区布局与间距验证' },
  { name: 'ComponentSpacing', domain: 'D12', category: 'Layout', description: '组件间距与对齐验证' },
  { name: 'ResponsiveLayout', domain: 'D12', category: 'Layout', description: '响应式布局适配验证' },
  { name: 'VisualConsistency', domain: 'D12', category: 'Layout', description: '视觉一致性与设计规范验证' },
  { name: 'KeyStateTransition', domain: 'D03', category: 'State', description: '按键状态转换流程验证' },
  { name: 'LifecycleState', domain: 'D03', category: 'State', description: '应用生命周期状态验证' },
  { name: 'ForegroundBackground', domain: 'D03', category: 'State', description: '前台后台状态行为验证' },
  { name: 'StateConsistency', domain: 'D03', category: 'State', description: '状态一致性跨操作验证' },
  { name: 'PendingState', domain: 'D03', category: 'State', description: 'Pending 状态计数逻辑验证' },
  { name: 'RestartRecovery', domain: 'D03', category: 'State', description: '重启恢复与状态重置验证' },
  { name: 'ApiErrorHandling', domain: 'D04', category: 'Error', description: 'API 错误处理与 try-catch 验证' },
  { name: 'ErrorInfoValidation', domain: 'D04', category: 'Error', description: '错误信息字段有效性验证' },
  { name: 'ErrorRecovery', domain: 'D04', category: 'Error', description: '错误恢复与状态重建验证' },
  { name: 'ErrorUIImpact', domain: 'D04', category: 'Error', description: '错误对 UI 组件影响验证' },
  { name: 'SequentialErrors', domain: 'D04', category: 'Error', description: '连续错误场景处理验证' },
  { name: 'ErrorBoundary', domain: 'D04', category: 'Error', description: '错误边界条件与极端值验证' },
  { name: 'HistoryRecord', domain: 'D06', category: 'History', description: '历史记录基本记录验证' },
  { name: 'HistoryLimit', domain: 'D06', category: 'History', description: '历史记录上限验证' },
  { name: 'HistoryClear', domain: 'D06', category: 'History', description: '历史清除功能验证' },
  { name: 'HistoryMixedOps', domain: 'D06', category: 'History', description: '混合操作历史记录验证' },
  { name: 'HistoryAfterRestart', domain: 'D06', category: 'History', description: '清除后历史记录恢复验证' },
  { name: 'AcquireCount', domain: 'D07', category: 'State', description: 'acquire 计数精确值验证' },
  { name: 'ReleaseCount', domain: 'D07', category: 'State', description: 'release 计数精确值验证' },
  { name: 'PendingCount', domain: 'D07', category: 'State', description: 'pending 计数逻辑验证' },
  { name: 'PairingSymmetry', domain: 'D07', category: 'State', description: '配对对称性验证' },
  { name: 'CounterOverflow', domain: 'D07', category: 'State', description: '计数器溢出与极端值验证' }
];

function getSuiteCountByDomain(): string {
  const domainMap: Record<string, number> = {};
  for (let i: number = 0; i < SUITE_INFO.length; i++) {
    const domain: string = SUITE_INFO[i].domain;
    if (domainMap[domain] === undefined) {
      domainMap[domain] = 0;
    }
    domainMap[domain] = domainMap[domain] + 1;
  }
  const entries: string[] = [];
  const keys: string[] = Object.keys(domainMap);
  for (let i: number = 0; i < keys.length; i++) {
    entries.push(`${keys[i]}:${domainMap[keys[i]]}`);
  }
  return entries.join(', ');
}

export default function testsuite(): void {
  hilog.info(DOMAIN, TAG, 'Starting %{public}d test suites', SUITE_INFO.length);
  hilog.info(DOMAIN, TAG, 'Domain distribution: %{public}s', getSuiteCountByDomain());

  hilog.info(DOMAIN, TAG, 'Running suite: AbilityLifecycle (domain=D00)');
  abilityLifecycleTest();
  hilog.info(DOMAIN, TAG, 'Running suite: ApiStates (domain=D01)');
  apiStatesTest();
  hilog.info(DOMAIN, TAG, 'Running suite: UiInteraction (domain=D02)');
  uiInteractionTest();
  hilog.info(DOMAIN, TAG, 'Running suite: EdgeCases (domain=D04)');
  edgeCasesTest();
  hilog.info(DOMAIN, TAG, 'Running suite: QueryAppKeyState (domain=D01)');
  queryAppKeyStateTest();
  hilog.info(DOMAIN, TAG, 'Running suite: AcquireAccess (domain=D01)');
  acquireAccessTest();
  hilog.info(DOMAIN, TAG, 'Running suite: ReleaseAccess (domain=D01)');
  releaseAccessTest();
  hilog.info(DOMAIN, TAG, 'Running suite: QueryAllStates (domain=D01)');
  queryAllStatesTest();
  hilog.info(DOMAIN, TAG, 'Running suite: EnumValues (domain=D01)');
  enumValuesTest();
  hilog.info(DOMAIN, TAG, 'Running suite: ApiReturnType (domain=D01)');
  apiReturnTypeTest();
  hilog.info(DOMAIN, TAG, 'Running suite: ApiSequence (domain=D01)');
  apiSequenceTest();
  hilog.info(DOMAIN, TAG, 'Running suite: ApiIdempotency (domain=D01)');
  apiIdempotencyTest();
  hilog.info(DOMAIN, TAG, 'Running suite: KeyStatusEnum (domain=D09)');
  keyStatusEnumTest();
  hilog.info(DOMAIN, TAG, 'Running suite: AccessStatusEnum (domain=D09)');
  accessStatusEnumTest();
  hilog.info(DOMAIN, TAG, 'Running suite: ReleaseStatusEnum (domain=D09)');
  releaseStatusEnumTest();
  hilog.info(DOMAIN, TAG, 'Running suite: ConstantsValidation (domain=D09)');
  constantsValidationTest();
  hilog.info(DOMAIN, TAG, 'Running suite: ButtonClick (domain=D02)');
  buttonClickTest();
  hilog.info(DOMAIN, TAG, 'Running suite: ResultDisplay (domain=D02)');
  resultDisplayTest();
  hilog.info(DOMAIN, TAG, 'Running suite: PairingStatusDisplay (domain=D02)');
  pairingStatusDisplayTest();
  hilog.info(DOMAIN, TAG, 'Running suite: HistoryList (domain=D02)');
  historyListTest();
  hilog.info(DOMAIN, TAG, 'Running suite: PageLayout (domain=D02)');
  pageLayoutTest();
  hilog.info(DOMAIN, TAG, 'Running suite: ButtonStyle (domain=D02)');
  buttonStyleTest();
  hilog.info(DOMAIN, TAG, 'Running suite: ScrollBehavior (domain=D02)');
  scrollBehaviorTest();
  hilog.info(DOMAIN, TAG, 'Running suite: CardStyle (domain=D02)');
  cardStyleTest();
  hilog.info(DOMAIN, TAG, 'Running suite: FontHierarchy (domain=D02)');
  fontHierarchyTest();
  hilog.info(DOMAIN, TAG, 'Running suite: TextContent (domain=D02)');
  textContentTest();
  hilog.info(DOMAIN, TAG, 'Running suite: PageStructure (domain=D12)');
  pageStructureTest();
  hilog.info(DOMAIN, TAG, 'Running suite: SectionLayout (domain=D12)');
  sectionLayoutTest();
  hilog.info(DOMAIN, TAG, 'Running suite: ComponentSpacing (domain=D12)');
  componentSpacingTest();
  hilog.info(DOMAIN, TAG, 'Running suite: ResponsiveLayout (domain=D12)');
  responsiveLayoutTest();
  hilog.info(DOMAIN, TAG, 'Running suite: VisualConsistency (domain=D12)');
  visualConsistencyTest();
  hilog.info(DOMAIN, TAG, 'Running suite: KeyStateTransition (domain=D03)');
  keyStateTransitionTest();
  hilog.info(DOMAIN, TAG, 'Running suite: LifecycleState (domain=D03)');
  lifecycleStateTest();
  hilog.info(DOMAIN, TAG, 'Running suite: ForegroundBackground (domain=D03)');
  foregroundBackgroundTest();
  hilog.info(DOMAIN, TAG, 'Running suite: StateConsistency (domain=D03)');
  stateConsistencyTest();
  hilog.info(DOMAIN, TAG, 'Running suite: PendingState (domain=D03)');
  pendingStateTest();
  hilog.info(DOMAIN, TAG, 'Running suite: RestartRecovery (domain=D03)');
  restartRecoveryTest();
  hilog.info(DOMAIN, TAG, 'Running suite: ApiErrorHandling (domain=D04)');
  apiErrorHandlingTest();
  hilog.info(DOMAIN, TAG, 'Running suite: ErrorInfoValidation (domain=D04)');
  errorInfoValidationTest();
  hilog.info(DOMAIN, TAG, 'Running suite: ErrorRecovery (domain=D04)');
  errorRecoveryTest();
  hilog.info(DOMAIN, TAG, 'Running suite: ErrorUIImpact (domain=D04)');
  errorUIImpactTest();
  hilog.info(DOMAIN, TAG, 'Running suite: SequentialErrors (domain=D04)');
  sequentialErrorsTest();
  hilog.info(DOMAIN, TAG, 'Running suite: ErrorBoundary (domain=D04)');
  errorBoundaryTest();
  hilog.info(DOMAIN, TAG, 'Running suite: HistoryRecord (domain=D06)');
  historyRecordTest();
  hilog.info(DOMAIN, TAG, 'Running suite: HistoryLimit (domain=D06)');
  historyLimitTest();
  hilog.info(DOMAIN, TAG, 'Running suite: HistoryClear (domain=D06)');
  historyClearTest();
  hilog.info(DOMAIN, TAG, 'Running suite: HistoryMixedOps (domain=D06)');
  historyMixedOpsTest();
  hilog.info(DOMAIN, TAG, 'Running suite: HistoryAfterRestart (domain=D06)');
  historyAfterRestartTest();
  hilog.info(DOMAIN, TAG, 'Running suite: AcquireCount (domain=D07)');
  acquireCountTest();
  hilog.info(DOMAIN, TAG, 'Running suite: ReleaseCount (domain=D07)');
  releaseCountTest();
  hilog.info(DOMAIN, TAG, 'Running suite: PendingCount (domain=D07)');
  pendingCountTest();
  hilog.info(DOMAIN, TAG, 'Running suite: PairingSymmetry (domain=D07)');
  pairingSymmetryTest();
  hilog.info(DOMAIN, TAG, 'Running suite: CounterOverflow (domain=D07)');
  counterOverflowTest();

  hilog.info(DOMAIN, TAG, 'All %{public}d test suites completed.', SUITE_INFO.length);
}
