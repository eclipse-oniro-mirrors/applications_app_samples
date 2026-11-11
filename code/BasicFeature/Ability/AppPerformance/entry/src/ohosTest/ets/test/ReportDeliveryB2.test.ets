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
        expect(await service.copyAnalysisReport('W-TEXT', 'control', false)).assertTrue();
        const text = platform.copiedTexts[0];
        expect(text.indexOf('W-NOTES')).assertEqual(-1);
        expect(text.indexOf('W-TEXT-files')).assertEqual(-1);
        expect(text.indexOf('记录：1 条') >= 0).assertTrue();
        expect(service.ledgerRecords().length).assertEqual(3);
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
        expect(text.indexOf('记录：1 条') >= 0).assertTrue();
        expect(text.indexOf('| 1 | 0 | 1 | 不可评估') >= 0).assertTrue();
        expect(text.indexOf('筛选：负载 W-TEXT；模式 control；仅失败/缺失记录') >= 0).assertTrue();
        expect(service.ledgerRecords().length).assertEqual(2);
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
        expect(platform.copiedTexts[0].indexOf('记录：2 条') >= 0).assertTrue();
        expect(platform.copiedTexts[0].indexOf('| 2 | 1 | 1 |') >= 0).assertTrue();
        expect(service.getState().notice).assertEqual('已复制分析报告（Markdown）');
        expect(copyLogB2(service).kind).assertEqual('success');
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
        expect(await service.copyAnalysisReport('W-TEXT', 'control', true)).assertFalse();
        expect(platform.copiedTexts.length).assertEqual(0);
        expect(service.getState().notice.indexOf('没有任何实验记录') >= 0).assertTrue();
        expect(service.ledgerRecords()[0].mode).assertEqual('files');
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
        expect(await service.copyAnalysisReport('not-a-workload', 'control', false)).assertFalse();
        expect(await service.copyAnalysisReport('W-TEXT', 'not-a-mode', false)).assertFalse();
        expect(platform.copiedTexts.length).assertEqual(0);
        expect(service.getState().notice).assertEqual('报告未生成：负载或模式无效');
        expect(service.ledgerRecords().length).assertEqual(1);
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
        expect(completed.length).assertEqual(0);
        expect(copyLogB2(service).kind).assertEqual('pending');
        expect(service.getState().notice === '已复制分析报告（Markdown）').assertFalse();
        platform.resolveAt(0);
        await pending;
        expect(completed[0]).assertTrue();
        expect(service.getState().notice).assertEqual('已复制分析报告（Markdown）');
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
        expect(await service.copyAnalysisReport('W-TEXT', 'control', false)).assertFalse();
        expect(copyLogB2(service).code).assertEqual(12900003);
        expect(service.getState().notice).assertEqual('复制失败');
        expect(service.ledgerRecords()[0].id).assertEqual('a');
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
        expect(await service.copyAnalysisReport('W-TEXT', 'control', false)).assertFalse();
        expect(platform.copiedTexts.length).assertEqual(32);
        expect(copyLogB2(service).kind).assertEqual('blocked');
        expect(service.getState().logs.filter((item: CallRecord): boolean => item.kind === 'pending').length)
          .assertEqual(32);
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
      expect(await service.copyAnalysisReport('W-TEXT', 'control', false)).assertFalse();
      expect(platform.copiedTexts.length).assertEqual(0);
      expect(service.getState().logs.length).assertEqual(logCount);
      expect(service.ledgerRecords().length).assertEqual(1);
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
        expect(await pending).assertTrue();
        expect(platform.copiedTexts[0].indexOf('记录：1 条') >= 0).assertTrue();
        expect(service.ledgerRecords().length).assertEqual(0);
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
      expect(report.measured()).assertEqual(1);
      expect(report.headline()).assertEqual('全部达标');
      expect(allStats(samples, CONTENT_LOAD_GROUPS)[2].p90).assertEqual(320);
      expect(report.results[0].count).assertEqual(0);
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
      expect(report.measured()).assertEqual(2);
      expect(allStats(samples, CONTENT_LOAD_GROUPS)[0].p50).assertEqual(500);
      expect(allStats(samples, CONTENT_LOAD_GROUPS)[1].p90).assertEqual(700);
      expect(report.results[2].count).assertEqual(0);
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
      expect(report.failed()).assertEqual(1);
      expect(report.failures()[0].overshoot()).assertEqual(100);
      expect(report.failures()[0].label).assertEqual('初始配置·内容加载');
      expect(report.results[0].count).assertEqual(0);
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
      expect(report.results[1].passed).assertTrue();
      expect(report.passRate()).assertEqual(50);
      expect(report.failed()).assertEqual(1);
      expect(report.results[2].count).assertEqual(0);
    });
  });
}
