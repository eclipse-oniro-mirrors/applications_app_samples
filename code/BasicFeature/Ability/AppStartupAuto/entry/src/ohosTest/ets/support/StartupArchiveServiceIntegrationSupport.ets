import { relationalStore } from '@kit.ArkData';
import { AutoStartupService } from '../../../main/ets/autostart/AutoStartupService';
import { RefreshSource } from '../../../main/ets/autostart/AutoStartupTypes';
import { ArchiveDocument, ArchiveStorage, StartupArchiveRepository, decodeArchive } from '../../../main/ets/autostart/archive/StartupArchive';
import { ARCHIVE_STATE_TABLE, StartupArchiveRdbStorage } from '../../../main/ets/autostart/archive/StartupArchiveRdbStorage';
import { ArchiveNativeQaFixture, ArchiveNativeSqlImage, withArchiveNativeQa } from './ArchiveNativeQaSupport';
import { ControlledAutoStartupApi, ManualQueryClock, TestBusinessError, flushMicrotasks } from './TestSupport';

/** Only delays handoff. Every released commit uses the real production RDB adapter. */
export class ServiceArchiveRdbGate implements ArchiveStorage {
  private delegate: StartupArchiveRdbStorage;
  private releases: (() => void)[] = [];
  hold: boolean = false;
  entered: number = 0;
  constructor(delegate: StartupArchiveRdbStorage) { this.delegate = delegate; }
  identity(): string { return this.delegate.identity(); }
  load(): Promise<ArchiveDocument> { return this.delegate.load(); }
  async commit(expectedRevision: number, document: ArchiveDocument): Promise<void> {
    this.entered++;
    if (this.hold) { await new Promise<void>((resolve): void => { this.releases.push(resolve); }); }
    await this.delegate.commit(expectedRevision, document);
  }
  close(): Promise<void> { return this.delegate.close(); }
  release(): void {
    this.hold = false; const releases = this.releases.slice(); this.releases = [];
    releases.forEach((release: () => void): void => { release(); });
  }
}

/** Real service, real repository and real dedicated database; only autoStartup APIs/time are controlled. */
export class ServiceArchiveIntegrationFixture {
  readonly native: ArchiveNativeQaFixture;
  readonly clock: ManualQueryClock = new ManualQueryClock();
  readonly api: ControlledAutoStartupApi = new ControlledAutoStartupApi();
  repository: StartupArchiveRepository;
  public service: AutoStartupService;
  private gates: ServiceArchiveRdbGate[] = [];

  constructor(native: ArchiveNativeQaFixture, repository: StartupArchiveRepository) {
    this.native = native; this.repository = repository;
    this.clock.advance(native.time - this.clock.now());
    this.service = new AutoStartupService(this.api, this.clock);
    this.service.attachRecordSink(repository);
  }

  advance(millis: number): void { this.clock.advance(millis); this.native.time = this.clock.now(); }

  async query(value: boolean, source: RefreshSource = RefreshSource.MANUAL,
    awaitArchive: boolean = true): Promise<void> {
    this.service.refresh(source); this.advance(7); this.api.resolveNext(value);
    await flushMicrotasks();
    if (awaitArchive) { await this.repository.whenIdle(); }
  }

  async reject(code: number, message: string): Promise<void> {
    this.service.refresh(RefreshSource.MANUAL); this.advance(13);
    this.api.rejectNext(new TestBusinessError(code, message));
    await flushMicrotasks(); await this.repository.whenIdle();
  }

  async reconnect(allowBlocked: boolean = false): Promise<void> {
    this.native.time = this.clock.now();
    const attached = await this.repository.attach(await this.native.openStorage());
    if (!attached && !allowBlocked) { throw new Error('Dedicated integration archive could not reconnect'); }
    this.service.attachRecordSink(this.repository);
  }

  /** NativeQa SQL access requires all production cursors/handles closed first. */
  async closedSql(body: (store: relationalStore.RdbStore) => Promise<void>): Promise<void> {
    await this.repository.whenIdle(); await this.repository.close();
    await this.native.withClosedDatabase(body);
    await this.reconnect();
  }

