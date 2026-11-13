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
  ExperimentRecord, ExperimentStage, compareRecords, latestPairOf
} from '../../../main/ets/core/ExperimentLedger';
import { ReportFilter, ReportSort, ReportTable } from '../../../main/ets/core/report/ReportTable';
import { waveRecord } from '../support/PerformanceWaveOneFixtures';

function groupedRecord(id: string, workload: string, elapsed: number): ExperimentRecord {
  const record = waveRecord(id, elapsed);
  record.workloadId = workload;
  return record;
}

function orderOf(table: ReportTable): string {
  return table.rows.map((row): string => row.workloadId).join('|');
}

export default function performanceGroupingWaveOneTests(): void {
  describe('PerformanceGroupingWaveOne', (): void => {
    /**
     * @tc.number SUB_PERFORMANCE_GROUPINGWAVEONE_0100
     * @tc.name testPerformanceGroupingWaveOne0001
     * @tc.desc 多样本阶段合计参与分位数和均值，失败大耗时与墙钟时长不混入
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceGroupingWaveOne0001', 0, (): void => {
      const failed = waveRecord('failed', 9000); failed.stages[2].status = '失败';
      const table = ReportTable.build([waveRecord('a', 2), waveRecord('b', 5),
        waveRecord('c', 9), waveRecord('d', 20), failed]);
      const row = table.rows[0];
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0001 PerformanceGroupingWaveOne.test:48 assertEqual actual', row.p50Ms)).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0001 PerformanceGroupingWaveOne.test:48 assertEqual expected', 42));
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0001 PerformanceGroupingWaveOne.test:49 assertEqual actual', row.p90Ms)).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0001 PerformanceGroupingWaveOne.test:49 assertEqual expected', 120));
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0001 PerformanceGroupingWaveOne.test:50 assertEqual actual', row.meanMs)).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0001 PerformanceGroupingWaveOne.test:50 assertEqual expected', 54));
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0001 PerformanceGroupingWaveOne.test:51 assertEqual actual', row.stageRows[2].p50Ms)).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0001 PerformanceGroupingWaveOne.test:51 assertEqual expected', 7));
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0001 PerformanceGroupingWaveOne.test:52 assertEqual actual', row.stageRows[2].meanMs)).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0001 PerformanceGroupingWaveOne.test:52 assertEqual expected', 9));
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0001 PerformanceGroupingWaveOne.test:53 assertEqual actual', row.failed)).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0001 PerformanceGroupingWaveOne.test:53 assertEqual expected', 1));
    });

    /**
     * @tc.number SUB_PERFORMANCE_GROUPINGWAVEONE_0200
     * @tc.name testPerformanceGroupingWaveOne0002
     * @tc.desc 回收模式和读取前摘要分别拆组，不混合各组统计
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceGroupingWaveOne0002', 0, (): void => {
      const file = waveRecord('file', 6); file.mode = 'files';
      const changedContent = waveRecord('changed', 9); changedContent.digestBefore = '12345678';
      const table = ReportTable.build([waveRecord('first', 1), file, changedContent, waveRecord('last', 3)]);
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0002 PerformanceGroupingWaveOne.test:68 assertEqual actual', table.rows.map((row): number => row.samples).join('|'))).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0002 PerformanceGroupingWaveOne.test:68 assertEqual expected', '2|1|1'));
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0002 PerformanceGroupingWaveOne.test:69 assertEqual actual', table.rows.map((row): number => row.p50Ms).join('|'))).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0002 PerformanceGroupingWaveOne.test:69 assertEqual expected', '12|36|54'));
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0002 PerformanceGroupingWaveOne.test:70 assertEqual actual', table.rows[1].modeLabel())).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0002 PerformanceGroupingWaveOne.test:70 assertEqual expected', '文件回收'));
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0002 PerformanceGroupingWaveOne.test:71 assertEqual actual', table.rows[2].fields.assetDigest)).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0002 PerformanceGroupingWaveOne.test:71 assertEqual expected', '12345678'));
    });

    /**
     * @tc.number SUB_PERFORMANCE_GROUPINGWAVEONE_0300
     * @tc.name testPerformanceGroupingWaveOne0003
     * @tc.desc 缺口去空白和去重但保留来源，失败记录不进入有效耗时
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceGroupingWaveOne0003', 0, (): void => {
      const ok = waveRecord('ok'); ok.missing = ['  驻留页未观测 ', '', '驻留页未观测'];
      const bad = waveRecord('bad', 10000); bad.integrity = '不一致';
      bad.missing = ['驻留页未观测', ' 系统事件缺失 '];
      const row = ReportTable.build([ok, bad]).rows[0];
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0003 PerformanceGroupingWaveOne.test:87 assertEqual actual', row.gaps.join('|'))).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0003 PerformanceGroupingWaveOne.test:87 assertEqual expected', '驻留页未观测|系统事件缺失|1 条记录未正常结束或缺条件，不计入 P50/P90/均值'));
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0003 PerformanceGroupingWaveOne.test:88 assertEqual actual', row.meanMs)).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0003 PerformanceGroupingWaveOne.test:88 assertEqual expected', 60));
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0003 PerformanceGroupingWaveOne.test:89 assertEqual actual', row.validSamples)).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0003 PerformanceGroupingWaveOne.test:89 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0003 PerformanceGroupingWaveOne.test:90 assertEqual actual', row.failed)).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0003 PerformanceGroupingWaveOne.test:90 assertEqual expected', 1));
    });

    /**
     * @tc.number SUB_PERFORMANCE_GROUPINGWAVEONE_0400
     * @tc.name testPerformanceGroupingWaveOne0004
     * @tc.desc 阶段按key汇总，标签取首个非空值且全空时使用key
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceGroupingWaveOne0004', 0, (): void => {
      const first = waveRecord('first', 3);
      const second = waveRecord('second', 7);
      first.stages.forEach((stage: ExperimentStage): void => { stage.label = ''; });
      second.stages.forEach((stage: ExperimentStage): void => { stage.label = ''; });
      second.stages[0].label = '第二次发现目标';
      first.stages.reverse();
      const rows = ReportTable.build([first, second]).rows[0].stageRows;
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0004 PerformanceGroupingWaveOne.test:109 assertEqual actual', rows[0].label)).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0004 PerformanceGroupingWaveOne.test:109 assertEqual expected', '第二次发现目标'));
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0004 PerformanceGroupingWaveOne.test:110 assertEqual actual', rows[5].label)).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0004 PerformanceGroupingWaveOne.test:110 assertEqual expected', 'configAgain'));
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0004 PerformanceGroupingWaveOne.test:111 assertEqual actual', rows[0].p50Ms)).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0004 PerformanceGroupingWaveOne.test:111 assertEqual expected', 5));
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0004 PerformanceGroupingWaveOne.test:112 assertEqual actual', rows[5].samples)).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0004 PerformanceGroupingWaveOne.test:112 assertEqual expected', 2));
    });

    /**
     * @tc.number SUB_PERFORMANCE_GROUPINGWAVEONE_0500
     * @tc.name testPerformanceGroupingWaveOne0005
     * @tc.desc 三种耗时排序使用各自统计量，降序也把不可评估组放最后
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceGroupingWaveOne0005', 0, (): void => {
      const missing = groupedRecord('missing', 'W-FORM', 1000); missing.integrity = '不一致';
      const table = ReportTable.build([
        groupedRecord('a1', 'W-TEXT', 1), groupedRecord('a2', 'W-TEXT', 1), groupedRecord('a3', 'W-TEXT', 100),
        groupedRecord('b1', 'W-NOTES', 50), groupedRecord('b2', 'W-NOTES', 50), groupedRecord('b3', 'W-NOTES', 50),
        groupedRecord('c1', 'W-IMAGES', 30), groupedRecord('c2', 'W-IMAGES', 30),
        groupedRecord('c3', 'W-IMAGES', 30), missing
      ]);
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0005 PerformanceGroupingWaveOne.test:131 assertEqual actual', orderOf(table.sortBy(ReportSort.P50, true)))).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0005 PerformanceGroupingWaveOne.test:131 assertEqual expected', 'W-NOTES|W-IMAGES|W-TEXT|W-FORM'));
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0005 PerformanceGroupingWaveOne.test:132 assertEqual actual', orderOf(table.sortBy(ReportSort.P90, true)))).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0005 PerformanceGroupingWaveOne.test:132 assertEqual expected', 'W-TEXT|W-NOTES|W-IMAGES|W-FORM'));
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0005 PerformanceGroupingWaveOne.test:133 assertEqual actual', orderOf(table.sortBy(ReportSort.MEAN, true)))).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0005 PerformanceGroupingWaveOne.test:133 assertEqual expected', 'W-NOTES|W-TEXT|W-IMAGES|W-FORM'));
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0005 PerformanceGroupingWaveOne.test:134 assertEqual actual', table.rows[3].stageRows[0].meanMs)).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0005 PerformanceGroupingWaveOne.test:134 assertEqual expected', -1));
    });

    /**
     * @tc.number SUB_PERFORMANCE_GROUPINGWAVEONE_0600
     * @tc.name testPerformanceGroupingWaveOne0006
     * @tc.desc 样本量与失败数独立排序，相等样本量稳定按组标签兜底且不改源表
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceGroupingWaveOne0006', 0, (): void => {
      const a2 = groupedRecord('a2', 'W-TEXT', 1); a2.integrity = '不一致';
      const a3 = groupedRecord('a3', 'W-TEXT', 1); a3.stages[0].status = '失败';
      const b4 = groupedRecord('b4', 'W-NOTES', 1); b4.stages[0].status = '跳过';
      const table = ReportTable.build([
        groupedRecord('a1', 'W-TEXT', 1), a2, a3,
        groupedRecord('b1', 'W-NOTES', 1), groupedRecord('b2', 'W-NOTES', 1), groupedRecord('b3', 'W-NOTES', 1), b4,
        groupedRecord('c1', 'W-IMAGES', 1), groupedRecord('c2', 'W-IMAGES', 1), groupedRecord('c3', 'W-IMAGES', 1)
      ]);
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0006 PerformanceGroupingWaveOne.test:154 assertEqual actual', orderOf(table.sortBy(ReportSort.SAMPLES, true)))).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0006 PerformanceGroupingWaveOne.test:154 assertEqual expected', 'W-NOTES|W-TEXT|W-IMAGES'));
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0006 PerformanceGroupingWaveOne.test:155 assertEqual actual', orderOf(table.sortBy(ReportSort.FAILED)))).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0006 PerformanceGroupingWaveOne.test:155 assertEqual expected', 'W-IMAGES|W-NOTES|W-TEXT'));
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0006 PerformanceGroupingWaveOne.test:156 assertEqual actual', orderOf(table))).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0006 PerformanceGroupingWaveOne.test:156 assertEqual expected', 'W-TEXT|W-NOTES|W-IMAGES'));
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0006 PerformanceGroupingWaveOne.test:157 assertEqual actual', table.sortBy(ReportSort.FAILED, true).rows[0].failed)).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0006 PerformanceGroupingWaveOne.test:157 assertEqual expected', 2));
    });

    /**
     * @tc.number SUB_PERFORMANCE_GROUPINGWAVEONE_0700
     * @tc.name testPerformanceGroupingWaveOne0007
     * @tc.desc 负载、模式与可评估性组合筛选只保留匹配条件组
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceGroupingWaveOne0007', 0, (): void => {
      const file = waveRecord('file'); file.mode = 'files';
      const failedFile = waveRecord('failed-file'); failedFile.mode = 'files';
      failedFile.condition = ''; failedFile.stages[2].status = '失败';
      const other = groupedRecord('other', 'W-NOTES', 10); other.mode = 'files';
      const table = ReportTable.build([waveRecord('control'), file, failedFile, other]);
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0007 PerformanceGroupingWaveOne.test:174 assertEqual actual', table.filter(new ReportFilter('W-TEXT', 'files', true)).size())).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0007 PerformanceGroupingWaveOne.test:174 assertEqual expected', 1));
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0007 PerformanceGroupingWaveOne.test:175 assertEqual actual', table.filter(new ReportFilter('W-TEXT', 'files', false)).size())).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0007 PerformanceGroupingWaveOne.test:175 assertEqual expected', 2));
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0007 PerformanceGroupingWaveOne.test:176 assertEqual actual', orderOf(table.filter(new ReportFilter('', 'files', true))))).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0007 PerformanceGroupingWaveOne.test:176 assertEqual expected', 'W-TEXT|W-NOTES'));
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0007 PerformanceGroupingWaveOne.test:177 assertEqual actual', table.filter(new ReportFilter('W-NOTES', 'control', false)).size())).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0007 PerformanceGroupingWaveOne.test:177 assertEqual expected', 0));
    });

    /**
     * @tc.number SUB_PERFORMANCE_GROUPINGWAVEONE_0800
     * @tc.name testPerformanceGroupingWaveOne0008
     * @tc.desc 最近两条比较跨过模式、资源和条件不匹配的中间记录
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceGroupingWaveOne0008', 0, (): void => {
      const latest = waveRecord('latest'); latest.endedAt = latest.startedAt + 180;
      const otherMode = waveRecord('other-mode'); otherMode.mode = 'files';
      const otherAsset = waveRecord('other-asset'); otherAsset.asset = 'other.txt';
      const otherCondition = waveRecord('other-condition'); otherCondition.condition += ' ';
      const previous = waveRecord('previous'); previous.endedAt = previous.startedAt + 60;
      const comparison = latestPairOf([latest, otherMode, otherAsset, otherCondition, previous,
        waveRecord('older')], 'W-TEXT');
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0008 PerformanceGroupingWaveOne.test:196 assertEqual actual', comparison.before)).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0008 PerformanceGroupingWaveOne.test:196 assertEqual expected', 'previous'));
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0008 PerformanceGroupingWaveOne.test:197 assertEqual actual', comparison.after)).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0008 PerformanceGroupingWaveOne.test:197 assertEqual expected', 'latest'));
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0008 PerformanceGroupingWaveOne.test:198 assertEqual actual', comparison.deltaDurationMs)).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0008 PerformanceGroupingWaveOne.test:198 assertEqual expected', 120));
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0008 PerformanceGroupingWaveOne.test:199 assertTrue actual', comparison.sameContent)).assertTrue();
    });

    /**
     * @tc.number SUB_PERFORMANCE_GROUPINGWAVEONE_0900
     * @tc.name testPerformanceGroupingWaveOne0009
     * @tc.desc 无记录与只有一条同条件记录分别说明原因，不拿其他负载补齐对照
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceGroupingWaveOne0009', 0, (): void => {
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0009 PerformanceGroupingWaveOne.test:211 assertEqual actual', latestPairOf([], 'W-TEXT').reasons.join('|'))).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0009 PerformanceGroupingWaveOne.test:211 assertEqual expected', '该负载还没有记录'));
      const different = waveRecord('different'); different.asset = 'other.txt';
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0009 PerformanceGroupingWaveOne.test:213 assertEqual actual', latestPairOf([waveRecord('one'), different], 'W-TEXT').reasons.join('|'))).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0009 PerformanceGroupingWaveOne.test:213 assertEqual expected', '该负载只有一条记录'));
      const anotherWorkload = groupedRecord('other', 'W-NOTES', 1);
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0009 PerformanceGroupingWaveOne.test:215 assertEqual actual', latestPairOf([anotherWorkload], 'W-TEXT').reasons.join('|'))).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0009 PerformanceGroupingWaveOne.test:215 assertEqual expected', '该负载还没有记录'));
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0009 PerformanceGroupingWaveOne.test:216 assertFalse actual', latestPairOf([waveRecord('one'), anotherWorkload], 'W-TEXT').comparable)).assertFalse();
    });

    /**
     * @tc.number SUB_PERFORMANCE_GROUPINGWAVEONE_1000
     * @tc.name testPerformanceGroupingWaveOne0010
     * @tc.desc 不可比时累积所有独立原因，不发布字节与耗时差量
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceGroupingWaveOne0010', 0, (): void => {
      const left = waveRecord('left');
      const right = groupedRecord('right', 'W-NOTES', 10);
      right.condition = ''; right.beforeBytes++; right.digestBefore = '12345678';
      right.stages[2].status = '失败'; right.afterBytes += 500; right.endedAt += 900;
      const comparison = compareRecords(left, right);
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0010 PerformanceGroupingWaveOne.test:233 assertEqual actual', comparison.reasons.join('|'))).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0010 PerformanceGroupingWaveOne.test:233 assertEqual expected', '负载不同|采样条件不同或旧记录缺少条件|样本大小不同|样本内容不同|有记录未正常结束'));
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0010 PerformanceGroupingWaveOne.test:234 assertEqual actual', comparison.deltaBytes)).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0010 PerformanceGroupingWaveOne.test:234 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0010 PerformanceGroupingWaveOne.test:235 assertEqual actual', comparison.deltaDurationMs)).assertEqual(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0010 PerformanceGroupingWaveOne.test:235 assertEqual expected', 0));
      expect(traceParameter('com.samples.appperformance_PerformanceGroupingWaveOne_0010 PerformanceGroupingWaveOne.test:236 assertFalse actual', comparison.comparable)).assertFalse();
    });
  });
}
