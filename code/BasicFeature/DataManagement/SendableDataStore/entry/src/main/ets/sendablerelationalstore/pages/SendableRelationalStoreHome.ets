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

import { common } from '@kit.AbilityKit';
import { relationalStore } from '@kit.ArkData';
import { BusinessError } from '@kit.BasicServicesKit';
import { Logger } from '../../utils/Logger';
import { SendableRdbHelper } from '../SendableRdbHelper';
import { TableSchema, SchemaField, DataType } from '../../models/DataModels';

@Entry
@Component
struct SendableRelationalStoreHome {
  @State private result: ResourceStr = $r('app.string.initial_result');
  private helper: SendableRdbHelper | null = null;

  aboutToAppear(): void {
    const context = this.getUIContext().getHostContext() as common.UIAbilityContext;
    this.helper = new SendableRdbHelper(context);
  }

  aboutToDisappear(): void {
    if (this.helper !== null) {
      this.helper.release();
      this.helper = null;
    }
  }

  @Builder
  sectionTitle(title: Resource): void {
    Text(title)
      .fontSize(18)
      .fontWeight(FontWeight.Medium)
      .fontColor($r('app.color.primary_text'))
      .width('100%')
      .margin({ top: 8 })
  }

  @Builder
  actionButton(label: Resource, action: () => void): void {
    Button(label)
      .width('100%')
      .height(46)
      .fontSize(14)
      .onClick(action)
  }

  @Builder
  buttonRow(firstLabel: Resource, firstAction: () => void, secondLabel: Resource, secondAction: () => void): void {
    Row({ space: 8 }) {
      Button(firstLabel)
        .layoutWeight(1)
        .height(44)
        .fontSize(13)
        .onClick(firstAction)
      Button(secondLabel)
        .layoutWeight(1)
        .height(44)
        .fontSize(13)
        .onClick(secondAction)
    }
    .width('100%')
  }