  async image(allowBlocked: boolean = false): Promise<ArchiveNativeSqlImage> {
    await this.repository.whenIdle(); await this.repository.close();
    const image = await this.native.image();
    await this.reconnect(allowBlocked);
    return image;
  }

  async disk(): Promise<ArchiveDocument> {
    const image = await this.image();
    return image.count === 0 ? new ArchiveDocument() : decodeArchive(image.payload);
  }

  async freshRepository(): Promise<void> {
    if (this.repository.snapshot().pending > 0) { throw new Error('Refusing to discard unacknowledged integration evidence'); }
    await this.repository.whenIdle(); await this.repository.close();
    this.native.time = this.clock.now(); this.repository = await this.native.reopen();
    this.service.attachRecordSink(this.repository);
  }

  async freshService(): Promise<void> {
    this.service.attachRecordSink(undefined); this.service.dispose(); this.api.finishPending();
    await flushMicrotasks(); this.advance(1);
    this.service = new AutoStartupService(this.api, this.clock);
    this.service.attachRecordSink(this.repository);
  }

  async gateStorage(): Promise<ServiceArchiveRdbGate> {
    await this.repository.whenIdle(); await this.repository.close(); await this.native.release();
    const gate = new ServiceArchiveRdbGate(await this.native.openStorage()); this.gates.push(gate);
    if (!await this.repository.attach(gate)) { throw new Error('Integration gate could not attach real RDB'); }
    this.service.attachRecordSink(this.repository);
    return gate;
  }

  async failArchiveWrites(): Promise<void> {
    await this.closedSql(async (store: relationalStore.RdbStore): Promise<void> => {
      await store.executeSql('CREATE TABLE IF NOT EXISTS sa_service_archive_audit (attempt INTEGER NOT NULL)');
      await store.executeSql('DELETE FROM sa_service_archive_audit');
      await store.executeSql(`CREATE TRIGGER sa_service_archive_fail BEFORE INSERT ON ${ARCHIVE_STATE_TABLE} ` +
        'BEGIN INSERT INTO sa_service_archive_audit(attempt) VALUES(NEW.revision); ' +
        'SELECT RAISE(FAIL, \'integration-archive-write-failure\'); END');
    });
  }

  async recoverArchiveWrites(): Promise<void> {
    await this.closedSql(async (store: relationalStore.RdbStore): Promise<void> => {
      await store.executeSql('DROP TRIGGER IF EXISTS sa_service_archive_fail');
    });
  }

  async auditCount(): Promise<number> {
    const counts: number[] = [];
    await this.closedSql(async (store: relationalStore.RdbStore): Promise<void> => {
      const rows = await store.querySql('SELECT COUNT(*) AS total FROM sa_service_archive_audit');
      try {
        if (!rows.goToFirstRow()) { throw new Error('No integration audit result'); }
        counts.push(rows.getLong(rows.getColumnIndex('total')));
      } finally { rows.close(); }
    });
    return counts[0];
  }

  async replaceDocument(payload: string, revision: number, operation: string,
    allowBlocked: boolean = false): Promise<void> {
    await this.repository.whenIdle(); await this.repository.close();
    await this.native.seedRaw(payload, revision, operation);
    this.native.time = this.clock.now();
    const attached = await this.repository.attach(await this.native.openStorage());
    this.service.attachRecordSink(this.repository);
    if (!attached && !allowBlocked) { throw new Error('Valid integration document failed to restore'); }
  }

  async finish(): Promise<void> {
    this.gates.forEach((gate: ServiceArchiveRdbGate): void => { gate.release(); });
    this.service.attachRecordSink(undefined); this.service.dispose();
    this.api.finishPending(); this.clock.clearAll(); await flushMicrotasks();
    await this.repository.whenIdle(); await this.repository.close();
  }
}

export async function withServiceArchiveIntegration(
  body: (fixture: ServiceArchiveIntegrationFixture) => Promise<void>): Promise<void> {
  await withArchiveNativeQa(async (native: ArchiveNativeQaFixture): Promise<void> => {
    const repository = await native.repository();
    const fixture = new ServiceArchiveIntegrationFixture(native, repository);
    try {
      await body(fixture);
    } finally {
      await fixture.finish();
    }
  });
}
