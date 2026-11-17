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

import { traceParameter } from '../support/TestLog';
import { describe, expect } from '@ohos/hypium';
import { loggedIt as it } from '../support/TestLog';
import {
  BudgetAudit, BudgetReport, BudgetResult, GroupStats, LAUNCH_GROUPS, LaunchGroup, RegressionReport,
  RegressionResult, RegressionVerdict, allStats, auditBudgets, budgetLines, compareLaunches,
  evaluateBudgets, groupKeys, groupLabel, groupOf, quantileOf, regressionLabel, sampleOf, statsFor
} from '../../../main/ets/core/LaunchBudget';
import { LaunchSample } from '../../../main/ets/core/Types';

/** 按分组关键字造一组样本，内容耗时从 base 起逐条加 step。 */
function samplesOf(key: string, count: number, base: number, step: number): LaunchSample[] {
  const list: LaunchSample[] = [];
  for (let index = 0; index < count; index++) {
    list.push(sampleOf(`${key}-${index}`, key, 1000 + index, base + index * step));
  }
  return list;
}

/** 合并多组样本，避免每个用例重复拼接。 */
function mergeSamples(groups: LaunchSample[][]): LaunchSample[] {
  const merged: LaunchSample[] = [];
  groups.forEach((group: LaunchSample[]): void => {
    group.forEach((sample: LaunchSample): void => {
      merged.push(sample);
    });
  });
  return merged;
}

