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
import { Room } from '../model/RoomTypes';
import { AppDatabase } from './AppDatabase';

const SCOPE: string = 'RoomDao';
const TABLE: string = 'room';
const COLUMNS: string[] = ['id', 'name', 'note', 'sort_order', 'created_at', 'updated_at'];

/**
 * Data access object for the room table. All methods are static and go
 * through the shared {@link AppDatabase} store; callers never touch SQL
 * directly for rooms.
 */
export class RoomDao {
  /** Inserts one room row. */
  static async insert(room: Room): Promise<void> {
    const values: relationalStore.ValuesBucket = {
      'id': room.id,
      'name': room.name,
      'note': room.note,
      'sort_order': room.sortOrder,
      'created_at': room.createdAt,
      'updated_at': room.updatedAt
    };
    await AppDatabase.getStore().insert(TABLE, values);
    AppLogger.info(SCOPE, `insert: id=${room.id}, name=${room.name}`);
  }

  /** Updates name/note/sort for an existing room row. */
  static async update(room: Room): Promise<void> {
    const values: relationalStore.ValuesBucket = {
      'name': room.name,
      'note': room.note,
      'sort_order': room.sortOrder,
      'updated_at': room.updatedAt
    };
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE);
    predicates.equalTo('id', room.id);
    await AppDatabase.getStore().update(values, predicates);
    AppLogger.info(SCOPE, `update: id=${room.id}, name=${room.name}`);
  }

  /**
   * Deletes a room together with every dependent device, key, scene and step
   * inside one transaction, and returns the ids of the removed devices.
   */
  static async remove(roomId: string): Promise<string[]> {
    const store: relationalStore.RdbStore = AppDatabase.getStore();
    const deviceIds: string[] = [];
    store.beginTransaction();
    try {
      const devicePredicates: relationalStore.RdbPredicates =
        new relationalStore.RdbPredicates('device');
      devicePredicates.equalTo('room_id', roomId);
      const deviceRows: relationalStore.ResultSet =
        await store.query(devicePredicates, ['id']);
      while (deviceRows.goToNextRow()) {
        deviceIds.push(deviceRows.getString(deviceRows.getColumnIndex('id')));
      }
      deviceRows.close();

      const sceneIds: string[] = [];
      const scenePredicates: relationalStore.RdbPredicates =
        new relationalStore.RdbPredicates('scene');
      scenePredicates.equalTo('room_id', roomId);
      const sceneRows: relationalStore.ResultSet =
        await store.query(scenePredicates, ['id']);
      while (sceneRows.goToNextRow()) {
        sceneIds.push(sceneRows.getString(sceneRows.getColumnIndex('id')));
      }
      sceneRows.close();

      if (deviceIds.length > 0) {
        const keyPredicates: relationalStore.RdbPredicates =
          new relationalStore.RdbPredicates('key');
        keyPredicates.in('device_id', deviceIds);
        await store.delete(keyPredicates);

        const statePredicates: relationalStore.RdbPredicates =
          new relationalStore.RdbPredicates('device_expected_state');
        statePredicates.in('device_id', deviceIds);
        await store.delete(statePredicates);

        const deviceStepPredicates: relationalStore.RdbPredicates =
          new relationalStore.RdbPredicates('scene_step');
        deviceStepPredicates.in('device_id', deviceIds);
        await store.delete(deviceStepPredicates);
      }
      if (sceneIds.length > 0) {
        const sceneStepPredicates: relationalStore.RdbPredicates =
          new relationalStore.RdbPredicates('scene_step');
        sceneStepPredicates.in('scene_id', sceneIds);
        await store.delete(sceneStepPredicates);
      }

      const sceneDeletePredicates: relationalStore.RdbPredicates =
        new relationalStore.RdbPredicates('scene');
      sceneDeletePredicates.equalTo('room_id', roomId);
      await store.delete(sceneDeletePredicates);

      const deviceDeletePredicates: relationalStore.RdbPredicates =
        new relationalStore.RdbPredicates('device');
      deviceDeletePredicates.equalTo('room_id', roomId);
      await store.delete(deviceDeletePredicates);

      const roomPredicates: relationalStore.RdbPredicates =
        new relationalStore.RdbPredicates(TABLE);
      roomPredicates.equalTo('id', roomId);
      await store.delete(roomPredicates);
      store.commit();
      AppLogger.info(SCOPE, `remove: id=${roomId}, cascadeDevices=${deviceIds.length}`);
    } catch (error) {
      store.rollBack();
      const detail: string = error instanceof Error ? error.message : 'Failed to delete room';
      AppLogger.error(SCOPE, `remove rolled back: id=${roomId}, reason=${detail}`);
      throw new Error(detail);
    }
    return deviceIds;
  }

  /** Fetches one room by id, or undefined when it does not exist. */
  static async get(roomId: string): Promise<Room | undefined> {
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE);
    predicates.equalTo('id', roomId);
    const resultSet: relationalStore.ResultSet =
      await AppDatabase.getStore().query(predicates, COLUMNS);
    let room: Room | undefined = undefined;
    if (resultSet.goToNextRow()) {
      room = RoomDao.fromRow(resultSet);
    }
    resultSet.close();
    return room;
  }

  /** Lists all rooms ordered by sort order then creation time. */
  static async list(): Promise<Room[]> {
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE);
    predicates.orderByAsc('sort_order');
    predicates.orderByAsc('created_at');
    const resultSet: relationalStore.ResultSet =
      await AppDatabase.getStore().query(predicates, COLUMNS);
    const rooms: Room[] = [];
    while (resultSet.goToNextRow()) {
      rooms.push(RoomDao.fromRow(resultSet));
    }
    resultSet.close();
    return rooms;
  }

  /** Returns the total number of room rows. */
  static async count(): Promise<number> {
    const resultSet: relationalStore.ResultSet =
      await AppDatabase.getStore().querySql(`SELECT COUNT(*) AS cnt FROM ${TABLE}`);
    let count: number = 0;
    if (resultSet.goToNextRow()) {
      count = resultSet.getLong(resultSet.getColumnIndex('cnt'));
    }
    resultSet.close();
    return count;
  }

  /** Maps the current row of a result set to a Room instance. */
  private static fromRow(resultSet: relationalStore.ResultSet): Room {
    const room: Room = new Room();
    room.id = resultSet.getString(resultSet.getColumnIndex('id'));
    room.name = resultSet.getString(resultSet.getColumnIndex('name'));
    room.note = resultSet.getString(resultSet.getColumnIndex('note'));
    room.sortOrder = resultSet.getLong(resultSet.getColumnIndex('sort_order'));
    room.createdAt = resultSet.getLong(resultSet.getColumnIndex('created_at'));
    room.updatedAt = resultSet.getLong(resultSet.getColumnIndex('updated_at'));
    return room;
  }
}
