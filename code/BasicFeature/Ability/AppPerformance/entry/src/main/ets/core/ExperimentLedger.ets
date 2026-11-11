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

/**
 * 实验账本：把一次「负载 → 回收 → 重读 → 校验」的过程记成可比较的记录。
 *
 * 记录只保存事实（字节数、校验值、阶段状态、耗时），不保存文件内容、路径与正文；
 * 缺口与不可观测状态显式登记，任何比较都不把缺失值当成 0。
 */

/** 阶段。 */
export class ExperimentStage {
  public key: string = '';
  public label: string = '';
  public status: string = '跳过';
  public elapsedMs: number = 0;
  public detail: string = '';

  constructor(key: string = '', label: string = '', status: string = '跳过',
    elapsedMs: number = 0, detail: string = '') {
    this.key = key;
    this.label = label;
    this.status = status;
    this.elapsedMs = elapsedMs;
    this.detail = detail;
  }

  succeeded(): boolean {
    return this.status === '成功';
  }

  failed(): boolean {
    return this.status === '失败';
  }

  text(): string {
    return `${this.succeeded() ? '✓' : (this.failed() ? '✗' : '-')} ${this.label}｜${this.detail}`;
  }
}

/** 一次实验记录。 */
export class ExperimentRecord {
  public id: string = '';
  public workloadId: string = '';
  public workloadLabel: string = '';
  public mode: string = 'control';
  public startedAt: number = 0;
  public endedAt: number = 0;
  public stages: ExperimentStage[] = [];
  public beforeBytes: number = 0;
  public afterBytes: number = 0;
  public digestBefore: string = '';
  public digestAfter: string = '';
  public integrity: string = '未校验';
  public checkBefore: string = '';
  public checkAfter: string = '';
  public observability: string = '未观测';
  public missing: string[] = [];
  public note: string = '';
  public condition: string = '';
  public asset: string = '';
  public requestStatus: string = 'not-observed';

  durationMs(): number {
    return Math.max(0, this.endedAt - this.startedAt);
  }

  failed(): number {
    return this.stages.filter((stage: ExperimentStage): boolean => stage.failed()).length;
  }

  skipped(): number {
    return this.stages.filter((stage: ExperimentStage): boolean => stage.status === '跳过').length;
  }

  complete(): boolean {
    const keys: string[] = ['discover', 'config', 'warm', 'evict', 'reread', 'configAgain'];
    return this.endedAt >= this.startedAt && this.startedAt > 0 && this.integrity === '一致' &&
      this.stages.length === keys.length && keys.every((key: string): boolean =>
        this.stages.filter((stage: ExperimentStage): boolean => stage.key === key && stage.succeeded()).length === 1);
  }

  stage(key: string): ExperimentStage | undefined {
    return this.stages.find((stage: ExperimentStage): boolean => stage.key === key);
  }

  modeLabel(): string {
    if (this.mode === 'files') {
      return '文件回收';
    }
    if (this.mode === 'modules') {
      return '模块回收';
    }
    return '对照组';
  }

  clone(): ExperimentRecord {
    const copy: ExperimentRecord = new ExperimentRecord();
    copy.id = this.id;
    copy.workloadId = this.workloadId;
    copy.workloadLabel = this.workloadLabel;
    copy.mode = this.mode;
    copy.startedAt = this.startedAt;
    copy.endedAt = this.endedAt;
    copy.stages = this.stages.map((stage: ExperimentStage): ExperimentStage =>
      new ExperimentStage(stage.key, stage.label, stage.status, stage.elapsedMs, stage.detail));
    copy.beforeBytes = this.beforeBytes;
    copy.afterBytes = this.afterBytes;
    copy.digestBefore = this.digestBefore;
    copy.digestAfter = this.digestAfter;
    copy.integrity = this.integrity;
    copy.checkBefore = this.checkBefore;
    copy.checkAfter = this.checkAfter;
    copy.observability = this.observability;
    copy.missing = this.missing.slice();
    copy.note = this.note;
    copy.condition = this.condition;
    copy.asset = this.asset;
    copy.requestStatus = this.requestStatus;
    return copy;
  }

  text(): string {
    return `${this.id}｜${this.workloadLabel}｜${this.modeLabel()}｜${this.integrity}｜` +
      `${this.durationMs()} ms｜失败 ${this.failed()} 阶段`;
  }
}

/** 两条记录的比较结论。 */
export class LedgerComparison {
  public comparable: boolean = false;
  public reasons: string[] = [];
  public before: string = '';
  public after: string = '';
  public integrityChanged: boolean = false;
  public deltaBytes: number = 0;
  public deltaDurationMs: number = 0;
  public sameContent: boolean = false;

