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
import { common } from '@kit.AbilityKit';
import { IDatabaseHelper } from './IDatabaseHelper';
import { CONNECT_DATABASE_NAME, DeviceLibraryField, SceneLibraryField, TableType, } from './TableConfig';
import { Logger } from '../utils/Logger';

const TAG = 'ConnectDatabaseHelperImpl';

/*
 * connect数据库支持类
 * */
export class ConnectDatabaseHelperImpl extends IDatabaseHelper {
  private static context?: common.BaseContext;
  /*
   * 当前版本应用对应的数据库版本号
   * */
  private static DATABASE_VERSION: number = 1;
  /*
   * 数据库配置信息（名称，加密登记）
   * */
  private static CONNECT_STORE_CONFIG: relationalStore.StoreConfig = {
    name: CONNECT_DATABASE_NAME, securityLevel: relationalStore.SecurityLevel.S1,
  };
  /*
   * 单例
   * */
  private static instance: ConnectDatabaseHelperImpl;

  private constructor() {
    super();
  }

  /*
   * 获取connect数据库支持类
   * */
  public static async getInstance(context: common.BaseContext = getContext()): Promise<ConnectDatabaseHelperImpl> {
    ConnectDatabaseHelperImpl.context = context;
    if (!ConnectDatabaseHelperImpl.instance) {
      Logger.info(TAG, 'ConnectDatabaseHelperImpl getInstance new & init dataTypeToSqlTable');
      ConnectDatabaseHelperImpl.instance = new ConnectDatabaseHelperImpl();
      ConnectDatabaseHelperImpl.instance.initConnectDatabaseHelperImpl();
    }
    if (ConnectDatabaseHelperImpl.instance.store == undefined) {
      Logger.info(TAG, 'ConnectDatabaseHelperImpl getInstance get store & init table');
      let res = await ConnectDatabaseHelperImpl.instance.getRdbStore();
      await ConnectDatabaseHelperImpl.instance.init();
    }
    Logger.info(TAG, 'ConnectDatabaseHelperImpl getInstance return');
    return ConnectDatabaseHelperImpl.instance;
  }

  /*
   * 获取RdbStore
   * */
  public async getRdbStore(): Promise<boolean> {
    let res = false;
    this.store = await relationalStore.getRdbStore(
      ConnectDatabaseHelperImpl.context ?? getContext(this) as common.UIAbilityContext,
      ConnectDatabaseHelperImpl.CONNECT_STORE_CONFIG);
    if (this.store != undefined) {
      Logger.info(TAG, 'ConnectDatabaseHelperImpl getRdbStore success');
      res = true;
    } else {
      Logger.info(TAG, 'ConnectDatabaseHelperImpl getRdbStore error');
      res = false;
    }
    return res;
  }

  /*
   * 初始化connect数据库
   * */
  public async init(): Promise<boolean> {
    if (this.store !== undefined) {
      Logger.info(TAG, 'ConnectDatabaseHelperImpl init this.store.version = ' + this.store.version);
      if (this.store.version == 0) { //若数据库版本为0
        if (!(await this.createTable())) { // 创建表
          Logger.info(TAG, 'ConnectDatabaseHelperImpl init createTable error');
          return false;
        }
      }
      return this.upgradeTable(this.store.version, ConnectDatabaseHelperImpl.DATABASE_VERSION); //数据库升级
    }
    Logger.info(TAG, 'ConnectDatabaseHelperImpl init error, this.store = undefined');
    return false;
  }

  /*
   * 创建表
   * */
  public async createTable(): Promise<boolean> {
    let res: boolean = true;
    if (this.store !== undefined) {
      this.store.version = 1; // 修改数据库版本号
      Logger.info(TAG, 'ConnectDatabaseHelperImpl createTable this.store.version = ' + this.store.version);
      res = await this.createDeviceLibraryTable();
      res = await this.createSceneLibraryTable() && res;
    } else {
      Logger.info(TAG, 'ConnectDatabaseHelperImpl createTable error,this.store = undefined');
      res = false;
    }
    Logger.info(TAG, 'ConnectDatabaseHelperImpl createTable res' + res);
    return res;
  }

  /*
   * 升级数据库
   * */
  public upgradeTable(startVersion: number, endVersion: number): boolean {
    if (startVersion === endVersion) {
      Logger.info(TAG, 'ConnectDatabaseHelperImpl upgradeTable startVersion == endVersion');
      return true;
    }
    return true;
  }

  /*
   * 初始化connect数据库支持类
   * */
  public initConnectDatabaseHelperImpl() {
    let deviceLibraryTab: string[] = [
      DeviceLibraryField.PID,
      DeviceLibraryField.VALUE
    ];
    this.dataTypeToSqlTable.set(TableType.DEVICE_LIBRARY, deviceLibraryTab);

    let sceneTable: string[] = [
      SceneLibraryField.SCENE_ID,
      SceneLibraryField.LANGUAGE,
      SceneLibraryField.VALUE,
    ];
    this.dataTypeToSqlTable.set(TableType.SCENE_LIBRARY, sceneTable);
  }


  /*
   * 通用建表
   * */
  private async createCommonTableByTableType(tableType: TableType): Promise<boolean> {
    if (!this.dataTypeToSqlTable.has(tableType)) {
      Logger.info(TAG, 'ConnectDatabaseHelperImpl createTableByTableType dataTypeToSqlTable no ' + tableType);
      return true;
    }
    let columns: Array<string> | undefined = this.dataTypeToSqlTable.get(tableType);
    let sql: string = 'create table if not exists ';
    let priKey: string = '';
    sql += tableType + '('; /*+ "id text primary key, "*/
    if (columns !== undefined) {
      for (let i = 0; i < columns.length; i++) {
        priKey += columns[i] + ',';
        sql += columns[i] + ' text not null,';
      }
    }
    priKey = priKey.substring(0, priKey.lastIndexOf(','));
    sql += 'primary key(' + priKey + ')';
    sql += ')';
    return await this.executeSql(sql);
  }

  /*
   * 创建设备库表
   * */
  private async createDeviceLibraryTable(): Promise<boolean> {
    if (!this.dataTypeToSqlTable.has(TableType.DEVICE_LIBRARY)) {
      Logger.info(TAG, 'ConnectDatabaseHelperImpl createSceneTable dataTypeToSqlTable no ' + TableType.SCENE_LIBRARY);
      return true;
    }
    let sql: string = 'create table if not exists ';
    sql += TableType.DEVICE_LIBRARY + '(' +
      DeviceLibraryField.PID + ' text primary key,' +
      DeviceLibraryField.VALUE + ' text not null)';
    return await this.executeSql(sql);
  }

  /*
   * 创建场景库表
   * */
  private async createSceneLibraryTable(): Promise<boolean> {
    if (!this.dataTypeToSqlTable.has(TableType.SCENE_LIBRARY)) {
      Logger.info(TAG, 'ConnectDatabaseHelperImpl createSceneTable dataTypeToSqlTable no ' + TableType.SCENE_LIBRARY);
      return true;
    }
    let sql: string = 'create table if not exists ';
    sql += TableType.SCENE_LIBRARY + '(' +
      SceneLibraryField.SCENE_ID + ' text not null,' +
      SceneLibraryField.LANGUAGE + ' text not null,' +
      SceneLibraryField.VALUE + ' text not null,' + 'primary key(' + SceneLibraryField.SCENE_ID + ',' +
      SceneLibraryField.LANGUAGE + ')' + ')';
    return await this.executeSql(sql);
  }
}