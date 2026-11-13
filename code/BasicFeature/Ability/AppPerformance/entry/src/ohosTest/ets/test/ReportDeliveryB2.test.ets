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
import { AppService } from '../../../main/ets/core/AppService';
import { CallRecord, LaunchSample } from '../../../main/ets/core/Types';
import { ExperimentRecord, ExperimentStage } from '../../../main/ets/core/ExperimentLedger';
import { FLOW_KEYS } from '../../../main/ets/core/FlowMetrics';
import { CONTENT_LOAD_GROUPS, allStats, evaluateBudgets } from '../../../main/ets/core/LaunchBudget';
import { FakePlatform, MemoryStore } from '../support/FakePlatform';
import { CopyPlatform, flushCoverageMicrotasks } from '../support/CoveragePlatform';

/** Storage envelope is input data; decoding/filtering/exporting remains production code. */
class StoredPerfB2 {
  public schema: number = 2;
  public nextId: number = 1;
  public snapFlag: string = '';
  public snapAt: number = 0;
  public rebuildAt: number = 0;
  public logs: CallRecord[] = [];
  public launches: LaunchSample[] = [];
  public experiments: ExperimentRecord[] = [];
}

function reportRecordB2(id: string, workload: string, mode: string, complete: boolean): ExperimentRecord {
  const record = new ExperimentRecord();
  record.id = id;
  record.workloadId = workload;
  record.workloadLabel = `${workload}-${mode}`;
  record.mode = mode;
  record.startedAt = 1700000000000;
  record.endedAt = 1700000000060;
  record.beforeBytes = 32;
  record.afterBytes = 32;
  record.digestBefore = 'abcd1234';
  record.digestAfter = 'abcd1234';
  record.integrity = complete ? '一致' : '不一致';
  record.condition = JSON.stringify(['fixture-board · fixture-os', '1.0.fixture', true]);
  record.stages = FLOW_KEYS.map((key: string): ExperimentStage =>
    new ExperimentStage(key, key, !complete && key === 'reread' ? '失败' : '成功', 10, ''));
  return record;
}

function seedReportsB2(platform: FakePlatform, records: ExperimentRecord[]): AppService {
  const stored = new StoredPerfB2();
  stored.experiments = records;
  platform.store.value = JSON.stringify(stored);
  return AppService.fromPlatform(platform);
}

function copyLogB2(service: AppService): CallRecord {
  const log = service.getState().logs.find((item: CallRecord): boolean => item.api === 'setData');
  if (log === undefined) { throw new Error('Missing production clipboard call'); }
  return log;
}

function measuredLaunchB2(flag: string, duration: number): LaunchSample[] {
  const store = new MemoryStore();
  const stored = new StoredPerfB2();
  stored.snapFlag = flag;
  stored.snapAt = flag.length > 0 ? 1700000000000 : 0;
  store.value = JSON.stringify(stored);
  const platform = new FakePlatform(store);
  const service = AppService.fromPlatform(platform);
  try {
    platform.advance(duration);
    service.markContentLoaded();
    return service.getState().launches;
  } finally { service.dispose(); }
}

