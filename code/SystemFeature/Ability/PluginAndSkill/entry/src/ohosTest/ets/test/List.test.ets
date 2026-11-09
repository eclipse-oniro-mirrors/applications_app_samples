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
import abilityTest from './Ability.test';
import selfSkillQueryTest from './SelfSkillQuery.test';
import bundleSkillQueryTest from './BundleSkillQuery.test';
import allSkillsQueryTest from './AllSkillsQuery.test';
import indexAndNavigationTest from './IndexAndNavigation.test';
import resultFieldValidationTest from './ResultFieldValidation.test';
import navigationFlowTest from './NavigationFlow.test';
import stateConsistencyTest from './StateConsistency.test';
import errorHandlingTest from './ErrorHandling.test';
import skillExecutionTest from './SkillExecution.test';
import skillCompareAndHistoryTest from './SkillCompareAndHistory.test';
import skillBatchTest from './PluginCompareAndBatch.test';
import advancedFeatureTest from './AdvancedFeatureTest.test';
import assertionHelperTest from './AssertionHelper.test';
import performanceTrackerTest from './PerformanceTracker.test';
import testDataProviderTest from './TestDataProvider.test';
import testMetricsCollectorTest from './TestMetricsCollector.test';
import testDataGeneratorTest from './TestDataGenerator.test';
import testEnvironmentCheckerTest from './TestEnvironmentChecker.test';
import testLogAnalyzerTest from './TestLogAnalyzer.test';
import testReportGeneratorTest from './TestReportGenerator.test';
import constantValidationTest from './ConstantValidation.test';
import skillManagerHomeExtendedTest from './SkillManagerHomeExtended.test';
import skillBatchExtendedTest from './SkillBatchExtended.test';
import skillHistoryExtendedTest from './SkillHistoryExtended.test';
import skillCompareExtendedTest from './SkillCompareExtended.test';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PluginAndSkill]';

// ==================== 测试套件结构化管理 ====================

// 套件分类
const CATEGORY_ABILITY: string = 'Ability';
const CATEGORY_SKILL_QUERY: string = 'SkillQuery';
const CATEGORY_NAVIGATION: string = 'Navigation';
const CATEGORY_VALIDATION: string = 'Validation';
const CATEGORY_STATE: string = 'State';
const CATEGORY_ERROR: string = 'Error';
const CATEGORY_EXECUTION: string = 'Execution';
const CATEGORY_COMPARE: string = 'Compare';
const CATEGORY_BATCH: string = 'Batch';
const CATEGORY_ADVANCED: string = 'Advanced';
const CATEGORY_UTIL: string = 'Util';

// 套件元数据定义
interface SuiteManifest {
  name: string;
  category: string;
  description: string;
  caseCount: number;
  factory: () => void;
}

