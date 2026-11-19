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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import {
  RdbManager,
  SQL_CREATE_TABLE,
  STORE_CONFIG,
  TABLE_NAME
} from '@ohos/base/src/main/ets/default/manager/RdbManager';

export default function rdbContractTest() {
  describe('LauncherRdbContractTest', () => {

    /**
     * @tc.name   testTableName0001
     * @tc.number SUB_LAUNCHER_ENTRY_RDB_0100
     * @tc.desc   Test the launcher database table name.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testTableName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(TABLE_NAME).assertEqual('launcher');
    })

    /**
     * @tc.name   testCreateTableSql0002
     * @tc.number SUB_LAUNCHER_ENTRY_RDB_0200
     * @tc.desc   Test the create-table SQL contains the table and primary key declaration.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCreateTableSql0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(SQL_CREATE_TABLE.includes('CREATE TABLE IF NOT EXISTS launcher')).assertTrue();
      expect(SQL_CREATE_TABLE.includes('id INTEGER PRIMARY KEY AUTOINCREMENT')).assertTrue();
    })

    /**
     * @tc.name   testCreateTableColumns0003
     * @tc.number SUB_LAUNCHER_ENTRY_RDB_0300
     * @tc.desc   Test the create-table SQL contains all grid layout columns.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testCreateTableColumns0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const columns: string[] = [
        'app_name', 'appIcon_id', 'container', 'type_id', 'card_id', 'card_name',
        'badge_number', 'module_name', 'bundle_name', 'ability_name', 'area', 'page', 'column', 'row'
      ];
      for (let i = 0; i < columns.length; i++) {
        expect(SQL_CREATE_TABLE.includes(columns[i])).assertTrue();
      }
    })

    /**
     * @tc.name   testStoreConfig0004
     * @tc.number SUB_LAUNCHER_ENTRY_RDB_0400
     * @tc.desc   Test the database file name and security level configuration.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testStoreConfig0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(STORE_CONFIG.name).assertEqual('launcher.db');
      expect(STORE_CONFIG.securityLevel !== undefined).assertTrue();
    })

    /**
     * @tc.name   testRdbManagerApi0005
     * @tc.number SUB_LAUNCHER_ENTRY_RDB_0500
     * @tc.desc   Test that the exported RdbManager exposes the expected database operations.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testRdbManagerApi0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(RdbManager !== undefined).assertTrue();
      expect(typeof RdbManager.initRdbConfig === 'function').assertTrue();
      expect(typeof RdbManager.insertData === 'function').assertTrue();
      expect(typeof RdbManager.queryLayoutInfo === 'function').assertTrue();
      expect(typeof RdbManager.insertItem === 'function').assertTrue();
      expect(typeof RdbManager.deleteItemByPosition === 'function').assertTrue();
    })

  })
}
