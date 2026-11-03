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

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_PluginAndSkill]';

// ==================== 测试套件结构化管理 ====================

// 套件分类
const CATEGORY_ABILITY: string = 'Ability';
const CATEGORY_SKILL_QUERY: string = 'SkillQuery';

// 套件元数据定义
interface SuiteManifest {
  name: string;
  category: string;
  description: string;
  caseCount: number;
  factory: () => void;
}

// 套件清单：按分类组织，便于管理和统计
const SUITE_MANIFEST: Array<SuiteManifest> = [
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
  }
];

// ==================== 套件管理工具函数 ====================

// 按分类统计套件数量
export function countByCategory(category: string): number {
  let count: number = 0;
  for (let i = 0; i < SUITE_MANIFEST.length; i++) {
    if (SUITE_MANIFEST[i].category === category) {
      count++;
    }
  }
  return count;
}

// 按名称查找套件
export function findSuite(name: string): SuiteManifest | undefined {
  for (let i = 0; i < SUITE_MANIFEST.length; i++) {
    if (SUITE_MANIFEST[i].name === name) {
      return SUITE_MANIFEST[i];
    }
  }
  return undefined;
}

// 获取全部套件名称
export function getSuiteNames(): Array<string> {
  const names: Array<string> = [];
  for (let i = 0; i < SUITE_MANIFEST.length; i++) {
    names.push(SUITE_MANIFEST[i].name);
  }
  return names;
}

// 获取用例总数
export function getTotalCaseCount(): number {
  let total: number = 0;
  for (let i = 0; i < SUITE_MANIFEST.length; i++) {
    total += SUITE_MANIFEST[i].caseCount;
  }
  return total;
}

// 验证套件清单完整性
export function validateManifest(): boolean {
  // 检查套件名称是否重复
  const names: Array<string> = getSuiteNames();
  for (let i = 0; i < names.length; i++) {
    for (let j = i + 1; j < names.length; j++) {
      if (names[i] === names[j]) {
        hilog.error(DOMAIN, TAG, 'Duplicate suite name: %{public}s', names[i]);
        return false;
      }
    }
  }

  // 检查每个套件是否有效
  for (let i = 0; i < SUITE_MANIFEST.length; i++) {
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

  // 按清单顺序挂载套件
  for (let i = 0; i < SUITE_MANIFEST.length; i++) {
    const suite: SuiteManifest = SUITE_MANIFEST[i];
    hilog.info(DOMAIN, TAG, '  [%{public}s] %{public}s - %{public}s (%{public}d cases)',
      suite.category, suite.name, suite.description, suite.caseCount);
    suite.factory();
  }
}
