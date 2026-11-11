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

import distributedDataTest from './DistributedData.test';
import distributedDeviceTest from './DistributedDevice.test';
import distributedCatalogMatrixTest from './DistributedCatalogMatrix.test';
import distributedProbeStateMatrixTest from './DistributedProbeStateMatrix.test';
import distributedErrorMapMatrixTest from './DistributedErrorMapMatrix.test';
import distributedTextCodecMatrixTest from './DistributedTextCodecMatrix.test';
import distributedPayloadPreviewMatrixTest from './DistributedPayloadPreviewMatrix.test';
import distributedCollabMatrixTest from './DistributedCollabMatrix.test';
import distributedContextMatrixTest from './DistributedContextMatrix.test';
import distributedLinkStageMatrixTest from './DistributedLinkStageMatrix.test';
import distributedChannelStageMatrixTest from './DistributedChannelStageMatrix.test';
import distributedLogStoreMatrixTest from './DistributedLogStoreMatrix.test';
import distributedFormatMatrixTest from './DistributedFormatMatrix.test';
import distributedThemeMatrixTest from './DistributedThemeMatrix.test';
import distributedConstantsMatrixTest from './DistributedConstantsMatrix.test';
import distributedWidgetToneTest from './DistributedWidgetTone.test';
import distributedProbeOutcomeMatrixTest from './DistributedProbeOutcomeMatrix.test';
import distributedRunnerGuardMatrixTest from './DistributedRunnerGuardMatrix.test';
import distributedPeerModelMatrixTest from './DistributedPeerModelMatrix.test';
import distributedPermissionModelMatrixTest from './DistributedPermissionModelMatrix.test';
import distributedErrorCrossMatrixTest from './DistributedErrorCrossMatrix.test';
import distributedLinkFsmMatrixTest from './DistributedLinkFsmMatrix.test';
import distributedChannelFsmMatrixTest from './DistributedChannelFsmMatrix.test';
import distributedCodecBoundaryMatrixTest from './DistributedCodecBoundaryMatrix.test';
import distributedLogQueryMatrixTest from './DistributedLogQueryMatrix.test';
import distributedCollabCatalogMatrixTest from './DistributedCollabCatalogMatrix.test';
import distributedFormatContextMatrixTest from './DistributedFormatContextMatrix.test';
import distributedThrownParseMatrixTest from './DistributedThrownParseMatrix.test';
import distributedPerfBudgetTest from './DistributedPerfBudget.test';
import distributedStabilityLoopTest from './DistributedStabilityLoop.test';
import distributedInputGuardTest from './DistributedInputGuard.test';
import distributedCompatMatrixTest from './DistributedCompatMatrix.test';
import distributedTextContractTest from './DistributedTextContract.test';
import distributedRecoverPathTest from './DistributedRecoverPath.test';
import distributedPipelineScenarioTest from './DistributedPipelineScenario.test';
import distributedDeviceComboScenarioTest from './DistributedDeviceComboScenario.test';
import distributedUiSmokeTest from './DistributedUiSmoke.test';
import distributedUtf8AsciiGridTest from './DistributedUtf8AsciiGrid.test';
import distributedUtf8MalformedGridTest from './DistributedUtf8MalformedGrid.test';
import distributedHexPreviewGridTest from './DistributedHexPreviewGrid.test';
import distributedUtf8LatinGridTest from './DistributedUtf8LatinGrid.test';
import distributedUtf8TwoByteGridTest from './DistributedUtf8TwoByteGrid.test';
import distributedUtf8CjkGridTest from './DistributedUtf8CjkGrid.test';
import distributedUtf8CjkGridPart2Test from './DistributedUtf8CjkGridPart2.test';
import distributedUtf8FourByteGridTest from './DistributedUtf8FourByteGrid.test';
import distributedUtf8MixedGridTest from './DistributedUtf8MixedGrid.test';
import distributedPad2GridTest from './DistributedPad2Grid.test';
import distributedDurationGridTest from './DistributedDurationGrid.test';
import distributedDurationSecondGridTest from './DistributedDurationSecondGrid.test';
import distributedDurationMinuteGridTest from './DistributedDurationMinuteGrid.test';
import distributedClockGridTest from './DistributedClockGrid.test';
import distributedStampGridTest from './DistributedStampGrid.test';
import distributedTruncateGridTest from './DistributedTruncateGrid.test';
import distributedClampGridTest from './DistributedClampGrid.test';
import distributedLogQueryGridTest from './DistributedLogQueryGrid.test';
import distributedLogCapacityGridTest from './DistributedLogCapacityGrid.test';
import distributedLogTagGridTest from './DistributedLogTagGrid.test';
import distributedLogLimitGridTest from './DistributedLogLimitGrid.test';
import distributedCatalogKeywordGridTest from './DistributedCatalogKeywordGrid.test';
import distributedCatalogFieldGridTest from './DistributedCatalogFieldGrid.test';
import distributedCollabIndexGridTest from './DistributedCollabIndexGrid.test';
import distributedLinkTriplePathGridTest from './DistributedLinkTriplePathGrid.test';
import distributedLinkTriplePathGridPart2Test from './DistributedLinkTriplePathGridPart2.test';
import distributedLinkQuadPathGridTest from './DistributedLinkQuadPathGrid.test';
import distributedLinkQuadPathGridPart2Test from './DistributedLinkQuadPathGridPart2.test';
import distributedChannelPathGridTest from './DistributedChannelPathGrid.test';
import distributedCodecAffixGridTest from './DistributedCodecAffixGrid.test';
import distributedCodecAffixGridPart2Test from './DistributedCodecAffixGridPart2.test';
import distributedErrorMessageGridTest from './DistributedErrorMessageGrid.test';
import distributedComposeGridTest from './DistributedComposeGrid.test';
import distributedHexLimitGridTest from './DistributedHexLimitGrid.test';

