import { describe, expect, it } from '@ohos/hypium';
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
      expect(FAULT_CATALOG.length).assertEqual(22);
      expect(faultIds().length).assertEqual(22);
      expect(faultLines().length).assertEqual(22);
      expect(faultDetailLines().length).assertEqual(22);
      const audit = auditFaults();
      expect(audit.findings.length).assertEqual(0);
      expect(audit.ok).assertTrue();
      expect(audit.summary()).assertEqual('故障目录自洽');
      FAULT_CATALOG.forEach((item: FaultEntry): void => {
        expect(item.symptom.length > 0).assertTrue();
        expect(item.trigger.length > 0).assertTrue();
        expect(item.detection.length > 0).assertTrue();
        expect(item.action.length > 0).assertTrue();
        expect(item.text().indexOf(item.faultId) === 0).assertTrue();
        expect(item.detail().indexOf('处置') > 0).assertTrue();
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
      expect(severityLabel(FaultSeverity.BLOCKER)).assertEqual('阻断');
      expect(severityLabel(FaultSeverity.MAJOR)).assertEqual('严重');
      expect(severityLabel(FaultSeverity.MINOR)).assertEqual('轻微');
      expect(severityLabel(FaultSeverity.INFO)).assertEqual('提示');
      expect(severityRank(FaultSeverity.BLOCKER)).assertEqual(3);
      expect(severityRank(FaultSeverity.INFO)).assertEqual(0);
      expect(ownerLabel(FaultOwner.SYSTEM)).assertEqual('系统侧');
      expect(ownerLabel(FaultOwner.ENVIRONMENT)).assertEqual('运行环境');
      expect(layerLabel(CheckLayer.STORAGE)).assertEqual('存储层');
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
      expect(faultsOfOwner(FaultOwner.SYSTEM).length).assertEqual(5);
      expect(faultsOfOwner(FaultOwner.APP).length).assertEqual(15);
      expect(faultsOfOwner(FaultOwner.USER).length).assertEqual(1);
      expect(faultsOfOwner(FaultOwner.ENVIRONMENT).length).assertEqual(1);
      expect(ownerCounts().length).assertEqual(4);
      expect(ownerCounts()[1]).assertEqual(15);
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
      expect(faultsOfLayer(CheckLayer.CAPABILITY).length).assertEqual(3);
      expect(faultsOfLayer(CheckLayer.PERMISSION).length).assertEqual(2);
      expect(faultsOfLayer(CheckLayer.QUERY).length).assertEqual(5);
      expect(faultsOfLayer(CheckLayer.STORAGE).length).assertEqual(4);
      expect(faultsOfLayer(CheckLayer.UI).length).assertEqual(8);
      expect(layerCounts().length).assertEqual(5);
      expect(layerCounts()[4]).assertEqual(8);
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
      const summary = summarizeFaults();
      expect(summary.total).assertEqual(22);
      expect(summary.blockers).assertEqual(2);
      expect(summary.majors).assertEqual(14);
      expect(summary.recoverable).assertEqual(18);
      expect(summary.urgent()).assertTrue();
      expect(summary.text().indexOf('共 22 条') === 0).assertTrue();
      expect(recoverableFaults().length).assertEqual(18);
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
      const critical: FaultEntry[] = criticalFaults();
      expect(critical.length).assertEqual(16);
      expect(critical[0].faultId).assertEqual('FT-04');
      expect(critical[1].faultId).assertEqual('FT-07');
      expect(critical[2].faultId).assertEqual('FT-01');
      expect(critical[critical.length - 1].faultId).assertEqual('FT-22');
      critical.forEach((item: FaultEntry, index: number): void => {
        expect(severityRank(item.severity) >= 2).assertTrue();
        if (index > 0) {
          expect(severityRank(critical[index - 1].severity) >= severityRank(item.severity))
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
      const actions = planActions(['FT-05', 'FT-04', 'FT-01', 'FT-05']);
      expect(actions.length).assertEqual(3);
      expect(actions[0].faultId).assertEqual('FT-04');
      expect(actions[1].faultId).assertEqual('FT-01');
      expect(actions[2].faultId).assertEqual('FT-05');
      expect(actions[0].seq).assertEqual(1);
      expect(actions[0].action.length > 0).assertTrue();
      expect(actions[0].text().indexOf('1.') === 0).assertTrue();
      expect(planActions([]).length).assertEqual(0);
      expect(planActions(['FT-99']).length).assertEqual(0);
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
      const seen: string[] = [];
      faultIds().forEach((faultId: string): void => {
        expect(seen.indexOf(faultId) < 0).assertTrue();
        seen.push(faultId);
        const entry: FaultEntry | undefined = faultOf(faultId);
        expect(entry !== undefined).assertTrue();
        if (entry !== undefined) {
          expect(entry.faultId).assertEqual(faultId);
          expect((entry.owner as string).length > 0).assertTrue();
          expect((entry.layer as string).length > 0).assertTrue();
        }
      });
      expect(faultOf('FT-99')).assertEqual(undefined);
      expect(seen.length).assertEqual(22);
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
      expect(RETENTION_RULES.length).assertEqual(11);
      expect(ruleIds().length).assertEqual(11);
      expect(retentionLines().length).assertEqual(11);
      const audit = auditRetention();
      expect(audit.findings.length).assertEqual(0);
      expect(audit.ok).assertTrue();
      expect(audit.summary()).assertEqual('保留策略自洽');
      expect(ruleOf('RT-11')?.tier).assertEqual(RetentionTier.EXPIRED);
      expect(rulesOfTier(RetentionTier.RECENT).length).assertEqual(3);
      expect(rulesOfTier(RetentionTier.WEEKLY).length).assertEqual(3);
      expect(rulesOfTier(RetentionTier.ARCHIVE).length).assertEqual(4);
      expect(tierLines().length).assertEqual(4);
      RETENTION_RULES.forEach((rule): void => {
        expect(rule.text().indexOf(rule.ruleId) === 0).assertTrue();
        expect(rule.description.length > 0).assertTrue();
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
      const now: number = 1700000000000;
      expect(tierOf(HOUR / 2, now, now - HOUR / 2)).assertEqual(RetentionTier.RECENT);
      expect(tierOf(2 * HOUR, now, now - 2 * HOUR)).assertEqual(RetentionTier.RECENT);
      expect(tierOf(12 * HOUR, now, now - 12 * HOUR)).assertEqual(RetentionTier.RECENT);
      expect(tierOf(2 * DAY, now, now - 2 * DAY)).assertEqual(RetentionTier.WEEKLY);
      expect(tierOf(10 * DAY, now, now - 10 * DAY)).assertEqual(RetentionTier.WEEKLY);
      expect(tierOf(20 * DAY, now, now - 20 * DAY)).assertEqual(RetentionTier.ARCHIVE);
      expect(tierOf(100 * DAY, now, now - 100 * DAY)).assertEqual(RetentionTier.ARCHIVE);
      expect(tierOf(200 * DAY, now, now - 200 * DAY)).assertEqual(RetentionTier.EXPIRED);
      expect(tierOrder(RetentionTier.ARCHIVE) > tierOrder(RetentionTier.WEEKLY)).assertTrue();
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
      expect(limitAt(HOUR / 2)).assertEqual(20);
      expect(limitAt(6 * HOUR)).assertEqual(40);
      expect(limitAt(DAY)).assertEqual(60);
      expect(limitAt(30 * DAY)).assertEqual(150);
      expect(limitAt(200 * DAY)).assertEqual(0);
      expect(exportableAt(DAY)).assertTrue();
      expect(exportableAt(90 * DAY)).assertTrue();
      expect(exportableAt(200 * DAY)).assertFalse();
      expect(keepsDetailAt(DAY)).assertTrue();
      expect(keepsDetailAt(30 * DAY)).assertFalse();
      expect(keepsDetailAt(200 * DAY)).assertFalse();
      expect(tierLabel(RetentionTier.ARCHIVE)).assertEqual('归档');
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
      const now: number = 1700000000000;
      const records: ArchiveRecord[] = [
        record(1, HOUR / 2, now),
        record(2, 2 * DAY, now),
        record(3, 20 * DAY, now),
        record(4, 200 * DAY, now),
        record(5, HOUR / 4, now)
      ];
      const plan: ArchivePlan = planArchive(records, now);
      expect(plan.total()).assertEqual(5);
      expect(plan.kept()).assertEqual(4);
      expect(plan.dropped()).assertEqual(1);
      expect(plan.recent.length).assertEqual(2);
      expect(plan.weekly.length).assertEqual(1);
      expect(plan.archive.length).assertEqual(1);
      expect(plan.expired.length).assertEqual(1);
      expect(plan.counts().length).assertEqual(4);
      expect(plan.counts()[0]).assertEqual(2);
      expect(plan.bucketOf(RetentionTier.EXPIRED).length).assertEqual(1);
      expect(plan.text().indexOf('共 5 条') === 0).assertTrue();
      expect(plan.recent[0].timestamp >= plan.recent[1].timestamp).assertTrue();
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
      const expired: CompactionInput = new CompactionInput();
      expired.tier = RetentionTier.EXPIRED;
      expired.count = 3;
      expect(decideCompaction(expired)).assertEqual(Compaction.DROP_ALL);
      const archive: CompactionInput = new CompactionInput();
      archive.tier = RetentionTier.ARCHIVE;
      archive.count = 5;
      expect(decideCompaction(archive)).assertEqual(Compaction.TRUNCATE_DETAIL);
      const recent: CompactionInput = new CompactionInput();
      recent.tier = RetentionTier.RECENT;
      recent.count = 30;
      expect(decideCompaction(recent)).assertEqual(Compaction.DROP_OLDEST);
      const small: CompactionInput = new CompactionInput();
      small.tier = RetentionTier.RECENT;
      small.count = 3;
      small.averageChars = 128;
      expect(decideCompaction(small)).assertEqual(Compaction.NONE);
      expect(compactionLabel(Compaction.TRUNCATE_DETAIL)).assertEqual('截断错误详情');
      expect(compactionLabel(Compaction.DROP_ALL)).assertEqual('整档清理');
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
      const now: number = 1700000000000;
      const records: ArchiveRecord[] = [
        record(1, HOUR / 2, now),
        record(2, 5 * DAY, now),
        record(3, 40 * DAY, now),
        record(4, 400 * DAY, now)
      ];
      const report = buildCompaction(records, now);
      expect(report.plan.total()).assertEqual(4);
      expect(report.decisions.length).assertEqual(4);
      expect(report.decisions[0].indexOf('近期') === 0).assertTrue();
      expect(report.decisions[3].indexOf('待清理') === 0).assertTrue();
      expect(report.needConfirm()).assertEqual(1);
      expect(report.text().indexOf('需要用户确认') > 0).assertTrue();
      const empty = buildCompaction([], now);
      expect(empty.plan.total()).assertEqual(0);
      expect(empty.needConfirm()).assertEqual(0);
      expect(empty.text().indexOf('共 0 条') === 0).assertTrue();
    });
  });
}
