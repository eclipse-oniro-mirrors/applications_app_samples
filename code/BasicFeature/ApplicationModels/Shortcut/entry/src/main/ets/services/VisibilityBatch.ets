export type BatchResult = 'not-run' | 'confirmed' | 'failed' | 'unknown';
export type BatchMode = 'apply' | 'retry' | 'restore';

export class BatchItem {
  public id: string = '';
  public originalKnown: boolean = false;
  public originalVisible: boolean = false;
  public target: boolean = false;
  public attempt: number = 0;
  public result: BatchResult = 'not-run';
  public restoreAttempt: number = 0;
  public restoreResult: BatchResult = 'not-run';
  public retryBlocked: boolean = false;
  public lastKnown: boolean = false;
  public lastVisible: boolean = false;
}

export class BatchPlan {
  public batchId: string = '';
  public createdAt: number = 0;
  public items: BatchItem[] = [];
  public interrupted: boolean = false;
}

export class BatchJournal {
  public version: number = 1;
  public sequence: number = 0;
  public batches: BatchPlan[] = [];
}

export class BatchPreviewItem {
  public id: string = '';
  public currentKnown: boolean = false;
  public currentVisible: boolean = false;
  public target: boolean = false;
  public eligible: boolean = true;
  public externalChange: boolean = false;
  public reason: string = '';
}

export class BatchPreview {
  public token: number = 0;
  public batchId: string = '';
  public mode: BatchMode = 'apply';
  public items: BatchPreviewItem[] = [];
}

export function copyBatch(plan: BatchPlan): BatchPlan {
  const result: BatchPlan = new BatchPlan();
  result.batchId = plan.batchId;
  result.createdAt = plan.createdAt;
  result.interrupted = plan.interrupted;
  result.items = plan.items.map((item: BatchItem): BatchItem => {
    const copy: BatchItem = new BatchItem();
    copy.id = item.id;
    copy.originalKnown = item.originalKnown;
    copy.originalVisible = item.originalVisible;
    copy.target = item.target;
    copy.attempt = item.attempt;
    copy.result = item.result;
    copy.restoreAttempt = item.restoreAttempt;
    copy.restoreResult = item.restoreResult;
    copy.retryBlocked = item.retryBlocked;
    copy.lastKnown = item.lastKnown;
    copy.lastVisible = item.lastVisible;
    return copy;
  });
  return result;
}

export function copyJournal(value: BatchJournal): BatchJournal {
  const result: BatchJournal = new BatchJournal();
  result.sequence = value.sequence;
  result.batches = value.batches.map((plan: BatchPlan) => copyBatch(plan));
  return result;
}

export function copyPreview(value: BatchPreview): BatchPreview {
  const copy: BatchPreview = new BatchPreview();
  copy.token = value.token;
  copy.batchId = value.batchId;
  copy.mode = value.mode;
  copy.items = value.items.map((item: BatchPreviewItem): BatchPreviewItem => {
    const row: BatchPreviewItem = new BatchPreviewItem();
    row.id = item.id;
    row.currentKnown = item.currentKnown;
    row.currentVisible = item.currentVisible;
    row.target = item.target;
    row.eligible = item.eligible;
    row.externalChange = item.externalChange;
    row.reason = item.reason;
    return row;
  });
  return copy;
}

function validResult(value: string): boolean {
  return value === 'not-run' || value === 'confirmed' || value === 'failed' || value === 'unknown';
}

/** Only facts/IDs are stored, never SDK Wants, resource paths, labels, or business content. */
export function decodeJournal(raw: string): BatchJournal {
  if (raw.length === 0) { return new BatchJournal(); }
  if (raw.length > 65536) { throw new Error('batch journal too large'); }
  const value: BatchJournal = JSON.parse(raw) as BatchJournal;
  if (value === null || typeof value !== 'object' || value.version !== 1 ||
    !Number.isSafeInteger(value.sequence) || value.sequence < 0 || !Array.isArray(value.batches) ||
    value.batches.length > 5) { throw new Error('invalid batch journal'); }
  const ids: string[] = [];
  for (const batch of value.batches) {
    if (batch === null || typeof batch !== 'object' || typeof batch.batchId !== 'string' ||
      !/^batch-[0-9]+$/.test(batch.batchId) || ids.includes(batch.batchId) ||
      !Number.isFinite(batch.createdAt) || batch.createdAt < 0 || typeof batch.interrupted !== 'boolean' ||
      !Array.isArray(batch.items) || batch.items.length === 0 || batch.items.length > 20) {
      throw new Error('invalid batch');
    }
    const number: number = Number(batch.batchId.substring(6));
    if (!Number.isSafeInteger(number) || number < 1 || number > value.sequence) {
      throw new Error('batch sequence inconsistent');
    }
    ids.push(batch.batchId);
    const itemIds: string[] = [];
    for (const item of batch.items) {
      if (item === null || typeof item !== 'object' || typeof item.id !== 'string' ||
        item.id.length === 0 || item.id.length > 256 || itemIds.includes(item.id) ||
        typeof item.originalKnown !== 'boolean' || typeof item.originalVisible !== 'boolean' ||
        typeof item.target !== 'boolean' || typeof item.retryBlocked !== 'boolean' ||
        typeof item.lastKnown !== 'boolean' ||
        typeof item.lastVisible !== 'boolean' || !Number.isSafeInteger(item.attempt) || item.attempt < 0 ||
        item.attempt > 100 || !Number.isSafeInteger(item.restoreAttempt) || item.restoreAttempt < 0 ||
        item.restoreAttempt > 100 || !validResult(item.result) || !validResult(item.restoreResult) ||
        (item.attempt === 0 && item.result !== 'not-run') ||
        (item.restoreAttempt === 0 && item.restoreResult !== 'not-run') ||
        (!item.originalKnown && item.restoreAttempt > 0)) { throw new Error('invalid batch item'); }
      itemIds.push(item.id);
    }
  }
  const result: BatchJournal = copyJournal(value);
  for (const plan of result.batches) {
    // Persisted successes are historical facts, not fresh observation. Reopen never grants a replay token.
    plan.interrupted = true;
  }
  return result;
}

export function batchResultText(result: BatchResult): string {
  switch (result) {
    case 'confirmed': return '已确认';
    case 'failed': return '失败（已核对未达目标）';
    case 'unknown': return '未知（须先核对）';
    default: return '未执行';
  }
}
