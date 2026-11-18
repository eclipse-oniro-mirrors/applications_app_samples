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
import { ValuesBucket } from '@kit.ArkData';
import { TableType } from './TableConfig';
import { GenericValues } from './GenericValues';
import { Logger } from '../utils/Logger';

const TAG = 'IDatabaseHelper';

/*
 * 数据库支持类
 * */
export class IDatabaseHelper {
  /*
   * 表信息
   * */
  public dataTypeToSqlTable: Map<TableType, Array<string>> = new Map([]);
  /*
   * 获取到的RdbStore
   * */
  protected store: relationalStore.RdbStore | undefined = undefined;

  /*
   * 执行sql语句
   * */
  public async executeSql(sqlStr: string): Promise<boolean> {
    let res: boolean = false;
    if (this.store !== undefined) {
      await (this.store as relationalStore.RdbStore).executeSql(sqlStr).then(() => {
        res = true;
        Logger.info(TAG, 'IDatabaseHelper executeSql res');
      }).catch(() => {
        res = false;
        Logger.info(TAG, 'IDatabaseHelper executeSql error');
      });
    }
    return res;
  }

  /*
   * 插入
   * */
  public async insert(type: TableType, value: ValuesBucket): Promise<boolean> {
    let res: boolean = false;
    if (this.store !== undefined) {
      await (this.store as relationalStore.RdbStore).insert(type, value).then((data) => {
        res = true;
        Logger.info(TAG, 'IDatabaseHelper insert res: ' + data);
      }).catch(() => {
        res = false;
        Logger.info(TAG, 'IDatabaseHelper insert error');
      });
    }
    return res;
  }

  /*
   * 插入多条数据
   * */
  public async batchInsert(type: TableType, values: Array<ValuesBucket>): Promise<boolean> {
    let res: boolean = false;
    if (this.store !== undefined) {
      await (this.store as relationalStore.RdbStore).batchInsert(type, values).then((data) => {
        res = true;
        Logger.info(TAG, 'IDatabaseHelper batchInsert res: ' + data);
      }).catch(() => {
        res = false;
        Logger.info(TAG, 'IDatabaseHelper batchInsert error');
      });
    }
    return res;
  }

  /*
   * 删除
   * */
  public async delete(predicates: relationalStore.RdbPredicates): Promise<boolean> {
    let res: boolean = false;
    if (this.store !== undefined) {
      await (this.store as relationalStore.RdbStore).delete(predicates).then((data) => {
        res = true;
        Logger.info(TAG, 'IDatabaseHelper delete res: ' + data);
      }).catch(() => {
        res = false;
        Logger.info(TAG, 'IDatabaseHelper delete error');
      });
    }
    return res;
  }

  /*
   * 更新
   * */
  public async update(modifyValues: ValuesBucket, predicates: relationalStore.RdbPredicates): Promise<boolean> {
    let res: boolean = false;
    if (this.store !== undefined) {
      await (this.store as relationalStore.RdbStore).update(modifyValues, predicates).then((data) => {
        res = true;
        Logger.info(TAG, 'IDatabaseHelper update res: ' + data);
      }).catch(() => {
        res = false;
        Logger.info(TAG, 'IDatabaseHelper update error');
      });
    }
    return res;
  }

  /*
   * 查询
   * */
  public async query(type: TableType): Promise<Array<GenericValues>> {
    let predicates = new relationalStore.RdbPredicates(type);
    let res: GenericValues[] = [];
    if (this.store !== undefined) {
      await (this.store as relationalStore.RdbStore).query(predicates).then((resultSet: relationalStore.ResultSet) => {
        Logger.info(TAG, 'IDatabaseHelper query res: ');
        while (resultSet.goToNextRow()) {
          let columns: Array<string> | undefined = this.dataTypeToSqlTable.get(type);
          let item = new GenericValues();
          if (columns !== undefined) {
            Logger.info(TAG, 'IDatabaseHelper query columns:' + columns.toString());
            for (let c of columns) {
              item.put(c, resultSet.getString(resultSet.getColumnIndex(c)));
            }
            res.push(item);
          }
        }
        resultSet.close();
      });
    }
    Logger.info(TAG, 'IDatabaseHelper query res :length=' + res.length);
    return res;
  }

  public getData(resultSet: relationalStore.ResultSet, res: GenericValues[], type: TableType) {
    let item = new GenericValues();
    let mcolumns: Array<string> | undefined = this.dataTypeToSqlTable.get(type);
    if (mcolumns !== undefined) {
      Logger.info(TAG, 'IDatabaseHelper query columns:' + mcolumns.toString());
      for (let c of mcolumns) {
        item.put(c, resultSet.getString(resultSet.getColumnIndex(c)));
      }
      res.push(item);
    }
  }

  /*
   * 根据条件查询
   * */
  public async queryByCondition(type: TableType, predicates: relationalStore.RdbPredicates,
    columns?: Array<string>): Promise<Array<GenericValues>> {
    let res: GenericValues[] = [];
    if (this.store !== undefined) {
      let resultSet: relationalStore.ResultSet =
        await (this.store as relationalStore.RdbStore).query(predicates, columns);
      Logger.info(TAG, 'IDatabaseHelper queryByCondition res: ');
      resultSet.goToNextRow();
      this.getData(resultSet, res, type);
      while (resultSet.goToNextRow()) {
        this.getData(resultSet, res, type);
      }
      resultSet.close();
    }
    Logger.info(TAG, 'IDatabaseHelper queryByCondition res :length=' + res.length);
    return res;
  }
}