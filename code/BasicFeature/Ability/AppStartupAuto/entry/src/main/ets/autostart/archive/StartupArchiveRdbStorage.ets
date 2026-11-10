import { common } from '@kit.AbilityKit';
import { relationalStore } from '@kit.ArkData';
import { ArchiveDocument, ArchiveFailure, ArchiveStorage, ARCHIVE_SCHEMA, decodeArchive, encodeArchive } from './StartupArchive';

export const ARCHIVE_DATABASE_NAME: string = 'startup_query_archive_v1.db';
export const ARCHIVE_STATE_TABLE: string = 'startup_archive_state';
export const ARCHIVE_CREATE_SQL: string = 'CREATE TABLE IF NOT EXISTS startup_archive_state (' +
  'singleton INTEGER PRIMARY KEY CHECK(singleton = 1), revision INTEGER NOT NULL, ' +
  'operation TEXT NOT NULL, payload TEXT NOT NULL)';

export function validArchiveDatabaseName(name: string): boolean {
  return /^[A-Za-z0-9_-]{1,64}\.db$/.test(name);
}

/** Private local RDB. The bounded document and its revision commit in one transaction. */
export class StartupArchiveRdbStorage implements ArchiveStorage {
  private store: relationalStore.RdbStore;
  private closed: boolean = false;
  private closing: boolean = false;
  private chain: Promise<void> = Promise.resolve();
  private identityValue: string;
  private constructor(store: relationalStore.RdbStore, identity: string) {
    this.store = store; this.identityValue = identity;
  }

  identity(): string { return this.identityValue; }

  static async open(context: common.Context, name: string = ARCHIVE_DATABASE_NAME): Promise<StartupArchiveRdbStorage> {
    if (!validArchiveDatabaseName(name)) { throw new ArchiveFailure('NAME'); }
    const config: relationalStore.StoreConfig = { name: name, securityLevel: relationalStore.SecurityLevel.S1 };
    const store = await relationalStore.getRdbStore(context, config);
    try {
      if (store.version !== 0 && store.version !== ARCHIVE_SCHEMA) { throw new ArchiveFailure('SCHEMA'); }
      await store.executeSql(ARCHIVE_CREATE_SQL);
      if (store.version === 0) { store.version = ARCHIVE_SCHEMA; }
      return new StartupArchiveRdbStorage(store, context.databaseDir + '/' + name);
    } catch (error) {
      await store.close();
      throw error as Error;
    }
  }

  /** Call only after closing all instances; tests must use their own dedicated name. */
  static async delete(context: common.Context, name: string): Promise<void> {
    if (!validArchiveDatabaseName(name)) { throw new ArchiveFailure('NAME'); }
    await relationalStore.deleteRdbStore(context, name);
  }

  load(): Promise<ArchiveDocument> {
    if (this.closed || this.closing) { return Promise.reject(new ArchiveFailure('CLOSED')); }
    const task = this.chain.then((): Promise<ArchiveDocument> => this.readCurrent());
    this.chain = task.then((): void => {}, (): void => {});
    return task;
  }

  commit(expectedRevision: number, document: ArchiveDocument): Promise<void> {
    if (this.closed || this.closing) { return Promise.reject(new ArchiveFailure('CLOSED')); }
    // Copy and validate before joining the writer queue: caller edits cannot affect SQL.
    let candidate: ArchiveDocument; let payload: string;
    try {
      payload = encodeArchive(document); candidate = decodeArchive(payload);
      if (!Number.isSafeInteger(expectedRevision) || expectedRevision < 0 ||
        candidate.revision !== expectedRevision + 1 || candidate.operationId.length === 0) {
        throw new ArchiveFailure('REVISION');
      }
    } catch (error) { return Promise.reject(error as Error); }
    const task = this.chain.then(async (): Promise<void> => {
      if (this.closed) { throw new ArchiveFailure('CLOSED'); }
      let transaction = false;
      try {
        // SDK API9: beginTransaction/commit/rollBack are synchronous; all SQL promises
        // are awaited before commit. This adapter serializes load and commit operations.
        this.store.beginTransaction(); transaction = true;
        const current = await this.readCurrent();
        if (current.revision !== expectedRevision) { throw new ArchiveFailure('CONFLICT'); }
        await this.store.executeSql('INSERT OR REPLACE INTO startup_archive_state ' +
          '(singleton, revision, operation, payload) VALUES (1, ?, ?, ?)',
          [candidate.revision, candidate.operationId, payload]);
        this.store.commit(); transaction = false;
      } catch (error) {
        if (transaction) {
          try { this.store.rollBack(); } catch (_) { /* Repository must reread an ambiguous result. */ }
        }
        throw error as Error;
      }
    });
    this.chain = task.then((): void => {}, (): void => {});
    return task;
  }

  async close(): Promise<void> {
    if (this.closed) { return; }
    if (this.closing) { await this.chain; return; }
    this.closing = true;
    const task = this.chain.then(async (): Promise<void> => {
      await this.store.close(); this.closed = true;
    });
    this.chain = task.then((): void => {}, (): void => {});
    try { await task; } finally { this.closing = false; }
  }

  private async readCurrent(): Promise<ArchiveDocument> {
    if (this.closed) { throw new ArchiveFailure('CLOSED'); }
    const rows = await this.store.querySql('SELECT revision, operation, payload FROM startup_archive_state WHERE singleton = 1');
    try {
      if (rows.rowCount === 0) { return new ArchiveDocument(); }
      if (rows.rowCount !== 1 || !rows.goToFirstRow()) { throw new ArchiveFailure('INVALID'); }
      const revision = rows.getLong(rows.getColumnIndex('revision'));
      const operation = rows.getString(rows.getColumnIndex('operation'));
      const payload = rows.getString(rows.getColumnIndex('payload'));
      const document = decodeArchive(payload);
      if (document.revision !== revision || document.operationId !== operation) { throw new ArchiveFailure('INVALID'); }
      return document;
    } finally { rows.close(); }
  }
}