// 套件清单：按分类组织，便于管理和统计
const SUITE_MANIFEST: SuiteManifest[] = [
  {
    name: 'PluginAndSkillAbilityTest',
    category: CATEGORY_ABILITY,
    description: '应用启动与首页元素完整性验证',
    caseCount: 2,
    factory: abilityTest
  },
  {
    name: 'SelfSkillQueryTest',
    category: CATEGORY_SKILL_QUERY,
    description: '自有技能查询：参数校验、成功、异常、Flag 验证',
    caseCount: 15,
    factory: selfSkillQueryTest
  },
  {
    name: 'BundleSkillQueryTest',
    category: CATEGORY_SKILL_QUERY,
    description: '应用技能查询：参数校验、成功、异常、Flag 验证',
    caseCount: 17,
    factory: bundleSkillQueryTest
  },
  {
    name: 'AllSkillsQueryTest',
    category: CATEGORY_SKILL_QUERY,
    description: '设备全部技能查询：基础查询、Flag 验证',
    caseCount: 8,
    factory: allSkillsQueryTest
  },
  {
    name: 'IndexAndNavigationTest',
    category: CATEGORY_NAVIGATION,
    description: 'Index 页面 UI、SkillManagerHome 导航、页面往返流程',
    caseCount: 10,
    factory: indexAndNavigationTest
  },
  {
    name: 'ResultFieldValidationTest',
    category: CATEGORY_VALIDATION,
    description: '三个查询页面结果卡片字段级验证',
    caseCount: 20,
    factory: resultFieldValidationTest
  },
  {
    name: 'NavigationFlowTest',
    category: CATEGORY_NAVIGATION,
    description: '多步导航路径、按钮状态、边界场景',
    caseCount: 10,
    factory: navigationFlowTest
  },
  {
    name: 'StateConsistencyTest',
    category: CATEGORY_STATE,
    description: '选择器状态、结果卡片状态、跨页面状态隔离',
    caseCount: 10,
    factory: stateConsistencyTest
  },
  {
    name: 'ErrorHandlingTest',
    category: CATEGORY_ERROR,
    description: '错误信息验证、空参数验证、错误恢复',
    caseCount: 10,
    factory: errorHandlingTest
  },
  {
    name: 'SkillExecutionTest',
    category: CATEGORY_EXECUTION,
    description: '技能执行页面：UI 验证、执行操作、选择器验证',
    caseCount: 10,
    factory: skillExecutionTest
  },
  {
    name: 'SkillCompareAndHistoryTest',
    category: CATEGORY_COMPARE,
    description: '技能对比与历史：对比操作、历史记录、筛选统计',
    caseCount: 10,
    factory: skillCompareAndHistoryTest
  },
  {
    name: 'SkillBatchTest',
    category: CATEGORY_BATCH,
    description: '批量技能操作：UI 验证、技能切换、执行操作',
    caseCount: 5,
    factory: skillBatchTest
  },
  {
    name: 'AdvancedFeatureTest',
    category: CATEGORY_ADVANCED,
    description: '高级功能场景：对比组合、历史详情、批量选择、执行记录',
    caseCount: 10,
    factory: advancedFeatureTest
  },
  {
    name: 'AssertionHelperTest',
    category: CATEGORY_UTIL,
    description: '断言工具类：各种断言方法、结果收集、统计报告、单例模式',
    caseCount: 68,
    factory: assertionHelperTest
  },
  {
    name: 'PerformanceTrackerTest',
    category: CATEGORY_UTIL,
    description: '性能跟踪器：计时器、指标记录、分类过滤、统计汇总、报告生成',
    caseCount: 38,
    factory: performanceTrackerTest
  },
  {
    name: 'TestDataProviderTest',
    category: CATEGORY_UTIL,
    description: '测试数据提供器：单例模式、参数工厂、用例生成、分类统计',
    caseCount: 32,
    factory: testDataProviderTest
  },
  {
    name: 'TestMetricsCollectorTest',
    category: CATEGORY_UTIL,
    description: '指标收集器：单例模式、记录/累加/淘汰、分类汇总、报告生成',
    caseCount: 25,
    factory: testMetricsCollectorTest
  },
  {
    name: 'TestDataGeneratorTest',
    category: CATEGORY_UTIL,
    description: '测试数据生成器：组合生成、边界用例、计数器、完整套件',
    caseCount: 25,
    factory: testDataGeneratorTest
  },
  {
    name: 'TestEnvironmentCheckerTest',
    category: CATEGORY_UTIL,
    description: '环境检查器：单例模式、常量校验、完整性检查、报告生成',
    caseCount: 25,
    factory: testEnvironmentCheckerTest
  },
  {
    name: 'TestLogAnalyzerTest',
    category: CATEGORY_UTIL,
    description: '日志分析器：级别过滤、标签搜索、用例识别、通过率统计',
    caseCount: 25,
    factory: testLogAnalyzerTest
  },
  {
    name: 'TestReportGeneratorTest',
    category: CATEGORY_UTIL,
    description: '报告生成器：条目管理、质量评分、套件分组、文本报告',
    caseCount: 25,
    factory: testReportGeneratorTest
  },
  {
    name: 'ConstantValidationTest',
    category: CATEGORY_UTIL,
    description: '常量配置验证：数组长度、默认值、索引范围、Flag 值、UI 常量',
    caseCount: 20,
    factory: constantValidationTest
  },
  {
    name: 'SkillManagerHomeExtendedTest',
    category: CATEGORY_NAVIGATION,
    description: '技能管理页扩展：按钮完整性、导航往返、导航深度',
    caseCount: 8,
    factory: skillManagerHomeExtendedTest
  },
  {
    name: 'SkillBatchExtendedTest',
    category: CATEGORY_BATCH,
    description: '批量操作扩展：单选执行、Summary 卡片、Record 字段、选择切换',
    caseCount: 12,
    factory: skillBatchExtendedTest
  },
  {
    name: 'SkillHistoryExtendedTest',
    category: CATEGORY_COMPARE,
    description: '历史记录扩展：统计准确性、记录字段、筛选交互、多次累积',
    caseCount: 12,
    factory: skillHistoryExtendedTest
  },
  {
    name: 'SkillCompareExtendedTest',
    category: CATEGORY_COMPARE,
    description: '技能对比扩展：相同/不同对比、不存在技能、选择器状态',
    caseCount: 10,
    factory: skillCompareExtendedTest
  }
];

// ==================== 套件管理工具函数 ====================

