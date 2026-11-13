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

import { describe, expect } from '@ohos/hypium';
import { traceParameter, loggedIt as it } from '../support/TestLog';
import { configureTestText } from '../support/TestTextResources';
import {
  CheckLayer, FaultOwner, FaultSeverity, FAULT_CATALOG, FaultEntry, auditFaults, criticalFaults,
  faultDetailLines, faultIds, faultLines, faultOf, faultsOfLayer, faultsOfOwner, layerCounts,
  layerLabel, ownerCounts, ownerLabel, planActions, recoverableFaults, severityLabel, severityRank,
  summarizeFaults
} from '../../../main/ets/autostart/diagnostics/FaultCatalog';
import {
  ArchiveRecord, ArchivePlan, Compaction, CompactionInput, RETENTION_RULES, RetentionTier,
  auditRetention, buildCompaction, compactionLabel, decideCompaction, exportableAt, keepsDetailAt,
  limitAt, planArchive, retentionLines, ruleIds, ruleOf, rulesOfTier, tierLabel, tierLines, tierOf,
  tierOrder
} from '../../../main/ets/autostart/history/ArchivePolicy';

const HOUR: number = 3600000;
const DAY: number = 86400000;

function record(id: number, ageMs: number, now: number): ArchiveRecord {
  return new ArchiveRecord(id, now - ageMs, 'success');
}

