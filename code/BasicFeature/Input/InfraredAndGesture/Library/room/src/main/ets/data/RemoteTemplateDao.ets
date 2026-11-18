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
import { DeviceType, RemoteTemplate } from '../model/RoomTypes';
import { AppDatabase } from './AppDatabase';

const SCOPE: string = 'RemoteTemplateDao';
const TABLE: string = 'remote_template';
const COLUMNS: string[] = ['id', 'device_type', 'name', 'layout', 'builtin'];

/** Data access object for the remote_template table (remote layouts). */
export class RemoteTemplateDao {
  /** Inserts one template row. */
  static async insert(template: RemoteTemplate): Promise<void> {
    await AppDatabase.getStore().insert(TABLE, RemoteTemplateDao.toValues(template));
    AppLogger.info(SCOPE, `insert: id=${template.id}, type=${template.deviceType}`);
  }

  /** Inserts the template when new and updates it otherwise. */
  static async upsert(template: RemoteTemplate): Promise<void> {
    const existing: RemoteTemplate | undefined = await RemoteTemplateDao.get(template.id);
    if (existing === undefined) {
      await RemoteTemplateDao.insert(template);
      return;
    }
    const values: relationalStore.ValuesBucket = {
      'device_type': template.deviceType,
      'name': template.name,
      'layout': template.layout,
      'builtin': template.builtin ? 1 : 0
    };
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE);
    predicates.equalTo('id', template.id);
    await AppDatabase.getStore().update(values, predicates);
    AppLogger.info(SCOPE, `upsert: updated id=${template.id}`);
  }

  /** Fetches one template by id, or undefined when it does not exist. */
  static async get(id: string): Promise<RemoteTemplate | undefined> {
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE);
    predicates.equalTo('id', id);
    const resultSet: relationalStore.ResultSet =
      await AppDatabase.getStore().query(predicates, COLUMNS);
    let template: RemoteTemplate | undefined = undefined;
    if (resultSet.goToNextRow()) {
      template = RemoteTemplateDao.fromRow(resultSet);
    }
    resultSet.close();
    return template;
  }

  /** Lists all templates ordered by device type then name. */
  static async list(): Promise<RemoteTemplate[]> {
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE);
    predicates.orderByAsc('device_type');
    predicates.orderByAsc('name');
    return RemoteTemplateDao.queryList(predicates);
  }

  /** Lists templates of one device type ordered by name. */
  static async listByType(type: DeviceType): Promise<RemoteTemplate[]> {
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE);
    predicates.equalTo('device_type', type);
    predicates.orderByAsc('name');
    return RemoteTemplateDao.queryList(predicates);
  }

  /** Runs a query and maps every row to a RemoteTemplate instance. */
  private static async queryList(
    predicates: relationalStore.RdbPredicates): Promise<RemoteTemplate[]> {
    const resultSet: relationalStore.ResultSet =
      await AppDatabase.getStore().query(predicates, COLUMNS);
    const templates: RemoteTemplate[] = [];
    while (resultSet.goToNextRow()) {
      templates.push(RemoteTemplateDao.fromRow(resultSet));
    }
    resultSet.close();
    return templates;
  }

  /** Maps a RemoteTemplate instance to the insertable values bucket. */
  private static toValues(template: RemoteTemplate): relationalStore.ValuesBucket {
    const values: relationalStore.ValuesBucket = {
      'id': template.id,
      'device_type': template.deviceType,
      'name': template.name,
      'layout': template.layout,
      'builtin': template.builtin ? 1 : 0
    };
    return values;
  }

  /** Maps the current row of a result set to a RemoteTemplate instance. */
  private static fromRow(resultSet: relationalStore.ResultSet): RemoteTemplate {
    const template: RemoteTemplate = new RemoteTemplate();
    template.id = resultSet.getString(resultSet.getColumnIndex('id'));
    template.deviceType =
      resultSet.getString(resultSet.getColumnIndex('device_type')) as DeviceType;
    template.name = resultSet.getString(resultSet.getColumnIndex('name'));
    template.layout = resultSet.getString(resultSet.getColumnIndex('layout'));
    template.builtin = resultSet.getLong(resultSet.getColumnIndex('builtin')) === 1;
    return template;
  }
}