// 按分类统计套件数量
export function countByCategory(category: string): number {
  let count: number = 0;
  for (let i: number = 0; i < SUITE_MANIFEST.length; i++) {
    if (SUITE_MANIFEST[i].category === category) {
      count++;
    }
  }
  return count;
}

// 按名称查找套件
export function findSuite(name: string): SuiteManifest | undefined {
  for (let i: number = 0; i < SUITE_MANIFEST.length; i++) {
    if (SUITE_MANIFEST[i].name === name) {
      return SUITE_MANIFEST[i];
    }
  }
  return undefined;
}

// 获取全部套件名称
export function getSuiteNames(): string[] {
  const names: string[] = [];
  for (let i: number = 0; i < SUITE_MANIFEST.length; i++) {
    names.push(SUITE_MANIFEST[i].name);
  }
  return names;
}

// 获取用例总数
export function getTotalCaseCount(): number {
  let total: number = 0;
  for (let i: number = 0; i < SUITE_MANIFEST.length; i++) {
    total += SUITE_MANIFEST[i].caseCount;
  }
  return total;
}

// 验证套件清单完整性
export function validateManifest(): boolean {
  // 检查套件名称是否重复
  const names: string[] = getSuiteNames();
  for (let i: number = 0; i < names.length; i++) {
    for (let j: number = i + 1; j < names.length; j++) {
      if (names[i] === names[j]) {
        hilog.error(DOMAIN, TAG, 'Duplicate suite name: %{public}s', names[i]);
        return false;
      }
    }
  }

  // 检查每个套件是否有效
  for (let i: number = 0; i < SUITE_MANIFEST.length; i++) {
    const suite: SuiteManifest = SUITE_MANIFEST[i];
    if (suite.name.length === 0 || suite.category.length === 0 || suite.caseCount <= 0) {
      hilog.error(DOMAIN, TAG, 'Invalid suite manifest at index %{public}d', i);
      return false;
    }
  }

  return true;
}

// ==================== 测试入口 ====================

