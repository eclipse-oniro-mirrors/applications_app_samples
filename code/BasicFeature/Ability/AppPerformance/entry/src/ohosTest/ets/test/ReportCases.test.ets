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

import { describe, expect, it } from '@ohos/hypium';
import { ExperimentRecord, ExperimentStage } from '../../../main/ets/core/ExperimentLedger';
import { FLOW_KEYS } from '../../../main/ets/core/FlowMetrics';
import {
  ConditionComparison, ConditionDiff, ConditionFields, ConditionSource, ConditionVerdict,
  SAMPLING_PROTOCOL, compareConditions, compareRecordConditions, conditionVerdictLabel,
  describeCondition, fieldsOfRecord, fingerprintOf, missingFieldsOf
} from '../../../main/ets/core/report/ConditionFingerprint';
import {
  ConditionGroup, ReportFilter, ReportSort, ReportTable, StageTimingRow, conditionGroupKey,
  reportSortLabel
} from '../../../main/ets/core/report/ReportTable';
import {
  CSV_BOM, ExportOutcome, ReportCheck, ReportFormat, ReportMeta, SECTION_CONDITIONS,
  SECTION_GAPS, SECTION_STAGES, SECTION_STATS, SECTION_TIME, buildCsv, buildMarkdown,
  checkReport, exportReport, formatLabel, residualSensitive
} from '../../../main/ets/core/report/ReportExport';

const DIGEST: string = 'abcdef12';
const ENV: string = 'Pixel 8 · SampleOS 14';

function stagesOf(): ExperimentStage[] {
  const values: number[] = [10, 20, 30, 40, 50, 60];
  const stages: ExperimentStage[] = [];
  FLOW_KEYS.forEach((key: string, index: number): void => {
    stages.push(new ExperimentStage(key, `阶段${index}`, '成功', values[index], ''));
  });
  return stages;
}

function skippedStages(): ExperimentStage[] {
  const stages: ExperimentStage[] = [];
  FLOW_KEYS.forEach((key: string): void => {
    stages.push(new ExperimentStage(key, key, '跳过', 0, ''));
  });
  return stages;
}

/** 一条完整、关键字段齐全的对照组记录。 */
function recordOf(id: string, workloadId: string = 'w1', device: string = ENV): ExperimentRecord {
  const record: ExperimentRecord = new ExperimentRecord();
  record.id = id;
  record.workloadId = workloadId;
  record.workloadLabel = '';
  record.mode = 'control';
  record.startedAt = 1000;
  record.endedAt = 1210;
  record.stages = stagesOf();
  record.beforeBytes = 1024;
  record.afterBytes = 1024;
  record.digestBefore = DIGEST;
  record.digestAfter = DIGEST;
  record.integrity = '一致';
  record.condition = JSON.stringify([device, '1.0.0', true]);
  return record;
}

function fieldsOf(device: string = 'Pixel 8'): ConditionFields {
  const fields: ConditionFields = new ConditionFields();
  fields.device = device;
  fields.osVersion = 'SampleOS 14';
  fields.appVersion = '1.0.0';
  fields.workloadId = 'w1';
  fields.mode = 'control';
  fields.assetBytes = 1024;
  fields.assetDigest = DIGEST;
  fields.targetCount = 0;
  fields.targetDigest = 'tg-811c9dc5';
  fields.protocol = SAMPLING_PROTOCOL;
  return fields;
}

