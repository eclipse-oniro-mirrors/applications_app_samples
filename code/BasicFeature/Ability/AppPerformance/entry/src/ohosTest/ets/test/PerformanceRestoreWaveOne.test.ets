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
import { ExperimentRecord, restoreRecords } from '../../../main/ets/core/ExperimentLedger';
import { waveBag, waveRecord } from '../support/PerformanceWaveOneFixtures';

export default function performanceRestoreWaveOneTests(): void {
  describe('PerformanceRestoreWaveOne', (): void => {
    /**
     * @tc.number SUB_PERFORMANCE_RESTOREWAVEONE_0100
     * @tc.name testPerformanceRestoreWaveOne0001
     * @tc.desc 非数组存储值不被解释为实验记录
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceRestoreWaveOne0001', 0, (): void => {
      expect(restoreRecords(undefined).length).assertEqual(0);
      expect(restoreRecords(JSON.parse('null') as Object).length).assertEqual(0);
      expect(restoreRecords(waveRecord('single-object')).length).assertEqual(0);
      expect(restoreRecords('not-an-array').length).assertEqual(0);
    });

    /**
     * @tc.number SUB_PERFORMANCE_RESTOREWAVEONE_0200
     * @tc.name testPerformanceRestoreWaveOne0002
     * @tc.desc 混合数组跳过坏元素且保序，恢复后的阶段和缺口不共享输入引用
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceRestoreWaveOne0002', 0, (): void => {
      const first = waveRecord('newest');
      first.missing = ['驻留页未观测'];
      const last = waveRecord('oldest');
      const mixed: Object[] = [JSON.parse('null') as Object, first, 7, 'bad', last];
      const restored = restoreRecords(mixed);
      expect(restored.map((record: ExperimentRecord): string => record.id).join('|')).assertEqual('newest|oldest');
      restored[0].stages[0].detail = 'mutated outside';
      restored[0].missing.push('outside gap');
      expect(first.stages[0].detail).assertEqual('');
      expect(first.missing.join('|')).assertEqual('驻留页未观测');
      last.note = 'changed input';
      expect(restored[1].note).assertEqual('');
    });

    /**
     * @tc.number SUB_PERFORMANCE_RESTOREWAVEONE_0300
     * @tc.name testPerformanceRestoreWaveOne0003
     * @tc.desc 记录标识允许160字符但拒绝空标识和超长标识
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceRestoreWaveOne0003', 0, (): void => {
      expect(restoreRecords([waveRecord('x'.repeat(160))]).length).assertEqual(1);
      expect(restoreRecords([waveRecord('')]).length).assertEqual(0);
      expect(restoreRecords([waveRecord('x'.repeat(161))]).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_PERFORMANCE_RESTOREWAVEONE_0400
     * @tc.name testPerformanceRestoreWaveOne0004
     * @tc.desc 负载编码须完整匹配正式存档编码，不能容忍大小写或后缀变体
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceRestoreWaveOne0004', 0, (): void => {
      const unknown = waveRecord('unknown'); unknown.workloadId = 'W-UNKNOWN';
      const lower = waveRecord('lower'); lower.workloadId = 'w-text';
      const suffix = waveRecord('suffix'); suffix.workloadId = 'W-TEXT-extra';
      expect(restoreRecords([unknown]).length).assertEqual(0);
      expect(restoreRecords([lower]).length).assertEqual(0);
      expect(restoreRecords([suffix]).length).assertEqual(0);
      const notes = waveRecord('notes'); notes.workloadId = 'W-NOTES';
      const images = waveRecord('images'); images.workloadId = 'W-IMAGES';
      const form = waveRecord('form'); form.workloadId = 'W-FORM';
      expect(restoreRecords([waveRecord('text'), notes, images, form]).length).assertEqual(4);
    });

    /**
     * @tc.number SUB_PERFORMANCE_RESTOREWAVEONE_0500
     * @tc.name testPerformanceRestoreWaveOne0005
     * @tc.desc 存档模式限制为三种业务值，非字符串按旧格式默认对照组
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceRestoreWaveOne0005', 0, (): void => {
      const files = waveRecord('files'); files.mode = 'files';
      const modules = waveRecord('modules'); modules.mode = 'modules';
      expect(restoreRecords([waveRecord('control'), files, modules]).map((record: ExperimentRecord): string =>
        record.modeLabel()).join('|')).assertEqual('对照组|文件回收|模块回收');
      const invalid = waveRecord('invalid'); invalid.mode = 'FILES';
      expect(restoreRecords([invalid]).length).assertEqual(0);
      const legacy = waveBag(waveRecord('legacy')); legacy['mode'] = 12;
      expect(restoreRecords([legacy])[0].mode).assertEqual('control');
    });

    /**
     * @tc.number SUB_PERFORMANCE_RESTOREWAVEONE_0600
     * @tc.name testPerformanceRestoreWaveOne0006
     * @tc.desc 零起点、倒退结束与非有限结束时间不能恢复
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceRestoreWaveOne0006', 0, (): void => {
      const zero = waveRecord('zero'); zero.startedAt = 0;
      const reversed = waveRecord('reversed'); reversed.endedAt = reversed.startedAt - 1;
      const infinite = waveRecord('infinite'); infinite.endedAt = Number.POSITIVE_INFINITY;
      expect(restoreRecords([zero]).length).assertEqual(0);
      expect(restoreRecords([reversed]).length).assertEqual(0);
      expect(restoreRecords([infinite]).length).assertEqual(0);
      const instant = waveRecord('instant'); instant.endedAt = instant.startedAt;
      expect(restoreRecords([instant])[0].durationMs()).assertEqual(0);
    });

    /**
     * @tc.number SUB_PERFORMANCE_RESTOREWAVEONE_0700
     * @tc.name testPerformanceRestoreWaveOne0007
     * @tc.desc 三十天和未来一分钟端点可恢复，超出一毫秒拒绝且可显式停用时效过滤
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceRestoreWaveOne0007', 0, (): void => {
      const now = 1700000001000;
      const oldest = waveRecord('oldest'); oldest.startedAt = now - 30 * 86400000;
      const future = waveRecord('future'); future.startedAt = now + 60000; future.endedAt = future.startedAt;
      expect(restoreRecords([oldest, future], now).map((record: ExperimentRecord): string =>
        record.id).join('|')).assertEqual('oldest|future');
      oldest.startedAt--;
      expect(restoreRecords([oldest], now).length).assertEqual(0);
      future.startedAt++; future.endedAt++;
      expect(restoreRecords([future], now).length).assertEqual(0);
      expect(restoreRecords([oldest, future]).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_PERFORMANCE_RESTOREWAVEONE_0800
     * @tc.name testPerformanceRestoreWaveOne0008
     * @tc.desc 字节数须为零到一MiB的安全整数，两个采样方向都受约束
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceRestoreWaveOne0008', 0, (): void => {
      const edge = waveRecord('edge'); edge.beforeBytes = 0; edge.afterBytes = 1048576;
      expect(restoreRecords([edge])[0].afterBytes).assertEqual(1048576);
      const negative = waveRecord('negative'); negative.beforeBytes = -1;
      const fractional = waveRecord('fractional'); fractional.afterBytes = 0.5;
      const overflow = waveRecord('overflow'); overflow.beforeBytes = 1048577;
      expect(restoreRecords([negative]).length).assertEqual(0);
      expect(restoreRecords([fractional]).length).assertEqual(0);
      expect(restoreRecords([overflow]).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_PERFORMANCE_RESTOREWAVEONE_0900
     * @tc.name testPerformanceRestoreWaveOne0009
     * @tc.desc 条件、资源名、备注和负载标签分别限制持久化文本大小
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceRestoreWaveOne0009', 0, (): void => {
      const edge = waveRecord('edge');
      edge.condition = 'c'.repeat(8192); edge.asset = 'a'.repeat(255);
      edge.note = 'n'.repeat(2048); edge.workloadLabel = 'l'.repeat(80);
      expect(restoreRecords([edge]).length).assertEqual(1);
      const condition = edge.clone(); condition.condition += 'x';
      const asset = edge.clone(); asset.asset += 'x';
      const note = edge.clone(); note.note += 'x';
      const label = edge.clone(); label.workloadLabel += 'x';
      expect(restoreRecords([condition]).length).assertEqual(0);
      expect(restoreRecords([asset]).length).assertEqual(0);
      expect(restoreRecords([note]).length).assertEqual(0);
      expect(restoreRecords([label]).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_PERFORMANCE_RESTOREWAVEONE_1000
     * @tc.name testPerformanceRestoreWaveOne0010
     * @tc.desc 缺口数组过滤非文字项，并限制条数及单项长度
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceRestoreWaveOne0010', 0, (): void => {
      const mixed = waveBag(waveRecord('mixed'));
      mixed['missing'] = JSON.parse('[1,"真实缺口",null,false]') as Object;
      expect(restoreRecords([mixed])[0].missing.join('|')).assertEqual('真实缺口');
      const edge = waveRecord('edge');
      for (let index = 0; index < 16; index++) { edge.missing.push('m'.repeat(512)); }
      expect(restoreRecords([edge]).length).assertEqual(1);
      edge.missing.push('extra');
      expect(restoreRecords([edge]).length).assertEqual(0);
      const long = waveRecord('long'); long.missing = ['m'.repeat(513)];
      expect(restoreRecords([long]).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_PERFORMANCE_RESTOREWAVEONE_1100
     * @tc.name testPerformanceRestoreWaveOne0011
     * @tc.desc 阶段杂项不会充数，必须恰好恢复六个带key的阶段
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceRestoreWaveOne0011', 0, (): void => {
      const mixed = waveBag(waveRecord('mixed'));
      const stages = mixed['stages'] as Object[];
      stages.push(JSON.parse('null') as Object); stages.push(7);
      mixed['stages'] = stages;
      expect(restoreRecords([mixed])[0].complete()).assertTrue();
      const short = waveRecord('short'); short.stages.pop();
      expect(restoreRecords([short]).length).assertEqual(0);
      const blank = waveRecord('blank'); blank.stages[0].key = '';
      expect(restoreRecords([blank]).length).assertEqual(0);
      const absent = waveBag(waveRecord('absent')); absent['stages'] = 'not an array';
      expect(restoreRecords([absent]).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_PERFORMANCE_RESTOREWAVEONE_1200
     * @tc.name testPerformanceRestoreWaveOne0012
     * @tc.desc 重复阶段key整条拒绝，合法阶段调序仍可完成且按key查询
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceRestoreWaveOne0012', 0, (): void => {
      const duplicate = waveRecord('duplicate'); duplicate.stages[5].key = duplicate.stages[0].key;
      expect(restoreRecords([duplicate]).length).assertEqual(0);
      const reordered = waveRecord('reordered');
      reordered.stages[0].elapsedMs = 17; reordered.stages.reverse();
      const restored = restoreRecords([reordered])[0];
      expect(restored.complete()).assertTrue();
      expect(restored.stage('discover')?.elapsedMs).assertEqual(17);
      expect(restored.stages[0].key).assertEqual('configAgain');
    });

    /**
     * @tc.number SUB_PERFORMANCE_RESTOREWAVEONE_1300
     * @tc.name testPerformanceRestoreWaveOne0013
     * @tc.desc 阶段耗时允许零但不允许负值及非有限值
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceRestoreWaveOne0013', 0, (): void => {
      const zero = waveRecord('zero', 0);
      expect(restoreRecords([zero])[0].complete()).assertTrue();
      const negative = waveRecord('negative'); negative.stages[2].elapsedMs = -1;
      const infinite = waveRecord('infinite'); infinite.stages[3].elapsedMs = Number.POSITIVE_INFINITY;
      expect(restoreRecords([negative]).length).assertEqual(0);
      expect(restoreRecords([infinite]).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_PERFORMANCE_RESTOREWAVEONE_1400
     * @tc.name testPerformanceRestoreWaveOne0014
     * @tc.desc 阶段详情与标签接受端点，任一阶段文本过长整条丢弃
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceRestoreWaveOne0014', 0, (): void => {
      const edge = waveRecord('edge'); edge.stages[0].detail = 'd'.repeat(2048); edge.stages[1].label = 'l'.repeat(80);
      expect(restoreRecords([edge]).length).assertEqual(1);
      const detail = edge.clone(); detail.stages[0].detail += 'x';
      const label = edge.clone(); label.stages[1].label += 'x';
      const key = edge.clone(); key.stages[2].key = 'k'.repeat(41);
      expect(restoreRecords([detail]).length).assertEqual(0);
      expect(restoreRecords([label]).length).assertEqual(0);
      expect(restoreRecords([key]).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_PERFORMANCE_RESTOREWAVEONE_1500
     * @tc.name testPerformanceRestoreWaveOne0015
     * @tc.desc 非字符串可选元信息恢复为默认值，错误缺口容器不混入内容
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceRestoreWaveOne0015', 0, (): void => {
      const raw = waveBag(waveRecord('legacy'));
      raw['requestStatus'] = 9; raw['observability'] = false;
      raw['note'] = 7; raw['missing'] = 'not-an-array';
      const restored = restoreRecords([raw])[0];
      expect(restored.requestStatus).assertEqual('not-observed');
      expect(restored.observability).assertEqual('未观测');
      expect(restored.note).assertEqual('');
      expect(restored.missing.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_PERFORMANCE_RESTOREWAVEONE_1600
     * @tc.name testPerformanceRestoreWaveOne0016
     * @tc.desc 五种终态可恢复，失败与跳过分别计数而未知状态拒绝
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPerformanceRestoreWaveOne0016', 0, (): void => {
      const mixed = waveRecord('mixed');
      mixed.stages[1].status = '失败'; mixed.stages[2].status = '跳过';
      mixed.stages[3].status = '超时'; mixed.stages[4].status = '已取消';
      const restored = restoreRecords([mixed])[0];
      expect(restored.failed()).assertEqual(1);
      expect(restored.skipped()).assertEqual(1);
      expect(restored.complete()).assertFalse();
      const unknown = waveRecord('unknown'); unknown.stages[0].status = '运行中';
      expect(restoreRecords([unknown]).length).assertEqual(0);
    });
  });
}
