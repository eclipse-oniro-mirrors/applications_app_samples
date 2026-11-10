import { common } from '@kit.AbilityKit';
import { relationalStore } from '@kit.ArkData';
import { abilityDelegatorRegistry } from '@kit.TestKit';
import { QueryOutcome, QueryRecord, RefreshSource } from '../../../main/ets/autostart/AutoStartupTypes';
import { ARCHIVE_SCHEMA, ArchiveFailure, StartupArchiveRepository } from '../../../main/ets/autostart/archive/StartupArchive';
import { ARCHIVE_CREATE_SQL, ARCHIVE_STATE_TABLE, StartupArchiveRdbStorage } from '../../../main/ets/autostart/archive/StartupArchiveRdbStorage';

// SQL observations are not a second archive model. All business documents use production exports.
export class ArchiveNativeSqlImage {
  count: number = 0;
  version: number = 0;
  revision: number = -1;
  operation: string = '';
  payload: string = '';
}

let archiveDatabaseSequence: number = 0;

export function archiveNativeQaRecord(id: number, timestamp: number,
  outcome: QueryOutcome = QueryOutcome.SUCCESS, source: RefreshSource = RefreshSource.MANUAL): QueryRecord {
  const record: QueryRecord = new QueryRecord();
  record.id = id;
  record.timestamp = timestamp;
  record.source = source;
  record.outcome = outcome;
  record.result = '归档验收查询结果';
  record.supportResult = '支持';
  record.statusResult = '已启用';
  record.durationMillis = 7;
  return record;
}

export async function archiveNativeFailure(action: () => Promise<void>): Promise<string> {
  try {
    await action();
    return '';
  } catch (error) {
    return error instanceof ArchiveFailure ? error.code : (error as Error).message;
  }
}

export class ArchiveNativeQaFixture {
  readonly context: common.ApplicationContext;
  readonly name: string;
  public time: number = 1800000000000;
  private storages: StartupArchiveRdbStorage[] = [];
  private repositories: StartupArchiveRepository[] = [];

  constructor(context: common.ApplicationContext, name: string) {
    if (!/^sa_archive_native_qa_[0-9]+_[0-9]+\.db$/.test(name)) {
      throw new Error('Refusing to access a non-QA archive database');
    }
    this.context = context;
    this.name = name;
  }

  async openStorage(): Promise<StartupArchiveRdbStorage> {
    const storage: StartupArchiveRdbStorage = await StartupArchiveRdbStorage.open(this.context, this.name);
    this.storages.push(storage);
    return storage;
  }

  async repository(): Promise<StartupArchiveRepository> {
    const repository: StartupArchiveRepository = new StartupArchiveRepository((): number => this.time);
    this.repositories.push(repository);
    await repository.attach(await this.openStorage());
    return repository;
  }

  async release(): Promise<void> {
    let failure: Error | undefined = undefined;
    for (const repository of this.repositories) {
      try {
        await repository.whenIdle();
        await repository.close();
      } catch (error) { failure = error as Error; }
    }
    this.repositories = [];
    for (const storage of this.storages) {
      try { await storage.close(); } catch (error) { failure = error as Error; }
    }
    this.storages = [];
    if (failure !== undefined) { throw failure; }
  }

  async reopen(): Promise<StartupArchiveRepository> {
    await this.release();
    return this.repository();
  }

  // Raw SDK access is deliberately available only after all production handles are closed.
  async withClosedDatabase(body: (store: relationalStore.RdbStore) => Promise<void>): Promise<void> {
    await this.release();
    const config: relationalStore.StoreConfig = { name: this.name,
      securityLevel: relationalStore.SecurityLevel.S1 };
    const store: relationalStore.RdbStore = await relationalStore.getRdbStore(this.context, config);
    try {
      await body(store);
    } finally {
      await store.close();
    }
  }

  async image(): Promise<ArchiveNativeSqlImage> {
    const image: ArchiveNativeSqlImage = new ArchiveNativeSqlImage();
    await this.withClosedDatabase(async (store: relationalStore.RdbStore): Promise<void> => {
      image.version = store.version;
      const rows: relationalStore.ResultSet = await store.querySql(
        `SELECT revision, operation, payload FROM ${ARCHIVE_STATE_TABLE} WHERE singleton = 1`);
      try {
        image.count = rows.rowCount;
        if (rows.goToFirstRow()) {
          image.revision = rows.getLong(rows.getColumnIndex('revision'));
          image.operation = rows.getString(rows.getColumnIndex('operation'));
          image.payload = rows.getString(rows.getColumnIndex('payload'));
        }
      } finally {
        rows.close();
      }
    });
    return image;
  }

  async seedRaw(payload: string, revision: number, operation: string): Promise<void> {
    await this.withClosedDatabase(async (store: relationalStore.RdbStore): Promise<void> => {
      await store.executeSql(ARCHIVE_CREATE_SQL);
      store.version = ARCHIVE_SCHEMA;
      await store.executeSql(`INSERT OR REPLACE INTO ${ARCHIVE_STATE_TABLE} ` +
        '(singleton, revision, operation, payload) VALUES (1, ?, ?, ?)', [revision, operation, payload]);
    });
  }

  async close(): Promise<void> {
    try {
      await this.release();
    } finally {
      await StartupArchiveRdbStorage.delete(this.context, this.name);
    }
  }
}

export async function withArchiveNativeQa(
  body: (fixture: ArchiveNativeQaFixture) => Promise<void>): Promise<void> {
  const context: common.ApplicationContext = abilityDelegatorRegistry.getAbilityDelegator()
    .getAppContext().getApplicationContext();
  archiveDatabaseSequence++;
  const name: string = `sa_archive_native_qa_${Date.now()}_${archiveDatabaseSequence}.db`;
  const fixture: ArchiveNativeQaFixture = new ArchiveNativeQaFixture(context, name);
  try {
    await body(fixture);
  } finally {
    await fixture.close();
  }
}