  text(): string {
    if (!this.comparable) {
      return `不可比：${this.reasons.join('；')}`;
    }
    return `同条件阶段耗时可比（非回收量）：校验 ${this.sameContent ? '一致' : '不一致'}，` +
      `字节差 ${this.deltaBytes}，耗时差 ${this.deltaDurationMs} ms`;
  }
}

export const LEDGER_LIMIT: number = 30;

/** 从持久化数据恢复记录：字段类型与取值都要自洽，坏记录整体丢弃而不是部分保留。 */
export function restoreRecords(value: Object | undefined, now: number = 0): ExperimentRecord[] {
  if (!Array.isArray(value)) {
    return [];
  }
  const result: ExperimentRecord[] = [];
  const seen: Set<string> = new Set<string>();
  (value as Object[]).slice(0, LEDGER_LIMIT).forEach((item: Object): void => {
    if (item === null || typeof item !== 'object') {
      return;
    }
    const bag = item as Record<string, Object>;
    const record: ExperimentRecord = new ExperimentRecord();
    record.id = typeof bag['id'] === 'string' ? bag['id'] as string : '';
    record.workloadId = typeof bag['workloadId'] === 'string' ? bag['workloadId'] as string : '';
    record.workloadLabel = typeof bag['workloadLabel'] === 'string' ? bag['workloadLabel'] as string : '';
    record.mode = typeof bag['mode'] === 'string' ? bag['mode'] as string : 'control';
    record.startedAt = typeof bag['startedAt'] === 'number' ? bag['startedAt'] as number : 0;
    record.endedAt = typeof bag['endedAt'] === 'number' ? bag['endedAt'] as number : 0;
    record.beforeBytes = typeof bag['beforeBytes'] === 'number' ? bag['beforeBytes'] as number : 0;
    record.afterBytes = typeof bag['afterBytes'] === 'number' ? bag['afterBytes'] as number : 0;
    record.digestBefore = typeof bag['digestBefore'] === 'string' ? bag['digestBefore'] as string : '';
    record.digestAfter = typeof bag['digestAfter'] === 'string' ? bag['digestAfter'] as string : '';
    record.integrity = typeof bag['integrity'] === 'string' ? bag['integrity'] as string : '未校验';
    record.checkBefore = typeof bag['checkBefore'] === 'string' ? bag['checkBefore'] as string : '';
    record.checkAfter = typeof bag['checkAfter'] === 'string' ? bag['checkAfter'] as string : '';
    record.observability = typeof bag['observability'] === 'string' ? bag['observability'] as string : '未观测';
    record.note = typeof bag['note'] === 'string' ? bag['note'] as string : '';
    record.condition = typeof bag['condition'] === 'string' ? bag['condition'] as string : '';
    record.asset = typeof bag['asset'] === 'string' ? bag['asset'] as string : '';
    record.requestStatus = typeof bag['requestStatus'] === 'string' ? bag['requestStatus'] as string : 'not-observed';
    if (record.id.length === 0 || record.id.length > 160 || seen.has(record.id) ||
      !/^W-(TEXT|NOTES|IMAGES|FORM)$/.test(record.workloadId) ||
      ['control', 'files', 'modules'].indexOf(record.mode) < 0 || record.condition.length > 8192 ||
      record.asset.length > 255 || record.note.length > 2048 || record.workloadLabel.length > 80 ||
      !Number.isFinite(record.startedAt) || record.startedAt <= 0 ||
      !Number.isFinite(record.endedAt) || record.endedAt < record.startedAt ||
      !Number.isSafeInteger(record.beforeBytes) || !Number.isSafeInteger(record.afterBytes) ||
      record.beforeBytes < 0 || record.afterBytes < 0 || record.beforeBytes > 1048576 || record.afterBytes > 1048576 ||
      (now > 0 && (record.startedAt > now + 60000 || now - record.startedAt > 30 * 86400000))) {
      return;
    }
    if (Array.isArray(bag['missing'])) {
      (bag['missing'] as Object[]).forEach((text: Object): void => {
        if (typeof text === 'string') {
          record.missing.push(text as string);
        }
      });
    }
    if (Array.isArray(bag['stages'])) {
      (bag['stages'] as Object[]).forEach((raw: Object): void => {
        if (raw === null || typeof raw !== 'object') {
          return;
        }
        const stageBag = raw as Record<string, Object>;
        const stage: ExperimentStage = new ExperimentStage();
        stage.key = typeof stageBag['key'] === 'string' ? stageBag['key'] as string : '';
        stage.label = typeof stageBag['label'] === 'string' ? stageBag['label'] as string : '';
        stage.status = typeof stageBag['status'] === 'string' ? stageBag['status'] as string : '跳过';
        stage.elapsedMs = typeof stageBag['elapsedMs'] === 'number' ? stageBag['elapsedMs'] as number : 0;
        stage.detail = typeof stageBag['detail'] === 'string' ? stageBag['detail'] as string : '';
        if (stage.key.length > 0) {
          record.stages.push(stage);
        }
      });
    }
    if (record.stages.length !== 6 || record.stages.some((stage: ExperimentStage): boolean =>
      !Number.isFinite(stage.elapsedMs) || stage.elapsedMs < 0 || stage.detail.length > 2048 ||
      stage.label.length > 80 || stage.key.length > 40 ||
      ['成功', '失败', '跳过', '超时', '已取消'].indexOf(stage.status) < 0) ||
      new Set<string>(record.stages.map((stage: ExperimentStage): string => stage.key)).size !== 6 ||
      record.missing.length > 16 || record.missing.some((text: string): boolean => text.length > 512)) { return; }
    seen.add(record.id);
    result.push(record);
  });
  return result;
}