export default function reportDeliveryB2Tests(): void {
  describe('ReportDeliveryB2', (): void => {
    /**
     * @tc.number SUB_PERFORMANCE_REPORTDELIVERYB2_0100
     * @tc.name testReportDeliveryBatchTwo0001
     * @tc.desc 报告仅包含当前负载与模式，不改变账本
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReportDeliveryBatchTwo0001', 0, async (): Promise<void> => {
      const platform = new FakePlatform();
      const service = seedReportsB2(platform, [reportRecordB2('a', 'W-TEXT', 'control', true),
        reportRecordB2('b', 'W-NOTES', 'control', true), reportRecordB2('c', 'W-TEXT', 'files', true)]);
      try {
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0001 ReportDeliveryB2.test:99 assertTrue actual', await service.copyAnalysisReport('W-TEXT', 'control', false))).assertTrue();
        const text = platform.copiedTexts[0];
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0001 ReportDeliveryB2.test:101 assertEqual actual', text.indexOf('W-NOTES'))).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0001 ReportDeliveryB2.test:101 assertEqual expected', -1));
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0001 ReportDeliveryB2.test:102 assertEqual actual', text.indexOf('W-TEXT-files'))).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0001 ReportDeliveryB2.test:102 assertEqual expected', -1));
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0001 ReportDeliveryB2.test:103 assertTrue actual', text.indexOf('记录：1 条') >= 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0001 ReportDeliveryB2.test:104 assertEqual actual', service.ledgerRecords().length)).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0001 ReportDeliveryB2.test:104 assertEqual expected', 3));
      } finally { service.dispose(); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_REPORTDELIVERYB2_0200
     * @tc.name testReportDeliveryBatchTwo0002
     * @tc.desc 仅失败筛选排除完整记录但保留失败事实与原账本
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReportDeliveryBatchTwo0002', 0, async (): Promise<void> => {
      const platform = new FakePlatform();
      const service = seedReportsB2(platform, [reportRecordB2('ok', 'W-TEXT', 'control', true),
        reportRecordB2('bad', 'W-TEXT', 'control', false)]);
      try {
        await service.copyAnalysisReport('W-TEXT', 'control', true);
        const text = platform.copiedTexts[0];
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0002 ReportDeliveryB2.test:123 assertTrue actual', text.indexOf('记录：1 条') >= 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0002 ReportDeliveryB2.test:124 assertTrue actual', text.indexOf('| 1 | 0 | 1 | 不可评估') >= 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0002 ReportDeliveryB2.test:125 assertTrue actual', text.indexOf('筛选：负载 W-TEXT；模式 对照组；仅失败/缺失记录') >= 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0002 ReportDeliveryB2.test:126 assertEqual actual', service.ledgerRecords().length)).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0002 ReportDeliveryB2.test:126 assertEqual expected', 2));
      } finally { service.dispose(); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_REPORTDELIVERYB2_0300
     * @tc.name testReportDeliveryBatchTwo0003
     * @tc.desc 全部结果保留成功和失败统计并在复制成功后更新提示
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReportDeliveryBatchTwo0003', 0, async (): Promise<void> => {
      const platform = new FakePlatform();
      const service = seedReportsB2(platform, [reportRecordB2('ok', 'W-TEXT', 'control', true),
        reportRecordB2('bad', 'W-TEXT', 'control', false)]);
      try {
        await service.copyAnalysisReport('W-TEXT', 'control', false);
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0003 ReportDeliveryB2.test:144 assertTrue actual', platform.copiedTexts[0].indexOf('记录：2 条') >= 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0003 ReportDeliveryB2.test:145 assertTrue actual', platform.copiedTexts[0].indexOf('| 2 | 1 | 1 |') >= 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0003 ReportDeliveryB2.test:146 assertEqual actual', service.getState().notice)).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0003 ReportDeliveryB2.test:146 assertEqual expected', '已复制分析报告（Markdown）'));
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0003 ReportDeliveryB2.test:147 assertEqual actual', copyLogB2(service).kind)).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0003 ReportDeliveryB2.test:147 assertEqual expected', 'success'));
      } finally { service.dispose(); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_REPORTDELIVERYB2_0400
     * @tc.name testReportDeliveryBatchTwo0004
     * @tc.desc 空筛选结果不覆盖剪贴板，只展示报告未生成的原因
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReportDeliveryBatchTwo0004', 0, async (): Promise<void> => {
      const platform = new FakePlatform();
      const service = seedReportsB2(platform, [reportRecordB2('a', 'W-NOTES', 'files', true)]);
      try {
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0004 ReportDeliveryB2.test:163 assertFalse actual', await service.copyAnalysisReport('W-TEXT', 'control', true))).assertFalse();
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0004 ReportDeliveryB2.test:164 assertEqual actual', platform.copiedTexts.length)).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0004 ReportDeliveryB2.test:164 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0004 ReportDeliveryB2.test:165 assertTrue actual', service.getState().notice.indexOf('没有任何实验记录') >= 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0004 ReportDeliveryB2.test:166 assertEqual actual', service.ledgerRecords()[0].mode)).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0004 ReportDeliveryB2.test:166 assertEqual expected', 'files'));
      } finally { service.dispose(); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_REPORTDELIVERYB2_0500
     * @tc.name testReportDeliveryBatchTwo0005
     * @tc.desc 无效负载或模式在触碰剪贴板前拒绝
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReportDeliveryBatchTwo0005', 0, async (): Promise<void> => {
      const platform = new FakePlatform();
      const service = seedReportsB2(platform, [reportRecordB2('a', 'W-TEXT', 'control', true)]);
      try {
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0005 ReportDeliveryB2.test:182 assertFalse actual', await service.copyAnalysisReport('not-a-workload', 'control', false))).assertFalse();
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0005 ReportDeliveryB2.test:183 assertFalse actual', await service.copyAnalysisReport('W-TEXT', 'not-a-mode', false))).assertFalse();
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0005 ReportDeliveryB2.test:184 assertEqual actual', platform.copiedTexts.length)).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0005 ReportDeliveryB2.test:184 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0005 ReportDeliveryB2.test:185 assertEqual actual', service.getState().notice)).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0005 ReportDeliveryB2.test:185 assertEqual expected', '报告未生成：负载或模式无效'));
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0005 ReportDeliveryB2.test:186 assertEqual actual', service.ledgerRecords().length)).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0005 ReportDeliveryB2.test:186 assertEqual expected', 1));
      } finally { service.dispose(); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_REPORTDELIVERYB2_0600
     * @tc.name testReportDeliveryBatchTwo0006
     * @tc.desc 剪贴板尚未完成时不得报告复制成功
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReportDeliveryBatchTwo0006', 0, async (): Promise<void> => {
      const platform = new CopyPlatform();
      const service = seedReportsB2(platform, [reportRecordB2('a', 'W-TEXT', 'control', true)]);
      const completed: boolean[] = [];
      try {
        const pending = service.copyAnalysisReport('W-TEXT', 'control', false).then((ok: boolean): void => {
          completed.push(ok);
        });
        await flushCoverageMicrotasks();
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0006 ReportDeliveryB2.test:207 assertEqual actual', completed.length)).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0006 ReportDeliveryB2.test:207 assertEqual expected', 0));
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0006 ReportDeliveryB2.test:208 assertEqual actual', copyLogB2(service).kind)).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0006 ReportDeliveryB2.test:208 assertEqual expected', 'pending'));
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0006 ReportDeliveryB2.test:209 assertFalse actual', service.getState().notice === '已复制分析报告（Markdown）')).assertFalse();
        platform.resolveAt(0);
        await pending;
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0006 ReportDeliveryB2.test:212 assertTrue actual', completed[0])).assertTrue();
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0006 ReportDeliveryB2.test:213 assertEqual actual', service.getState().notice)).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0006 ReportDeliveryB2.test:213 assertEqual expected', '已复制分析报告（Markdown）'));
      } finally { platform.finishAll(); service.dispose(); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_REPORTDELIVERYB2_0700
     * @tc.name testReportDeliveryBatchTwo0007
     * @tc.desc SDK复制拒绝返回失败且保留错误码与原账本
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReportDeliveryBatchTwo0007', 0, async (): Promise<void> => {
      const platform = new FakePlatform();
      platform.copyErrorCode = 12900003;
      const service = seedReportsB2(platform, [reportRecordB2('a', 'W-TEXT', 'control', true)]);
      try {
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0007 ReportDeliveryB2.test:230 assertFalse actual', await service.copyAnalysisReport('W-TEXT', 'control', false))).assertFalse();
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0007 ReportDeliveryB2.test:231 assertEqual actual', copyLogB2(service).code)).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0007 ReportDeliveryB2.test:231 assertEqual expected', 12900003));
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0007 ReportDeliveryB2.test:232 assertEqual actual', service.getState().notice)).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0007 ReportDeliveryB2.test:232 assertEqual expected', '复制失败'));
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0007 ReportDeliveryB2.test:233 assertEqual actual', service.ledgerRecords()[0].id)).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0007 ReportDeliveryB2.test:233 assertEqual expected', 'a'));
      } finally { service.dispose(); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_REPORTDELIVERYB2_0800
     * @tc.name testReportDeliveryBatchTwo0008
     * @tc.desc 在途调用达上限时报告复制不再发起SDK请求
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReportDeliveryBatchTwo0008', 0, async (): Promise<void> => {
      const platform = new CopyPlatform();
      const service = seedReportsB2(platform, [reportRecordB2('a', 'W-TEXT', 'control', true)]);
      const pending: Promise<void>[] = [];
      try {
        for (let index: number = 0; index < 32; index++) { pending.push(service.copyText(`busy-${index}`)); }
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0008 ReportDeliveryB2.test:251 assertFalse actual', await service.copyAnalysisReport('W-TEXT', 'control', false))).assertFalse();
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0008 ReportDeliveryB2.test:252 assertEqual actual', platform.copiedTexts.length)).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0008 ReportDeliveryB2.test:252 assertEqual expected', 32));
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0008 ReportDeliveryB2.test:253 assertEqual actual', copyLogB2(service).kind)).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0008 ReportDeliveryB2.test:253 assertEqual expected', 'blocked'));
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0008 ReportDeliveryB2.test:254 assertEqual actual', service.getState().logs.filter((item: CallRecord): boolean => item.kind === 'pending').length))
          .assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0008 ReportDeliveryB2.test:254 assertEqual expected', 32));
      } finally { platform.finishAll(); await Promise.all(pending); service.dispose(); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_REPORTDELIVERYB2_0900
     * @tc.name testReportDeliveryBatchTwo0009
     * @tc.desc 释放后的报告入口不得再操作剪贴板或创建日志
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReportDeliveryBatchTwo0009', 0, async (): Promise<void> => {
      const platform = new FakePlatform();
      const service = seedReportsB2(platform, [reportRecordB2('a', 'W-TEXT', 'control', true)]);
      service.dispose();
      const logCount = service.getState().logs.length;
      expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0009 ReportDeliveryB2.test:272 assertFalse actual', await service.copyAnalysisReport('W-TEXT', 'control', false))).assertFalse();
      expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0009 ReportDeliveryB2.test:273 assertEqual actual', platform.copiedTexts.length)).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0009 ReportDeliveryB2.test:273 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0009 ReportDeliveryB2.test:274 assertEqual actual', service.getState().logs.length)).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0009 ReportDeliveryB2.test:274 assertEqual expected', logCount));
      expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0009 ReportDeliveryB2.test:275 assertEqual actual', service.ledgerRecords().length)).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0009 ReportDeliveryB2.test:275 assertEqual expected', 1));
    });

    /**
     * @tc.number SUB_PERFORMANCE_REPORTDELIVERYB2_1000
     * @tc.name testReportDeliveryBatchTwo0010
     * @tc.desc 在途报告固定请求时快照，清空账本不回填旧数据
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReportDeliveryBatchTwo0010', 0, async (): Promise<void> => {
      const platform = new CopyPlatform();
      const service = seedReportsB2(platform, [reportRecordB2('a', 'W-TEXT', 'control', true)]);
      try {
        const pending = service.copyAnalysisReport('W-TEXT', 'control', false);
        service.clearLedger();
        platform.resolveAt(0);
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0010 ReportDeliveryB2.test:293 assertTrue actual', await pending)).assertTrue();
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0010 ReportDeliveryB2.test:294 assertTrue actual', platform.copiedTexts[0].indexOf('记录：1 条') >= 0)).assertTrue();
        expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0010 ReportDeliveryB2.test:295 assertEqual actual', service.ledgerRecords().length)).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0010 ReportDeliveryB2.test:295 assertEqual expected', 0));
      } finally { platform.finishAll(); service.dispose(); }
    });

    /**
     * @tc.number SUB_PERFORMANCE_REPORTDELIVERYB2_1100
     * @tc.name testReportDeliveryBatchTwo0011
     * @tc.desc 真实初始配置内容加载样本参与预算而不再显示无样本
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReportDeliveryBatchTwo0011', 0, (): void => {
      const samples = measuredLaunchB2('', 320);
      const report = evaluateBudgets(samples, CONTENT_LOAD_GROUPS);
      expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0011 ReportDeliveryB2.test:310 assertEqual actual', report.measured())).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0011 ReportDeliveryB2.test:310 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0011 ReportDeliveryB2.test:311 assertEqual actual', report.headline())).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0011 ReportDeliveryB2.test:311 assertEqual expected', '全部达标'));
      expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0011 ReportDeliveryB2.test:312 assertEqual actual', allStats(samples, CONTENT_LOAD_GROUPS)[2].p90)).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0011 ReportDeliveryB2.test:312 assertEqual expected', 320));
      expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0011 ReportDeliveryB2.test:313 assertEqual actual', report.results[0].count)).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0011 ReportDeliveryB2.test:313 assertEqual expected', 0));
    });

    /**
     * @tc.number SUB_PERFORMANCE_REPORTDELIVERYB2_1200
     * @tc.name testReportDeliveryBatchTwo0012
     * @tc.desc 启用与禁用配置样本保持各自分组和实测耗时
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReportDeliveryBatchTwo0012', 0, (): void => {
      const samples = measuredLaunchB2('启用', 500).concat(measuredLaunchB2('禁用', 700));
      const report = evaluateBudgets(samples, CONTENT_LOAD_GROUPS);
      expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0012 ReportDeliveryB2.test:327 assertEqual actual', report.measured())).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0012 ReportDeliveryB2.test:327 assertEqual expected', 2));
      expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0012 ReportDeliveryB2.test:328 assertEqual actual', allStats(samples, CONTENT_LOAD_GROUPS)[0].p50)).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0012 ReportDeliveryB2.test:328 assertEqual expected', 500));
      expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0012 ReportDeliveryB2.test:329 assertEqual actual', allStats(samples, CONTENT_LOAD_GROUPS)[1].p90)).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0012 ReportDeliveryB2.test:329 assertEqual expected', 700));
      expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0012 ReportDeliveryB2.test:330 assertEqual actual', report.results[2].count)).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0012 ReportDeliveryB2.test:330 assertEqual expected', 0));
    });

    /**
     * @tc.number SUB_PERFORMANCE_REPORTDELIVERYB2_1300
     * @tc.name testReportDeliveryBatchTwo0013
     * @tc.desc 真实慢样本产生超预算值且不会混为冷启动
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReportDeliveryBatchTwo0013', 0, (): void => {
      const samples = measuredLaunchB2('', 1600);
      const report = evaluateBudgets(samples, CONTENT_LOAD_GROUPS);
      expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0013 ReportDeliveryB2.test:344 assertEqual actual', report.failed())).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0013 ReportDeliveryB2.test:344 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0013 ReportDeliveryB2.test:345 assertEqual actual', report.failures()[0].overshoot())).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0013 ReportDeliveryB2.test:345 assertEqual expected', 100));
      expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0013 ReportDeliveryB2.test:346 assertEqual actual', report.failures()[0].label)).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0013 ReportDeliveryB2.test:346 assertEqual expected', '初始配置·内容加载'));
      expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0013 ReportDeliveryB2.test:347 assertEqual actual', report.results[0].count)).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0013 ReportDeliveryB2.test:347 assertEqual expected', 0));
    });

    /**
     * @tc.number SUB_PERFORMANCE_REPORTDELIVERYB2_1400
     * @tc.name testReportDeliveryBatchTwo0014
     * @tc.desc 阈值等值样本通过，未测配置不计入通过率
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testReportDeliveryBatchTwo0014', 0, (): void => {
      const samples = measuredLaunchB2('禁用', 1500).concat(measuredLaunchB2('启用', 1600));
      const report = evaluateBudgets(samples, CONTENT_LOAD_GROUPS);
      expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0014 ReportDeliveryB2.test:361 assertTrue actual', report.results[1].passed)).assertTrue();
      expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0014 ReportDeliveryB2.test:362 assertEqual actual', report.passRate())).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0014 ReportDeliveryB2.test:362 assertEqual expected', 50));
      expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0014 ReportDeliveryB2.test:363 assertEqual actual', report.failed())).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0014 ReportDeliveryB2.test:363 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0014 ReportDeliveryB2.test:364 assertEqual actual', report.results[2].count)).assertEqual(traceParameter('com.samples.appperformance_ReportDeliveryBatchTwo_0014 ReportDeliveryB2.test:364 assertEqual expected', 0));
    });
  });
}