export default function testsuite(): void {
  // 验证套件清单
  if (!validateManifest()) {
    throw new Error('Suite manifest validation failed');
  }

  // 打印套件信息
  hilog.info(DOMAIN, TAG, 'Starting %{public}d test suites (%{public}d total cases)',
    SUITE_MANIFEST.length, getTotalCaseCount());

  // 直接调用各测试套件（IDE 静态分析需要直接函数调用，不能使用 for + factory 间接调用）
  hilog.info(DOMAIN, TAG, '  [%{public}s] %{public}s - %{public}s (%{public}d cases)',
    CATEGORY_ABILITY, 'PluginAndSkillAbilityTest', '应用启动与首页元素完整性验证', 2);
  abilityTest();

  hilog.info(DOMAIN, TAG, '  [%{public}s] %{public}s - %{public}s (%{public}d cases)',
    CATEGORY_SKILL_QUERY, 'SelfSkillQueryTest', '自有技能查询：参数校验、成功、异常、Flag 验证', 15);
  selfSkillQueryTest();

  hilog.info(DOMAIN, TAG, '  [%{public}s] %{public}s - %{public}s (%{public}d cases)',
    CATEGORY_SKILL_QUERY, 'BundleSkillQueryTest', '应用技能查询：参数校验、成功、异常、Flag 验证', 17);
  bundleSkillQueryTest();

  hilog.info(DOMAIN, TAG, '  [%{public}s] %{public}s - %{public}s (%{public}d cases)',
    CATEGORY_SKILL_QUERY, 'AllSkillsQueryTest', '设备全部技能查询：基础查询、Flag 验证', 8);
  allSkillsQueryTest();

  hilog.info(DOMAIN, TAG, '  [%{public}s] %{public}s - %{public}s (%{public}d cases)',
    CATEGORY_NAVIGATION, 'IndexAndNavigationTest', 'Index 页面 UI、导航、往返流程', 10);
  indexAndNavigationTest();

  hilog.info(DOMAIN, TAG, '  [%{public}s] %{public}s - %{public}s (%{public}d cases)',
    CATEGORY_VALIDATION, 'ResultFieldValidationTest', '结果卡片字段级验证', 20);
  resultFieldValidationTest();

  hilog.info(DOMAIN, TAG, '  [%{public}s] %{public}s - %{public}s (%{public}d cases)',
    CATEGORY_NAVIGATION, 'NavigationFlowTest', '多步导航路径、按钮状态、边界场景', 10);
  navigationFlowTest();

  hilog.info(DOMAIN, TAG, '  [%{public}s] %{public}s - %{public}s (%{public}d cases)',
    CATEGORY_STATE, 'StateConsistencyTest', '选择器状态、结果卡片状态、跨页面隔离', 10);
  stateConsistencyTest();

  hilog.info(DOMAIN, TAG, '  [%{public}s] %{public}s - %{public}s (%{public}d cases)',
    CATEGORY_ERROR, 'ErrorHandlingTest', '错误信息验证、空参数验证、错误恢复', 10);
  errorHandlingTest();

  hilog.info(DOMAIN, TAG, '  [%{public}s] %{public}s - %{public}s (%{public}d cases)',
    CATEGORY_EXECUTION, 'SkillExecutionTest', '技能执行页面验证', 10);
  skillExecutionTest();

  hilog.info(DOMAIN, TAG, '  [%{public}s] %{public}s - %{public}s (%{public}d cases)',
    CATEGORY_COMPARE, 'SkillCompareAndHistoryTest', '技能对比与历史验证', 10);
  skillCompareAndHistoryTest();

  hilog.info(DOMAIN, TAG, '  [%{public}s] %{public}s - %{public}s (%{public}d cases)',
    CATEGORY_BATCH, 'SkillBatchTest', '批量技能操作验证', 5);
  skillBatchTest();

  hilog.info(DOMAIN, TAG, '  [%{public}s] %{public}s - %{public}s (%{public}d cases)',
    CATEGORY_ADVANCED, 'AdvancedFeatureTest', '高级功能场景验证', 10);
  advancedFeatureTest();

  hilog.info(DOMAIN, TAG, '  [%{public}s] %{public}s - %{public}s (%{public}d cases)',
    CATEGORY_UTIL, 'AssertionHelperTest', '断言工具类验证', 68);
  assertionHelperTest();

  hilog.info(DOMAIN, TAG, '  [%{public}s] %{public}s - %{public}s (%{public}d cases)',
    CATEGORY_UTIL, 'PerformanceTrackerTest', '性能跟踪器验证', 38);
  performanceTrackerTest();

  hilog.info(DOMAIN, TAG, '  [%{public}s] %{public}s - %{public}s (%{public}d cases)',
    CATEGORY_UTIL, 'TestDataProviderTest', '测试数据提供器验证', 32);
  testDataProviderTest();

  hilog.info(DOMAIN, TAG, '  [%{public}s] %{public}s - %{public}s (%{public}d cases)',
    CATEGORY_UTIL, 'TestMetricsCollectorTest', '指标收集器验证', 25);
  testMetricsCollectorTest();

  hilog.info(DOMAIN, TAG, '  [%{public}s] %{public}s - %{public}s (%{public}d cases)',
    CATEGORY_UTIL, 'TestDataGeneratorTest', '测试数据生成器验证', 25);
  testDataGeneratorTest();

  hilog.info(DOMAIN, TAG, '  [%{public}s] %{public}s - %{public}s (%{public}d cases)',
    CATEGORY_UTIL, 'TestEnvironmentCheckerTest', '环境检查器验证', 25);
  testEnvironmentCheckerTest();

  hilog.info(DOMAIN, TAG, '  [%{public}s] %{public}s - %{public}s (%{public}d cases)',
    CATEGORY_UTIL, 'TestLogAnalyzerTest', '日志分析器验证', 25);
  testLogAnalyzerTest();

  hilog.info(DOMAIN, TAG, '  [%{public}s] %{public}s - %{public}s (%{public}d cases)',
    CATEGORY_UTIL, 'TestReportGeneratorTest', '报告生成器验证', 25);
  testReportGeneratorTest();

  hilog.info(DOMAIN, TAG, '  [%{public}s] %{public}s - %{public}s (%{public}d cases)',
    CATEGORY_UTIL, 'ConstantValidationTest', '常量配置验证', 20);
  constantValidationTest();

  hilog.info(DOMAIN, TAG, '  [%{public}s] %{public}s - %{public}s (%{public}d cases)',
    CATEGORY_NAVIGATION, 'SkillManagerHomeExtendedTest', '技能管理页扩展导航', 8);
  skillManagerHomeExtendedTest();

  hilog.info(DOMAIN, TAG, '  [%{public}s] %{public}s - %{public}s (%{public}d cases)',
    CATEGORY_BATCH, 'SkillBatchExtendedTest', '批量操作扩展验证', 12);
  skillBatchExtendedTest();

  hilog.info(DOMAIN, TAG, '  [%{public}s] %{public}s - %{public}s (%{public}d cases)',
    CATEGORY_COMPARE, 'SkillHistoryExtendedTest', '历史记录扩展验证', 12);
  skillHistoryExtendedTest();

  hilog.info(DOMAIN, TAG, '  [%{public}s] %{public}s - %{public}s (%{public}d cases)',
    CATEGORY_COMPARE, 'SkillCompareExtendedTest', '技能对比扩展验证', 10);
  skillCompareExtendedTest();
}
