import { common, shortcutManager } from '@kit.AbilityKit';
import { ShortcutApi } from '../../../main/ets/services/ShortcutApi';
import { BatchStorage } from '../../../main/ets/services/BatchStorage';
import { ShortcutService } from '../../../main/ets/services/ShortcutService';
import { BatchItem, BatchJournal, BatchPlan, BatchPreview } from '../../../main/ets/services/VisibilityBatch';
import { BatchSpan, BatchTelemetry } from '../../../main/ets/services/BatchTelemetry';
import { NavigationDialog, NavigationRouter } from '../../../main/ets/navigation/AppNavigation';
import { CaseScope, getTestContext } from './CaseScope';
import { Deferred, FixtureError, shortcutInfo } from './ShortcutFixture';

/** Port doubles only: production owns all journal, eligibility and navigation decisions. */
export class WaveJournalPort implements BatchStorage {
  public value: string = '';
  public reads: number = 0;
  public writes: string[] = [];
  public failRead: boolean = false;
  public failWrite: boolean = false;
  public readGate: Deferred<string> | undefined = undefined;
  async read(_context: common.ApplicationContext): Promise<string> {
    this.reads++;
    if (this.failRead) { throw new Error('journal read rejected'); }
    const gate: Deferred<string> | undefined = this.readGate;
    return gate === undefined ? this.value : gate.promise;
  }
  async write(value: string): Promise<void> {
    this.writes.push(value);
    if (this.failWrite) { throw new Error('journal write rejected'); }
    this.value = value;
  }
}

export class WaveShortcutPort implements ShortcutApi {
  public infos: shortcutManager.ShortcutInfo[] = [shortcutInfo('a', true), shortcutInfo('b', false)];
  public queries: number = 0;
  public failQuery: boolean = false;
  public writes: string[] = [];
  public onWrite: () => void = (): void => {};
  isShortcutSupported(): boolean { return true; }
  async getAllShortcutInfoForSelf(): Promise<shortcutManager.ShortcutInfo[]> {
    this.queries++;
    if (this.failQuery) { throw new FixtureError(350001, 'query unavailable'); }
    return JSON.parse(JSON.stringify(this.infos)) as shortcutManager.ShortcutInfo[];
  }
  async setShortcutVisibleForSelf(id: string, visible: boolean): Promise<void> {
    this.onWrite();
    this.writes.push(`${id}:${visible}`);
    const found: shortcutManager.ShortcutInfo | undefined = this.infos.find(
      (info: shortcutManager.ShortcutInfo) => info.id === id);
    if (found === undefined) { throw new FixtureError(17700070, 'no entry'); }
    found.visible = visible;
  }
}

class WaveTelemetry implements BatchTelemetry {
  begin(stage: string): BatchSpan { const span: BatchSpan = new BatchSpan(); span.stage = stage; return span; }
  finish(_span: BatchSpan): void {}
}

export class WaveBatchHarness {
  public api: WaveShortcutPort = new WaveShortcutPort();
  public io: WaveJournalPort = new WaveJournalPort();
  public service: ShortcutService = new ShortcutService(this.api, this.io, 5000, new WaveTelemetry());
  private scope: CaseScope;
  constructor(scope: CaseScope) {
    this.scope = scope;
    scope.cleanup((): void => { this.service.dispose(); this.io.readGate?.resolve(''); });
  }
  async start(): Promise<void> {
    this.service.initialize(getTestContext());
    await this.scope.until((): boolean => !this.service.snapshot().busy && !this.service.snapshot().batchLoading,
      (changed: () => void): (() => void) => {
        const token: number = this.service.subscribe(changed);
        return (): void => { this.service.unsubscribe(token); };
      });
  }
  preview(): BatchPreview {
    const value: BatchPreview | undefined = this.service.snapshot().batchPreview;
    if (value === undefined) { throw new Error('production did not create preview'); }
    return value;
  }
  plan(): BatchPlan {
    const value: BatchPlan[] = this.service.snapshot().batches;
    if (value.length === 0) { throw new Error('production did not retain plan'); }
    return value[0];
  }
}

/** A stored input fixture, not an implementation of decode/reconciliation. */
export function waveJournal(): BatchJournal {
  const journal: BatchJournal = new BatchJournal();
  journal.sequence = 1;
  const plan: BatchPlan = new BatchPlan();
  plan.batchId = 'batch-1';
  plan.createdAt = 1;
  const row: BatchItem = new BatchItem();
  row.id = 'a';
  row.originalKnown = true;
  row.originalVisible = true;
  row.target = false;
  row.lastKnown = true;
  row.lastVisible = false;
  row.attempt = 1;
  row.result = 'failed';
  plan.items = [row];
  journal.batches = [plan];
  return journal;
}

export class WaveRouter implements NavigationRouter {
  public calls: string[] = [];
  public depth: number = 2;
  public fail: boolean = false;
  public gate: Deferred<void> | undefined = undefined;
  async push(url: string, id: string): Promise<void> { await this.record(`push:${url}:${id}`); }
  async replace(url: string, id: string): Promise<void> { await this.record(`replace:${url}:${id}`); }
  async back(home: boolean): Promise<void> { await this.record(`back:${home}`); }
  length(): number { return this.depth; }
  private async record(call: string): Promise<void> {
    this.calls.push(call);
    if (this.gate !== undefined) { await this.gate.promise; }
    if (this.fail) { throw new Error('route rejected'); }
  }
}

export class WaveDialog implements NavigationDialog {
  public answer: number = 2;
  public editing: boolean[] = [];
  public toasts: string[] = [];
  public fail: boolean = false;
  public gate: Deferred<number> | undefined = undefined;
  async choose(editing: boolean): Promise<number> {
    this.editing.push(editing);
    if (this.fail) { throw new Error('dialog rejected'); }
    return this.gate === undefined ? this.answer : this.gate.promise;
  }
  toast(message: string): void { this.toasts.push(message); }
}

export async function waveSettle(): Promise<void> {
  for (let index: number = 0; index < 24; index++) { await Promise.resolve(); }
}