export default function testsuite() {
  // 本文件只做「导入 + 直接调用」：DevEco 运行测试时静态扫描这里，任何非 *.test 模块的导入都会让扫描结果清零，
  // 表现为 00502002（在包中未找到任何测试用例）。主线程让出策略见各测试文件 describe 内的 beforeEachIt。
  // 纯数据与纯函数：断言主模块里的文案规则、状态机、编解码与常量表
  distributedDataTest();
  distributedCatalogMatrixTest();
  distributedProbeStateMatrixTest();
  distributedErrorMapMatrixTest();
  distributedTextCodecMatrixTest();
  distributedPayloadPreviewMatrixTest();
  distributedCollabMatrixTest();
  distributedContextMatrixTest();
  distributedLinkStageMatrixTest();
  distributedChannelStageMatrixTest();
  distributedLogStoreMatrixTest();
  distributedFormatMatrixTest();
  distributedThemeMatrixTest();
  distributedConstantsMatrixTest();
  distributedWidgetToneTest();
  // 分层细粒度矩阵：错误码交叉、状态机穷举、编解码边界
  distributedErrorCrossMatrixTest();
  distributedLinkFsmMatrixTest();
  distributedChannelFsmMatrixTest();
  distributedCodecBoundaryMatrixTest();
  distributedLogQueryMatrixTest();
  distributedCollabCatalogMatrixTest();
  distributedFormatContextMatrixTest();
  distributedThrownParseMatrixTest();
  // 新输入值网格：逐字符 / 逐字节 / 逐 limit 展开，断言仍是真实期望值
  distributedUtf8AsciiGridTest();
  distributedUtf8MalformedGridTest();
  distributedHexPreviewGridTest();
  distributedUtf8LatinGridTest();
  distributedUtf8TwoByteGridTest();
  distributedUtf8CjkGridTest();
  distributedUtf8CjkGridPart2Test();
  distributedUtf8FourByteGridTest();
  distributedUtf8MixedGridTest();
  distributedPad2GridTest();
  distributedDurationGridTest();
  distributedDurationSecondGridTest();
  distributedDurationMinuteGridTest();
  distributedClockGridTest();
  distributedStampGridTest();
  distributedTruncateGridTest();
  distributedClampGridTest();
  distributedLogQueryGridTest();
  distributedLogCapacityGridTest();
  distributedLogTagGridTest();
  distributedLogLimitGridTest();
  distributedCatalogKeywordGridTest();
  distributedCatalogFieldGridTest();
  distributedCollabIndexGridTest();
  distributedLinkTriplePathGridTest();
  distributedLinkTriplePathGridPart2Test();
  distributedLinkQuadPathGridTest();
  distributedLinkQuadPathGridPart2Test();
  distributedChannelPathGridTest();
  distributedCodecAffixGridTest();
  distributedCodecAffixGridPart2Test();
  distributedErrorMessageGridTest();
  distributedComposeGridTest();
  distributedHexLimitGridTest();
  // 质量轴：性能预算、稳定性、非法输入、常量兼容、国际化文案、失败恢复
  distributedPerfBudgetTest();
  distributedStabilityLoopTest();
  distributedInputGuardTest();
  distributedCompatMatrixTest();
  distributedTextContractTest();
  distributedRecoverPathTest();
  // 组合大场景（总）：跨模块流水线，把上面各层串成页面真实会走的链路
  distributedPipelineScenarioTest();
  // 真调用：结果取决于本机权限与组网状态，用例内部对成功/失败两条分支都做断言
  distributedDeviceTest();
  distributedProbeOutcomeMatrixTest();
  distributedRunnerGuardMatrixTest();
  distributedPeerModelMatrixTest();
  distributedPermissionModelMatrixTest();
  // 设备真调用组合（总）：权限、能力位、linkEnhance、proxyChannelManager 与蓝牙扫描串跑
  distributedDeviceComboScenarioTest();
  // UI 冒烟排在最后：它要独占前台窗口，慢一步也不影响前两组
  distributedUiSmokeTest();
}
