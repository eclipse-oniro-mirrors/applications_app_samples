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

import { relationalStore } from '@kit.ArkData';
import { AppLogger } from 'common';
import { IrCode, IrProtocol } from 'ircore';
import { AppDatabase } from './AppDatabase';

const SCOPE: string = 'IrCodeDao';
const TABLE: string = 'ir_code';
const COLUMNS: string[] = [
  'id', 'protocol', 'frequency_hz', 'payload', 'repeat_count', 'source', 'license',
  'brand', 'model', 'key_semantic', 'checksum'
];

/**
 * Data access object for the ir_code table that stores compiled IR waveforms
 * (or protocol parameters) referenced by keys.
 */
export class IrCodeDao {
  /** Inserts one IR code row. */
  static async insert(code: IrCode): Promise<void> {
    await AppDatabase.getStore().insert(TABLE, IrCodeDao.toValues(code));
    AppLogger.info(SCOPE, `insert: id=${code.id}, protocol=${code.protocol}`);
  }

  /** Inserts several IR code rows sequentially; stops on the first failure. */
  static async insertMany(codes: IrCode[]): Promise<void> {
    const store: relationalStore.RdbStore = AppDatabase.getStore();
    for (let i = 0; i < codes.length; i++) {
      await store.insert(TABLE, IrCodeDao.toValues(codes[i]));
    }
    AppLogger.info(SCOPE, `insertMany: count=${codes.length}`);
  }

  /** Inserts the code when new and updates it otherwise. */
  static async upsert(code: IrCode): Promise<void> {
    const existing: IrCode | undefined = await IrCodeDao.get(code.id);
    if (existing === undefined) {
      await IrCodeDao.insert(code);
      return;
    }
    const values: relationalStore.ValuesBucket = {
      'protocol': code.protocol,
      'frequency_hz': code.frequencyHz,
      'payload': code.payload,
      'repeat_count': code.repeatCount,
      'source': code.source,
      'license': code.license,
      'brand': code.brand,
      'model': code.model,
      'key_semantic': code.keySemantic,
      'checksum': code.checksum
    };
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE);
    predicates.equalTo('id', code.id);
    await AppDatabase.getStore().update(values, predicates);
    AppLogger.info(SCOPE, `upsert: updated id=${code.id}`);
  }

  /** Fetches one IR code by id, or undefined when it does not exist. */
  static async get(id: string): Promise<IrCode | undefined> {
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE);
    predicates.equalTo('id', id);
    const resultSet: relationalStore.ResultSet =
      await AppDatabase.getStore().query(predicates, COLUMNS);
    let code: IrCode | undefined = undefined;
    if (resultSet.goToNextRow()) {
      code = IrCodeDao.fromRow(resultSet);
    }
    resultSet.close();
    return code;
  }

  /** Lists IR codes by exact ids; returns them in database order. */
  static async listByIds(ids: string[]): Promise<IrCode[]> {
    if (ids.length === 0) {
      return [];
    }
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE);
    predicates.in('id', ids);
    return IrCodeDao.queryList(predicates);
  }

  /** Lists all IR codes ordered by brand, model and key semantic. */
  static async listAll(): Promise<IrCode[]> {
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE);
    predicates.orderByAsc('brand');
    predicates.orderByAsc('model');
    predicates.orderByAsc('key_semantic');
    return IrCodeDao.queryList(predicates);
  }

  /** Lists all IR codes of one brand ordered by model and key semantic. */
  static async listByBrand(brand: string): Promise<IrCode[]> {
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE);
    predicates.equalTo('brand', brand);
    predicates.orderByAsc('model');
    predicates.orderByAsc('key_semantic');
    return IrCodeDao.queryList(predicates);
  }

  /** Runs a query and maps every row to an IrCode instance. */
  private static async queryList(
    predicates: relationalStore.RdbPredicates): Promise<IrCode[]> {
    const resultSet: relationalStore.ResultSet =
      await AppDatabase.getStore().query(predicates, COLUMNS);
    const codes: IrCode[] = [];
    while (resultSet.goToNextRow()) {
      codes.push(IrCodeDao.fromRow(resultSet));
    }
    resultSet.close();
    return codes;
  }

  /** Maps an IrCode instance to the insertable values bucket. */
  private static toValues(code: IrCode): relationalStore.ValuesBucket {
    const values: relationalStore.ValuesBucket = {
      'id': code.id,
      'protocol': code.protocol,
      'frequency_hz': code.frequencyHz,
      'payload': code.payload,
      'repeat_count': code.repeatCount,
      'source': code.source,
      'license': code.license,
      'brand': code.brand,
      'model': code.model,
      'key_semantic': code.keySemantic,
      'checksum': code.checksum
    };
    return values;
  }

  /** Maps the current row of a result set to an IrCode instance. */
  private static fromRow(resultSet: relationalStore.ResultSet): IrCode {
    const code: IrCode = new IrCode();
    code.id = resultSet.getString(resultSet.getColumnIndex('id'));
    code.protocol = resultSet.getString(resultSet.getColumnIndex('protocol')) as IrProtocol;
    code.frequencyHz = resultSet.getLong(resultSet.getColumnIndex('frequency_hz'));
    code.payload = resultSet.getString(resultSet.getColumnIndex('payload'));
    code.repeatCount = resultSet.getLong(resultSet.getColumnIndex('repeat_count'));
    code.source = resultSet.getString(resultSet.getColumnIndex('source'));
    code.license = resultSet.getString(resultSet.getColumnIndex('license'));
    code.brand = resultSet.getString(resultSet.getColumnIndex('brand'));
    code.model = resultSet.getString(resultSet.getColumnIndex('model'));
    code.keySemantic = resultSet.getString(resultSet.getColumnIndex('key_semantic'));
    code.checksum = resultSet.getString(resultSet.getColumnIndex('checksum'));
    return code;
  }
}