export default function launchBudgetCasesTest(): void {
  describe('LaunchGroupCatalogCases', (): void => {
    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPCATALOGCASES_0100
     * @tc.name      testLaunchGroupCatalogCases0001
     * @tc.desc      Verify group catalog has stable keys
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testLaunchGroupCatalogCases0001', 0, (): void => {
      expect(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0001 LaunchBudgetCases.test:56 assertEqual actual', LAUNCH_GROUPS.length)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0001 LaunchBudgetCases.test:56 assertEqual expected', 5));
      expect(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0001 LaunchBudgetCases.test:57 assertEqual actual', groupKeys().join(','))).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0001 LaunchBudgetCases.test:57 assertEqual expected', 'cold,warm,hot,firstFrame,interactive'));
      expect(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0001 LaunchBudgetCases.test:58 assertEqual actual', LAUNCH_GROUPS[0].key)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0001 LaunchBudgetCases.test:58 assertEqual expected', 'cold'));
      expect(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0001 LaunchBudgetCases.test:59 assertEqual actual', LAUNCH_GROUPS[4].key)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0001 LaunchBudgetCases.test:59 assertEqual expected', 'interactive'));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPCATALOGCASES_0200
     * @tc.name      testLaunchGroupCatalogCases0002
     * @tc.desc      Verify every group carries key and label
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testLaunchGroupCatalogCases0002', 0, (): void => {
      LAUNCH_GROUPS.forEach((group: LaunchGroup): void => {
        expect(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0002 LaunchBudgetCases.test:73 assertTrue actual', group.key.length > 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0002 LaunchBudgetCases.test:74 assertTrue actual', group.label.length > 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0002 LaunchBudgetCases.test:75 assertEqual actual', group.key.indexOf(' '))).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0002 LaunchBudgetCases.test:75 assertEqual expected', -1));
      });
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPCATALOGCASES_0300
     * @tc.name      testLaunchGroupCatalogCases0003
     * @tc.desc      Verify every group budget is positive
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchGroupCatalogCases0003', 0, (): void => {
      LAUNCH_GROUPS.forEach((group: LaunchGroup): void => {
        expect(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0003 LaunchBudgetCases.test:90 assertTrue actual', group.budgetMs > 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0003 LaunchBudgetCases.test:91 assertTrue actual', Number.isInteger(group.budgetMs))).assertTrue();
      });
      expect(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0003 LaunchBudgetCases.test:93 assertEqual actual', LAUNCH_GROUPS.length)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0003 LaunchBudgetCases.test:93 assertEqual expected', 5));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPCATALOGCASES_0400
     * @tc.name      testLaunchGroupCatalogCases0004
     * @tc.desc      Verify group keys mirror catalog order
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testLaunchGroupCatalogCases0004', 0, (): void => {
      const keys: string[] = groupKeys();
      expect(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0004 LaunchBudgetCases.test:107 assertEqual actual', keys.length)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0004 LaunchBudgetCases.test:107 assertEqual expected', LAUNCH_GROUPS.length));
      keys.forEach((key: string, index: number): void => {
        expect(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0004 LaunchBudgetCases.test:109 assertEqual actual', key)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0004 LaunchBudgetCases.test:109 assertEqual expected', LAUNCH_GROUPS[index].key));
      });
      expect(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0004 LaunchBudgetCases.test:111 assertEqual actual', groupKeys()[0])).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0004 LaunchBudgetCases.test:111 assertEqual expected', LAUNCH_GROUPS[0].key));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPCATALOGCASES_0500
     * @tc.name      testLaunchGroupCatalogCases0005
     * @tc.desc      Verify group of hits known keys
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchGroupCatalogCases0005', 0, (): void => {
      const cold: LaunchGroup | undefined = groupOf('cold');
      expect(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0005 LaunchBudgetCases.test:125 assertTrue actual', cold !== undefined)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0005 LaunchBudgetCases.test:126 assertEqual actual', cold?.label)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0005 LaunchBudgetCases.test:126 assertEqual expected', '冷启动'));
      expect(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0005 LaunchBudgetCases.test:127 assertEqual actual', cold?.budgetMs)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0005 LaunchBudgetCases.test:127 assertEqual expected', 1200));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPCATALOGCASES_0600
     * @tc.name      testLaunchGroupCatalogCases0006
     * @tc.desc      Verify group of rejects unknown key
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchGroupCatalogCases0006', 0, (): void => {
      expect(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0006 LaunchBudgetCases.test:140 assertUndefined actual', groupOf('unknown'))).assertUndefined();
      expect(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0006 LaunchBudgetCases.test:141 assertUndefined actual', groupOf(''))).assertUndefined();
      expect(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0006 LaunchBudgetCases.test:142 assertUndefined actual', groupOf('Cold'))).assertUndefined();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPCATALOGCASES_0700
     * @tc.name      testLaunchGroupCatalogCases0007
     * @tc.desc      Verify group label falls back to raw key
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testLaunchGroupCatalogCases0007', 0, (): void => {
      expect(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0007 LaunchBudgetCases.test:155 assertEqual actual', groupLabel('hot'))).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0007 LaunchBudgetCases.test:155 assertEqual expected', '热启动'));
      expect(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0007 LaunchBudgetCases.test:156 assertEqual actual', groupLabel('custom'))).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0007 LaunchBudgetCases.test:156 assertEqual expected', 'custom'));
      expect(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0007 LaunchBudgetCases.test:157 assertEqual actual', groupLabel(''))).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0007 LaunchBudgetCases.test:157 assertEqual expected', ''));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPCATALOGCASES_0800
     * @tc.name      testLaunchGroupCatalogCases0008
     * @tc.desc      Verify group text carries all dimensions
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testLaunchGroupCatalogCases0008', 0, (): void => {
      LAUNCH_GROUPS.forEach((group: LaunchGroup): void => {
        const text: string = group.text();
        expect(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0008 LaunchBudgetCases.test:172 assertTrue actual', text.indexOf(group.key) >= 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0008 LaunchBudgetCases.test:173 assertTrue actual', text.indexOf(group.label) >= 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0008 LaunchBudgetCases.test:174 assertTrue actual', text.indexOf(`${group.budgetMs}`) >= 0)).assertTrue();
      });
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPCATALOGCASES_0900
     * @tc.name      testLaunchGroupCatalogCases0009
     * @tc.desc      Verify heat budget is tightest
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchGroupCatalogCases0009', 0, (): void => {
      const budgets: number[] = LAUNCH_GROUPS.map((group: LaunchGroup): number => group.budgetMs);
      const minBudget: number = budgets.reduce((peak: number, value: number): number =>
        Math.min(peak, value), Number.MAX_SAFE_INTEGER);
      const maxBudget: number = budgets.reduce((peak: number, value: number): number =>
        Math.max(peak, value), 0);
      expect(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0009 LaunchBudgetCases.test:193 assertEqual actual', groupOf('hot')?.budgetMs)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0009 LaunchBudgetCases.test:193 assertEqual expected', minBudget));
      expect(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0009 LaunchBudgetCases.test:194 assertEqual actual', groupOf('interactive')?.budgetMs)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0009 LaunchBudgetCases.test:194 assertEqual expected', maxBudget));
      expect(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0009 LaunchBudgetCases.test:195 assertTrue actual', minBudget < maxBudget)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPCATALOGCASES_1000
     * @tc.name      testLaunchGroupCatalogCases0010
     * @tc.desc      Verify cold budget exceeds warm and heat
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchGroupCatalogCases0010', 0, (): void => {
      const cold: number = groupOf('cold')?.budgetMs ?? 0;
      const warm: number = groupOf('warm')?.budgetMs ?? 0;
      const hot: number = groupOf('hot')?.budgetMs ?? 0;
      expect(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0010 LaunchBudgetCases.test:211 assertTrue actual', cold > warm)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0010 LaunchBudgetCases.test:212 assertTrue actual', warm > hot)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0010 LaunchBudgetCases.test:213 assertTrue actual', cold > hot)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPCATALOGCASES_1100
     * @tc.name      testLaunchGroupCatalogCases0011
     * @tc.desc      Verify budget audit reports clean catalog
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testLaunchGroupCatalogCases0011', 0, (): void => {
      const audit: BudgetAudit = auditBudgets();
      expect(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0011 LaunchBudgetCases.test:227 assertTrue actual', audit.ok)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0011 LaunchBudgetCases.test:228 assertEqual actual', audit.findings.length)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0011 LaunchBudgetCases.test:228 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0011 LaunchBudgetCases.test:229 assertTrue actual', audit.summary().indexOf('自洽') >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPCATALOGCASES_1200
     * @tc.name      testLaunchGroupCatalogCases0012
     * @tc.desc      Verify budget lines cover every group
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testLaunchGroupCatalogCases0012', 0, (): void => {
      const lines: string[] = budgetLines();
      expect(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0012 LaunchBudgetCases.test:243 assertEqual actual', lines.length)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0012 LaunchBudgetCases.test:243 assertEqual expected', LAUNCH_GROUPS.length));
      lines.forEach((line: string, index: number): void => {
        expect(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0012 LaunchBudgetCases.test:245 assertTrue actual', line.indexOf(LAUNCH_GROUPS[index].key) >= 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_LaunchGroupCatalogCases_0012 LaunchBudgetCases.test:246 assertTrue actual', line.length > 0)).assertTrue();
      });
    });
  });

  describe('LaunchSampleFactoryCases', (): void => {
    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHSAMPLEFACTORYCASES_0100
     * @tc.name      testLaunchSampleFactoryCases0001
     * @tc.desc      Verify sample factory fills every field
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchSampleFactoryCases0001', 0, (): void => {
      const sample: LaunchSample = sampleOf('s1', 'cold', 1700000000000, 850);
      expect(traceParameter('com.samples.appperformance_LaunchSampleFactoryCases_0001 LaunchBudgetCases.test:263 assertEqual actual', sample.id)).assertEqual(traceParameter('com.samples.appperformance_LaunchSampleFactoryCases_0001 LaunchBudgetCases.test:263 assertEqual expected', 's1'));
      expect(traceParameter('com.samples.appperformance_LaunchSampleFactoryCases_0001 LaunchBudgetCases.test:264 assertEqual actual', sample.group)).assertEqual(traceParameter('com.samples.appperformance_LaunchSampleFactoryCases_0001 LaunchBudgetCases.test:264 assertEqual expected', 'cold'));
      expect(traceParameter('com.samples.appperformance_LaunchSampleFactoryCases_0001 LaunchBudgetCases.test:265 assertEqual actual', sample.at)).assertEqual(traceParameter('com.samples.appperformance_LaunchSampleFactoryCases_0001 LaunchBudgetCases.test:265 assertEqual expected', 1700000000000));
      expect(traceParameter('com.samples.appperformance_LaunchSampleFactoryCases_0001 LaunchBudgetCases.test:266 assertEqual actual', sample.contentMs)).assertEqual(traceParameter('com.samples.appperformance_LaunchSampleFactoryCases_0001 LaunchBudgetCases.test:266 assertEqual expected', 850));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHSAMPLEFACTORYCASES_0200
     * @tc.name      testLaunchSampleFactoryCases0002
     * @tc.desc      Verify sample factory keeps device metadata
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchSampleFactoryCases0002', 0, (): void => {
      const sample: LaunchSample = sampleOf('s2', 'warm', 1, 10);
      expect(traceParameter('com.samples.appperformance_LaunchSampleFactoryCases_0002 LaunchBudgetCases.test:280 assertTrue actual', sample.device.length > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LaunchSampleFactoryCases_0002 LaunchBudgetCases.test:281 assertTrue actual', sample.appVersion.length > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LaunchSampleFactoryCases_0002 LaunchBudgetCases.test:282 assertEqual actual', sample.id)).assertEqual(traceParameter('com.samples.appperformance_LaunchSampleFactoryCases_0002 LaunchBudgetCases.test:282 assertEqual expected', 's2'));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHSAMPLEFACTORYCASES_0300
     * @tc.name      testLaunchSampleFactoryCases0003
     * @tc.desc      Verify sample factory clamps negative duration
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchSampleFactoryCases0003', 0, (): void => {
      const sample: LaunchSample = sampleOf('s3', 'hot', 1, -50);
      expect(traceParameter('com.samples.appperformance_LaunchSampleFactoryCases_0003 LaunchBudgetCases.test:296 assertEqual actual', sample.contentMs)).assertEqual(traceParameter('com.samples.appperformance_LaunchSampleFactoryCases_0003 LaunchBudgetCases.test:296 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_LaunchSampleFactoryCases_0003 LaunchBudgetCases.test:297 assertTrue actual', sample.contentMs >= 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LaunchSampleFactoryCases_0003 LaunchBudgetCases.test:298 assertEqual actual', sample.group)).assertEqual(traceParameter('com.samples.appperformance_LaunchSampleFactoryCases_0003 LaunchBudgetCases.test:298 assertEqual expected', 'hot'));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHSAMPLEFACTORYCASES_0400
     * @tc.name      testLaunchSampleFactoryCases0004
     * @tc.desc      Verify sample factory rounds fractional duration
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchSampleFactoryCases0004', 0, (): void => {
      const up: LaunchSample = sampleOf('s4', 'hot', 1, 12.6);
      const down: LaunchSample = sampleOf('s5', 'hot', 1, 12.4);
      expect(traceParameter('com.samples.appperformance_LaunchSampleFactoryCases_0004 LaunchBudgetCases.test:313 assertEqual actual', up.contentMs)).assertEqual(traceParameter('com.samples.appperformance_LaunchSampleFactoryCases_0004 LaunchBudgetCases.test:313 assertEqual expected', 13));
      expect(traceParameter('com.samples.appperformance_LaunchSampleFactoryCases_0004 LaunchBudgetCases.test:314 assertEqual actual', down.contentMs)).assertEqual(traceParameter('com.samples.appperformance_LaunchSampleFactoryCases_0004 LaunchBudgetCases.test:314 assertEqual expected', 12));
      expect(traceParameter('com.samples.appperformance_LaunchSampleFactoryCases_0004 LaunchBudgetCases.test:315 assertTrue actual', Number.isInteger(up.contentMs))).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHSAMPLEFACTORYCASES_0500
     * @tc.name      testLaunchSampleFactoryCases0005
     * @tc.desc      Verify sample factory keeps unknown group verbatim
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchSampleFactoryCases0005', 0, (): void => {
      const sample: LaunchSample = sampleOf('s6', 'brand-new', 1, 5);
      expect(traceParameter('com.samples.appperformance_LaunchSampleFactoryCases_0005 LaunchBudgetCases.test:329 assertEqual actual', sample.group)).assertEqual(traceParameter('com.samples.appperformance_LaunchSampleFactoryCases_0005 LaunchBudgetCases.test:329 assertEqual expected', 'brand-new'));
      expect(traceParameter('com.samples.appperformance_LaunchSampleFactoryCases_0005 LaunchBudgetCases.test:330 assertUndefined actual', groupOf(sample.group))).assertUndefined();
      expect(traceParameter('com.samples.appperformance_LaunchSampleFactoryCases_0005 LaunchBudgetCases.test:331 assertEqual actual', groupLabel(sample.group))).assertEqual(traceParameter('com.samples.appperformance_LaunchSampleFactoryCases_0005 LaunchBudgetCases.test:331 assertEqual expected', 'brand-new'));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHSAMPLEFACTORYCASES_0600
     * @tc.name      testLaunchSampleFactoryCases0006
     * @tc.desc      Verify sample factory accepts zero timestamp
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchSampleFactoryCases0006', 0, (): void => {
      const sample: LaunchSample = sampleOf('s7', 'cold', 0, 0);
      expect(traceParameter('com.samples.appperformance_LaunchSampleFactoryCases_0006 LaunchBudgetCases.test:345 assertEqual actual', sample.at)).assertEqual(traceParameter('com.samples.appperformance_LaunchSampleFactoryCases_0006 LaunchBudgetCases.test:345 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_LaunchSampleFactoryCases_0006 LaunchBudgetCases.test:346 assertEqual actual', sample.contentMs)).assertEqual(traceParameter('com.samples.appperformance_LaunchSampleFactoryCases_0006 LaunchBudgetCases.test:346 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_LaunchSampleFactoryCases_0006 LaunchBudgetCases.test:347 assertEqual actual', sample.id)).assertEqual(traceParameter('com.samples.appperformance_LaunchSampleFactoryCases_0006 LaunchBudgetCases.test:347 assertEqual expected', 's7'));
    });
  });

  describe('LaunchQuantileCases', (): void => {
    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHQUANTILECASES_0100
     * @tc.name      testLaunchQuantileCases0001
     * @tc.desc      Verify quantile of empty is zero
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchQuantileCases0001', 0, (): void => {
      expect(traceParameter('com.samples.appperformance_LaunchQuantileCases_0001 LaunchBudgetCases.test:362 assertEqual actual', quantileOf([], 50))).assertEqual(traceParameter('com.samples.appperformance_LaunchQuantileCases_0001 LaunchBudgetCases.test:362 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_LaunchQuantileCases_0001 LaunchBudgetCases.test:363 assertEqual actual', quantileOf([], 0))).assertEqual(traceParameter('com.samples.appperformance_LaunchQuantileCases_0001 LaunchBudgetCases.test:363 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_LaunchQuantileCases_0001 LaunchBudgetCases.test:364 assertEqual actual', quantileOf([], 100))).assertEqual(traceParameter('com.samples.appperformance_LaunchQuantileCases_0001 LaunchBudgetCases.test:364 assertEqual expected', 0));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHQUANTILECASES_0200
     * @tc.name      testLaunchQuantileCases0002
     * @tc.desc      Verify quantile of single value ignores percentile
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchQuantileCases0002', 0, (): void => {
      expect(traceParameter('com.samples.appperformance_LaunchQuantileCases_0002 LaunchBudgetCases.test:377 assertEqual actual', quantileOf([42], 0))).assertEqual(traceParameter('com.samples.appperformance_LaunchQuantileCases_0002 LaunchBudgetCases.test:377 assertEqual expected', 42));
      expect(traceParameter('com.samples.appperformance_LaunchQuantileCases_0002 LaunchBudgetCases.test:378 assertEqual actual', quantileOf([42], 50))).assertEqual(traceParameter('com.samples.appperformance_LaunchQuantileCases_0002 LaunchBudgetCases.test:378 assertEqual expected', 42));
      expect(traceParameter('com.samples.appperformance_LaunchQuantileCases_0002 LaunchBudgetCases.test:379 assertEqual actual', quantileOf([42], 100))).assertEqual(traceParameter('com.samples.appperformance_LaunchQuantileCases_0002 LaunchBudgetCases.test:379 assertEqual expected', 42));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHQUANTILECASES_0300
     * @tc.name      testLaunchQuantileCases0003
     * @tc.desc      Verify zero percentile yields minimum
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchQuantileCases0003', 0, (): void => {
      const values: number[] = [900, 120, 640, 300];
      expect(traceParameter('com.samples.appperformance_LaunchQuantileCases_0003 LaunchBudgetCases.test:393 assertEqual actual', quantileOf(values, 0))).assertEqual(traceParameter('com.samples.appperformance_LaunchQuantileCases_0003 LaunchBudgetCases.test:393 assertEqual expected', 120));
      expect(traceParameter('com.samples.appperformance_LaunchQuantileCases_0003 LaunchBudgetCases.test:394 assertEqual actual', quantileOf(values, 0))).assertEqual(traceParameter('com.samples.appperformance_LaunchQuantileCases_0003 LaunchBudgetCases.test:394 assertEqual expected', 
        values.reduce((peak: number, value: number): number => Math.min(peak, value), 10000)));
      expect(traceParameter('com.samples.appperformance_LaunchQuantileCases_0003 LaunchBudgetCases.test:396 assertTrue actual', quantileOf(values, 0) < quantileOf(values, 50))).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHQUANTILECASES_0400
     * @tc.name      testLaunchQuantileCases0004
     * @tc.desc      Verify full percentile yields maximum
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchQuantileCases0004', 0, (): void => {
      const values: number[] = [900, 120, 640, 300];
      expect(traceParameter('com.samples.appperformance_LaunchQuantileCases_0004 LaunchBudgetCases.test:410 assertEqual actual', quantileOf(values, 100))).assertEqual(traceParameter('com.samples.appperformance_LaunchQuantileCases_0004 LaunchBudgetCases.test:410 assertEqual expected', 900));
      expect(traceParameter('com.samples.appperformance_LaunchQuantileCases_0004 LaunchBudgetCases.test:411 assertEqual actual', quantileOf(values, 100))).assertEqual(traceParameter('com.samples.appperformance_LaunchQuantileCases_0004 LaunchBudgetCases.test:411 assertEqual expected', 
        values.reduce((peak: number, value: number): number => Math.max(peak, value), 0)));
      expect(traceParameter('com.samples.appperformance_LaunchQuantileCases_0004 LaunchBudgetCases.test:413 assertTrue actual', quantileOf(values, 100) > quantileOf(values, 50))).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHQUANTILECASES_0500
     * @tc.name      testLaunchQuantileCases0005
     * @tc.desc      Verify median of odd sized set is middle element
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchQuantileCases0005', 0, (): void => {
      expect(traceParameter('com.samples.appperformance_LaunchQuantileCases_0005 LaunchBudgetCases.test:426 assertEqual actual', quantileOf([10, 20, 30], 50))).assertEqual(traceParameter('com.samples.appperformance_LaunchQuantileCases_0005 LaunchBudgetCases.test:426 assertEqual expected', 20));
      expect(traceParameter('com.samples.appperformance_LaunchQuantileCases_0005 LaunchBudgetCases.test:427 assertEqual actual', quantileOf([30, 10, 20], 50))).assertEqual(traceParameter('com.samples.appperformance_LaunchQuantileCases_0005 LaunchBudgetCases.test:427 assertEqual expected', 20));
      expect(traceParameter('com.samples.appperformance_LaunchQuantileCases_0005 LaunchBudgetCases.test:428 assertEqual actual', quantileOf([1, 2, 3, 4, 5], 50))).assertEqual(traceParameter('com.samples.appperformance_LaunchQuantileCases_0005 LaunchBudgetCases.test:428 assertEqual expected', 3));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHQUANTILECASES_0600
     * @tc.name      testLaunchQuantileCases0006
     * @tc.desc      Verify median of even sized set interpolates
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchQuantileCases0006', 0, (): void => {
      expect(traceParameter('com.samples.appperformance_LaunchQuantileCases_0006 LaunchBudgetCases.test:441 assertEqual actual', quantileOf([10, 20], 50))).assertEqual(traceParameter('com.samples.appperformance_LaunchQuantileCases_0006 LaunchBudgetCases.test:441 assertEqual expected', 15));
      expect(traceParameter('com.samples.appperformance_LaunchQuantileCases_0006 LaunchBudgetCases.test:442 assertEqual actual', quantileOf([10, 20, 30, 40], 50))).assertEqual(traceParameter('com.samples.appperformance_LaunchQuantileCases_0006 LaunchBudgetCases.test:442 assertEqual expected', 25));
      expect(traceParameter('com.samples.appperformance_LaunchQuantileCases_0006 LaunchBudgetCases.test:443 assertEqual actual', quantileOf([0, 100], 50))).assertEqual(traceParameter('com.samples.appperformance_LaunchQuantileCases_0006 LaunchBudgetCases.test:443 assertEqual expected', 50));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHQUANTILECASES_0700
     * @tc.name      testLaunchQuantileCases0007
     * @tc.desc      Verify percentile is clamped to range
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchQuantileCases0007', 0, (): void => {
      const values: number[] = [5, 15, 25];
      expect(traceParameter('com.samples.appperformance_LaunchQuantileCases_0007 LaunchBudgetCases.test:457 assertEqual actual', quantileOf(values, -40))).assertEqual(traceParameter('com.samples.appperformance_LaunchQuantileCases_0007 LaunchBudgetCases.test:457 assertEqual expected', 5));
      expect(traceParameter('com.samples.appperformance_LaunchQuantileCases_0007 LaunchBudgetCases.test:458 assertEqual actual', quantileOf(values, 240))).assertEqual(traceParameter('com.samples.appperformance_LaunchQuantileCases_0007 LaunchBudgetCases.test:458 assertEqual expected', 25));
      expect(traceParameter('com.samples.appperformance_LaunchQuantileCases_0007 LaunchBudgetCases.test:459 assertEqual actual', quantileOf(values, -1))).assertEqual(traceParameter('com.samples.appperformance_LaunchQuantileCases_0007 LaunchBudgetCases.test:459 assertEqual expected', quantileOf(values, 0)));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHQUANTILECASES_0800
     * @tc.name      testLaunchQuantileCases0008
     * @tc.desc      Verify quantile does not mutate input
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchQuantileCases0008', 0, (): void => {
      const values: number[] = [300, 100, 200];
      const snapshot: string = values.join(',');
      quantileOf(values, 90);
      expect(traceParameter('com.samples.appperformance_LaunchQuantileCases_0008 LaunchBudgetCases.test:475 assertEqual actual', values.join(','))).assertEqual(traceParameter('com.samples.appperformance_LaunchQuantileCases_0008 LaunchBudgetCases.test:475 assertEqual expected', snapshot));
      expect(traceParameter('com.samples.appperformance_LaunchQuantileCases_0008 LaunchBudgetCases.test:476 assertEqual actual', values[0])).assertEqual(traceParameter('com.samples.appperformance_LaunchQuantileCases_0008 LaunchBudgetCases.test:476 assertEqual expected', 300));
      expect(traceParameter('com.samples.appperformance_LaunchQuantileCases_0008 LaunchBudgetCases.test:477 assertEqual actual', values.length)).assertEqual(traceParameter('com.samples.appperformance_LaunchQuantileCases_0008 LaunchBudgetCases.test:477 assertEqual expected', 3));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHQUANTILECASES_0900
     * @tc.name      testLaunchQuantileCases0009
     * @tc.desc      Verify quantile is monotonic in percentile
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchQuantileCases0009', 0, (): void => {
      const values: number[] = [10, 40, 70, 100, 130];
      const p10: number = quantileOf(values, 10);
      const p50: number = quantileOf(values, 50);
      const p90: number = quantileOf(values, 90);
      expect(traceParameter('com.samples.appperformance_LaunchQuantileCases_0009 LaunchBudgetCases.test:494 assertTrue actual', p10 >= values[0])).assertTrue();
      expect(traceParameter('com.samples.appperformance_LaunchQuantileCases_0009 LaunchBudgetCases.test:495 assertTrue actual', p10 < p50)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LaunchQuantileCases_0009 LaunchBudgetCases.test:496 assertTrue actual', p50 <= p90 && p90 <= values[4])).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHQUANTILECASES_1000
     * @tc.name      testLaunchQuantileCases0010
     * @tc.desc      Verify quantile interpolates quarters
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchQuantileCases0010', 0, (): void => {
      expect(traceParameter('com.samples.appperformance_LaunchQuantileCases_0010 LaunchBudgetCases.test:509 assertEqual actual', quantileOf([0, 100], 25))).assertEqual(traceParameter('com.samples.appperformance_LaunchQuantileCases_0010 LaunchBudgetCases.test:509 assertEqual expected', 25));
      expect(traceParameter('com.samples.appperformance_LaunchQuantileCases_0010 LaunchBudgetCases.test:510 assertEqual actual', quantileOf([0, 100], 75))).assertEqual(traceParameter('com.samples.appperformance_LaunchQuantileCases_0010 LaunchBudgetCases.test:510 assertEqual expected', 75));
      expect(traceParameter('com.samples.appperformance_LaunchQuantileCases_0010 LaunchBudgetCases.test:511 assertEqual actual', quantileOf([0, 100], 90))).assertEqual(traceParameter('com.samples.appperformance_LaunchQuantileCases_0010 LaunchBudgetCases.test:511 assertEqual expected', 90));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHQUANTILECASES_1100
     * @tc.name      testLaunchQuantileCases0011
     * @tc.desc      Verify quantile ignores insertion order
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchQuantileCases0011', 0, (): void => {
      const ascending: number[] = [100, 200, 300, 400];
      const descending: number[] = [400, 300, 200, 100];
      expect(traceParameter('com.samples.appperformance_LaunchQuantileCases_0011 LaunchBudgetCases.test:526 assertEqual actual', quantileOf(ascending, 50))).assertEqual(traceParameter('com.samples.appperformance_LaunchQuantileCases_0011 LaunchBudgetCases.test:526 assertEqual expected', quantileOf(descending, 50)));
      expect(traceParameter('com.samples.appperformance_LaunchQuantileCases_0011 LaunchBudgetCases.test:527 assertEqual actual', quantileOf(ascending, 90))).assertEqual(traceParameter('com.samples.appperformance_LaunchQuantileCases_0011 LaunchBudgetCases.test:527 assertEqual expected', quantileOf(descending, 90)));
      expect(traceParameter('com.samples.appperformance_LaunchQuantileCases_0011 LaunchBudgetCases.test:528 assertEqual actual', quantileOf(ascending, 0))).assertEqual(traceParameter('com.samples.appperformance_LaunchQuantileCases_0011 LaunchBudgetCases.test:528 assertEqual expected', 100));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHQUANTILECASES_1200
     * @tc.name      testLaunchQuantileCases0012
     * @tc.desc      Verify quantile handles duplicate values
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchQuantileCases0012', 0, (): void => {
      const values: number[] = [200, 200, 200, 400];
      expect(traceParameter('com.samples.appperformance_LaunchQuantileCases_0012 LaunchBudgetCases.test:542 assertEqual actual', quantileOf(values, 0))).assertEqual(traceParameter('com.samples.appperformance_LaunchQuantileCases_0012 LaunchBudgetCases.test:542 assertEqual expected', 200));
      expect(traceParameter('com.samples.appperformance_LaunchQuantileCases_0012 LaunchBudgetCases.test:543 assertEqual actual', quantileOf(values, 50))).assertEqual(traceParameter('com.samples.appperformance_LaunchQuantileCases_0012 LaunchBudgetCases.test:543 assertEqual expected', 200));
      expect(traceParameter('com.samples.appperformance_LaunchQuantileCases_0012 LaunchBudgetCases.test:544 assertEqual actual', quantileOf(values, 100))).assertEqual(traceParameter('com.samples.appperformance_LaunchQuantileCases_0012 LaunchBudgetCases.test:544 assertEqual expected', 400));
    });
  });

  describe('LaunchGroupStatsCases', (): void => {
    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPSTATSCASES_0100
     * @tc.name      testLaunchGroupStatsCases0001
     * @tc.desc      Verify stats for empty group is zeroed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchGroupStatsCases0001', 0, (): void => {
      const stats: GroupStats = statsFor([], 'cold');
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0001 LaunchBudgetCases.test:560 assertEqual actual', stats.key)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0001 LaunchBudgetCases.test:560 assertEqual expected', 'cold'));
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0001 LaunchBudgetCases.test:561 assertEqual actual', stats.count)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0001 LaunchBudgetCases.test:561 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0001 LaunchBudgetCases.test:562 assertEqual actual', stats.p50)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0001 LaunchBudgetCases.test:562 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0001 LaunchBudgetCases.test:563 assertEqual actual', stats.p90)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0001 LaunchBudgetCases.test:563 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0001 LaunchBudgetCases.test:564 assertEqual actual', stats.worst)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0001 LaunchBudgetCases.test:564 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0001 LaunchBudgetCases.test:565 assertEqual actual', stats.mean)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0001 LaunchBudgetCases.test:565 assertEqual expected', 0));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPSTATSCASES_0200
     * @tc.name      testLaunchGroupStatsCases0002
     * @tc.desc      Verify stats for filters by group key
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchGroupStatsCases0002', 0, (): void => {
      const samples: LaunchSample[] = mergeSamples([
        samplesOf('cold', 3, 100, 10),
        samplesOf('hot', 4, 50, 5)
      ]);
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0002 LaunchBudgetCases.test:582 assertEqual actual', statsFor(samples, 'cold').count)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0002 LaunchBudgetCases.test:582 assertEqual expected', 3));
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0002 LaunchBudgetCases.test:583 assertEqual actual', statsFor(samples, 'hot').count)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0002 LaunchBudgetCases.test:583 assertEqual expected', 4));
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0002 LaunchBudgetCases.test:584 assertEqual actual', statsFor(samples, 'warm').count)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0002 LaunchBudgetCases.test:584 assertEqual expected', 0));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPSTATSCASES_0300
     * @tc.name      testLaunchGroupStatsCases0003
     * @tc.desc      Verify stats for computes percentiles
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchGroupStatsCases0003', 0, (): void => {
      const samples: LaunchSample[] = mergeSamples([samplesOf('cold', 5, 100, 100)]);
      const stats: GroupStats = statsFor(samples, 'cold');
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0003 LaunchBudgetCases.test:599 assertEqual actual', stats.p50)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0003 LaunchBudgetCases.test:599 assertEqual expected', 300));
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0003 LaunchBudgetCases.test:600 assertEqual actual', stats.p90)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0003 LaunchBudgetCases.test:600 assertEqual expected', 460));
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0003 LaunchBudgetCases.test:601 assertTrue actual', stats.p90 >= stats.p50)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPSTATSCASES_0400
     * @tc.name      testLaunchGroupStatsCases0004
     * @tc.desc      Verify stats for worst tracks maximum
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchGroupStatsCases0004', 0, (): void => {
      const samples: LaunchSample[] = mergeSamples([samplesOf('warm', 4, 400, -80)]);
      const stats: GroupStats = statsFor(samples, 'warm');
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0004 LaunchBudgetCases.test:616 assertEqual actual', stats.worst)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0004 LaunchBudgetCases.test:616 assertEqual expected', 400));
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0004 LaunchBudgetCases.test:617 assertTrue actual', stats.worst >= stats.p90)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0004 LaunchBudgetCases.test:618 assertEqual actual', stats.count)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0004 LaunchBudgetCases.test:618 assertEqual expected', 4));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPSTATSCASES_0500
     * @tc.name      testLaunchGroupStatsCases0005
     * @tc.desc      Verify stats for mean is rounded
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchGroupStatsCases0005', 0, (): void => {
      const samples: LaunchSample[] = [
        sampleOf('a', 'hot', 0, 100),
        sampleOf('b', 'hot', 1, 101)
      ];
      const stats: GroupStats = statsFor(samples, 'hot');
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0005 LaunchBudgetCases.test:636 assertEqual actual', stats.mean)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0005 LaunchBudgetCases.test:636 assertEqual expected', 101));
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0005 LaunchBudgetCases.test:637 assertTrue actual', Number.isInteger(stats.mean))).assertTrue();
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0005 LaunchBudgetCases.test:638 assertEqual actual', stats.count)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0005 LaunchBudgetCases.test:638 assertEqual expected', 2));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPSTATSCASES_0600
     * @tc.name      testLaunchGroupStatsCases0006
     * @tc.desc      Verify stats for text carries label and count
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testLaunchGroupStatsCases0006', 0, (): void => {
      const samples: LaunchSample[] = mergeSamples([samplesOf('firstFrame', 2, 700, 100)]);
      const text: string = statsFor(samples, 'firstFrame').text();
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0006 LaunchBudgetCases.test:653 assertTrue actual', text.indexOf('首帧') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0006 LaunchBudgetCases.test:654 assertTrue actual', text.indexOf('2 条') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0006 LaunchBudgetCases.test:655 assertTrue actual', text.indexOf('P90') >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPSTATSCASES_0700
     * @tc.name      testLaunchGroupStatsCases0007
     * @tc.desc      Verify all stats keep catalog order
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testLaunchGroupStatsCases0007', 0, (): void => {
      const stats: GroupStats[] = allStats([]);
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0007 LaunchBudgetCases.test:669 assertEqual actual', stats.length)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0007 LaunchBudgetCases.test:669 assertEqual expected', LAUNCH_GROUPS.length));
      stats.forEach((item: GroupStats, index: number): void => {
        expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0007 LaunchBudgetCases.test:671 assertEqual actual', item.key)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0007 LaunchBudgetCases.test:671 assertEqual expected', LAUNCH_GROUPS[index].key));
      });
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0007 LaunchBudgetCases.test:673 assertTrue actual', allStats([]).every((item: GroupStats): boolean => item.count === 0))).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPSTATSCASES_0800
     * @tc.name      testLaunchGroupStatsCases0008
     * @tc.desc      Verify all stats conserve sample count
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchGroupStatsCases0008', 0, (): void => {
      const samples: LaunchSample[] = mergeSamples([
        samplesOf('cold', 3, 100, 10),
        samplesOf('warm', 2, 200, 10),
        samplesOf('hot', 5, 30, 10)
      ]);
      let total: number = 0;
      allStats(samples).forEach((item: GroupStats): void => {
        total += item.count;
      });
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0008 LaunchBudgetCases.test:695 assertEqual actual', total)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0008 LaunchBudgetCases.test:695 assertEqual expected', samples.length));
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0008 LaunchBudgetCases.test:696 assertEqual actual', total)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0008 LaunchBudgetCases.test:696 assertEqual expected', 10));
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0008 LaunchBudgetCases.test:697 assertEqual actual', samples.length)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0008 LaunchBudgetCases.test:697 assertEqual expected', 10));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPSTATSCASES_0900
     * @tc.name      testLaunchGroupStatsCases0009
     * @tc.desc      Verify all stats ignore samples outside catalog
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testLaunchGroupStatsCases0009', 0, (): void => {
      const samples: LaunchSample[] = mergeSamples([
        samplesOf('cold', 2, 100, 10),
        [sampleOf('x', 'orphan', 0, 999)]
      ]);
      let total: number = 0;
      allStats(samples).forEach((item: GroupStats): void => {
        total += item.count;
      });
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0009 LaunchBudgetCases.test:718 assertEqual actual', total)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0009 LaunchBudgetCases.test:718 assertEqual expected', 2));
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0009 LaunchBudgetCases.test:719 assertEqual actual', samples.length)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0009 LaunchBudgetCases.test:719 assertEqual expected', 3));
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0009 LaunchBudgetCases.test:720 assertEqual actual', samples.length)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0009 LaunchBudgetCases.test:720 assertEqual expected', 3));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPSTATSCASES_1000
     * @tc.name      testLaunchGroupStatsCases0010
     * @tc.desc      Verify stats P90 never below median
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchGroupStatsCases0010', 0, (): void => {
      const samples: LaunchSample[] = mergeSamples([samplesOf('interactive', 6, 200, 37)]);
      const stats: GroupStats = statsFor(samples, 'interactive');
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0010 LaunchBudgetCases.test:735 assertTrue actual', stats.p90 >= stats.p50)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0010 LaunchBudgetCases.test:736 assertTrue actual', stats.worst >= stats.p90)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0010 LaunchBudgetCases.test:737 assertTrue actual', stats.mean >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPSTATSCASES_1100
     * @tc.name      testLaunchGroupStatsCases0011
     * @tc.desc      Verify stats for ignores blank key
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchGroupStatsCases0011', 0, (): void => {
      const samples: LaunchSample[] = mergeSamples([samplesOf('cold', 2, 100, 10)]);
      const stats: GroupStats = statsFor(samples, '');
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0011 LaunchBudgetCases.test:752 assertEqual actual', stats.count)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0011 LaunchBudgetCases.test:752 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0011 LaunchBudgetCases.test:753 assertEqual actual', stats.key)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0011 LaunchBudgetCases.test:753 assertEqual expected', ''));
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0011 LaunchBudgetCases.test:754 assertFalse actual', stats.key === 'cold')).assertFalse();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHGROUPSTATSCASES_1200
     * @tc.name      testLaunchGroupStatsCases0012
     * @tc.desc      Verify stats for single sample aligns all metrics
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchGroupStatsCases0012', 0, (): void => {
      const samples: LaunchSample[] = [sampleOf('only', 'hot', 0, 320)];
      const stats: GroupStats = statsFor(samples, 'hot');
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0012 LaunchBudgetCases.test:769 assertEqual actual', stats.count)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0012 LaunchBudgetCases.test:769 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0012 LaunchBudgetCases.test:770 assertEqual actual', stats.p50)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0012 LaunchBudgetCases.test:770 assertEqual expected', 320));
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0012 LaunchBudgetCases.test:771 assertEqual actual', stats.p90)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0012 LaunchBudgetCases.test:771 assertEqual expected', 320));
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0012 LaunchBudgetCases.test:772 assertEqual actual', stats.worst)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0012 LaunchBudgetCases.test:772 assertEqual expected', 320));
      expect(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0012 LaunchBudgetCases.test:773 assertEqual actual', stats.mean)).assertEqual(traceParameter('com.samples.appperformance_LaunchGroupStatsCases_0012 LaunchBudgetCases.test:773 assertEqual expected', 320));
    });
  });

  describe('LaunchBudgetEvaluationCases', (): void => {
    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHBUDGETEVALUATIONCASES_0100
     * @tc.name      testLaunchBudgetEvaluationCases0001
     * @tc.desc      Verify empty samples produce no measured groups
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchBudgetEvaluationCases0001', 0, (): void => {
      const report: BudgetReport = evaluateBudgets([]);
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0001 LaunchBudgetCases.test:789 assertEqual actual', report.results.length)).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0001 LaunchBudgetCases.test:789 assertEqual expected', LAUNCH_GROUPS.length));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0001 LaunchBudgetCases.test:790 assertEqual actual', report.measured())).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0001 LaunchBudgetCases.test:790 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0001 LaunchBudgetCases.test:791 assertEqual actual', report.passed())).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0001 LaunchBudgetCases.test:791 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0001 LaunchBudgetCases.test:792 assertEqual actual', report.failed())).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0001 LaunchBudgetCases.test:792 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0001 LaunchBudgetCases.test:793 assertEqual actual', report.passRate())).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0001 LaunchBudgetCases.test:793 assertEqual expected', 0));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHBUDGETEVALUATIONCASES_0200
     * @tc.name      testLaunchBudgetEvaluationCases0002
     * @tc.desc      Verify empty samples headline says no data
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchBudgetEvaluationCases0002', 0, (): void => {
      const report: BudgetReport = evaluateBudgets([]);
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0002 LaunchBudgetCases.test:807 assertEqual actual', report.headline())).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0002 LaunchBudgetCases.test:807 assertEqual expected', '暂无启动样本'));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0002 LaunchBudgetCases.test:808 assertTrue actual', report.text().indexOf('暂无启动样本') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0002 LaunchBudgetCases.test:809 assertEqual actual', report.failures().length)).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0002 LaunchBudgetCases.test:809 assertEqual expected', 0));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHBUDGETEVALUATIONCASES_0300
     * @tc.name      testLaunchBudgetEvaluationCases0003
     * @tc.desc      Verify unmeasured groups count as passed but excluded
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchBudgetEvaluationCases0003', 0, (): void => {
      const samples: LaunchSample[] = mergeSamples([samplesOf('cold', 2, 500, 10)]);
      const report: BudgetReport = evaluateBudgets(samples);
      const cold: BudgetResult | undefined = report.results.find((item: BudgetResult): boolean =>
        item.key === 'cold');
      const warm: BudgetResult | undefined = report.results.find((item: BudgetResult): boolean =>
        item.key === 'warm');
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0003 LaunchBudgetCases.test:828 assertTrue actual', cold?.passed)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0003 LaunchBudgetCases.test:829 assertTrue actual', warm?.passed)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0003 LaunchBudgetCases.test:830 assertEqual actual', warm?.count)).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0003 LaunchBudgetCases.test:830 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0003 LaunchBudgetCases.test:831 assertEqual actual', report.measured())).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0003 LaunchBudgetCases.test:831 assertEqual expected', 1));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHBUDGETEVALUATIONCASES_0400
     * @tc.name      testLaunchBudgetEvaluationCases0004
     * @tc.desc      Verify over budget group is reported as failure
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchBudgetEvaluationCases0004', 0, (): void => {
      const samples: LaunchSample[] = mergeSamples([samplesOf('hot', 3, 500, 10)]);
      const report: BudgetReport = evaluateBudgets(samples);
      const hot: BudgetResult | undefined = report.results.find((item: BudgetResult): boolean =>
        item.key === 'hot');
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0004 LaunchBudgetCases.test:848 assertFalse actual', hot?.passed)).assertFalse();
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0004 LaunchBudgetCases.test:849 assertEqual actual', hot?.overshoot())).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0004 LaunchBudgetCases.test:849 assertEqual expected', 118));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0004 LaunchBudgetCases.test:850 assertEqual actual', hot?.overshoot())).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0004 LaunchBudgetCases.test:850 assertEqual expected', (hot?.p90 ?? 0) - 400));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0004 LaunchBudgetCases.test:851 assertEqual actual', report.failed())).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0004 LaunchBudgetCases.test:851 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0004 LaunchBudgetCases.test:852 assertEqual actual', report.headline())).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0004 LaunchBudgetCases.test:852 assertEqual expected', '1 组超出预算'));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHBUDGETEVALUATIONCASES_0500
     * @tc.name      testLaunchBudgetEvaluationCases0005
     * @tc.desc      Verify budget boundary is inclusive
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchBudgetEvaluationCases0005', 0, (): void => {
      const atBudget: LaunchSample[] = [sampleOf('edge', 'hot', 0, 400)];
      const overBudget: LaunchSample[] = [sampleOf('edge', 'hot', 0, 401)];
      const passReport: BudgetReport = evaluateBudgets(atBudget);
      const failReport: BudgetReport = evaluateBudgets(overBudget);
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0005 LaunchBudgetCases.test:869 assertEqual actual', passReport.failed())).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0005 LaunchBudgetCases.test:869 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0005 LaunchBudgetCases.test:870 assertEqual actual', failReport.failed())).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0005 LaunchBudgetCases.test:870 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0005 LaunchBudgetCases.test:871 assertEqual actual', passReport.passRate())).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0005 LaunchBudgetCases.test:871 assertEqual expected', 100));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHBUDGETEVALUATIONCASES_0600
     * @tc.name      testLaunchBudgetEvaluationCases0006
     * @tc.desc      Verify overshoot is zero when passed
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchBudgetEvaluationCases0006', 0, (): void => {
      const report: BudgetReport = evaluateBudgets([sampleOf('ok', 'cold', 0, 600)]);
      const cold: BudgetResult | undefined = report.results.find((item: BudgetResult): boolean =>
        item.key === 'cold');
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0006 LaunchBudgetCases.test:887 assertTrue actual', cold?.passed)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0006 LaunchBudgetCases.test:888 assertEqual actual', cold?.overshoot())).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0006 LaunchBudgetCases.test:888 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0006 LaunchBudgetCases.test:889 assertEqual actual', cold?.count)).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0006 LaunchBudgetCases.test:889 assertEqual expected', 1));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHBUDGETEVALUATIONCASES_0700
     * @tc.name      testLaunchBudgetEvaluationCases0007
     * @tc.desc      Verify budget result text for empty group
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testLaunchBudgetEvaluationCases0007', 0, (): void => {
      const result: BudgetResult = new BudgetResult();
      result.key = 'warm';
      result.label = '温启动';
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0007 LaunchBudgetCases.test:905 assertEqual actual', result.text())).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0007 LaunchBudgetCases.test:905 assertEqual expected', '温启动：暂无样本'));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0007 LaunchBudgetCases.test:906 assertEqual actual', result.count)).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0007 LaunchBudgetCases.test:906 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0007 LaunchBudgetCases.test:907 assertEqual actual', result.overshoot())).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0007 LaunchBudgetCases.test:907 assertEqual expected', 0));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHBUDGETEVALUATIONCASES_0800
     * @tc.name      testLaunchBudgetEvaluationCases0008
     * @tc.desc      Verify budget result text for passed group
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testLaunchBudgetEvaluationCases0008', 0, (): void => {
      const result: BudgetResult = new BudgetResult();
      result.label = '热启动';
      result.count = 3;
      result.p90 = 300;
      result.budgetMs = 400;
      result.passed = true;
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0008 LaunchBudgetCases.test:926 assertTrue actual', result.text().indexOf('达标') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0008 LaunchBudgetCases.test:927 assertTrue actual', result.text().indexOf('300') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0008 LaunchBudgetCases.test:928 assertEqual actual', result.text().indexOf('超出'))).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0008 LaunchBudgetCases.test:928 assertEqual expected', -1));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHBUDGETEVALUATIONCASES_0900
     * @tc.name      testLaunchBudgetEvaluationCases0009
     * @tc.desc      Verify budget result text for failed group
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testLaunchBudgetEvaluationCases0009', 0, (): void => {
      const result: BudgetResult = new BudgetResult();
      result.label = '冷启动';
      result.count = 4;
      result.p90 = 1500;
      result.budgetMs = 1200;
      result.passed = false;
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0009 LaunchBudgetCases.test:947 assertTrue actual', result.text().indexOf('超出 300 ms') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0009 LaunchBudgetCases.test:948 assertEqual actual', result.overshoot())).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0009 LaunchBudgetCases.test:948 assertEqual expected', 300));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0009 LaunchBudgetCases.test:949 assertEqual actual', result.text().indexOf('达标'))).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0009 LaunchBudgetCases.test:949 assertEqual expected', -1));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHBUDGETEVALUATIONCASES_1000
     * @tc.name      testLaunchBudgetEvaluationCases0010
     * @tc.desc      Verify report text starts with headline
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testLaunchBudgetEvaluationCases0010', 0, (): void => {
      const report: BudgetReport = evaluateBudgets([sampleOf('ok', 'hot', 0, 100)]);
      const lines: string[] = report.text().split('\n');
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0010 LaunchBudgetCases.test:964 assertEqual actual', lines.length)).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0010 LaunchBudgetCases.test:964 assertEqual expected', LAUNCH_GROUPS.length + 1));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0010 LaunchBudgetCases.test:965 assertTrue actual', lines[0].indexOf('启动预算') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0010 LaunchBudgetCases.test:966 assertTrue actual', lines[0].indexOf('通过率') >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHBUDGETEVALUATIONCASES_1100
     * @tc.name      testLaunchBudgetEvaluationCases0011
     * @tc.desc      Verify pass rate counts only measured groups
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchBudgetEvaluationCases0011', 0, (): void => {
      const samples: LaunchSample[] = mergeSamples([
        samplesOf('cold', 2, 500, 10),
        samplesOf('hot', 2, 900, 10)
      ]);
      const report: BudgetReport = evaluateBudgets(samples);
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0011 LaunchBudgetCases.test:984 assertEqual actual', report.measured())).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0011 LaunchBudgetCases.test:984 assertEqual expected', 2));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0011 LaunchBudgetCases.test:985 assertEqual actual', report.passed())).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0011 LaunchBudgetCases.test:985 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0011 LaunchBudgetCases.test:986 assertEqual actual', report.failed())).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0011 LaunchBudgetCases.test:986 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0011 LaunchBudgetCases.test:987 assertEqual actual', report.passRate())).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0011 LaunchBudgetCases.test:987 assertEqual expected', 50));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHBUDGETEVALUATIONCASES_1200
     * @tc.name      testLaunchBudgetEvaluationCases0012
     * @tc.desc      Verify failures exclude unmeasured groups
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchBudgetEvaluationCases0012', 0, (): void => {
      const report: BudgetReport = evaluateBudgets([sampleOf('slow', 'warm', 0, 2000)]);
      const failures: BudgetResult[] = report.failures();
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0012 LaunchBudgetCases.test:1002 assertEqual actual', failures.length)).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0012 LaunchBudgetCases.test:1002 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0012 LaunchBudgetCases.test:1003 assertEqual actual', failures[0].key)).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0012 LaunchBudgetCases.test:1003 assertEqual expected', 'warm'));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0012 LaunchBudgetCases.test:1004 assertTrue actual', failures[0].count > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0012 LaunchBudgetCases.test:1005 assertEqual actual', report.results.length)).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0012 LaunchBudgetCases.test:1005 assertEqual expected', 5));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHBUDGETEVALUATIONCASES_1300
     * @tc.name      testLaunchBudgetEvaluationCases0013
     * @tc.desc      Verify all groups within budget headline
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchBudgetEvaluationCases0013', 0, (): void => {
      const samples: LaunchSample[] = mergeSamples([
        samplesOf('cold', 2, 800, 10),
        samplesOf('warm', 2, 500, 10),
        samplesOf('hot', 2, 200, 10)
      ]);
      const report: BudgetReport = evaluateBudgets(samples);
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0013 LaunchBudgetCases.test:1024 assertEqual actual', report.headline())).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0013 LaunchBudgetCases.test:1024 assertEqual expected', '全部达标'));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0013 LaunchBudgetCases.test:1025 assertEqual actual', report.failed())).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0013 LaunchBudgetCases.test:1025 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0013 LaunchBudgetCases.test:1026 assertEqual actual', report.passRate())).assertEqual(traceParameter('com.samples.appperformance_LaunchBudgetEvaluationCases_0013 LaunchBudgetCases.test:1026 assertEqual expected', 100));
    });
  });

  describe('LaunchRegressionCases', (): void => {
    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHREGRESSIONCASES_0100
     * @tc.name      testLaunchRegressionCases0001
     * @tc.desc      Verify missing group is uncomparable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchRegressionCases0001', 0, (): void => {
      const before: LaunchSample[] = mergeSamples([samplesOf('cold', 2, 500, 10)]);
      const after: LaunchSample[] = mergeSamples([samplesOf('warm', 2, 500, 10)]);
      const report: RegressionReport = compareLaunches(before, after);
      const cold: RegressionResult | undefined = report.results.find((item: RegressionResult): boolean =>
        item.key === 'cold');
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0001 LaunchBudgetCases.test:1046 assertEqual actual', cold?.verdict)).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0001 LaunchBudgetCases.test:1046 assertEqual expected', RegressionVerdict.UNKNOWN));
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0001 LaunchBudgetCases.test:1047 assertEqual actual', cold?.beforeP90)).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0001 LaunchBudgetCases.test:1047 assertEqual expected', 509));
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0001 LaunchBudgetCases.test:1048 assertEqual actual', cold?.afterP90)).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0001 LaunchBudgetCases.test:1048 assertEqual expected', 0));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHREGRESSIONCASES_0200
     * @tc.name      testLaunchRegressionCases0002
     * @tc.desc      Verify empty both sides is uncomparable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchRegressionCases0002', 0, (): void => {
      const report: RegressionReport = compareLaunches([], []);
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0002 LaunchBudgetCases.test:1062 assertEqual actual', report.results.length)).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0002 LaunchBudgetCases.test:1062 assertEqual expected', LAUNCH_GROUPS.length));
      report.results.forEach((item: RegressionResult): void => {
        expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0002 LaunchBudgetCases.test:1064 assertEqual actual', item.verdict)).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0002 LaunchBudgetCases.test:1064 assertEqual expected', RegressionVerdict.UNKNOWN));
      });
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0002 LaunchBudgetCases.test:1066 assertEqual actual', report.regressed().length)).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0002 LaunchBudgetCases.test:1066 assertEqual expected', 0));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHREGRESSIONCASES_0300
     * @tc.name      testLaunchRegressionCases0003
     * @tc.desc      Verify identical samples are stable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchRegressionCases0003', 0, (): void => {
      const samples: LaunchSample[] = mergeSamples([samplesOf('cold', 3, 700, 10)]);
      const report: RegressionReport = compareLaunches(samples, samples);
      const cold: RegressionResult | undefined = report.results.find((item: RegressionResult): boolean =>
        item.key === 'cold');
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0003 LaunchBudgetCases.test:1083 assertEqual actual', cold?.verdict)).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0003 LaunchBudgetCases.test:1083 assertEqual expected', RegressionVerdict.STABLE));
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0003 LaunchBudgetCases.test:1084 assertEqual actual', cold?.changePercent())).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0003 LaunchBudgetCases.test:1084 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0003 LaunchBudgetCases.test:1085 assertEqual actual', report.headline())).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0003 LaunchBudgetCases.test:1085 assertEqual expected', '没有回归'));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHREGRESSIONCASES_0400
     * @tc.name      testLaunchRegressionCases0004
     * @tc.desc      Verify slower samples regress
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchRegressionCases0004', 0, (): void => {
      const before: LaunchSample[] = [sampleOf('b', 'hot', 0, 1000)];
      const after: LaunchSample[] = [sampleOf('a', 'hot', 0, 1200)];
      const report: RegressionReport = compareLaunches(before, after);
      const hot: RegressionResult | undefined = report.results.find((item: RegressionResult): boolean =>
        item.key === 'hot');
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0004 LaunchBudgetCases.test:1103 assertEqual actual', hot?.verdict)).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0004 LaunchBudgetCases.test:1103 assertEqual expected', RegressionVerdict.REGRESSED));
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0004 LaunchBudgetCases.test:1104 assertEqual actual', hot?.changePercent())).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0004 LaunchBudgetCases.test:1104 assertEqual expected', 20));
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0004 LaunchBudgetCases.test:1105 assertEqual actual', report.regressed().length)).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0004 LaunchBudgetCases.test:1105 assertEqual expected', 1));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHREGRESSIONCASES_0500
     * @tc.name      testLaunchRegressionCases0005
     * @tc.desc      Verify faster samples improve
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchRegressionCases0005', 0, (): void => {
      const before: LaunchSample[] = [sampleOf('b', 'hot', 0, 1000)];
      const after: LaunchSample[] = [sampleOf('a', 'hot', 0, 850)];
      const report: RegressionReport = compareLaunches(before, after);
      const hot: RegressionResult | undefined = report.results.find((item: RegressionResult): boolean =>
        item.key === 'hot');
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0005 LaunchBudgetCases.test:1123 assertEqual actual', hot?.verdict)).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0005 LaunchBudgetCases.test:1123 assertEqual expected', RegressionVerdict.IMPROVED));
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0005 LaunchBudgetCases.test:1124 assertEqual actual', hot?.changePercent())).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0005 LaunchBudgetCases.test:1124 assertEqual expected', -15));
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0005 LaunchBudgetCases.test:1125 assertEqual actual', report.headline())).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0005 LaunchBudgetCases.test:1125 assertEqual expected', '没有回归'));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHREGRESSIONCASES_0600
     * @tc.name      testLaunchRegressionCases0006
     * @tc.desc      Verify change within threshold is stable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchRegressionCases0006', 0, (): void => {
      const before: LaunchSample[] = [sampleOf('b', 'warm', 0, 1000)];
      const after: LaunchSample[] = [sampleOf('a', 'warm', 0, 1050)];
      const report: RegressionReport = compareLaunches(before, after);
      const warm: RegressionResult | undefined = report.results.find((item: RegressionResult): boolean =>
        item.key === 'warm');
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0006 LaunchBudgetCases.test:1143 assertEqual actual', warm?.verdict)).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0006 LaunchBudgetCases.test:1143 assertEqual expected', RegressionVerdict.STABLE));
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0006 LaunchBudgetCases.test:1144 assertEqual actual', warm?.changePercent())).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0006 LaunchBudgetCases.test:1144 assertEqual expected', 5));
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0006 LaunchBudgetCases.test:1145 assertEqual actual', warm?.beforeP90)).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0006 LaunchBudgetCases.test:1145 assertEqual expected', 1000));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHREGRESSIONCASES_0700
     * @tc.name      testLaunchRegressionCases0007
     * @tc.desc      Verify custom threshold widens tolerance
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchRegressionCases0007', 0, (): void => {
      const before: LaunchSample[] = [sampleOf('b', 'cold', 0, 1000)];
      const after: LaunchSample[] = [sampleOf('a', 'cold', 0, 1200)];
      const strict: RegressionReport = compareLaunches(before, after, 10);
      const loose: RegressionReport = compareLaunches(before, after, 20);
      const strictCold: RegressionResult | undefined = strict.results.find((item: RegressionResult): boolean =>
        item.key === 'cold');
      const looseCold: RegressionResult | undefined = loose.results.find((item: RegressionResult): boolean =>
        item.key === 'cold');
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0007 LaunchBudgetCases.test:1166 assertEqual actual', strictCold?.verdict)).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0007 LaunchBudgetCases.test:1166 assertEqual expected', RegressionVerdict.REGRESSED));
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0007 LaunchBudgetCases.test:1167 assertEqual actual', looseCold?.verdict)).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0007 LaunchBudgetCases.test:1167 assertEqual expected', RegressionVerdict.STABLE));
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0007 LaunchBudgetCases.test:1168 assertTrue actual', strict.results.length > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHREGRESSIONCASES_0800
     * @tc.name      testLaunchRegressionCases0008
     * @tc.desc      Verify change percent handles zero baseline
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchRegressionCases0008', 0, (): void => {
      const zero: RegressionResult = new RegressionResult();
      zero.beforeP90 = 0;
      zero.afterP90 = 0;
      const grown: RegressionResult = new RegressionResult();
      grown.beforeP90 = 0;
      grown.afterP90 = 240;
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0008 LaunchBudgetCases.test:1187 assertEqual actual', zero.changePercent())).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0008 LaunchBudgetCases.test:1187 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0008 LaunchBudgetCases.test:1188 assertEqual actual', grown.changePercent())).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0008 LaunchBudgetCases.test:1188 assertEqual expected', 100));
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0008 LaunchBudgetCases.test:1189 assertTrue actual', grown.changePercent() > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHREGRESSIONCASES_0900
     * @tc.name      testLaunchRegressionCases0009
     * @tc.desc      Verify regression labels cover every verdict
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testLaunchRegressionCases0009', 0, (): void => {
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0009 LaunchBudgetCases.test:1202 assertEqual actual', regressionLabel(RegressionVerdict.IMPROVED))).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0009 LaunchBudgetCases.test:1202 assertEqual expected', '变快'));
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0009 LaunchBudgetCases.test:1203 assertEqual actual', regressionLabel(RegressionVerdict.STABLE))).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0009 LaunchBudgetCases.test:1203 assertEqual expected', '持平'));
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0009 LaunchBudgetCases.test:1204 assertEqual actual', regressionLabel(RegressionVerdict.REGRESSED))).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0009 LaunchBudgetCases.test:1204 assertEqual expected', '变慢'));
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0009 LaunchBudgetCases.test:1205 assertEqual actual', regressionLabel(RegressionVerdict.UNKNOWN))).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0009 LaunchBudgetCases.test:1205 assertEqual expected', '无法比较'));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHREGRESSIONCASES_1000
     * @tc.name      testLaunchRegressionCases0010
     * @tc.desc      Verify regression labels are distinct
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testLaunchRegressionCases0010', 0, (): void => {
      const labels: string[] = [
        regressionLabel(RegressionVerdict.IMPROVED),
        regressionLabel(RegressionVerdict.STABLE),
        regressionLabel(RegressionVerdict.REGRESSED),
        regressionLabel(RegressionVerdict.UNKNOWN)
      ];
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0010 LaunchBudgetCases.test:1224 assertEqual actual', labels.filter((label: string, index: number): boolean =>
        labels.indexOf(label) !== index).length)).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0010 LaunchBudgetCases.test:1224 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0010 LaunchBudgetCases.test:1226 assertTrue actual', labels.every((label: string): boolean => label.length > 0))).assertTrue();
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0010 LaunchBudgetCases.test:1227 assertEqual actual', labels.length)).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0010 LaunchBudgetCases.test:1227 assertEqual expected', 4));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHREGRESSIONCASES_1100
     * @tc.name      testLaunchRegressionCases0011
     * @tc.desc      Verify regressed filters only worse groups
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchRegressionCases0011', 0, (): void => {
      const before: LaunchSample[] = mergeSamples([
        [sampleOf('b1', 'cold', 0, 800)],
        [sampleOf('b2', 'hot', 0, 300)],
        [sampleOf('b3', 'warm', 0, 600)]
      ]);
      const after: LaunchSample[] = mergeSamples([
        [sampleOf('a1', 'cold', 0, 1000)],
        [sampleOf('a2', 'hot', 0, 200)],
        [sampleOf('a3', 'warm', 0, 600)]
      ]);
      const report: RegressionReport = compareLaunches(before, after);
      const worse: RegressionResult[] = report.regressed();
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0011 LaunchBudgetCases.test:1252 assertEqual actual', worse.length)).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0011 LaunchBudgetCases.test:1252 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0011 LaunchBudgetCases.test:1253 assertEqual actual', worse[0].key)).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0011 LaunchBudgetCases.test:1253 assertEqual expected', 'cold'));
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0011 LaunchBudgetCases.test:1254 assertEqual actual', report.headline())).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0011 LaunchBudgetCases.test:1254 assertEqual expected', '1 组出现回归'));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHREGRESSIONCASES_1200
     * @tc.name      testLaunchRegressionCases0012
     * @tc.desc      Verify regression text lists every group
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testLaunchRegressionCases0012', 0, (): void => {
      const report: RegressionReport = compareLaunches(
        [sampleOf('b', 'cold', 0, 700)], [sampleOf('a', 'cold', 0, 800)]);
      const lines: string[] = report.text().split('\n');
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0012 LaunchBudgetCases.test:1270 assertEqual actual', lines.length)).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0012 LaunchBudgetCases.test:1270 assertEqual expected', LAUNCH_GROUPS.length + 1));
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0012 LaunchBudgetCases.test:1271 assertTrue actual', lines[0].indexOf('回归检测') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0012 LaunchBudgetCases.test:1272 assertTrue actual', report.text().indexOf('冷启动') >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHREGRESSIONCASES_1300
     * @tc.name      testLaunchRegressionCases0013
     * @tc.desc      Verify empty report headline says no comparison
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchRegressionCases0013', 0, (): void => {
      const report: RegressionReport = new RegressionReport();
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0013 LaunchBudgetCases.test:1286 assertEqual actual', report.headline())).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0013 LaunchBudgetCases.test:1286 assertEqual expected', '没有可比样本'));
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0013 LaunchBudgetCases.test:1287 assertEqual actual', report.regressed().length)).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0013 LaunchBudgetCases.test:1287 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0013 LaunchBudgetCases.test:1288 assertEqual actual', report.results.length)).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0013 LaunchBudgetCases.test:1288 assertEqual expected', 0));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHREGRESSIONCASES_1400
     * @tc.name      testLaunchRegressionCases0014
     * @tc.desc      Verify regression result text shows delta
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testLaunchRegressionCases0014', 0, (): void => {
      const result: RegressionResult = new RegressionResult();
      result.key = 'cold';
      result.beforeP90 = 800;
      result.afterP90 = 1000;
      result.verdict = RegressionVerdict.REGRESSED;
      const text: string = result.text();
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0014 LaunchBudgetCases.test:1307 assertTrue actual', text.indexOf('800 -> 1000') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0014 LaunchBudgetCases.test:1308 assertTrue actual', text.indexOf('变慢') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0014 LaunchBudgetCases.test:1309 assertTrue actual', text.indexOf('25%') >= 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_LAUNCHREGRESSIONCASES_1500
     * @tc.name      testLaunchRegressionCases0015
     * @tc.desc      Verify regression compares percentiles not means
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testLaunchRegressionCases0015', 0, (): void => {
      const before: LaunchSample[] = mergeSamples([samplesOf('hot', 5, 100, 10)]);
      const after: LaunchSample[] = mergeSamples([samplesOf('hot', 5, 100, 10)]);
      const report: RegressionReport = compareLaunches(before, after);
      const hot: RegressionResult | undefined = report.results.find((item: RegressionResult): boolean =>
        item.key === 'hot');
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0015 LaunchBudgetCases.test:1327 assertEqual actual', hot?.beforeP90)).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0015 LaunchBudgetCases.test:1327 assertEqual expected', 136));
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0015 LaunchBudgetCases.test:1328 assertEqual actual', hot?.afterP90)).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0015 LaunchBudgetCases.test:1328 assertEqual expected', 136));
      expect(traceParameter('com.samples.appperformance_LaunchRegressionCases_0015 LaunchBudgetCases.test:1329 assertEqual actual', hot?.verdict)).assertEqual(traceParameter('com.samples.appperformance_LaunchRegressionCases_0015 LaunchBudgetCases.test:1329 assertEqual expected', RegressionVerdict.STABLE));
    });
  });
}
