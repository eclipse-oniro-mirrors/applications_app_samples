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
import { Scene } from '../model/RoomTypes';
import { AppDatabase } from './AppDatabase';

const SCOPE: string = 'SceneDao';
const TABLE: string = 'scene';
const COLUMNS: string[] = ['id', 'room_id', 'name', 'icon', 'sort_order'];

/**
 * Data access object for the scene table. Scene removal cascades to its
 * scene_step rows inside one transaction.
 */
export class SceneDao {
  /** Inserts one scene row. */
  static async insert(scene: Scene): Promise<void> {
    await AppDatabase.getStore().insert(TABLE, SceneDao.toValues(scene));
    AppLogger.info(SCOPE, `insert: id=${scene.id}, roomId=${scene.roomId}, name=${scene.name}`);
  }

  /** Updates the editable fields of an existing scene row. */
  static async update(scene: Scene): Promise<void> {
    const values: relationalStore.ValuesBucket = {
      'room_id': scene.roomId,
      'name': scene.name,
      'icon': scene.icon,
      'sort_order': scene.sortOrder
    };
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE);
    predicates.equalTo('id', scene.id);
    await AppDatabase.getStore().update(values, predicates);
    AppLogger.info(SCOPE, `update: id=${scene.id}, name=${scene.name}`);
  }

  /** Deletes a scene and its steps inside one transaction; rolls back on failure. */
  static async remove(sceneId: string): Promise<void> {
    const store: relationalStore.RdbStore = AppDatabase.getStore();
    store.beginTransaction();
    try {
      const stepPredicates: relationalStore.RdbPredicates =
        new relationalStore.RdbPredicates('scene_step');
      stepPredicates.equalTo('scene_id', sceneId);
      await store.delete(stepPredicates);

      const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE);
      predicates.equalTo('id', sceneId);
      await store.delete(predicates);
      store.commit();
      AppLogger.info(SCOPE, `remove: id=${sceneId} (steps cascaded)`);
    } catch (error) {
      store.rollBack();
      const detail: string = error instanceof Error ? error.message : 'Failed to delete scene';
      AppLogger.error(SCOPE, `remove rolled back: id=${sceneId}, reason=${detail}`);
      throw new Error(detail);
    }
  }

  /** Fetches one scene by id, or undefined when it does not exist. */
  static async get(sceneId: string): Promise<Scene | undefined> {
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE);
    predicates.equalTo('id', sceneId);
    const resultSet: relationalStore.ResultSet =
      await AppDatabase.getStore().query(predicates, COLUMNS);
    let scene: Scene | undefined = undefined;
    if (resultSet.goToNextRow()) {
      scene = SceneDao.fromRow(resultSet);
    }
    resultSet.close();
    return scene;
  }

  /** Lists scenes of one room ordered by sort order. */
  static async listByRoom(roomId: string): Promise<Scene[]> {
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE);
    predicates.equalTo('room_id', roomId);
    predicates.orderByAsc('sort_order');
    return SceneDao.queryList(predicates);
  }

  /** Lists all scenes ordered by room then sort order. */
  static async listAll(): Promise<Scene[]> {
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE);
    predicates.orderByAsc('room_id');
    predicates.orderByAsc('sort_order');
    return SceneDao.queryList(predicates);
  }

  /** Runs a query and maps every row to a Scene instance. */
  private static async queryList(predicates: relationalStore.RdbPredicates): Promise<Scene[]> {
    const resultSet: relationalStore.ResultSet =
      await AppDatabase.getStore().query(predicates, COLUMNS);
    const scenes: Scene[] = [];
    while (resultSet.goToNextRow()) {
      scenes.push(SceneDao.fromRow(resultSet));
    }
    resultSet.close();
    return scenes;
  }

  /** Maps a Scene instance to the insertable values bucket. */
  private static toValues(scene: Scene): relationalStore.ValuesBucket {
    const values: relationalStore.ValuesBucket = {
      'id': scene.id,
      'room_id': scene.roomId,
      'name': scene.name,
      'icon': scene.icon,
      'sort_order': scene.sortOrder
    };
    return values;
  }

  /** Maps the current row of a result set to a Scene instance. */
  private static fromRow(resultSet: relationalStore.ResultSet): Scene {
    const scene: Scene = new Scene();
    scene.id = resultSet.getString(resultSet.getColumnIndex('id'));
    scene.roomId = resultSet.getString(resultSet.getColumnIndex('room_id'));
    scene.name = resultSet.getString(resultSet.getColumnIndex('name'));
    scene.icon = resultSet.getString(resultSet.getColumnIndex('icon'));
    scene.sortOrder = resultSet.getLong(resultSet.getColumnIndex('sort_order'));
    return scene;
  }
}