/** 有界实验账本。 */
export class ExperimentLedger {
  private records: ExperimentRecord[] = [];
  private serial: number = 0;

  restore(records: ExperimentRecord[]): void {
    // Persistence is newest first; append/unshift would reverse it on every reopen.
    this.records = restoreRecords(records).map((record: ExperimentRecord): ExperimentRecord => record.clone());
    this.records.forEach((record: ExperimentRecord): void => {
      const match = /^EXP-([0-9]+)$/.exec(record.id);
      if (match !== null && Number.isSafeInteger(Number(match[1]))) {
        this.serial = Math.max(this.serial, Number(match[1]));
      }
    });
  }

  append(record: ExperimentRecord): ExperimentRecord {
    const stored: ExperimentRecord = record.clone();
    if (stored.id.length === 0 || this.records.some((item: ExperimentRecord): boolean => item.id === stored.id)) {
      do { this.serial += 1; stored.id = `EXP-${this.serial}`; }
      while (this.records.some((item: ExperimentRecord): boolean => item.id === stored.id));
    }
    this.records.unshift(stored);
    this.records = this.records.slice(0, LEDGER_LIMIT);
    return stored.clone();
  }

  all(): ExperimentRecord[] {
    return this.records.map((record: ExperimentRecord): ExperimentRecord => record.clone());
  }

  size(): number {
    return this.records.length;
  }

  clear(): void {
    this.records = [];
  }

  byWorkload(workloadId: string): ExperimentRecord[] {
    return this.all().filter((record: ExperimentRecord): boolean =>
      record.workloadId === workloadId);
  }

  /** 同负载、同模式下最近两条，作为同条件对照。 */
  latestPair(workloadId: string): LedgerComparison {
    return latestPairOf(this.all(), workloadId);
  }

  /** 脱敏导出：只有编码、字节数、校验值、耗时与状态，不含路径与正文。 */
  exportText(): string {
    const lines: string[] = ['# 实验记录（脱敏）', `# 共 ${this.records.length} 条`];
    this.records.forEach((record: ExperimentRecord, index: number): void => {
      const conditionId: number = this.records.findIndex((item: ExperimentRecord): boolean =>
        item.condition === record.condition) + 1;
      lines.push(`sample-${index + 1}\t${record.workloadId}\t${record.mode}\tcondition-${conditionId}\t` +
        `${record.beforeBytes}\t${record.afterBytes}\t${record.integrity}\t${record.requestStatus}\t` +
        `${record.durationMs()}\t${record.observability}\tmissing=${record.missing.length}`);
      record.stages.forEach((stage: ExperimentStage): void => {
        lines.push(`  ${stage.key}\t${stage.status}\t${stage.elapsedMs}ms`);
      });
    });
    return lines.join('\n');
  }
}

/** 同负载最近两条记录的比较，直接从记录数组推导，页面无需再维护第二本账。 */
export function latestPairOf(records: ExperimentRecord[], workloadId: string): LedgerComparison {
  const matching: ExperimentRecord[] = records.filter((record: ExperimentRecord): boolean =>
    record.workloadId === workloadId);
  const latest = matching[0];
  const same: ExperimentRecord[] = latest === undefined ? [] : matching.filter((record: ExperimentRecord): boolean =>
    record.condition === latest.condition && record.mode === latest.mode && record.asset === latest.asset);
  if (same.length < 2) {
    const missing: LedgerComparison = new LedgerComparison();
    missing.reasons.push(same.length === 0 ? '该负载还没有记录' : '该负载只有一条记录');
    return missing;
  }
  return compareRecords(same[1], same[0]);
}

