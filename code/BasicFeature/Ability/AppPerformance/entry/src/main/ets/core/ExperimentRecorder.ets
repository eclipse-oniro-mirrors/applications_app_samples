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

import { MaintenanceFlow, MaintenanceStep } from './Types';
import { ExperimentRecord, ExperimentStage } from './ExperimentLedger';

/**
 * 把一次真实维护流程翻译成实验记录。
 * 只搬运流程已经产生的事实：阶段状态、耗时、字节数与校验值；缺失一律保留为缺口，
 * 不推断驻留页变化，也不把「请求成功」写成「已回收」。
 */
export function recordOfFlow(flow: MaintenanceFlow, workloadId: string, workloadLabel: string,
  missing: string[]): ExperimentRecord {
  const record: ExperimentRecord = new ExperimentRecord();
  record.workloadId = workloadId;
  record.workloadLabel = workloadLabel;
  record.mode = flow.mode;
  record.startedAt = flow.startedAt;
  record.endedAt = flow.endedAt;
  record.beforeBytes = flow.beforeBytes;
  record.afterBytes = flow.afterBytes;
  record.digestBefore = flow.digestBefore;
  record.digestAfter = flow.digestAfter;
  record.integrity = flow.integrity === '业务资源校验一致' ? '一致' :
    (flow.integrity === '业务资源重读失败' ? '不一致' : (flow.integrity === '业务资源校验不一致' ? '不一致' : '未校验'));
  record.observability = '不可观测';
  record.note = flow.notice;
  missing.forEach((item: string): void => {
    record.missing.push(item);
  });
  flow.steps.forEach((step: MaintenanceStep): void => {
    const status: string = ['成功', '失败', '超时', '已取消'].indexOf(step.status) >= 0 ? step.status : '跳过';
    record.stages.push(new ExperimentStage(step.key, step.label, status, step.elapsed, step.detail));
  });
  return record;
}

/** 正常结束的流程才计入成功；中途停止保留为失败记录。 */
export function flowCompleted(flow: MaintenanceFlow): boolean {
  return flow.endedAt > 0 && flow.status.indexOf('已完成') === 0 && flow.steps.every(
    (step: MaintenanceStep): boolean => step.status === '成功');
}