  build(): void {
    Column({ space: 12 }) {
      Text($r('app.string.relational_title'))
        .fontSize(26)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.primary_text'))
        .id('rdb_page_title')
      Text($r('app.string.relational_description'))
        .fontSize(14)
        .fontColor($r('app.color.secondary_text'))
      Scroll() {
        Column({ space: 10 }) {
          this.sectionTitle($r('app.string.section_rdb'))
          this.actionButton($r('app.string.initialize_rdb'),
            (): void => this.runAsync((): Promise<string> => this.getHelper().initialize()))
          this.actionButton($r('app.string.close_rdb'),
            (): void => this.runAsync((): Promise<string> => this.getHelper().closeStore()))

          this.sectionTitle($r('app.string.section_conversion'))
          this.actionButton($r('app.string.convert_insert_query'),
            (): void => this.runAsync((): Promise<string> => this.getHelper().convertInsertAndQuery()))
          this.actionButton($r('app.string.convert_values'),
            (): void => this.runSync((): string => this.getHelper().convertValues()))
          this.actionButton($r('app.string.convert_asset'),
            (): void => this.runSync((): string => this.getHelper().convertAsset()))

          this.sectionTitle($r('app.string.section_multi_table'))
          this.buttonRow($r('app.string.create_table'),
            (): void => this.runAsync((): Promise<string> => {
              const field: SchemaField = {
                name: 'title',
                dataType: DataType.STRING,
                required: true,
                defaultValue: '',
                maxLength: 256,
                min: 0,
                max: 256
              };
              const field2: SchemaField = {
                name: 'score',
                dataType: DataType.NUMBER,
                required: false,
                defaultValue: 0,
                maxLength: 0,
                min: 0,
                max: 100
              };
              const fields: SchemaField[] = [field, field2];
              const schema: TableSchema = {
                tableName: 'extra_table',
                fields: fields,
                primaryKeys: ['id'],
                indexes: []
              };
              return this.getHelper().createTable('extra_table', schema);
            }),
            $r('app.string.drop_table'),
            (): void => this.runAsync((): Promise<string> => this.getHelper().dropTable('extra_table')))
          this.buttonRow($r('app.string.list_tables'),
            (): void => this.runSync((): string => this.getHelper().listTables()),
            $r('app.string.has_table'),
            (): void => this.runSync((): string =>
              `hasTable('extra_table')=${this.getHelper().hasTable('extra_table')}`))

          this.sectionTitle($r('app.string.section_crud'))
          this.buttonRow($r('app.string.batch_insert'),
            (): void => this.runAsync((): Promise<string> => {
              const b1: relationalStore.ValuesBucket = { name: 'batch_user_1', age: 20, active: true };
              const b2: relationalStore.ValuesBucket = { name: 'batch_user_2', age: 25, active: false };
              const b3: relationalStore.ValuesBucket = { name: 'batch_user_3', age: 30, active: true };
              const buckets: relationalStore.ValuesBucket[] = [b1, b2, b3];
              return this.getHelper().batchInsert('sendable_sample', buckets);
            }),
            $r('app.string.query_all'),
            (): void => this.runAsync((): Promise<string> =>
              this.getHelper().queryAll('sendable_sample')))
          this.buttonRow($r('app.string.query_all_sync'),
            (): void => this.runSync((): string =>
              this.getHelper().queryAllSync('sendable_sample')),
            $r('app.string.update_row'),
            (): void => this.runAsync((): Promise<string> => {
              const bucket: relationalStore.ValuesBucket = { age: 99 };
              const pred = new relationalStore.RdbPredicates('sendable_sample');
              pred.equalTo('name', 'batch_user_1');
              return this.getHelper().update('sendable_sample', bucket, pred);
            }))
          this.buttonRow($r('app.string.update_row_sync'),
            (): void => this.runSync((): string => {
              const bucket: relationalStore.ValuesBucket = { active: false };
              const pred = new relationalStore.RdbPredicates('sendable_sample');
              pred.equalTo('name', 'batch_user_2');
              return this.getHelper().updateSync('sendable_sample', bucket, pred);
            }),
            $r('app.string.delete_row'),
            (): void => this.runAsync((): Promise<string> => {
              const pred = new relationalStore.RdbPredicates('sendable_sample');
              pred.equalTo('name', 'batch_user_3');return this.getHelper().deleteByPredicates('sendable_sample', pred);
            }))
          this.buttonRow($r('app.string.delete_row_sync'),
            (): void => this.runSync((): string => {
              const pred = new relationalStore.RdbPredicates('sendable_sample');
              pred.equalTo('name', 'batch_user_3');
              return this.getHelper().deleteByPredicatesSync('sendable_sample', pred);
            }),
            $r('app.string.convert_batch_buckets'),
            (): void => this.runSync((): string => {
              const b1: relationalStore.ValuesBucket = { name: 'conv_1', age: 10, active: true };
              const b2: relationalStore.ValuesBucket = { name: 'conv_2', age: 20, active: false };
              return this.getHelper().convertBatchBuckets([b1, b2]);
            }))
          this.buttonRow($r('app.string.convert_result_json'),
            (): void => this.runAsync((): Promise<string> =>
              this.getHelper().convertResultSetToJSON('sendable_sample')),
            $r('app.string.convert_result_json_sync'),
            (): void => this.runSync((): string =>
              this.getHelper().convertResultSetToJSONSync('sendable_sample')))

          this.sectionTitle($r('app.string.section_transaction'))
          this.buttonRow($r('app.string.begin_transaction'),
            (): void => this.runAsync((): Promise<string> => this.getHelper().beginTransaction()),
            $r('app.string.commit_transaction'),
            (): void => this.runAsync((): Promise<string> => this.getHelper().commitTransaction()))
          this.buttonRow($r('app.string.rollback_transaction'),
            (): void => this.runAsync((): Promise<string> => this.getHelper().rollbackTransaction()),
            $r('app.string.check_rdb_initialized'),
            (): void => this.runSync((): string =>
              `isInitialized=${this.getHelper().isInitialized()}, ` +
              `transactionActive=${this.getHelper().isTransactionActive()}`))

          this.sectionTitle($r('app.string.section_sql'))
          this.buttonRow($r('app.string.execute_raw_sql'),
            (): void => this.runAsync((): Promise<string> =>
              this.getHelper().executeRawSQL(
                "INSERT INTO sendable_sample (name, age, active) VALUES ('sql_user', 33, 1)")),
            $r('app.string.execute_raw_sql_sync'),
            (): void => this.runSync((): string =>
              this.getHelper().executeRawSQLSync(
                "UPDATE sendable_sample SET age=34 WHERE name='sql_user'")))
          this.buttonRow($r('app.string.query_by_sql'),
            (): void => this.runAsync((): Promise<string> =>
              this.getHelper().queryBySQL('SELECT * FROM sendable_sample WHERE age > ?', ['25'])),
            $r('app.string.query_by_sql_sync'),
            (): void => this.runSync((): string =>
              this.getHelper().queryBySQLSync('SELECT COUNT(*) FROM sendable_sample', [])))

          this.sectionTitle($r('app.string.section_rdb_statistics'))
          this.actionButton($r('app.string.show_rdb_statistics'),
            (): void => this.runSync((): string => this.getHelper().getStatistics()))
          this.buttonRow($r('app.string.reset_rdb_statistics'),
            (): void => this.runSync((): string => this.getHelper().resetStatistics()),
            $r('app.string.reinitialize_rdb'),
            (): void => this.runAsync((): Promise<string> => this.getHelper().reinitialize()))
        }
        .width('100%')
      }
      .layoutWeight(1)
      .width('100%')
      .align(Alignment.Top)
      Text($r('app.string.result_title'))
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .width('100%')
      Scroll() {
        Text(this.result)
          .fontSize(13)
          .fontColor($r('app.color.primary_text'))
          .width('100%')
      }
      .height(150)
      .width('100%')
      .padding(12)
      .backgroundColor($r('app.color.result_background'))
      .borderRadius(8)
    }
    .width('100%')
    .height('100%')
    .padding(16)
    .backgroundColor($r('app.color.page_background'))
  }

  private getHelper(): SendableRdbHelper {
    if (this.helper === null) {
      throw new Error('Relational store page is not ready');
    }
    return this.helper;
  }

  private runAsync(action: () => Promise<string>): void {
    action().then((message: string): void => {
      this.result = message;
    }).catch((error: BusinessError): void => {
      this.showError(error);
    });
  }

  private runSync(action: () => string): void {
    try {
      this.result = action();
    } catch (error) {
      this.showError(error as BusinessError);
    }
  }

  private showError(error: BusinessError): void {
    const message = `${error.name}: ${error.message}; code=${error.code}`;
    this.result = message;
    Logger.error(message);
  }
}