/** 判断两条记录是否同条件。 */
export function compareRecords(left: ExperimentRecord, right: ExperimentRecord): LedgerComparison {
  const comparison: LedgerComparison = new LedgerComparison();
  comparison.before = left.id;
  comparison.after = right.id;
  if (left.workloadId !== right.workloadId) {
    comparison.reasons.push('负载不同');
  }
  if (left.condition.length === 0 || left.condition !== right.condition ||
    left.mode !== right.mode || left.asset !== right.asset) {
    comparison.reasons.push('采样条件不同或旧记录缺少条件');
  }
  if (left.beforeBytes !== right.beforeBytes) {
    comparison.reasons.push('样本大小不同');
  }
  if (left.digestBefore !== right.digestBefore) {
    comparison.reasons.push('样本内容不同');
  }
  if (!left.complete() || !right.complete()) {
    comparison.reasons.push('有记录未正常结束');
  }
  comparison.comparable = comparison.reasons.length === 0;
  if (!comparison.comparable) {
    return comparison;
  }
  comparison.sameContent = left.digestAfter === right.digestAfter && left.afterBytes === right.afterBytes;
  comparison.integrityChanged = left.integrity !== right.integrity;
  comparison.deltaBytes = right.afterBytes - left.afterBytes;
  comparison.deltaDurationMs = right.durationMs() - left.durationMs();
  return comparison;
}

/** 中位数：缺失数组返回 -1，而不是 0。 */
export function medianOf(values: number[]): number {
  if (values.length === 0) {
    return -1;
  }
  const sorted: number[] = values.slice().sort((a: number, b: number): number => a - b);
  const middle: number = Math.floor(sorted.length / 2);
  return sorted.length % 2 === 0 ? Math.round((sorted[middle - 1] + sorted[middle]) / 2) :
    sorted[middle];
}

/** 按负载汇总。 */
export class WorkloadDigest {
  public workloadId: string = '';
  public runs: number = 0;
  public succeeded: number = 0;
  public failed: number = 0;
  public medianDuration: number = -1;
  public integrityOk: number = 0;
  public group: string = '';
  public p90Duration: number = -1;

  text(): string {
    return `${this.workloadId}｜${this.group}｜${this.runs} 次｜有效 ${this.succeeded}｜失败/缺失 ${this.failed}｜` +
      `P50 ${this.medianDuration < 0 ? '不可评估' : `${this.medianDuration} ms`}｜` +
      `P90 ${this.p90Duration < 0 ? '不可评估' : `${this.p90Duration} ms`}｜完整性通过 ${this.integrityOk}`;
  }
}

/** 汇总账本。 */
export function digestLedger(records: ExperimentRecord[]): WorkloadDigest[] {
  const ids: string[] = [];
  records.forEach((record: ExperimentRecord): void => {
    const key: string = JSON.stringify([record.workloadId, record.mode, record.condition,
      record.digestBefore, record.beforeBytes]);
    if (ids.indexOf(key) < 0) { ids.push(key); }
  });
  return ids.map((id: string, index: number): WorkloadDigest => {
    const digest: WorkloadDigest = new WorkloadDigest();
    const same: ExperimentRecord[] = records.filter((record: ExperimentRecord): boolean =>
      JSON.stringify([record.workloadId, record.mode, record.condition,
        record.digestBefore, record.beforeBytes]) === id);
    digest.workloadId = same[0].workloadId;
    digest.group = `${same[0].modeLabel()} / 条件组${index + 1}`;
    const valid: ExperimentRecord[] = same.filter((record: ExperimentRecord): boolean =>
      record.complete() && record.condition.length > 0);
    digest.runs = same.length;
    digest.succeeded = valid.length;
    digest.failed = same.length - valid.length;
    digest.integrityOk = valid.length;
    const values = valid.map((record: ExperimentRecord): number => record.stages.reduce(
      (sum: number, stage: ExperimentStage): number => sum + stage.elapsedMs, 0));
    digest.medianDuration = medianOf(values);
    if (values.length > 0) {
      values.sort((left: number, right: number): number => left - right);
      digest.p90Duration = values[Math.ceil(values.length * 0.9) - 1];
    }
    return digest;
  });
}
