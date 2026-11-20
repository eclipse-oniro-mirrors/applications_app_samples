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
import { SceneStep } from '../model/RoomTypes';
import { AppDatabase } from './AppDatabase';

const SCOPE: string = 'SceneStepDao';
const TABLE: string = 'scene_step';
const COLUMNS: string[] = [
  'id', 'scene_id', 'device_id', 'key_id', 'delay_ms', 'step_order', 'enabled'
];

/**
 * Data access object for the scene_step table. Scene steps are managed as a
 * whole per scene: replacement deletes and re-inserts all steps of the scene
 * inside one transaction.
 */
export class SceneStepDao {
  /** Inserts one scene step row. */
  static async insert(step: SceneStep): Promise<void> {
    await AppDatabase.getStore().insert(TABLE, SceneStepDao.toValues(step));
    AppLogger.info(SCOPE, `insert: id=${step.id}, sceneId=${step.sceneId}, order=${step.order}`);
  }

  /** Deletes one scene step row. */
  static async remove(stepId: string): Promise<void> {
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE);
    predicates.equalTo('id', stepId);
    await AppDatabase.getStore().delete(predicates);
    AppLogger.info(SCOPE, `remove: id=${stepId}`);
  }

  /** Lists steps of one scene in execution order. */
  static async listByScene(sceneId: string): Promise<SceneStep[]> {
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE);
    predicates.equalTo('scene_id', sceneId);
    predicates.orderByAsc('step_order');
    return SceneStepDao.queryList(predicates);
  }

  /**
   * Replaces every step of a scene with the given list inside one
   * transaction; rolls back completely on any failure.
   */
  static async replaceForScene(sceneId: string, steps: SceneStep[]): Promise<void> {
    const store: relationalStore.RdbStore = AppDatabase.getStore();
    store.beginTransaction();
    try {
      const predicates: relationalStore.RdbPredicates =
        new relationalStore.RdbPredicates(TABLE);
      predicates.equalTo('scene_id', sceneId);
      await store.delete(predicates);
      for (let i = 0; i < steps.length; i++) {
        await store.insert(TABLE, SceneStepDao.toValues(steps[i]));
      }
      store.commit();
      AppLogger.info(SCOPE, `replaceForScene: sceneId=${sceneId}, steps=${steps.length}`);
    } catch (error) {
      store.rollBack();
      const detail: string = error instanceof Error ? error.message : 'Failed to replace scene steps';
      AppLogger.error(SCOPE, `replaceForScene rolled back: sceneId=${sceneId}, reason=${detail}`);
      throw new Error(detail);
    }
  }

  /** Lists all steps ordered by scene then execution order. */
  static async listAll(): Promise<SceneStep[]> {
    const predicates: relationalStore.RdbPredicates = new relationalStore.RdbPredicates(TABLE);
    predicates.orderByAsc('scene_id');
    predicates.orderByAsc('step_order');
    return SceneStepDao.queryList(predicates);
  }

  /** Runs a query and maps every row to a SceneStep instance. */
  private static async queryList(
    predicates: relationalStore.RdbPredicates): Promise<SceneStep[]> {
    const resultSet: relationalStore.ResultSet =
      await AppDatabase.getStore().query(predicates, COLUMNS);
    const steps: SceneStep[] = [];
    while (resultSet.goToNextRow()) {
      steps.push(SceneStepDao.fromRow(resultSet));
    }
    resultSet.close();
    return steps;
  }

  /** Maps a SceneStep instance to the insertable values bucket. */
  private static toValues(step: SceneStep): relationalStore.ValuesBucket {
    const values: relationalStore.ValuesBucket = {
      'id': step.id,
      'scene_id': step.sceneId,
      'device_id': step.deviceId,
      'key_id': step.keyId,
      'delay_ms': step.delayMs,
      'step_order': step.order,
      'enabled': step.enabled ? 1 : 0
    };
    return values;
  }

  /** Maps the current row of a result set to a SceneStep instance. */
  private static fromRow(resultSet: relationalStore.ResultSet): SceneStep {
    const step: SceneStep = new SceneStep();
    step.id = resultSet.getString(resultSet.getColumnIndex('id'));
    step.sceneId = resultSet.getString(resultSet.getColumnIndex('scene_id'));
    step.deviceId = resultSet.getString(resultSet.getColumnIndex('device_id'));
    step.keyId = resultSet.getString(resultSet.getColumnIndex('key_id'));
    step.delayMs = resultSet.getLong(resultSet.getColumnIndex('delay_ms'));
    step.order = resultSet.getLong(resultSet.getColumnIndex('step_order'));
    step.enabled = resultSet.getLong(resultSet.getColumnIndex('enabled')) === 1;
    return step;
  }
}