export default function faultArchiveCasesTest(): void {
  configureTestText();
  describe('FaultCatalogCases', (): void => {
    /**
     * @tc.number    SUB_STARTUP_FAULTCATALOGCASES_0100
     * @tc.name      testFaultCatalogCases0001
     * @tc.desc      Verify catalog is complete and ordered
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testFaultCatalogCases0001', 0, (): void => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0001|FaultArchiveCases.test.ets|assert0001|assertEqual|actual', FAULT_CATALOG.length)).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0001|FaultArchiveCases.test.ets|assert0001|assertEqual|expected', 22));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0001|FaultArchiveCases.test.ets|assert0002|assertEqual|actual', faultIds().length)).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0001|FaultArchiveCases.test.ets|assert0002|assertEqual|expected', 22));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0001|FaultArchiveCases.test.ets|assert0003|assertEqual|actual', faultLines().length)).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0001|FaultArchiveCases.test.ets|assert0003|assertEqual|expected', 22));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0001|FaultArchiveCases.test.ets|assert0004|assertEqual|actual', faultDetailLines().length)).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0001|FaultArchiveCases.test.ets|assert0004|assertEqual|expected', 22));
      const audit = auditFaults();
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0001|FaultArchiveCases.test.ets|assert0005|assertEqual|actual', audit.findings.length)).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0001|FaultArchiveCases.test.ets|assert0005|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0001|FaultArchiveCases.test.ets|assert0006|assertTrue|actual|expected=true', audit.ok)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0001|FaultArchiveCases.test.ets|assert0007|assertEqual|actual', audit.summary())).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0001|FaultArchiveCases.test.ets|assert0007|assertEqual|expected', '故障目录自洽'));
      FAULT_CATALOG.forEach((item: FaultEntry): void => {
        expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0001|FaultArchiveCases.test.ets|assert0008|assertTrue|actual|expected=true', item.symptom.length > 0)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0001|FaultArchiveCases.test.ets|assert0009|assertTrue|actual|expected=true', item.trigger.length > 0)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0001|FaultArchiveCases.test.ets|assert0010|assertTrue|actual|expected=true', item.detection.length > 0)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0001|FaultArchiveCases.test.ets|assert0011|assertTrue|actual|expected=true', item.action.length > 0)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0001|FaultArchiveCases.test.ets|assert0012|assertTrue|actual|expected=true', item.text().indexOf(item.faultId) === 0)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0001|FaultArchiveCases.test.ets|assert0013|assertTrue|actual|expected=true', item.detail().indexOf('处置') > 0)).assertTrue();
      });
    });

    /**
     * @tc.number    SUB_STARTUP_FAULTCATALOGCASES_0200
     * @tc.name      testFaultCatalogCases0002
     * @tc.desc      Verify severity and owner labels
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testFaultCatalogCases0002', 0, (): void => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0002|FaultArchiveCases.test.ets|assert0014|assertEqual|actual', severityLabel(FaultSeverity.BLOCKER))).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0002|FaultArchiveCases.test.ets|assert0014|assertEqual|expected', '阻断'));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0002|FaultArchiveCases.test.ets|assert0015|assertEqual|actual', severityLabel(FaultSeverity.MAJOR))).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0002|FaultArchiveCases.test.ets|assert0015|assertEqual|expected', '严重'));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0002|FaultArchiveCases.test.ets|assert0016|assertEqual|actual', severityLabel(FaultSeverity.MINOR))).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0002|FaultArchiveCases.test.ets|assert0016|assertEqual|expected', '轻微'));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0002|FaultArchiveCases.test.ets|assert0017|assertEqual|actual', severityLabel(FaultSeverity.INFO))).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0002|FaultArchiveCases.test.ets|assert0017|assertEqual|expected', '提示'));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0002|FaultArchiveCases.test.ets|assert0018|assertEqual|actual', severityRank(FaultSeverity.BLOCKER))).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0002|FaultArchiveCases.test.ets|assert0018|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0002|FaultArchiveCases.test.ets|assert0019|assertEqual|actual', severityRank(FaultSeverity.INFO))).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0002|FaultArchiveCases.test.ets|assert0019|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0002|FaultArchiveCases.test.ets|assert0020|assertEqual|actual', ownerLabel(FaultOwner.SYSTEM))).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0002|FaultArchiveCases.test.ets|assert0020|assertEqual|expected', '系统侧'));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0002|FaultArchiveCases.test.ets|assert0021|assertEqual|actual', ownerLabel(FaultOwner.ENVIRONMENT))).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0002|FaultArchiveCases.test.ets|assert0021|assertEqual|expected', '运行环境'));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0002|FaultArchiveCases.test.ets|assert0022|assertEqual|actual', layerLabel(CheckLayer.STORAGE))).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0002|FaultArchiveCases.test.ets|assert0022|assertEqual|expected', '存储层'));
    });

    /**
     * @tc.number    SUB_STARTUP_FAULTCATALOGCASES_0300
     * @tc.name      testFaultCatalogCases0003
     * @tc.desc      Verify owner distribution matches catalog
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testFaultCatalogCases0003', 0, (): void => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0003|FaultArchiveCases.test.ets|assert0023|assertEqual|actual', faultsOfOwner(FaultOwner.SYSTEM).length)).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0003|FaultArchiveCases.test.ets|assert0023|assertEqual|expected', 5));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0003|FaultArchiveCases.test.ets|assert0024|assertEqual|actual', faultsOfOwner(FaultOwner.APP).length)).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0003|FaultArchiveCases.test.ets|assert0024|assertEqual|expected', 15));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0003|FaultArchiveCases.test.ets|assert0025|assertEqual|actual', faultsOfOwner(FaultOwner.USER).length)).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0003|FaultArchiveCases.test.ets|assert0025|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0003|FaultArchiveCases.test.ets|assert0026|assertEqual|actual', faultsOfOwner(FaultOwner.ENVIRONMENT).length)).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0003|FaultArchiveCases.test.ets|assert0026|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0003|FaultArchiveCases.test.ets|assert0027|assertEqual|actual', ownerCounts().length)).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0003|FaultArchiveCases.test.ets|assert0027|assertEqual|expected', 4));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0003|FaultArchiveCases.test.ets|assert0028|assertEqual|actual', ownerCounts()[1])).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0003|FaultArchiveCases.test.ets|assert0028|assertEqual|expected', 15));
    });

    /**
     * @tc.number    SUB_STARTUP_FAULTCATALOGCASES_0400
     * @tc.name      testFaultCatalogCases0004
     * @tc.desc      Verify layer distribution matches catalog
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testFaultCatalogCases0004', 0, (): void => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0004|FaultArchiveCases.test.ets|assert0029|assertEqual|actual', faultsOfLayer(CheckLayer.CAPABILITY).length)).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0004|FaultArchiveCases.test.ets|assert0029|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0004|FaultArchiveCases.test.ets|assert0030|assertEqual|actual', faultsOfLayer(CheckLayer.PERMISSION).length)).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0004|FaultArchiveCases.test.ets|assert0030|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0004|FaultArchiveCases.test.ets|assert0031|assertEqual|actual', faultsOfLayer(CheckLayer.QUERY).length)).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0004|FaultArchiveCases.test.ets|assert0031|assertEqual|expected', 5));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0004|FaultArchiveCases.test.ets|assert0032|assertEqual|actual', faultsOfLayer(CheckLayer.STORAGE).length)).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0004|FaultArchiveCases.test.ets|assert0032|assertEqual|expected', 4));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0004|FaultArchiveCases.test.ets|assert0033|assertEqual|actual', faultsOfLayer(CheckLayer.UI).length)).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0004|FaultArchiveCases.test.ets|assert0033|assertEqual|expected', 8));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0004|FaultArchiveCases.test.ets|assert0034|assertEqual|actual', layerCounts().length)).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0004|FaultArchiveCases.test.ets|assert0034|assertEqual|expected', 5));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0004|FaultArchiveCases.test.ets|assert0035|assertEqual|actual', layerCounts()[4])).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0004|FaultArchiveCases.test.ets|assert0035|assertEqual|expected', 8));
    });

    /**
     * @tc.number    SUB_STARTUP_FAULTCATALOGCASES_0500
     * @tc.name      testFaultCatalogCases0005
     * @tc.desc      Verify summary counts severities
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFaultCatalogCases0005', 0, (): void => {
      configureTestText();
      const summary = summarizeFaults();
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0005|FaultArchiveCases.test.ets|assert0036|assertEqual|actual', summary.total)).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0005|FaultArchiveCases.test.ets|assert0036|assertEqual|expected', 22));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0005|FaultArchiveCases.test.ets|assert0037|assertEqual|actual', summary.blockers)).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0005|FaultArchiveCases.test.ets|assert0037|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0005|FaultArchiveCases.test.ets|assert0038|assertEqual|actual', summary.majors)).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0005|FaultArchiveCases.test.ets|assert0038|assertEqual|expected', 14));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0005|FaultArchiveCases.test.ets|assert0039|assertEqual|actual', summary.recoverable)).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0005|FaultArchiveCases.test.ets|assert0039|assertEqual|expected', 18));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0005|FaultArchiveCases.test.ets|assert0040|assertTrue|actual|expected=true', summary.urgent())).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0005|FaultArchiveCases.test.ets|assert0041|assertTrue|actual|expected=true', summary.text().indexOf('共 22 条') === 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0005|FaultArchiveCases.test.ets|assert0042|assertEqual|actual', recoverableFaults().length)).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0005|FaultArchiveCases.test.ets|assert0042|assertEqual|expected', 18));
    });

    /**
     * @tc.number    SUB_STARTUP_FAULTCATALOGCASES_0600
     * @tc.name      testFaultCatalogCases0006
     * @tc.desc      Verify critical faults sort blockers first
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFaultCatalogCases0006', 0, (): void => {
      configureTestText();
      const critical: FaultEntry[] = criticalFaults();
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0006|FaultArchiveCases.test.ets|assert0043|assertEqual|actual', critical.length)).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0006|FaultArchiveCases.test.ets|assert0043|assertEqual|expected', 16));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0006|FaultArchiveCases.test.ets|assert0044|assertEqual|actual', critical[0].faultId)).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0006|FaultArchiveCases.test.ets|assert0044|assertEqual|expected', 'FT-04'));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0006|FaultArchiveCases.test.ets|assert0045|assertEqual|actual', critical[1].faultId)).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0006|FaultArchiveCases.test.ets|assert0045|assertEqual|expected', 'FT-07'));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0006|FaultArchiveCases.test.ets|assert0046|assertEqual|actual', critical[2].faultId)).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0006|FaultArchiveCases.test.ets|assert0046|assertEqual|expected', 'FT-01'));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0006|FaultArchiveCases.test.ets|assert0047|assertEqual|actual', critical[critical.length - 1].faultId)).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0006|FaultArchiveCases.test.ets|assert0047|assertEqual|expected', 'FT-22'));
      critical.forEach((item: FaultEntry, index: number): void => {
        expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0006|FaultArchiveCases.test.ets|assert0048|assertTrue|actual|expected=true', severityRank(item.severity) >= 2)).assertTrue();
        if (index > 0) {
          expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0006|FaultArchiveCases.test.ets|assert0049|assertTrue|actual|expected=true', severityRank(critical[index - 1].severity) >= severityRank(item.severity)))
            .assertTrue();
        }
      });
    });

    /**
     * @tc.number    SUB_STARTUP_FAULTCATALOGCASES_0700
     * @tc.name      testFaultCatalogCases0007
     * @tc.desc      Verify plan actions follows severity order
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFaultCatalogCases0007', 0, (): void => {
      configureTestText();
      const actions = planActions(['FT-05', 'FT-04', 'FT-01', 'FT-05']);
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0007|FaultArchiveCases.test.ets|assert0050|assertEqual|actual', actions.length)).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0007|FaultArchiveCases.test.ets|assert0050|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0007|FaultArchiveCases.test.ets|assert0051|assertEqual|actual', actions[0].faultId)).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0007|FaultArchiveCases.test.ets|assert0051|assertEqual|expected', 'FT-04'));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0007|FaultArchiveCases.test.ets|assert0052|assertEqual|actual', actions[1].faultId)).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0007|FaultArchiveCases.test.ets|assert0052|assertEqual|expected', 'FT-01'));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0007|FaultArchiveCases.test.ets|assert0053|assertEqual|actual', actions[2].faultId)).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0007|FaultArchiveCases.test.ets|assert0053|assertEqual|expected', 'FT-05'));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0007|FaultArchiveCases.test.ets|assert0054|assertEqual|actual', actions[0].seq)).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0007|FaultArchiveCases.test.ets|assert0054|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0007|FaultArchiveCases.test.ets|assert0055|assertTrue|actual|expected=true', actions[0].action.length > 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0007|FaultArchiveCases.test.ets|assert0056|assertTrue|actual|expected=true', actions[0].text().indexOf('1.') === 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0007|FaultArchiveCases.test.ets|assert0057|assertEqual|actual', planActions([]).length)).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0007|FaultArchiveCases.test.ets|assert0057|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0007|FaultArchiveCases.test.ets|assert0058|assertEqual|actual', planActions(['FT-99']).length)).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0007|FaultArchiveCases.test.ets|assert0058|assertEqual|expected', 0));
    });

    /**
     * @tc.number    SUB_STARTUP_FAULTCATALOGCASES_0800
     * @tc.name      testFaultCatalogCases0008
     * @tc.desc      Verify each fault is unique and reachable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFaultCatalogCases0008', 0, (): void => {
      configureTestText();
      const seen: string[] = [];
      faultIds().forEach((faultId: string): void => {
        expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0008|FaultArchiveCases.test.ets|assert0059|assertTrue|actual|expected=true', seen.indexOf(faultId) < 0)).assertTrue();
        seen.push(faultId);
        const entry: FaultEntry | undefined = faultOf(faultId);
        expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0008|FaultArchiveCases.test.ets|assert0060|assertTrue|actual|expected=true', entry !== undefined)).assertTrue();
        if (entry !== undefined) {
          expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0008|FaultArchiveCases.test.ets|assert0061|assertEqual|actual', entry.faultId)).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0008|FaultArchiveCases.test.ets|assert0061|assertEqual|expected', faultId));
          expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0008|FaultArchiveCases.test.ets|assert0062|assertTrue|actual|expected=true', (entry.owner as string).length > 0)).assertTrue();
          expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0008|FaultArchiveCases.test.ets|assert0063|assertTrue|actual|expected=true', (entry.layer as string).length > 0)).assertTrue();
        }
      });
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0008|FaultArchiveCases.test.ets|assert0064|assertEqual|actual', faultOf('FT-99'))).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0008|FaultArchiveCases.test.ets|assert0064|assertEqual|expected', undefined));
      expect(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0008|FaultArchiveCases.test.ets|assert0065|assertEqual|actual', seen.length)).assertEqual(traceParameter('com.samples.appstartupauto_FaultCatalogCases_0008|FaultArchiveCases.test.ets|assert0065|assertEqual|expected', 22));
    });
  });

  describe('ArchivePolicyCases', (): void => {
    /**
     * @tc.number    SUB_STARTUP_ARCHIVEPOLICYCASES_0100
     * @tc.name      testArchivePolicyCases0001
     * @tc.desc      Verify rule table is monotonic
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */

    it('testArchivePolicyCases0001', 0, (): void => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0001|FaultArchiveCases.test.ets|assert0066|assertEqual|actual', RETENTION_RULES.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0001|FaultArchiveCases.test.ets|assert0066|assertEqual|expected', 11));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0001|FaultArchiveCases.test.ets|assert0067|assertEqual|actual', ruleIds().length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0001|FaultArchiveCases.test.ets|assert0067|assertEqual|expected', 11));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0001|FaultArchiveCases.test.ets|assert0068|assertEqual|actual', retentionLines().length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0001|FaultArchiveCases.test.ets|assert0068|assertEqual|expected', 11));
      const audit = auditRetention();
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0001|FaultArchiveCases.test.ets|assert0069|assertEqual|actual', audit.findings.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0001|FaultArchiveCases.test.ets|assert0069|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0001|FaultArchiveCases.test.ets|assert0070|assertTrue|actual|expected=true', audit.ok)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0001|FaultArchiveCases.test.ets|assert0071|assertEqual|actual', audit.summary())).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0001|FaultArchiveCases.test.ets|assert0071|assertEqual|expected', '保留策略自洽'));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0001|FaultArchiveCases.test.ets|assert0072|assertEqual|actual', ruleOf('RT-11')?.tier)).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0001|FaultArchiveCases.test.ets|assert0072|assertEqual|expected', RetentionTier.EXPIRED));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0001|FaultArchiveCases.test.ets|assert0073|assertEqual|actual', rulesOfTier(RetentionTier.RECENT).length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0001|FaultArchiveCases.test.ets|assert0073|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0001|FaultArchiveCases.test.ets|assert0074|assertEqual|actual', rulesOfTier(RetentionTier.WEEKLY).length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0001|FaultArchiveCases.test.ets|assert0074|assertEqual|expected', 3));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0001|FaultArchiveCases.test.ets|assert0075|assertEqual|actual', rulesOfTier(RetentionTier.ARCHIVE).length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0001|FaultArchiveCases.test.ets|assert0075|assertEqual|expected', 4));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0001|FaultArchiveCases.test.ets|assert0076|assertEqual|actual', tierLines().length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0001|FaultArchiveCases.test.ets|assert0076|assertEqual|expected', 4));
      RETENTION_RULES.forEach((rule): void => {
        expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0001|FaultArchiveCases.test.ets|assert0077|assertTrue|actual|expected=true', rule.text().indexOf(rule.ruleId) === 0)).assertTrue();
        expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0001|FaultArchiveCases.test.ets|assert0078|assertTrue|actual|expected=true', rule.description.length > 0)).assertTrue();
      });
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEPOLICYCASES_0200
     * @tc.name      testArchivePolicyCases0002
     * @tc.desc      Verify tier assignment follows age
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchivePolicyCases0002', 0, (): void => {
      configureTestText();
      const now: number = 1700000000000;
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0002|FaultArchiveCases.test.ets|assert0079|assertEqual|actual', tierOf(HOUR / 2, now, now - HOUR / 2))).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0002|FaultArchiveCases.test.ets|assert0079|assertEqual|expected', RetentionTier.RECENT));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0002|FaultArchiveCases.test.ets|assert0080|assertEqual|actual', tierOf(2 * HOUR, now, now - 2 * HOUR))).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0002|FaultArchiveCases.test.ets|assert0080|assertEqual|expected', RetentionTier.RECENT));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0002|FaultArchiveCases.test.ets|assert0081|assertEqual|actual', tierOf(12 * HOUR, now, now - 12 * HOUR))).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0002|FaultArchiveCases.test.ets|assert0081|assertEqual|expected', RetentionTier.RECENT));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0002|FaultArchiveCases.test.ets|assert0082|assertEqual|actual', tierOf(2 * DAY, now, now - 2 * DAY))).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0002|FaultArchiveCases.test.ets|assert0082|assertEqual|expected', RetentionTier.WEEKLY));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0002|FaultArchiveCases.test.ets|assert0083|assertEqual|actual', tierOf(10 * DAY, now, now - 10 * DAY))).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0002|FaultArchiveCases.test.ets|assert0083|assertEqual|expected', RetentionTier.WEEKLY));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0002|FaultArchiveCases.test.ets|assert0084|assertEqual|actual', tierOf(20 * DAY, now, now - 20 * DAY))).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0002|FaultArchiveCases.test.ets|assert0084|assertEqual|expected', RetentionTier.ARCHIVE));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0002|FaultArchiveCases.test.ets|assert0085|assertEqual|actual', tierOf(100 * DAY, now, now - 100 * DAY))).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0002|FaultArchiveCases.test.ets|assert0085|assertEqual|expected', RetentionTier.ARCHIVE));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0002|FaultArchiveCases.test.ets|assert0086|assertEqual|actual', tierOf(200 * DAY, now, now - 200 * DAY))).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0002|FaultArchiveCases.test.ets|assert0086|assertEqual|expected', RetentionTier.EXPIRED));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0002|FaultArchiveCases.test.ets|assert0087|assertTrue|actual|expected=true', tierOrder(RetentionTier.ARCHIVE) > tierOrder(RetentionTier.WEEKLY))).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEPOLICYCASES_0300
     * @tc.name      testArchivePolicyCases0003
     * @tc.desc      Verify limits and export flags follow tier
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchivePolicyCases0003', 0, (): void => {
      configureTestText();
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0003|FaultArchiveCases.test.ets|assert0088|assertEqual|actual', limitAt(HOUR / 2))).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0003|FaultArchiveCases.test.ets|assert0088|assertEqual|expected', 20));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0003|FaultArchiveCases.test.ets|assert0089|assertEqual|actual', limitAt(6 * HOUR))).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0003|FaultArchiveCases.test.ets|assert0089|assertEqual|expected', 40));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0003|FaultArchiveCases.test.ets|assert0090|assertEqual|actual', limitAt(DAY))).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0003|FaultArchiveCases.test.ets|assert0090|assertEqual|expected', 60));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0003|FaultArchiveCases.test.ets|assert0091|assertEqual|actual', limitAt(30 * DAY))).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0003|FaultArchiveCases.test.ets|assert0091|assertEqual|expected', 150));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0003|FaultArchiveCases.test.ets|assert0092|assertEqual|actual', limitAt(200 * DAY))).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0003|FaultArchiveCases.test.ets|assert0092|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0003|FaultArchiveCases.test.ets|assert0093|assertTrue|actual|expected=true', exportableAt(DAY))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0003|FaultArchiveCases.test.ets|assert0094|assertTrue|actual|expected=true', exportableAt(90 * DAY))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0003|FaultArchiveCases.test.ets|assert0095|assertFalse|actual|expected=false', exportableAt(200 * DAY))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0003|FaultArchiveCases.test.ets|assert0096|assertTrue|actual|expected=true', keepsDetailAt(DAY))).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0003|FaultArchiveCases.test.ets|assert0097|assertFalse|actual|expected=false', keepsDetailAt(30 * DAY))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0003|FaultArchiveCases.test.ets|assert0098|assertFalse|actual|expected=false', keepsDetailAt(200 * DAY))).assertFalse();
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0003|FaultArchiveCases.test.ets|assert0099|assertEqual|actual', tierLabel(RetentionTier.ARCHIVE))).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0003|FaultArchiveCases.test.ets|assert0099|assertEqual|expected', '归档'));
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEPOLICYCASES_0400
     * @tc.name      testArchivePolicyCases0004
     * @tc.desc      Verify plan buckets every record
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchivePolicyCases0004', 0, (): void => {
      configureTestText();
      const now: number = 1700000000000;
      const records: ArchiveRecord[] = [
        record(1, HOUR / 2, now),
        record(2, 2 * DAY, now),
        record(3, 20 * DAY, now),
        record(4, 200 * DAY, now),
        record(5, HOUR / 4, now)
      ];
      const plan: ArchivePlan = planArchive(records, now);
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0004|FaultArchiveCases.test.ets|assert0100|assertEqual|actual', plan.total())).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0004|FaultArchiveCases.test.ets|assert0100|assertEqual|expected', 5));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0004|FaultArchiveCases.test.ets|assert0101|assertEqual|actual', plan.kept())).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0004|FaultArchiveCases.test.ets|assert0101|assertEqual|expected', 4));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0004|FaultArchiveCases.test.ets|assert0102|assertEqual|actual', plan.dropped())).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0004|FaultArchiveCases.test.ets|assert0102|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0004|FaultArchiveCases.test.ets|assert0103|assertEqual|actual', plan.recent.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0004|FaultArchiveCases.test.ets|assert0103|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0004|FaultArchiveCases.test.ets|assert0104|assertEqual|actual', plan.weekly.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0004|FaultArchiveCases.test.ets|assert0104|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0004|FaultArchiveCases.test.ets|assert0105|assertEqual|actual', plan.archive.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0004|FaultArchiveCases.test.ets|assert0105|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0004|FaultArchiveCases.test.ets|assert0106|assertEqual|actual', plan.expired.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0004|FaultArchiveCases.test.ets|assert0106|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0004|FaultArchiveCases.test.ets|assert0107|assertEqual|actual', plan.counts().length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0004|FaultArchiveCases.test.ets|assert0107|assertEqual|expected', 4));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0004|FaultArchiveCases.test.ets|assert0108|assertEqual|actual', plan.counts()[0])).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0004|FaultArchiveCases.test.ets|assert0108|assertEqual|expected', 2));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0004|FaultArchiveCases.test.ets|assert0109|assertEqual|actual', plan.bucketOf(RetentionTier.EXPIRED).length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0004|FaultArchiveCases.test.ets|assert0109|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0004|FaultArchiveCases.test.ets|assert0110|assertTrue|actual|expected=true', plan.text().indexOf('共 5 条') === 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0004|FaultArchiveCases.test.ets|assert0111|assertTrue|actual|expected=true', plan.recent[0].timestamp >= plan.recent[1].timestamp)).assertTrue();
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEPOLICYCASES_0500
     * @tc.name      testArchivePolicyCases0005
     * @tc.desc      Verify compaction decisions cover all outcomes
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchivePolicyCases0005', 0, (): void => {
      configureTestText();
      const expired: CompactionInput = new CompactionInput();
      expired.tier = RetentionTier.EXPIRED;
      expired.count = 3;
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0005|FaultArchiveCases.test.ets|assert0112|assertEqual|actual', decideCompaction(expired))).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0005|FaultArchiveCases.test.ets|assert0112|assertEqual|expected', Compaction.DROP_ALL));
      const archive: CompactionInput = new CompactionInput();
      archive.tier = RetentionTier.ARCHIVE;
      archive.count = 5;
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0005|FaultArchiveCases.test.ets|assert0113|assertEqual|actual', decideCompaction(archive))).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0005|FaultArchiveCases.test.ets|assert0113|assertEqual|expected', Compaction.TRUNCATE_DETAIL));
      const recent: CompactionInput = new CompactionInput();
      recent.tier = RetentionTier.RECENT;
      recent.count = 30;
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0005|FaultArchiveCases.test.ets|assert0114|assertEqual|actual', decideCompaction(recent))).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0005|FaultArchiveCases.test.ets|assert0114|assertEqual|expected', Compaction.DROP_OLDEST));
      const small: CompactionInput = new CompactionInput();
      small.tier = RetentionTier.RECENT;
      small.count = 3;
      small.averageChars = 128;
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0005|FaultArchiveCases.test.ets|assert0115|assertEqual|actual', decideCompaction(small))).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0005|FaultArchiveCases.test.ets|assert0115|assertEqual|expected', Compaction.NONE));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0005|FaultArchiveCases.test.ets|assert0116|assertEqual|actual', compactionLabel(Compaction.TRUNCATE_DETAIL))).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0005|FaultArchiveCases.test.ets|assert0116|assertEqual|expected', '截断错误详情'));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0005|FaultArchiveCases.test.ets|assert0117|assertEqual|actual', compactionLabel(Compaction.DROP_ALL))).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0005|FaultArchiveCases.test.ets|assert0117|assertEqual|expected', '整档清理'));
    });

    /**
     * @tc.number    SUB_STARTUP_ARCHIVEPOLICYCASES_0600
     * @tc.name      testArchivePolicyCases0006
     * @tc.desc      Verify build compaction reports every tier
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testArchivePolicyCases0006', 0, (): void => {
      configureTestText();
      const now: number = 1700000000000;
      const records: ArchiveRecord[] = [
        record(1, HOUR / 2, now),
        record(2, 5 * DAY, now),
        record(3, 40 * DAY, now),
        record(4, 400 * DAY, now)
      ];
      const report = buildCompaction(records, now);
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0006|FaultArchiveCases.test.ets|assert0118|assertEqual|actual', report.plan.total())).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0006|FaultArchiveCases.test.ets|assert0118|assertEqual|expected', 4));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0006|FaultArchiveCases.test.ets|assert0119|assertEqual|actual', report.decisions.length)).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0006|FaultArchiveCases.test.ets|assert0119|assertEqual|expected', 4));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0006|FaultArchiveCases.test.ets|assert0120|assertTrue|actual|expected=true', report.decisions[0].indexOf('近期') === 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0006|FaultArchiveCases.test.ets|assert0121|assertTrue|actual|expected=true', report.decisions[3].indexOf('待清理') === 0)).assertTrue();
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0006|FaultArchiveCases.test.ets|assert0122|assertEqual|actual', report.needConfirm())).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0006|FaultArchiveCases.test.ets|assert0122|assertEqual|expected', 1));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0006|FaultArchiveCases.test.ets|assert0123|assertTrue|actual|expected=true', report.text().indexOf('需要用户确认') > 0)).assertTrue();
      const empty = buildCompaction([], now);
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0006|FaultArchiveCases.test.ets|assert0124|assertEqual|actual', empty.plan.total())).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0006|FaultArchiveCases.test.ets|assert0124|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0006|FaultArchiveCases.test.ets|assert0125|assertEqual|actual', empty.needConfirm())).assertEqual(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0006|FaultArchiveCases.test.ets|assert0125|assertEqual|expected', 0));
      expect(traceParameter('com.samples.appstartupauto_ArchivePolicyCases_0006|FaultArchiveCases.test.ets|assert0126|assertTrue|actual|expected=true', empty.text().indexOf('共 0 条') === 0)).assertTrue();
    });
  });
}
