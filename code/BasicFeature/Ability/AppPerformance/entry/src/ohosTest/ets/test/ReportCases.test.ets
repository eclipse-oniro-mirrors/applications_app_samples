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
import { withTestMessages } from '../support/TestMessageResolver';
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
    stages.push(new ExperimentStage(key, `阶段${index}`, 'success', values[index], ''));
  });
  return stages;
}

function skippedStages(): ExperimentStage[] {
  const stages: ExperimentStage[] = [];
  FLOW_KEYS.forEach((key: string): void => {
    stages.push(new ExperimentStage(key, key, 'skipped', 0, ''));
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
  record.integrity = 'consistent';
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
      expect(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0001 ReportCases.test:100 assertEqual actual', conditionVerdictLabel(ConditionVerdict.SAME))).assertEqual(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0001 ReportCases.test:100 assertEqual expected', '同条件'));
      expect(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0001 ReportCases.test:101 assertEqual actual', conditionVerdictLabel(ConditionVerdict.PARTIAL))).assertEqual(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0001 ReportCases.test:101 assertEqual expected', '部分不同'));
      expect(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0001 ReportCases.test:102 assertEqual actual', conditionVerdictLabel(ConditionVerdict.INCOMPARABLE))).assertEqual(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0001 ReportCases.test:102 assertEqual expected', '不可比'));
      expect(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0001 ReportCases.test:103 assertEqual actual', ConditionVerdict.SAME)).assertEqual(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0001 ReportCases.test:103 assertEqual expected', 'same'));
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
      expect(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0002 ReportCases.test:116 assertEqual actual', SAMPLING_PROTOCOL)).assertEqual(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0002 ReportCases.test:116 assertEqual expected', 'ledger-v1 · 6 阶段 · 单次运行 · 同资源重读'));
      expect(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0002 ReportCases.test:117 assertTrue actual', SAMPLING_PROTOCOL.length > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0002 ReportCases.test:118 assertTrue actual', SAMPLING_PROTOCOL.indexOf('|') < 0)).assertTrue();
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
      expect(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0003 ReportCases.test:133 assertEqual actual', fields.modeLabel())).assertEqual(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0003 ReportCases.test:133 assertEqual expected', '文件回收'));
      fields.mode = 'modules';
      expect(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0003 ReportCases.test:135 assertEqual actual', fields.modeLabel())).assertEqual(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0003 ReportCases.test:135 assertEqual expected', '模块回收'));
      fields.mode = 'control';
      expect(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0003 ReportCases.test:137 assertEqual actual', fields.modeLabel())).assertEqual(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0003 ReportCases.test:137 assertEqual expected', '对照组'));
      fields.mode = 'unknown';
      expect(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0003 ReportCases.test:139 assertEqual actual', fields.modeLabel())).assertEqual(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0003 ReportCases.test:139 assertEqual expected', '模式未记录'));
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
      expect(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0004 ReportCases.test:153 assertEqual actual', fields.assetText())).assertEqual(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0004 ReportCases.test:153 assertEqual expected', '1024 字节 / 摘要 abcdef12'));
      expect(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0004 ReportCases.test:154 assertEqual actual', fields.targetText())).assertEqual(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0004 ReportCases.test:154 assertEqual expected', '0 项 / 摘要 tg-811c9dc5'));
      const empty: ConditionFields = new ConditionFields();
      expect(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0004 ReportCases.test:156 assertEqual actual', empty.assetText())).assertEqual(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0004 ReportCases.test:156 assertEqual expected', '大小未记录 / 摘要 未记录'));
      expect(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0004 ReportCases.test:157 assertEqual actual', empty.targetText())).assertEqual(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0004 ReportCases.test:157 assertEqual expected', '个数未记录 / 摘要 未记录'));
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
      expect(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0005 ReportCases.test:171 assertEqual actual', source.device)).assertEqual(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0005 ReportCases.test:171 assertEqual expected', 'Pixel 8'));
      expect(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0005 ReportCases.test:172 assertEqual actual', source.osVersion)).assertEqual(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0005 ReportCases.test:172 assertEqual expected', 'SampleOS 14'));
      expect(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0005 ReportCases.test:173 assertEqual actual', source.appVersion)).assertEqual(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0005 ReportCases.test:173 assertEqual expected', '2.0'));
      expect(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0005 ReportCases.test:174 assertEqual actual', source.protocol)).assertEqual(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0005 ReportCases.test:174 assertEqual expected', SAMPLING_PROTOCOL));
      const single: ConditionSource = ConditionSource.fromEnvironment('OnlyModel', '1.0');
      expect(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0005 ReportCases.test:176 assertEqual actual', single.device)).assertEqual(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0005 ReportCases.test:176 assertEqual expected', 'OnlyModel'));
      expect(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0005 ReportCases.test:177 assertEqual actual', single.osVersion)).assertEqual(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0005 ReportCases.test:177 assertEqual expected', ''));
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
      expect(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0006 ReportCases.test:191 assertEqual actual', source.device)).assertEqual(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0006 ReportCases.test:191 assertEqual expected', 'M'));
      expect(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0006 ReportCases.test:192 assertEqual actual', source.osVersion)).assertEqual(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0006 ReportCases.test:192 assertEqual expected', 'O'));
      expect(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0006 ReportCases.test:193 assertEqual actual', source.appVersion)).assertEqual(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0006 ReportCases.test:193 assertEqual expected', 'A'));
      expect(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0006 ReportCases.test:194 assertEqual actual', source.protocol)).assertEqual(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0006 ReportCases.test:194 assertEqual expected', SAMPLING_PROTOCOL));
      expect(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0006 ReportCases.test:195 assertEqual actual', ConditionSource.of('M', 'O', 'A', 'p2').protocol)).assertEqual(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0006 ReportCases.test:195 assertEqual expected', 'p2'));
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
      expect(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0007 ReportCases.test:209 assertEqual actual', diff.text())).assertEqual(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0007 ReportCases.test:209 assertEqual expected', '设备型号（A → B）'));
      expect(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0007 ReportCases.test:210 assertEqual actual', new ConditionDiff().text())).assertEqual(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0007 ReportCases.test:210 assertEqual expected', '（ → ）'));
      expect(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0007 ReportCases.test:211 assertEqual actual', diff.label)).assertEqual(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0007 ReportCases.test:211 assertEqual expected', '设备型号'));
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
      expect(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0008 ReportCases.test:225 assertEqual actual', incomparable.text())).assertEqual(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0008 ReportCases.test:225 assertEqual expected', '不可比：关键字段缺失'));
      expect(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0008 ReportCases.test:226 assertFalse actual', incomparable.comparable())).assertFalse();
      incomparable.missing = ['左侧缺少设备型号', '右侧缺少系统版本'];
      expect(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0008 ReportCases.test:228 assertEqual actual', incomparable.text())).assertEqual(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0008 ReportCases.test:228 assertEqual expected', '不可比：左侧缺少设备型号；右侧缺少系统版本'));
      const same: ConditionComparison = new ConditionComparison(ConditionVerdict.SAME, 'cf-1');
      expect(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0008 ReportCases.test:230 assertEqual actual', same.text())).assertEqual(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0008 ReportCases.test:230 assertEqual expected', '同条件（指纹 cf-1）'));
      expect(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0008 ReportCases.test:231 assertTrue actual', same.same())).assertTrue();
      const partial: ConditionComparison = new ConditionComparison(ConditionVerdict.PARTIAL, 'cf-2',
        [new ConditionDiff('设备型号', 'A', 'B')]);
      expect(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0008 ReportCases.test:234 assertEqual actual', partial.text())).assertEqual(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0008 ReportCases.test:234 assertEqual expected', '部分不同（指纹 cf-2）：设备型号（A → B）'));
      expect(traceParameter('com.samples.appperformance_FingerprintBasicsCases_0008 ReportCases.test:235 assertFalse actual', partial.comparable())).assertFalse();
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
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0001 ReportCases.test:250 assertEqual actual', missingFieldsOf(fieldsOf()).length)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0001 ReportCases.test:250 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0001 ReportCases.test:251 assertEqual actual', fingerprintOf(fieldsOf()).indexOf('cf-'))).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0001 ReportCases.test:251 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0001 ReportCases.test:252 assertEqual actual', fingerprintOf(fieldsOf()).length)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0001 ReportCases.test:252 assertEqual expected', 11));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0001 ReportCases.test:253 assertEqual actual', fingerprintOf(fieldsOf()))).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0001 ReportCases.test:253 assertEqual expected', fingerprintOf(fieldsOf())));
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
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0002 ReportCases.test:268 assertEqual actual', missing.join(','))).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0002 ReportCases.test:268 assertEqual expected', '设备型号,系统版本,应用版本,负载标识,回收模式,资源大小,资源摘要,目标集合,采样协议'));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0002 ReportCases.test:269 assertEqual actual', missingFieldsOf(blank).length)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0002 ReportCases.test:269 assertEqual expected', 9));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0002 ReportCases.test:270 assertEqual actual', fingerprintOf(blank))).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0002 ReportCases.test:270 assertEqual expected', ''));
      const badDigest: ConditionFields = fieldsOf();
      badDigest.assetDigest = 'XYZ';
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0002 ReportCases.test:273 assertEqual actual', missingFieldsOf(badDigest).join(','))).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0002 ReportCases.test:273 assertEqual expected', '资源摘要'));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0002 ReportCases.test:274 assertEqual actual', missingFieldsOf(badDigest).length)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0002 ReportCases.test:274 assertEqual expected', 1));
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
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0003 ReportCases.test:288 assertEqual actual', missingFieldsOf(control).length)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0003 ReportCases.test:288 assertEqual expected', 0));
      const files: ConditionFields = fieldsOf();
      files.mode = 'files';
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0003 ReportCases.test:291 assertEqual actual', missingFieldsOf(files).join(','))).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0003 ReportCases.test:291 assertEqual expected', '目标集合'));
      files.targetCount = 2;
      files.targetDigest = 'tg-0000';
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0003 ReportCases.test:294 assertEqual actual', missingFieldsOf(files).length)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0003 ReportCases.test:294 assertEqual expected', 0));
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
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0004 ReportCases.test:309 assertEqual actual', describeCondition(fields)))
        .assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0004 ReportCases.test:309 assertEqual expected', 'Pixel 8 · SampleOS 14 · APP 1.0.0｜w1 · 对照组｜样本 1024 字节 · 摘要 abcdef12｜' +
          '目标 0 项 · 摘要 tg-811c9dc5｜协议 ledger-v1 · 6 阶段 · 单次运行 · 同资源重读 · 前台'));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0004 ReportCases.test:312 assertTrue actual', describeCondition(new ConditionFields()).indexOf('设备未记录 · 系统未记录 · APP 版本未记录') === 0))
        .assertTrue();
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0004 ReportCases.test:314 assertTrue actual', describeCondition(fields).indexOf('前台') > 0)).assertTrue();
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
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0005 ReportCases.test:328 assertEqual actual', fields.device)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0005 ReportCases.test:328 assertEqual expected', 'Pixel 8'));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0005 ReportCases.test:329 assertEqual actual', fields.osVersion)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0005 ReportCases.test:329 assertEqual expected', 'SampleOS 14'));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0005 ReportCases.test:330 assertEqual actual', fields.appVersion)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0005 ReportCases.test:330 assertEqual expected', '1.0.0'));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0005 ReportCases.test:331 assertEqual actual', fields.foreground)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0005 ReportCases.test:331 assertEqual expected', '前台'));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0005 ReportCases.test:332 assertEqual actual', fields.targetCount)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0005 ReportCases.test:332 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0005 ReportCases.test:333 assertEqual actual', fields.targetDigest)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0005 ReportCases.test:333 assertEqual expected', 'tg-811c9dc5'));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0005 ReportCases.test:334 assertEqual actual', fields.workloadId)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0005 ReportCases.test:334 assertEqual expected', 'w1'));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0005 ReportCases.test:335 assertEqual actual', missingFieldsOf(fields).length)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0005 ReportCases.test:335 assertEqual expected', 0));
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
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0006 ReportCases.test:350 assertEqual actual', fields.device)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0006 ReportCases.test:350 assertEqual expected', 'Forced'));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0006 ReportCases.test:351 assertEqual actual', fields.osVersion)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0006 ReportCases.test:351 assertEqual expected', 'ForcedOS'));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0006 ReportCases.test:352 assertEqual actual', fields.appVersion)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0006 ReportCases.test:352 assertEqual expected', '9.9'));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0006 ReportCases.test:353 assertEqual actual', fields.protocol)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0006 ReportCases.test:353 assertEqual expected', 'p-x'));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0006 ReportCases.test:354 assertEqual actual', fields.workloadId)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0006 ReportCases.test:354 assertEqual expected', 'w1'));
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
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0007 ReportCases.test:372 assertEqual actual', fields.targetCount)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0007 ReportCases.test:372 assertEqual expected', 2));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0007 ReportCases.test:373 assertEqual actual', fields.foreground)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0007 ReportCases.test:373 assertEqual expected', '后台'));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0007 ReportCases.test:374 assertEqual actual', fields.scopeDigest.indexOf('sc-'))).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0007 ReportCases.test:374 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0007 ReportCases.test:375 assertEqual actual', fields.targetDigest)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0007 ReportCases.test:375 assertEqual expected', fieldsOfRecord(record).targetDigest));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0007 ReportCases.test:376 assertEqual actual', fields.targetDigest.length)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0007 ReportCases.test:376 assertEqual expected', 11));
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
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0008 ReportCases.test:390 assertEqual actual', comparison.verdict)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0008 ReportCases.test:390 assertEqual expected', ConditionVerdict.SAME));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0008 ReportCases.test:391 assertEqual actual', comparison.diffs.length)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0008 ReportCases.test:391 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0008 ReportCases.test:392 assertEqual actual', comparison.missing.length)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0008 ReportCases.test:392 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0008 ReportCases.test:393 assertEqual actual', comparison.fingerprint)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0008 ReportCases.test:393 assertEqual expected', fingerprintOf(fieldsOf())));
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
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0009 ReportCases.test:408 assertEqual actual', comparison.verdict)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0009 ReportCases.test:408 assertEqual expected', ConditionVerdict.PARTIAL));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0009 ReportCases.test:409 assertEqual actual', comparison.diffs.length)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0009 ReportCases.test:409 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0009 ReportCases.test:410 assertEqual actual', comparison.diffs[0].label)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0009 ReportCases.test:410 assertEqual expected', '设备型号'));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0009 ReportCases.test:411 assertEqual actual', comparison.diffs[0].left)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0009 ReportCases.test:411 assertEqual expected', 'Pixel 8'));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0009 ReportCases.test:412 assertEqual actual', comparison.fingerprint.length)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0009 ReportCases.test:412 assertEqual expected', 11));
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
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0010 ReportCases.test:430 assertEqual actual', comparison.verdict)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0010 ReportCases.test:430 assertEqual expected', ConditionVerdict.PARTIAL));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0010 ReportCases.test:431 assertEqual actual', comparison.diffs.length)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0010 ReportCases.test:431 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0010 ReportCases.test:432 assertEqual actual', comparison.diffs[0].label)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0010 ReportCases.test:432 assertEqual expected', '前后台'));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0010 ReportCases.test:433 assertEqual actual', comparison.fingerprint)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0010 ReportCases.test:433 assertEqual expected', fingerprintOf(right)));
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
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0011 ReportCases.test:447 assertEqual actual', comparison.verdict)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0011 ReportCases.test:447 assertEqual expected', ConditionVerdict.INCOMPARABLE));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0011 ReportCases.test:448 assertEqual actual', comparison.fingerprint)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0011 ReportCases.test:448 assertEqual expected', ''));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0011 ReportCases.test:449 assertEqual actual', comparison.missing.length)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0011 ReportCases.test:449 assertEqual expected', 9));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0011 ReportCases.test:450 assertEqual actual', comparison.missing[0])).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0011 ReportCases.test:450 assertEqual expected', '左侧缺少设备型号'));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0011 ReportCases.test:451 assertEqual actual', comparison.diffs.length)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0011 ReportCases.test:451 assertEqual expected', 0));
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
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0012 ReportCases.test:465 assertEqual actual', same.verdict)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0012 ReportCases.test:465 assertEqual expected', ConditionVerdict.SAME));
      const other: ConditionComparison =
        compareRecordConditions(recordOf('a'), recordOf('b', 'w1', 'Pixel 9 · SampleOS 14'));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0012 ReportCases.test:468 assertEqual actual', other.verdict)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0012 ReportCases.test:468 assertEqual expected', ConditionVerdict.PARTIAL));
      expect(traceParameter('com.samples.appperformance_FingerprintRuleCases_0012 ReportCases.test:469 assertEqual actual', other.diffs[0].right)).assertEqual(traceParameter('com.samples.appperformance_FingerprintRuleCases_0012 ReportCases.test:469 assertEqual expected', 'Pixel 9'));
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
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0001 ReportCases.test:484 assertEqual actual', reportSortLabel(ReportSort.SAMPLES))).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0001 ReportCases.test:484 assertEqual expected', '样本量'));
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0001 ReportCases.test:485 assertEqual actual', reportSortLabel(ReportSort.P50))).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0001 ReportCases.test:485 assertEqual expected', 'P50'));
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0001 ReportCases.test:486 assertEqual actual', reportSortLabel(ReportSort.P90))).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0001 ReportCases.test:486 assertEqual expected', 'P90'));
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0001 ReportCases.test:487 assertEqual actual', reportSortLabel(ReportSort.MEAN))).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0001 ReportCases.test:487 assertEqual expected', '均值'));
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0001 ReportCases.test:488 assertEqual actual', reportSortLabel(ReportSort.FAILED))).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0001 ReportCases.test:488 assertEqual expected', '失败/缺失数'));
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0001 ReportCases.test:489 assertEqual actual', reportSortLabel(ReportSort.WORKLOAD))).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0001 ReportCases.test:489 assertEqual expected', '负载'));
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
      withTestMessages('zh_CN', (): void => {
        const table: ReportTable = ReportTable.build([recordOf('r1')]);
        const group: ConditionGroup = table.rows[0];
        expect(traceParameter('com.samples.appperformance_ReportTableCases_0002 ReportCases.test:504 assertTrue actual', new ReportFilter().matches(group))).assertTrue();
        expect(traceParameter('com.samples.appperformance_ReportTableCases_0002 ReportCases.test:505 assertTrue actual', new ReportFilter('w1', 'control', true).matches(group))).assertTrue();
        expect(traceParameter('com.samples.appperformance_ReportTableCases_0002 ReportCases.test:506 assertFalse actual', new ReportFilter('w2').matches(group))).assertFalse();
        expect(traceParameter('com.samples.appperformance_ReportTableCases_0002 ReportCases.test:507 assertFalse actual', new ReportFilter('', 'files').matches(group))).assertFalse();
        expect(traceParameter('com.samples.appperformance_ReportTableCases_0002 ReportCases.test:508 assertEqual actual', new ReportFilter().text())).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0002 ReportCases.test:508 assertEqual expected', '全部负载｜全部模式｜含不可评估'));
        // text() is a localized display contract; the filter still carries the canonical mode token.
        const files = new ReportFilter('w1', 'files', true);
        const canonical = JSON.stringify([files.workloadId, files.mode, files.evaluableOnly]);
        expect(traceParameter('com.samples.appperformance_ReportTableCases_0002 ReportCases.test:509 assertEqual actual', files.text())).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0002 ReportCases.test:509 assertEqual expected', 'w1｜文件回收｜仅可评估'));
        expect(traceParameter('com.samples.appperformance_ReportTableCases_0002 canonicalMode', files.mode))
          .assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0002 rawMode', 'files'));
        const english = withTestMessages('en', (): string => files.text());
        expect(traceParameter('com.samples.appperformance_ReportTableCases_0002 englishDisplay', english))
          .assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0002 englishExpected', 'w1｜File reclaim｜Evaluable only'));
        expect(traceParameter('com.samples.appperformance_ReportTableCases_0002 nestedScopeRestored', files.text()))
          .assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0002 chineseExpected', 'w1｜文件回收｜仅可评估'));
        expect(traceParameter('com.samples.appperformance_ReportTableCases_0002 canonicalUnchanged',
          JSON.stringify([files.workloadId, files.mode, files.evaluableOnly])))
          .assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0002 originalCanonical', canonical));
      });
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
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0003 ReportCases.test:523 assertEqual actual', row.text())).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0003 ReportCases.test:523 assertEqual expected', '扫描｜样本 3｜P50 40 ms｜均值 44 ms'));
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0003 ReportCases.test:524 assertEqual actual', row.p50Text())).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0003 ReportCases.test:524 assertEqual expected', '40 ms'));
      const missing: StageTimingRow = new StageTimingRow('k', 'K', 0, false);
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0003 ReportCases.test:526 assertEqual actual', missing.text())).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0003 ReportCases.test:526 assertEqual expected', 'K｜样本 0｜P50 不可评估｜均值 不可评估｜不可评估'));
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0003 ReportCases.test:527 assertEqual actual', missing.meanText())).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0003 ReportCases.test:527 assertEqual expected', '不可评估'));
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
      const group: ConditionGroup = new ConditionGroup('condition-group-1', 'cf-1', 'desc',
        'w1', '负载甲', 'files');
      group.samples = 5;
      group.validSamples = 4;
      group.failed = 1;
      group.p50Ms = 210;
      group.p90Ms = 300;
      group.meanMs = 215;
      group.unavailable = '不可比：缺少设备型号';
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0004 ReportCases.test:548 assertEqual actual', group.rowText()))
        .assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0004 ReportCases.test:548 assertEqual expected', '条件组1｜负载甲（w1）｜文件回收｜样本 5（有效 4）｜失败/缺失 1｜P50 210 ms｜' +
          'P90 300 ms｜均值 215 ms｜不可比：缺少设备型号'));
      const bare: ConditionGroup = new ConditionGroup('condition-group-2', '', '', 'w2', '', '');
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0004 ReportCases.test:552 assertEqual actual', bare.modeLabel())).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0004 ReportCases.test:552 assertEqual expected', '模式未记录'));
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0004 ReportCases.test:553 assertTrue actual', bare.rowText().indexOf('条件组2｜w2｜模式未记录') === 0)).assertTrue();
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
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0005 ReportCases.test:567 assertTrue actual', key.indexOf('["w1","control"') === 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0005 ReportCases.test:568 assertEqual actual', key)).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0005 ReportCases.test:568 assertEqual expected', conditionGroupKey(recordOf('r2'))));
      const other: ExperimentRecord = recordOf('r3');
      other.beforeBytes = 2048;
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0005 ReportCases.test:571 assertFalse actual', conditionGroupKey(other) === key)).assertFalse();
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0005 ReportCases.test:572 assertTrue actual', key.indexOf('abcdef12') > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_PERFORMANCE_REPORTTABLECASES_0600
     * @tc.name      testReportTableCases0006
     * @tc.desc      Verify condition grouping and locale-independent group codes
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */

    it('testReportTableCases0006', 0, (): void => {
      const table: ReportTable = withTestMessages('en', (): ReportTable => ReportTable.build([
        recordOf('r1'), recordOf('r2'),
        recordOf('r3', 'w1', 'Pixel 9 · SampleOS 14')
      ]));
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0006 ReportCases.test:589 assertEqual actual', table.size())).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0006 ReportCases.test:589 assertEqual expected', 2));
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0006 ' +
        'ReportCases.test:590 assertEqual actual', table.rows[0].label))
        .assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0006 ' +
          'ReportCases.test:590 assertEqual expected', 'condition-group-1'));
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0006 ' +
        'ReportCases.test:591 assertEqual actual', table.rows[1].label))
        .assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0006 ' +
          'ReportCases.test:591 assertEqual expected', 'condition-group-2'));
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0006 ReportCases.test:592 assertEqual actual', table.rows[0].samples)).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0006 ReportCases.test:592 assertEqual expected', 2));
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0006 ReportCases.test:593 assertEqual actual', table.rows[0].validSamples)).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0006 ReportCases.test:593 assertEqual expected', 2));
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0006 ReportCases.test:594 assertEqual actual', table.rows[1].samples)).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0006 ReportCases.test:594 assertEqual expected', 1));
      const languages: string[] = ['en', 'zh_CN', 'en'];
      languages.forEach((language: string): void => {
        withTestMessages(language, (): void => {
          const expected: string = language === 'zh_CN' ? '条件组1' : 'Condition group 1';
          expect(traceParameter('com.samples.appperformance_ReportTableCases_0006 localizedLabel',
            table.rows[0].labelText()))
            .assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0006 expectedLabel', expected));
          expect(traceParameter('com.samples.appperformance_ReportTableCases_0006 localizedRow',
            table.rows[0].rowText().startsWith(expected + '｜'))).assertTrue();
          expect(traceParameter('com.samples.appperformance_ReportTableCases_0006 localizedTable',
            table.text().split('\n')[1].startsWith(expected + '\t'))).assertTrue();
          expect(traceParameter('com.samples.appperformance_ReportTableCases_0006 codeAfterSwitch',
            table.rows[0].label))
            .assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0006 expectedCode',
              'condition-group-1'));
        });
      });
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
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0007 ReportCases.test:609 assertTrue actual', group.evaluable)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0007 ReportCases.test:610 assertEqual actual', group.p50Ms)).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0007 ReportCases.test:610 assertEqual expected', 210));
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0007 ReportCases.test:611 assertEqual actual', group.p90Ms)).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0007 ReportCases.test:611 assertEqual expected', 210));
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0007 ReportCases.test:612 assertEqual actual', group.meanMs)).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0007 ReportCases.test:612 assertEqual expected', 210));
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0007 ReportCases.test:613 assertEqual actual', group.failed)).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0007 ReportCases.test:613 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0007 ReportCases.test:614 assertEqual actual', group.unavailable)).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0007 ReportCases.test:614 assertEqual expected', ''));
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0007 ReportCases.test:615 assertEqual actual', group.p50Text())).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0007 ReportCases.test:615 assertEqual expected', '210 ms'));
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
      record.integrity = 'inconsistent';
      const table: ReportTable = ReportTable.build([record]);
      const group: ConditionGroup = table.rows[0];
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0008 ReportCases.test:633 assertEqual actual', group.validSamples)).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0008 ReportCases.test:633 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0008 ReportCases.test:634 assertFalse actual', group.evaluable)).assertFalse();
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0008 ReportCases.test:635 assertEqual actual', group.p50Ms)).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0008 ReportCases.test:635 assertEqual expected', -1));
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0008 ReportCases.test:636 assertEqual actual', group.meanMs)).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0008 ReportCases.test:636 assertEqual expected', -1));
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0008 ReportCases.test:637 assertEqual actual', group.p50Text())).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0008 ReportCases.test:637 assertEqual expected', '不可评估'));
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0008 ReportCases.test:638 assertTrue actual', group.gaps.indexOf('无有效样本：P50/P90/均值不可评估（不能用 0 代替）') >= 0)).assertTrue();
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
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0009 ReportCases.test:653 assertEqual actual', rows.length)).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0009 ReportCases.test:653 assertEqual expected', 6));
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0009 ReportCases.test:654 assertEqual actual', rows[0].stageKey)).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0009 ReportCases.test:654 assertEqual expected', 'discover'));
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0009 ReportCases.test:655 assertEqual actual', rows[0].label)).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0009 ReportCases.test:655 assertEqual expected', '阶段0'));
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0009 ReportCases.test:656 assertEqual actual', rows[5].p50Ms)).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0009 ReportCases.test:656 assertEqual expected', 60));
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0009 ReportCases.test:657 assertEqual actual', rows[0].samples)).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0009 ReportCases.test:657 assertEqual expected', 1));
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
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0010 ReportCases.test:673 assertEqual actual', table.size())).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0010 ReportCases.test:673 assertEqual expected', 3));
      const filtered: ReportTable = table.filter(new ReportFilter('w2'));
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0010 ReportCases.test:675 assertEqual actual', filtered.size())).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0010 ReportCases.test:675 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0010 ReportCases.test:676 assertEqual actual', table.size())).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0010 ReportCases.test:676 assertEqual expected', 3));
      const sorted: ReportTable = table.sortBy(ReportSort.SAMPLES, true);
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0010 ReportCases.test:678 assertEqual actual', sorted.rows[0].samples)).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0010 ReportCases.test:678 assertEqual expected', 1));
      // 三组样本量相等时按 label 升序兄底，不受 descending 影响。
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0010 ReportCases.test:680 assertEqual actual', sorted.rows[0].workloadId)).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0010 ReportCases.test:680 assertEqual expected', 'w1'));
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0010 ReportCases.test:681 assertEqual actual', sorted.rows[2].workloadId)).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0010 ReportCases.test:681 assertEqual expected', 'w3'));
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0010 ReportCases.test:682 assertEqual actual', table.rows[0].workloadId)).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0010 ReportCases.test:682 assertEqual expected', 'w1'));
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
      broken.integrity = 'inconsistent';
      const table: ReportTable = ReportTable.build([broken, recordOf('r1')]);
      const sorted: ReportTable = table.sortBy(ReportSort.P50, false);
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0011 ReportCases.test:700 assertEqual actual', sorted.rows.length)).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0011 ReportCases.test:700 assertEqual expected', 2));
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0011 ReportCases.test:701 assertEqual actual', sorted.rows[1].workloadId)).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0011 ReportCases.test:701 assertEqual expected', 'w9'));
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0011 ReportCases.test:702 assertEqual actual', sorted.rows[1].p50Ms)).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0011 ReportCases.test:702 assertEqual expected', -1));
      const byWorkload: ReportTable = table.sortBy(ReportSort.WORKLOAD, false);
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0011 ReportCases.test:704 assertEqual actual', byWorkload.rows[0].workloadId)).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0011 ReportCases.test:704 assertEqual expected', 'w1'));
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
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0012 ReportCases.test:719 assertEqual actual', lines.length)).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0012 ReportCases.test:719 assertEqual expected', 2));
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0012 ReportCases.test:720 assertEqual actual', lines[0])).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0012 ReportCases.test:720 assertEqual expected', '条件组\t负载\t模式\t样本\t有效\t失败/缺失\tP50\tP90\t均值\t可比性'));
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0012 ReportCases.test:721 assertEqual actual', lines[1])).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0012 ReportCases.test:721 assertEqual expected', '条件组1\tw1\t对照组\t1\t1\t0\t210 ms\t210 ms\t210 ms\t可统计'));
      expect(traceParameter('com.samples.appperformance_ReportTableCases_0012 ReportCases.test:722 assertEqual actual', ReportTable.build([]).text())).assertEqual(traceParameter('com.samples.appperformance_ReportTableCases_0012 ReportCases.test:722 assertEqual expected', '没有条件组：账本为空或全部被当前筛选条件排除'));
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
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0001 ReportCases.test:737 assertEqual actual', formatLabel(ReportFormat.CSV))).assertEqual(traceParameter('com.samples.appperformance_ReportExportCases_0001 ReportCases.test:737 assertEqual expected', 'CSV'));
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0001 ReportCases.test:738 assertEqual actual', formatLabel(ReportFormat.MARKDOWN))).assertEqual(traceParameter('com.samples.appperformance_ReportExportCases_0001 ReportCases.test:738 assertEqual expected', 'Markdown'));
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0001 ReportCases.test:739 assertEqual actual', CSV_BOM)).assertEqual(traceParameter('com.samples.appperformance_ReportExportCases_0001 ReportCases.test:739 assertEqual expected', '\uFEFF'));
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0001 ReportCases.test:740 assertEqual actual', SECTION_CONDITIONS)).assertEqual(traceParameter('com.samples.appperformance_ReportExportCases_0001 ReportCases.test:740 assertEqual expected', 'conditions'));
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0001 ReportCases.test:741 assertEqual actual', SECTION_STATS)).assertEqual(traceParameter('com.samples.appperformance_ReportExportCases_0001 ReportCases.test:741 assertEqual expected', 'statistics'));
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0001 ReportCases.test:742 assertEqual actual', SECTION_STAGES)).assertEqual(traceParameter('com.samples.appperformance_ReportExportCases_0001 ReportCases.test:742 assertEqual expected', 'stages'));
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0001 ReportCases.test:743 assertEqual actual', SECTION_GAPS)).assertEqual(traceParameter('com.samples.appperformance_ReportExportCases_0001 ReportCases.test:743 assertEqual expected', 'gaps'));
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0001 ReportCases.test:744 assertEqual actual', SECTION_TIME)).assertEqual(traceParameter('com.samples.appperformance_ReportExportCases_0001 ReportCases.test:744 assertEqual expected', 'generated_at'));
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
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0002 ReportCases.test:758 assertEqual actual', check.summary())).assertEqual(traceParameter('com.samples.appperformance_ReportExportCases_0002 ReportCases.test:758 assertEqual expected', ''));
      check.ok = true;
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0002 ReportCases.test:760 assertEqual actual', check.summary())).assertEqual(traceParameter('com.samples.appperformance_ReportExportCases_0002 ReportCases.test:760 assertEqual expected', '必填段落齐全，未发现敏感信息残留'));
      check.ok = false;
      check.findings = ['报告标题为空', '缺少分组统计行'];
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0002 ReportCases.test:763 assertEqual actual', check.summary())).assertEqual(traceParameter('com.samples.appperformance_ReportExportCases_0002 ReportCases.test:763 assertEqual expected', '报告标题为空；缺少分组统计行'));
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
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0003 ReportCases.test:778 assertTrue actual', text.indexOf('# 报告') === 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0003 ReportCases.test:779 assertTrue actual', text.indexOf('## 1. 条件描述') > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0003 ReportCases.test:780 assertTrue actual', text.indexOf('## 2. 分组统计') > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0003 ReportCases.test:781 assertTrue actual', text.indexOf('## 3. 阶段耗时') > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0003 ReportCases.test:782 assertTrue actual', text.indexOf('## 4. 缺口说明') > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0003 ReportCases.test:783 assertTrue actual', text.indexOf('## 5. 生成时间') > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0003 ReportCases.test:784 assertTrue actual', text.indexOf('只有一个条件组，未进行跨组比较。') > 0)).assertTrue();
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
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0004 ReportCases.test:802 assertTrue actual', text.indexOf('以 条件组1 为基准，条件组2：') > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0004 ReportCases.test:803 assertTrue actual', text.indexOf('部分不同（指纹 cf-') > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0004 ReportCases.test:804 assertTrue actual', text.indexOf('设备型号（Pixel 8 → Pixel 9）') > 0)).assertTrue();
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
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0005 ReportCases.test:818 assertTrue actual', text.indexOf('- 没有条件组：账本为空或全部被筛选条件排除。') > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0005 ReportCases.test:819 assertTrue actual', text.indexOf('- 未登记缺口：所有样本正常结束且条件字段齐全。') > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0005 ReportCases.test:820 assertTrue actual', text.indexOf('- 设备：未记录｜系统：未记录｜应用版本：未记录') > 0)).assertTrue();
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
      withTestMessages('zh_CN', (): void => {
        const record = recordOf('r1');
        const canonical = JSON.stringify(record);
        const expectedFingerprint = fingerprintOf(fieldsOfRecord(record));
        const text: string = buildCsv(ReportTable.build([record]), new ReportMeta('报告', 1700000000000));
        expect(traceParameter('com.samples.appperformance_ReportExportCases_0006 ReportCases.test:835 assertTrue actual', text.indexOf(CSV_BOM) === 0)).assertTrue();
        const lines: string[] = text.split('\n');
        expect(traceParameter('com.samples.appperformance_ReportExportCases_0006 ReportCases.test:837 assertTrue actual', lines[0].indexOf('章节,条件组,项目,值,备注') > 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_ReportExportCases_0006 ReportCases.test:838 assertTrue actual', lines[1].indexOf('报告,全部,生成时间') === 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_ReportExportCases_0006 ReportCases.test:839 assertTrue actual', text.indexOf('报告,全部,报告版本,report-v1,') > 0)).assertTrue();
        // The item label is localized; its raw fingerprint and the five-column schema are not.
        expect(traceParameter('com.samples.appperformance_ReportExportCases_0006 ReportCases.test:840 assertTrue actual', text.indexOf('条件描述,条件组1,条件指纹,cf-') > 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_ReportExportCases_0006 ReportCases.test:841 assertTrue actual', text.indexOf('分组统计,条件组1,P50,210 ms,阶段耗时合计') > 0)).assertTrue();
        const fingerprintRow = lines.find((line: string): boolean => line.startsWith('条件描述,条件组1,条件指纹,'));
        if (fingerprintRow === undefined) { throw new Error('Expected the named fingerprint CSV row'); }
        // This fixed fixture row contains no comma/quote/newline payload cells.
        const cells: string[] = fingerprintRow.split(',');
        expect(traceParameter('com.samples.appperformance_ReportExportCases_0006 exactColumns', cells.length))
          .assertEqual(traceParameter('com.samples.appperformance_ReportExportCases_0006 expectedColumns', 5));
        expect(traceParameter('com.samples.appperformance_ReportExportCases_0006 exactFingerprint', cells[3]))
          .assertEqual(traceParameter('com.samples.appperformance_ReportExportCases_0006 rawFingerprint', expectedFingerprint));
        expect(traceParameter('com.samples.appperformance_ReportExportCases_0006 nonemptyFingerprint',
          expectedFingerprint.startsWith('cf-'))).assertTrue();
        expect(traceParameter('com.samples.appperformance_ReportExportCases_0006 rawMode', record.mode))
          .assertEqual(traceParameter('com.samples.appperformance_ReportExportCases_0006 expectedMode', 'control'));
        expect(traceParameter('com.samples.appperformance_ReportExportCases_0006 canonicalRecord', JSON.stringify(record)))
          .assertEqual(traceParameter('com.samples.appperformance_ReportExportCases_0006 originalRecord', canonical));
      });
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
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0007 ReportCases.test:856 assertTrue actual', text.indexOf('"含,逗号与""引号"""') > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0007 ReportCases.test:857 assertTrue actual', text.split('\n').length > 10)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0007 ReportCases.test:858 assertTrue actual', text.indexOf('报告') >= 0)).assertTrue();
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
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0008 ReportCases.test:871 assertEqual actual', residualSensitive('干净文本').length)).assertEqual(traceParameter('com.samples.appperformance_ReportExportCases_0008 ReportCases.test:871 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0008 ReportCases.test:872 assertEqual actual', residualSensitive('C:\\temp\\a.txt')[0])).assertEqual(traceParameter('com.samples.appperformance_ReportExportCases_0008 ReportCases.test:872 assertEqual expected', '疑似文件路径'));
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0008 ReportCases.test:873 assertEqual actual', residualSensitive('token=abc123')[0])).assertEqual(traceParameter('com.samples.appperformance_ReportExportCases_0008 ReportCases.test:873 assertEqual expected', '疑似凭据或序列号字段'));
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0008 ReportCases.test:874 assertEqual actual', residualSensitive('138001380001234567')[0])).assertEqual(traceParameter('com.samples.appperformance_ReportExportCases_0008 ReportCases.test:874 assertEqual expected', '疑似长数字序列（可能是序列号）'));
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0008 ReportCases.test:875 assertEqual actual', residualSensitive('/data/app/x/Y.png')[0])).assertEqual(traceParameter('com.samples.appperformance_ReportExportCases_0008 ReportCases.test:875 assertEqual expected', '疑似文件路径'));
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
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0009 ReportCases.test:890 assertTrue actual', text.indexOf('secret') < 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0009 ReportCases.test:891 assertTrue actual', text.indexOf('[路径已脱敏]') > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0009 ReportCases.test:892 assertEqual actual', residualSensitive(text).join('|'))).assertEqual(traceParameter('com.samples.appperformance_ReportExportCases_0009 ReportCases.test:892 assertEqual expected', ''));
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
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0010 ReportCases.test:906 assertFalse actual', blankTitle.ok)).assertFalse();
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0010 ReportCases.test:907 assertEqual actual', blankTitle.findings[0])).assertEqual(traceParameter('com.samples.appperformance_ReportExportCases_0010 ReportCases.test:907 assertEqual expected', '报告标题为空'));
      const noRecords: ReportCheck = checkReport([], new ReportMeta('报告'));
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0010 ReportCases.test:909 assertFalse actual', noRecords.ok)).assertFalse();
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0010 ReportCases.test:910 assertTrue actual', noRecords.findings.indexOf('没有任何实验记录，无法生成条件描述与分组统计') >= 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0010 ReportCases.test:911 assertEqual actual', checkReport([recordOf('r1')], new ReportMeta('报告')).findings.join('|'))).assertEqual(traceParameter('com.samples.appperformance_ReportExportCases_0010 ReportCases.test:911 assertEqual expected', ''));
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
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0011 ReportCases.test:926 assertEqual actual', markdown.check.findings.join('|'))).assertEqual(traceParameter('com.samples.appperformance_ReportExportCases_0011 ReportCases.test:926 assertEqual expected', ''));
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0011 ReportCases.test:927 assertTrue actual', markdown.ok)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0011 ReportCases.test:928 assertTrue actual', markdown.text.indexOf('# 报告') === 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0011 ReportCases.test:929 assertTrue actual', markdown.check.ok)).assertTrue();
      const csv: ExportOutcome = exportReport([recordOf('r1')], meta, ReportFormat.CSV);
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0011 ReportCases.test:931 assertTrue actual', csv.ok)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0011 ReportCases.test:932 assertTrue actual', csv.text.indexOf(CSV_BOM) === 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0011 ReportCases.test:933 assertEqual actual', csv.format)).assertEqual(traceParameter('com.samples.appperformance_ReportExportCases_0011 ReportCases.test:933 assertEqual expected', ReportFormat.CSV));
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
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0012 ReportCases.test:948 assertFalse actual', outcome.ok)).assertFalse();
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0012 ReportCases.test:949 assertEqual actual', outcome.text)).assertEqual(traceParameter('com.samples.appperformance_ReportExportCases_0012 ReportCases.test:949 assertEqual expected', ''));
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0012 ReportCases.test:950 assertFalse actual', outcome.check.ok)).assertFalse();
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0012 ReportCases.test:951 assertTrue actual', outcome.check.summary().indexOf('没有任何实验记录') >= 0)).assertTrue();
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
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0013 ReportCases.test:966 assertTrue actual', text.indexOf('…（截断，原 400 字符）') > 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0013 ReportCases.test:967 assertTrue actual', text.indexOf('x'.repeat(201)) < 0)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ReportExportCases_0013 ReportCases.test:968 assertTrue actual', text.length > 100)).assertTrue();
    });
  });
}