export default function reportCasesTest(): void {
  describe('FingerprintBasicsCases', (): void => {
    /**
     * @tc.number    SUB_PERFORMANCE_FINGERPRINTBASICSCASES_0100
     * @tc.name      testFingerprintBasicsCases0001
     * @tc.desc      Verify verdict labels
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testFingerprintBasicsCases0001', 0, (): void => {
      expect(conditionVerdictLabel(ConditionVerdict.SAME)).assertEqual('同条件');
      expect(conditionVerdictLabel(ConditionVerdict.PARTIAL)).assertEqual('部分不同');
      expect(conditionVerdictLabel(ConditionVerdict.INCOMPARABLE)).assertEqual('不可比');
      expect(ConditionVerdict.SAME).assertEqual('same');
    });

    /**
     * @tc.number    SUB_PERFORMANCE_FINGERPRINTBASICSCASES_0200
     * @tc.name      testFingerprintBasicsCases0002
     * @tc.desc      Verify protocol constant
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFingerprintBasicsCases0002', 0, (): void => {
      expect(SAMPLING_PROTOCOL).assertEqual('ledger-v1 · 6 阶段 · 单次运行 · 同资源重读');
      expect(SAMPLING_PROTOCOL.length > 0).assertTrue();
      expect(SAMPLING_PROTOCOL.indexOf('|') < 0).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_FINGERPRINTBASICSCASES_0300
     * @tc.name      testFingerprintBasicsCases0003
     * @tc.desc      Verify mode labels
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testFingerprintBasicsCases0003', 0, (): void => {
      const fields: ConditionFields = new ConditionFields();
      fields.mode = 'files';
      expect(fields.modeLabel()).assertEqual('文件回收');
      fields.mode = 'modules';
      expect(fields.modeLabel()).assertEqual('模块回收');
      fields.mode = 'control';
      expect(fields.modeLabel()).assertEqual('对照组');
      fields.mode = 'unknown';
      expect(fields.modeLabel()).assertEqual('模式未记录');
    });

    /**
     * @tc.number    SUB_PERFORMANCE_FINGERPRINTBASICSCASES_0400
     * @tc.name      testFingerprintBasicsCases0004
     * @tc.desc      Verify field texts
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testFingerprintBasicsCases0004', 0, (): void => {
      const fields: ConditionFields = fieldsOf();
      expect(fields.assetText()).assertEqual('1024 字节 / 摘要 abcdef12');
      expect(fields.targetText()).assertEqual('0 项 / 摘要 tg-811c9dc5');
      const empty: ConditionFields = new ConditionFields();
      expect(empty.assetText()).assertEqual('大小未记录 / 摘要 未记录');
      expect(empty.targetText()).assertEqual('个数未记录 / 摘要 未记录');
    });

    /**
     * @tc.number    SUB_PERFORMANCE_FINGERPRINTBASICSCASES_0500
     * @tc.name      testFingerprintBasicsCases0005
     * @tc.desc      Verify source from environment
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFingerprintBasicsCases0005', 0, (): void => {
      const source: ConditionSource = ConditionSource.fromEnvironment('Pixel 8 · SampleOS 14', ' 2.0 ');
      expect(source.device).assertEqual('Pixel 8');
      expect(source.osVersion).assertEqual('SampleOS 14');
      expect(source.appVersion).assertEqual('2.0');
      expect(source.protocol).assertEqual(SAMPLING_PROTOCOL);
      const single: ConditionSource = ConditionSource.fromEnvironment('OnlyModel', '1.0');
      expect(single.device).assertEqual('OnlyModel');
      expect(single.osVersion).assertEqual('');
    });

    /**
     * @tc.number    SUB_PERFORMANCE_FINGERPRINTBASICSCASES_0600
     * @tc.name      testFingerprintBasicsCases0006
     * @tc.desc      Verify source of keeps protocol
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFingerprintBasicsCases0006', 0, (): void => {
      const source: ConditionSource = ConditionSource.of('M', 'O', 'A');
      expect(source.device).assertEqual('M');
      expect(source.osVersion).assertEqual('O');
      expect(source.appVersion).assertEqual('A');
      expect(source.protocol).assertEqual(SAMPLING_PROTOCOL);
      expect(ConditionSource.of('M', 'O', 'A', 'p2').protocol).assertEqual('p2');
    });

    /**
     * @tc.number    SUB_PERFORMANCE_FINGERPRINTBASICSCASES_0700
     * @tc.name      testFingerprintBasicsCases0007
     * @tc.desc      Verify diff text uses full width parens
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testFingerprintBasicsCases0007', 0, (): void => {
      const diff: ConditionDiff = new ConditionDiff('设备型号', 'A', 'B');
      expect(diff.text()).assertEqual('设备型号（A → B）');
      expect(new ConditionDiff().text()).assertEqual('（ → ）');
      expect(diff.label).assertEqual('设备型号');
    });

    /**
     * @tc.number    SUB_PERFORMANCE_FINGERPRINTBASICSCASES_0800
     * @tc.name      testFingerprintBasicsCases0008
     * @tc.desc      Verify comparison text three states
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testFingerprintBasicsCases0008', 0, (): void => {
      const incomparable: ConditionComparison = new ConditionComparison();
      expect(incomparable.text()).assertEqual('不可比：关键字段缺失');
      expect(incomparable.comparable()).assertFalse();
      incomparable.missing = ['左侧缺少设备型号', '右侧缺少系统版本'];
      expect(incomparable.text()).assertEqual('不可比：左侧缺少设备型号；右侧缺少系统版本');
      const same: ConditionComparison = new ConditionComparison(ConditionVerdict.SAME, 'cf-1');
      expect(same.text()).assertEqual('同条件（指纹 cf-1）');
      expect(same.same()).assertTrue();
      const partial: ConditionComparison = new ConditionComparison(ConditionVerdict.PARTIAL, 'cf-2',
        [new ConditionDiff('设备型号', 'A', 'B')]);
      expect(partial.text()).assertEqual('部分不同（指纹 cf-2）：设备型号（A → B）');
      expect(partial.comparable()).assertFalse();
    });
  });

  describe('FingerprintRuleCases', (): void => {
    /**
     * @tc.number    SUB_PERFORMANCE_FINGERPRINTRULECASES_0100
     * @tc.name      testFingerprintRuleCases0001
     * @tc.desc      Verify complete fields have no missing
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFingerprintRuleCases0001', 0, (): void => {
      expect(missingFieldsOf(fieldsOf()).length).assertEqual(0);
      expect(fingerprintOf(fieldsOf()).indexOf('cf-')).assertEqual(0);
      expect(fingerprintOf(fieldsOf()).length).assertEqual(11);
      expect(fingerprintOf(fieldsOf())).assertEqual(fingerprintOf(fieldsOf()));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_FINGERPRINTRULECASES_0200
     * @tc.name      testFingerprintRuleCases0002
     * @tc.desc      Verify each missing field reported
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFingerprintRuleCases0002', 0, (): void => {
      const blank: ConditionFields = new ConditionFields();
      const missing: string[] = missingFieldsOf(blank);
      expect(missing.join(',')).assertEqual('设备型号,系统版本,应用版本,负载标识,回收模式,资源大小,资源摘要,目标集合,采样协议');
      expect(missingFieldsOf(blank).length).assertEqual(9);
      expect(fingerprintOf(blank)).assertEqual('');
      const badDigest: ConditionFields = fieldsOf();
      badDigest.assetDigest = 'XYZ';
      expect(missingFieldsOf(badDigest).join(',')).assertEqual('资源摘要');
      expect(missingFieldsOf(badDigest).length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_FINGERPRINTRULECASES_0300
     * @tc.name      testFingerprintRuleCases0003
     * @tc.desc      Verify zero targets only valid for control
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFingerprintRuleCases0003', 0, (): void => {
      const control: ConditionFields = fieldsOf();
      expect(missingFieldsOf(control).length).assertEqual(0);
      const files: ConditionFields = fieldsOf();
      files.mode = 'files';
      expect(missingFieldsOf(files).join(',')).assertEqual('目标集合');
      files.targetCount = 2;
      files.targetDigest = 'tg-0000';
      expect(missingFieldsOf(files).length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_FINGERPRINTRULECASES_0400
     * @tc.name      testFingerprintRuleCases0004
     * @tc.desc      Verify describe condition full text
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testFingerprintRuleCases0004', 0, (): void => {
      const fields: ConditionFields = fieldsOf();
      fields.foreground = '前台';
      expect(describeCondition(fields))
        .assertEqual('Pixel 8 · SampleOS 14 · APP 1.0.0｜w1 · 对照组｜样本 1024 字节 · 摘要 abcdef12｜' +
          '目标 0 项 · 摘要 tg-811c9dc5｜协议 ledger-v1 · 6 阶段 · 单次运行 · 同资源重读 · 前台');
      expect(describeCondition(new ConditionFields()).indexOf('设备未记录 · 系统未记录 · APP 版本未记录') === 0)
        .assertTrue();
      expect(describeCondition(fields).indexOf('前台') > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_FINGERPRINTRULECASES_0500
     * @tc.name      testFingerprintRuleCases0005
     * @tc.desc      Verify fields of record restores from tuple
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFingerprintRuleCases0005', 0, (): void => {
      const fields: ConditionFields = fieldsOfRecord(recordOf('r1'));
      expect(fields.device).assertEqual('Pixel 8');
      expect(fields.osVersion).assertEqual('SampleOS 14');
      expect(fields.appVersion).assertEqual('1.0.0');
      expect(fields.foreground).assertEqual('前台');
      expect(fields.targetCount).assertEqual(0);
      expect(fields.targetDigest).assertEqual('tg-811c9dc5');
      expect(fields.workloadId).assertEqual('w1');
      expect(missingFieldsOf(fields).length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_FINGERPRINTRULECASES_0600
     * @tc.name      testFingerprintRuleCases0006
     * @tc.desc      Verify source overrides record values
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFingerprintRuleCases0006', 0, (): void => {
      const source: ConditionSource = ConditionSource.of('Forced', 'ForcedOS', '9.9', 'p-x');
      const fields: ConditionFields = fieldsOfRecord(recordOf('r1'), source);
      expect(fields.device).assertEqual('Forced');
      expect(fields.osVersion).assertEqual('ForcedOS');
      expect(fields.appVersion).assertEqual('9.9');
      expect(fields.protocol).assertEqual('p-x');
      expect(fields.workloadId).assertEqual('w1');
    });

    /**
     * @tc.number    SUB_PERFORMANCE_FINGERPRINTRULECASES_0700
     * @tc.name      testFingerprintRuleCases0007
     * @tc.desc      Verify files mode reads target list
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFingerprintRuleCases0007', 0, (): void => {
      const record: ExperimentRecord = recordOf('r2');
      record.mode = 'files';
      record.condition = JSON.stringify([ENV, '1.0.0', false, '', '', [],
        ['mod.b', 'mod.a'], ['b.so', 'a.so', 'a.so']]);
      const fields: ConditionFields = fieldsOfRecord(record);
      expect(fields.targetCount).assertEqual(2);
      expect(fields.foreground).assertEqual('后台');
      expect(fields.scopeDigest.indexOf('sc-')).assertEqual(0);
      expect(fields.targetDigest).assertEqual(fieldsOfRecord(record).targetDigest);
      expect(fields.targetDigest.length).assertEqual(11);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_FINGERPRINTRULECASES_0800
     * @tc.name      testFingerprintRuleCases0008
     * @tc.desc      Verify same conditions compare equal
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFingerprintRuleCases0008', 0, (): void => {
      const comparison: ConditionComparison = compareConditions(fieldsOf(), fieldsOf());
      expect(comparison.verdict).assertEqual(ConditionVerdict.SAME);
      expect(comparison.diffs.length).assertEqual(0);
      expect(comparison.missing.length).assertEqual(0);
      expect(comparison.fingerprint).assertEqual(fingerprintOf(fieldsOf()));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_FINGERPRINTRULECASES_0900
     * @tc.name      testFingerprintRuleCases0009
     * @tc.desc      Verify device difference is partial
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFingerprintRuleCases0009', 0, (): void => {
      const comparison: ConditionComparison =
        compareConditions(fieldsOf(), fieldsOf('Pixel 9 · SampleOS 14'));
      expect(comparison.verdict).assertEqual(ConditionVerdict.PARTIAL);
      expect(comparison.diffs.length).assertEqual(1);
      expect(comparison.diffs[0].label).assertEqual('设备型号');
      expect(comparison.diffs[0].left).assertEqual('Pixel 8');
      expect(comparison.fingerprint.length).assertEqual(11);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_FINGERPRINTRULECASES_1000
     * @tc.name      testFingerprintRuleCases0010
     * @tc.desc      Verify auxiliary foreground diff stays partial
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFingerprintRuleCases0010', 0, (): void => {
      const left: ConditionFields = fieldsOf();
      left.foreground = '前台';
      const right: ConditionFields = fieldsOf();
      right.foreground = '后台';
      const comparison: ConditionComparison = compareConditions(left, right);
      expect(comparison.verdict).assertEqual(ConditionVerdict.PARTIAL);
      expect(comparison.diffs.length).assertEqual(1);
      expect(comparison.diffs[0].label).assertEqual('前后台');
      expect(comparison.fingerprint).assertEqual(fingerprintOf(right));
    });

    /**
     * @tc.number    SUB_PERFORMANCE_FINGERPRINTRULECASES_1100
     * @tc.name      testFingerprintRuleCases0011
     * @tc.desc      Verify missing side is incomparable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFingerprintRuleCases0011', 0, (): void => {
      const comparison: ConditionComparison = compareConditions(new ConditionFields(), fieldsOf());
      expect(comparison.verdict).assertEqual(ConditionVerdict.INCOMPARABLE);
      expect(comparison.fingerprint).assertEqual('');
      expect(comparison.missing.length).assertEqual(9);
      expect(comparison.missing[0]).assertEqual('左侧缺少设备型号');
      expect(comparison.diffs.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_FINGERPRINTRULECASES_1200
     * @tc.name      testFingerprintRuleCases0012
     * @tc.desc      Verify compare record conditions
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testFingerprintRuleCases0012', 0, (): void => {
      const same: ConditionComparison = compareRecordConditions(recordOf('a'), recordOf('b'));
      expect(same.verdict).assertEqual(ConditionVerdict.SAME);
      const other: ConditionComparison =
        compareRecordConditions(recordOf('a'), recordOf('b', 'w1', 'Pixel 9 · SampleOS 14'));
      expect(other.verdict).assertEqual(ConditionVerdict.PARTIAL);
      expect(other.diffs[0].right).assertEqual('Pixel 9');
    });
  });

  describe('ReportTableCases', (): void => {
    /**
     * @tc.number    SUB_PERFORMANCE_REPORTTABLECASES_0100
     * @tc.name      testReportTableCases0001
     * @tc.desc      Verify sort labels
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testReportTableCases0001', 0, (): void => {
      expect(reportSortLabel(ReportSort.SAMPLES)).assertEqual('样本量');
      expect(reportSortLabel(ReportSort.P50)).assertEqual('P50');
      expect(reportSortLabel(ReportSort.P90)).assertEqual('P90');
      expect(reportSortLabel(ReportSort.MEAN)).assertEqual('均值');
      expect(reportSortLabel(ReportSort.FAILED)).assertEqual('失败/缺失数');
      expect(reportSortLabel(ReportSort.WORKLOAD)).assertEqual('负载');
    });

    /**
     * @tc.number    SUB_PERFORMANCE_REPORTTABLECASES_0200
     * @tc.name      testReportTableCases0002
     * @tc.desc      Verify filter matches and text
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testReportTableCases0002', 0, (): void => {
      const table: ReportTable = ReportTable.build([recordOf('r1')]);
      const group: ConditionGroup = table.rows[0];
      expect(new ReportFilter().matches(group)).assertTrue();
      expect(new ReportFilter('w1', 'control', true).matches(group)).assertTrue();
      expect(new ReportFilter('w2').matches(group)).assertFalse();
      expect(new ReportFilter('', 'files').matches(group)).assertFalse();
      expect(new ReportFilter().text()).assertEqual('全部负载｜全部模式｜含不可评估');
      expect(new ReportFilter('w1', 'files', true).text()).assertEqual('w1｜files｜仅可评估');
    });

    /**
     * @tc.number    SUB_PERFORMANCE_REPORTTABLECASES_0300
     * @tc.name      testReportTableCases0003
     * @tc.desc      Verify stage row text
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testReportTableCases0003', 0, (): void => {
      const row: StageTimingRow = new StageTimingRow('scan', '扫描', 3, true, 40, 44);
      expect(row.text()).assertEqual('扫描｜样本 3｜P50 40 ms｜均值 44 ms');
      expect(row.p50Text()).assertEqual('40 ms');
      const missing: StageTimingRow = new StageTimingRow('k', 'K', 0, false);
      expect(missing.text()).assertEqual('K｜样本 0｜P50 不可评估｜均值 不可评估｜不可评估');
      expect(missing.meanText()).assertEqual('不可评估');
    });

    /**
     * @tc.number    SUB_PERFORMANCE_REPORTTABLECASES_0400
     * @tc.name      testReportTableCases0004
     * @tc.desc      Verify group row text
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testReportTableCases0004', 0, (): void => {
      const group: ConditionGroup = new ConditionGroup('条件组1', 'cf-1', 'desc', 'w1', '负载甲', 'files');
      group.samples = 5;
      group.validSamples = 4;
      group.failed = 1;
      group.p50Ms = 210;
      group.p90Ms = 300;
      group.meanMs = 215;
      group.unavailable = '不可比：缺少设备型号';
      expect(group.rowText())
        .assertEqual('条件组1｜负载甲（w1）｜文件回收｜样本 5（有效 4）｜失败/缺失 1｜P50 210 ms｜' +
          'P90 300 ms｜均值 215 ms｜不可比：缺少设备型号');
      const bare: ConditionGroup = new ConditionGroup('条件组2', '', '', 'w2', '', '');
      expect(bare.modeLabel()).assertEqual('模式未记录');
      expect(bare.rowText().indexOf('条件组2｜w2｜模式未记录') === 0).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_REPORTTABLECASES_0500
     * @tc.name      testReportTableCases0005
     * @tc.desc      Verify group key includes five fields
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReportTableCases0005', 0, (): void => {
      const key: string = conditionGroupKey(recordOf('r1'));
      expect(key.indexOf('["w1","control"') === 0).assertTrue();
      expect(key).assertEqual(conditionGroupKey(recordOf('r2')));
      const other: ExperimentRecord = recordOf('r3');
      other.beforeBytes = 2048;
      expect(conditionGroupKey(other) === key).assertFalse();
      expect(key.indexOf('abcdef12') > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_REPORTTABLECASES_0600
     * @tc.name      testReportTableCases0006
     * @tc.desc      Verify build groups by condition key
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReportTableCases0006', 0, (): void => {
      const table: ReportTable = ReportTable.build([
        recordOf('r1'), recordOf('r2'),
        recordOf('r3', 'w1', 'Pixel 9 · SampleOS 14')
      ]);
      expect(table.size()).assertEqual(2);
      expect(table.rows[0].label).assertEqual('条件组1');
      expect(table.rows[1].label).assertEqual('条件组2');
      expect(table.rows[0].samples).assertEqual(2);
      expect(table.rows[0].validSamples).assertEqual(2);
      expect(table.rows[1].samples).assertEqual(1);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_REPORTTABLECASES_0700
     * @tc.name      testReportTableCases0007
     * @tc.desc      Verify evaluable group has stats
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReportTableCases0007', 0, (): void => {
      const table: ReportTable = ReportTable.build([recordOf('r1')]);
      const group: ConditionGroup = table.rows[0];
      expect(group.evaluable).assertTrue();
      expect(group.p50Ms).assertEqual(210);
      expect(group.p90Ms).assertEqual(210);
      expect(group.meanMs).assertEqual(210);
      expect(group.failed).assertEqual(0);
      expect(group.unavailable).assertEqual('');
      expect(group.p50Text()).assertEqual('210 ms');
    });

    /**
     * @tc.number    SUB_PERFORMANCE_REPORTTABLECASES_0800
     * @tc.name      testReportTableCases0008
     * @tc.desc      Verify incomplete records are not evaluable
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReportTableCases0008', 0, (): void => {
      const record: ExperimentRecord = recordOf('r1');
      record.stages = skippedStages();
      record.integrity = '不一致';
      const table: ReportTable = ReportTable.build([record]);
      const group: ConditionGroup = table.rows[0];
      expect(group.validSamples).assertEqual(0);
      expect(group.evaluable).assertFalse();
      expect(group.p50Ms).assertEqual(-1);
      expect(group.meanMs).assertEqual(-1);
      expect(group.p50Text()).assertEqual('不可评估');
      expect(group.gaps.indexOf('无有效样本：P50/P90/均值不可评估（不能用 0 代替）') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_REPORTTABLECASES_0900
     * @tc.name      testReportTableCases0009
     * @tc.desc      Verify stage rows always six
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReportTableCases0009', 0, (): void => {
      const table: ReportTable = ReportTable.build([recordOf('r1')]);
      const rows: StageTimingRow[] = table.rows[0].stageRows;
      expect(rows.length).assertEqual(6);
      expect(rows[0].stageKey).assertEqual('discover');
      expect(rows[0].label).assertEqual('阶段0');
      expect(rows[5].p50Ms).assertEqual(60);
      expect(rows[0].samples).assertEqual(1);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_REPORTTABLECASES_1000
     * @tc.name      testReportTableCases0010
     * @tc.desc      Verify filter and sort return new tables
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReportTableCases0010', 0, (): void => {
      const table: ReportTable = ReportTable.build([
        recordOf('r1'), recordOf('r2', 'w2'), recordOf('r3', 'w3')
      ]);
      expect(table.size()).assertEqual(3);
      const filtered: ReportTable = table.filter(new ReportFilter('w2'));
      expect(filtered.size()).assertEqual(1);
      expect(table.size()).assertEqual(3);
      const sorted: ReportTable = table.sortBy(ReportSort.SAMPLES, true);
      expect(sorted.rows[0].samples).assertEqual(1);
      // 三组样本量相等时按 label 升序兄底，不受 descending 影响。
      expect(sorted.rows[0].workloadId).assertEqual('w1');
      expect(sorted.rows[2].workloadId).assertEqual('w3');
      expect(table.rows[0].workloadId).assertEqual('w1');
    });

    /**
     * @tc.number    SUB_PERFORMANCE_REPORTTABLECASES_1100
     * @tc.name      testReportTableCases0011
     * @tc.desc      Verify unavailable rows sort last
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReportTableCases0011', 0, (): void => {
      const broken: ExperimentRecord = recordOf('r9', 'w9');
      broken.stages = skippedStages();
      broken.integrity = '不一致';
      const table: ReportTable = ReportTable.build([broken, recordOf('r1')]);
      const sorted: ReportTable = table.sortBy(ReportSort.P50, false);
      expect(sorted.rows.length).assertEqual(2);
      expect(sorted.rows[1].workloadId).assertEqual('w9');
      expect(sorted.rows[1].p50Ms).assertEqual(-1);
      const byWorkload: ReportTable = table.sortBy(ReportSort.WORKLOAD, false);
      expect(byWorkload.rows[0].workloadId).assertEqual('w1');
    });

    /**
     * @tc.number    SUB_PERFORMANCE_REPORTTABLECASES_1200
     * @tc.name      testReportTableCases0012
     * @tc.desc      Verify table text
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testReportTableCases0012', 0, (): void => {
      const table: ReportTable = ReportTable.build([recordOf('r1')]);
      const lines: string[] = table.text().split('\n');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('条件组\t负载\t模式\t样本\t有效\t失败/缺失\tP50\tP90\t均值\t可比性');
      expect(lines[1]).assertEqual('条件组1\tw1\t对照组\t1\t1\t0\t210 ms\t210 ms\t210 ms\t可统计');
      expect(ReportTable.build([]).text()).assertEqual('没有条件组：账本为空或全部被当前筛选条件排除');
    });
  });

  describe('ReportExportCases', (): void => {
    /**
     * @tc.number    SUB_PERFORMANCE_REPORTEXPORTCASES_0100
     * @tc.name      testReportExportCases0001
     * @tc.desc      Verify format and sections
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReportExportCases0001', 0, (): void => {
      expect(formatLabel(ReportFormat.CSV)).assertEqual('CSV');
      expect(formatLabel(ReportFormat.MARKDOWN)).assertEqual('Markdown');
      expect(CSV_BOM).assertEqual('\uFEFF');
      expect(SECTION_CONDITIONS).assertEqual('条件描述');
      expect(SECTION_STATS).assertEqual('分组统计');
      expect(SECTION_STAGES).assertEqual('阶段耗时');
      expect(SECTION_GAPS).assertEqual('缺口说明');
      expect(SECTION_TIME).assertEqual('生成时间');
    });

    /**
     * @tc.number    SUB_PERFORMANCE_REPORTEXPORTCASES_0200
     * @tc.name      testReportExportCases0002
     * @tc.desc      Verify check summary
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 3
     */

    it('testReportExportCases0002', 0, (): void => {
      const check: ReportCheck = new ReportCheck();
      expect(check.summary()).assertEqual('');
      check.ok = true;
      expect(check.summary()).assertEqual('必填段落齐全，未发现敏感信息残留');
      check.ok = false;
      check.findings = ['报告标题为空', '缺少分组统计行'];
      expect(check.summary()).assertEqual('报告标题为空；缺少分组统计行');
    });

    /**
     * @tc.number    SUB_PERFORMANCE_REPORTEXPORTCASES_0300
     * @tc.name      testReportExportCases0003
     * @tc.desc      Verify markdown has five sections
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReportExportCases0003', 0, (): void => {
      const meta: ReportMeta = new ReportMeta('报告', 1700000000000);
      const text: string = buildMarkdown(ReportTable.build([recordOf('r1')]), meta);
      expect(text.indexOf('# 报告') === 0).assertTrue();
      expect(text.indexOf('## 1. 条件描述') > 0).assertTrue();
      expect(text.indexOf('## 2. 分组统计') > 0).assertTrue();
      expect(text.indexOf('## 3. 阶段耗时') > 0).assertTrue();
      expect(text.indexOf('## 4. 缺口说明') > 0).assertTrue();
      expect(text.indexOf('## 5. 生成时间') > 0).assertTrue();
      expect(text.indexOf('只有一个条件组，未进行跨组比较。') > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_REPORTEXPORTCASES_0400
     * @tc.name      testReportExportCases0004
     * @tc.desc      Verify markdown compares multiple groups
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReportExportCases0004', 0, (): void => {
      const meta: ReportMeta = new ReportMeta('报告', 1700000000000);
      const table: ReportTable = ReportTable.build([
        recordOf('r1'), recordOf('r2', 'w1', 'Pixel 9 · SampleOS 14')
      ]);
      const text: string = buildMarkdown(table, meta);
      expect(text.indexOf('以 条件组1 为基准，条件组2：') > 0).assertTrue();
      expect(text.indexOf('部分不同（指纹 cf-') > 0).assertTrue();
      expect(text.indexOf('设备型号（Pixel 8 → Pixel 9）') > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_REPORTEXPORTCASES_0500
     * @tc.name      testReportExportCases0005
     * @tc.desc      Verify markdown empty table
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReportExportCases0005', 0, (): void => {
      const text: string = buildMarkdown(ReportTable.build([]), new ReportMeta('空', 1700000000000));
      expect(text.indexOf('- 没有条件组：账本为空或全部被筛选条件排除。') > 0).assertTrue();
      expect(text.indexOf('- 未登记缺口：所有样本正常结束且条件字段齐全。') > 0).assertTrue();
      expect(text.indexOf('- 设备：未记录｜系统：未记录｜应用版本：未记录') > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_REPORTEXPORTCASES_0600
     * @tc.name      testReportExportCases0006
     * @tc.desc      Verify csv structure
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReportExportCases0006', 0, (): void => {
      const text: string = buildCsv(ReportTable.build([recordOf('r1')]),
        new ReportMeta('报告', 1700000000000));
      expect(text.indexOf(CSV_BOM) === 0).assertTrue();
      const lines: string[] = text.split('\n');
      expect(lines[0].indexOf('章节,条件组,项目,值,备注') > 0).assertTrue();
      expect(lines[1].indexOf('报告,全部,生成时间') === 0).assertTrue();
      expect(text.indexOf('报告,全部,报告版本,report-v1,') > 0).assertTrue();
      expect(text.indexOf('条件描述,条件组1,指纹,cf-') > 0).assertTrue();
      expect(text.indexOf('分组统计,条件组1,P50,210 ms,阶段耗时合计') > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_REPORTEXPORTCASES_0700
     * @tc.name      testReportExportCases0007
     * @tc.desc      Verify csv quotes commas
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReportExportCases0007', 0, (): void => {
      const text: string = buildCsv(ReportTable.build([recordOf('r1')]),
        new ReportMeta('报告', 1700000000000, '', '含,逗号与"引号"'));
      expect(text.indexOf('"含,逗号与""引号"""') > 0).assertTrue();
      expect(text.split('\n').length > 10).assertTrue();
      expect(text.indexOf('报告') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_REPORTEXPORTCASES_0800
     * @tc.name      testReportExportCases0008
     * @tc.desc      Verify residual sensitive detection
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReportExportCases0008', 0, (): void => {
      expect(residualSensitive('干净文本').length).assertEqual(0);
      expect(residualSensitive('C:\\temp\\a.txt')[0]).assertEqual('疑似文件路径');
      expect(residualSensitive('token=abc123')[0]).assertEqual('疑似凭据或序列号字段');
      expect(residualSensitive('138001380001234567')[0]).assertEqual('疑似长数字序列（可能是序列号）');
      expect(residualSensitive('/data/app/x/Y.png')[0]).assertEqual('疑似文件路径');
    });

    /**
     * @tc.number    SUB_PERFORMANCE_REPORTEXPORTCASES_0900
     * @tc.name      testReportExportCases0009
     * @tc.desc      Verify path is redacted in report
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReportExportCases0009', 0, (): void => {
      const meta: ReportMeta = new ReportMeta('报告', 1700000000000, '', 'C:\\secret\\a.txt');
      const text: string = buildMarkdown(ReportTable.build([recordOf('r1')]), meta);
      expect(text.indexOf('secret') < 0).assertTrue();
      expect(text.indexOf('[路径已脱敏]') > 0).assertTrue();
      expect(residualSensitive(text).join('|')).assertEqual('');
    });

    /**
     * @tc.number    SUB_PERFORMANCE_REPORTEXPORTCASES_1000
     * @tc.name      testReportExportCases0010
     * @tc.desc      Verify check rejects empty inputs
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReportExportCases0010', 0, (): void => {
      const blankTitle: ReportCheck = checkReport([recordOf('r1')], new ReportMeta(''));
      expect(blankTitle.ok).assertFalse();
      expect(blankTitle.findings[0]).assertEqual('报告标题为空');
      const noRecords: ReportCheck = checkReport([], new ReportMeta('报告'));
      expect(noRecords.ok).assertFalse();
      expect(noRecords.findings.indexOf('没有任何实验记录，无法生成条件描述与分组统计') >= 0).assertTrue();
      expect(checkReport([recordOf('r1')], new ReportMeta('报告')).findings.join('|')).assertEqual('');
    });

    /**
     * @tc.number    SUB_PERFORMANCE_REPORTEXPORTCASES_1100
     * @tc.name      testReportExportCases0011
     * @tc.desc      Verify export honours format
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReportExportCases0011', 0, (): void => {
      const meta: ReportMeta = new ReportMeta('报告', 1700000000000);
      const markdown: ExportOutcome = exportReport([recordOf('r1')], meta, ReportFormat.MARKDOWN);
      expect(markdown.check.findings.join('|')).assertEqual('');
      expect(markdown.ok).assertTrue();
      expect(markdown.text.indexOf('# 报告') === 0).assertTrue();
      expect(markdown.check.ok).assertTrue();
      const csv: ExportOutcome = exportReport([recordOf('r1')], meta, ReportFormat.CSV);
      expect(csv.ok).assertTrue();
      expect(csv.text.indexOf(CSV_BOM) === 0).assertTrue();
      expect(csv.format).assertEqual(ReportFormat.CSV);
    });

    /**
     * @tc.number    SUB_PERFORMANCE_REPORTEXPORTCASES_1200
     * @tc.name      testReportExportCases0012
     * @tc.desc      Verify export blocks on check failure
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReportExportCases0012', 0, (): void => {
      const outcome: ExportOutcome =
        exportReport([], new ReportMeta('报告'), ReportFormat.MARKDOWN);
      expect(outcome.ok).assertFalse();
      expect(outcome.text).assertEqual('');
      expect(outcome.check.ok).assertFalse();
      expect(outcome.check.summary().indexOf('没有任何实验记录') >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_REPORTEXPORTCASES_1300
     * @tc.name      testReportExportCases0013
     * @tc.desc      Verify long cells are clipped with note
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReportExportCases0013', 0, (): void => {
      const meta: ReportMeta = new ReportMeta('报告', 1700000000000, '', 'x'.repeat(400));
      const text: string = buildMarkdown(ReportTable.build([recordOf('r1')]), meta);
      expect(text.indexOf('…（截断，原 400 字符）') > 0).assertTrue();
      expect(text.indexOf('x'.repeat(201)) < 0).assertTrue();
      expect(text.length > 100).assertTrue();
    });
  });
}
