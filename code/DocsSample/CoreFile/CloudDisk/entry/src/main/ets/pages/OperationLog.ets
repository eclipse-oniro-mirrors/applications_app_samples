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

import cloudDisk from 'libentry.so';
import { PromptAction } from '@kit.ArkUI';

@Entry
@Component
struct OperationLog {
  @StorageLink('syncFolderPath') syncFolderPath: string = '';
  @State startUsnStr: string = '0';
  @State countStr: string = '0';
  @State batchCountStr: string = '100';
  @State changesResult?: cloudDisk.ChangesResult = undefined;
  private startUsn: number = 0;
  private count: number = 0;
  private batchCount: number = 100;
  private promptAction: PromptAction = this.getUIContext().getPromptAction();

  private resStr(res: Resource): string {
    return getContext(this).resourceManager.getStringSync(res.id);
  }

  build() {
    Scroll() {
      Column() {
        Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
          Text($r('app.string.sync_root_path_label'))
          TextInput({ text: this.syncFolderPath })
            .onChange((value: string) => {
              this.syncFolderPath = value;
            })
            .width('40%')
            .margin(10)
        }
        Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
          Text('startusn：')
          TextInput({ text: $$this.startUsnStr })
            .type(InputType.Number)
            .inputFilter('^\\d*$', (errVal) => {})
            .onChange((value: string) => {
              const minValue = 0;
              const maxValue = 0xFFFFFFFF;
              let processedValue = value.replace(/^0+(?=\d)/, '') || '0';
              const numericValue = parseInt(processedValue);
              if (!isNaN(numericValue)) {
                const clampedValue = Math.min(Math.max(numericValue, minValue), maxValue);
                processedValue = clampedValue.toString();
              }
              if (/^0+$/.test(processedValue)) {
                processedValue = '0';
              }
              if (this.startUsnStr !== processedValue) {
                this.startUsnStr = processedValue;
              }
              this.startUsn = parseInt(processedValue);
            })
            .width('10%')
            .margin(10)
          Text('count：')
          TextInput({ text: $$this.countStr })
            .type(InputType.Number)
            .inputFilter('^\\d*$', (errVal) => {})
            .onChange((value: string) => {
              const minValue = 0;
              const maxValue = 1000;
              let processedValue = value.replace(/^0+(?=\d)/, '') || '0';
              const numericValue = parseInt(processedValue);
              if (!isNaN(numericValue)) {
                const clampedValue = Math.min(Math.max(numericValue, minValue), maxValue);
                processedValue = clampedValue.toString();
              }
              if (/^0+$/.test(processedValue)) {
                processedValue = '0';
              }
              if (this.countStr !== processedValue) {
                this.countStr = processedValue;
              }
              this.count = parseInt(processedValue);
            })
            .width('10%')
            .margin(10)
          Button($r('app.string.query_operation_log'))
            .onClick(() => {
              this.changesResult = cloudDisk.getSyncFolderChanges(this.syncFolderPath, this.startUsn, this.count);
            })
            .margin(10)
        }
        Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
          Text($r('app.string.batch_count_label'))
          TextInput({ text: $$this.batchCountStr, placeholder: '100' })
            .type(InputType.Number)
            .inputFilter('^\\d*$', (errVal) => {})
            .onChange((value: string) => {
              const minValue = 1;
              const maxValue = 100000;
              let processedValue = value.replace(/^0+(?=\d)/, '') || '1';
              const numericValue = parseInt(processedValue);
              if (!isNaN(numericValue)) {
                const clampedValue = Math.min(Math.max(numericValue, minValue), maxValue);
                processedValue = clampedValue.toString();
              }
              if (this.batchCountStr !== processedValue) {
                this.batchCountStr = processedValue;
              }
              this.batchCount = parseInt(processedValue);
            })
            .width('15%')
            .margin(10)
          Button($r('app.string.batch_query_operation_log'))
            .backgroundColor('#FF9800')
            .onClick(() => {
              let totalCount = this.batchCount;
              let totalTime = 0;
              let successCount = 0;
              let failCount = 0;
              let startTimestamp = Date.now();
              let startDate = new Date(startTimestamp);
              let startTimeStr = startDate.getFullYear() + '-' +
                String(startDate.getMonth() + 1).padStart(2, '0') + '-' +
                String(startDate.getDate()).padStart(2, '0') + ' ' +
                String(startDate.getHours()).padStart(2, '0') + ':' +
                String(startDate.getMinutes()).padStart(2, '0') + ':' +
                String(startDate.getSeconds()).padStart(2, '0') + '.' +
                String(startDate.getMilliseconds()).padStart(3, '0');
              for (let i = 1; i <= totalCount; i++) {
                let t0 = Date.now();
                let ret: cloudDisk.ChangesResult = cloudDisk.getSyncFolderChanges(
                  this.syncFolderPath, this.startUsn, this.count);
                totalTime += Date.now() - t0;
                if (ret !== null && ret !== undefined) {
                  successCount++;
                } else {
                  failCount++;
                }
                if (i % Math.max(1, Math.floor(totalCount / 10)) === 0) {
                  console.info('batchGetSyncFolderChanges progress: ' + i + '/' + totalCount +
                    ' avg=' + (totalTime / i).toFixed(2) + 'ms/op');
                }
              }
              let endTimestamp = Date.now();
              let endDate = new Date(endTimestamp);
              let endTimeStr = endDate.getFullYear() + '-' +
                String(endDate.getMonth() + 1).padStart(2, '0') + '-' +
                String(endDate.getDate()).padStart(2, '0') + ' ' +
                String(endDate.getHours()).padStart(2, '0') + ':' +
                String(endDate.getMinutes()).padStart(2, '0') + ':' +
                String(endDate.getSeconds()).padStart(2, '0') + '.' +
                String(endDate.getMilliseconds()).padStart(3, '0');
              console.info('batchGetSyncFolderChanges done: success=' + successCount +
                ' fail=' + failCount + ' totalTime=' + totalTime + 'ms' +
                ' avg=' + (totalTime / totalCount).toFixed(2) + 'ms/op');
              this.promptAction.showDialog({
                title: totalCount + this.resStr($r('app.string.batch_query_done_suffix')),
                message: this.resStr($r('app.string.start_time_label')) + startTimeStr +
                  '\n' + this.resStr($r('app.string.end_time_label')) + endTimeStr +
                  '\n' + this.resStr($r('app.string.total_time_label')) + totalTime + 'ms' +
                  '\n' + this.resStr($r('app.string.avg_time_label')) + (totalTime / totalCount).toFixed(2) + 'ms/op' +
                  '\nsuccess: ' + successCount + ' fail: ' + failCount,
                buttons: [{ text: $r('app.string.ok'), color: '#000000' }]
              });
            })
            .margin(10)
        }
        // 结果列表
        if (this.changesResult) {
          Column() {
            Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
              Text('nextUSN：' + this.changesResult.nextUsn)
                .margin(10)
              Text('isEof：' + this.changesResult.isEof)
                .margin(10)
            }
            Row() {
              Text('usn').width('10%').textAlign(TextAlign.Start)
              Text('fileId').width('10%').textAlign(TextAlign.Start)
              Text('parentFileId').width('10%').textAlign(TextAlign.Start)
              Text('relativePath').width('25%').textAlign(TextAlign.Start)
              Text('operationType').width('15%').textAlign(TextAlign.Start)
              Text('size').width('10%').textAlign(TextAlign.Start)
              Text('mtime').width('10%').textAlign(TextAlign.Start)
              Text('timeStamp').width('10%').textAlign(TextAlign.Start)
            }
            .padding(12)
            .backgroundColor('#f5f5f5')
            .border({ width: 1, color: '#ddd' })
            if (this.changesResult.changesData && this.changesResult.changesData.length) {
              List() {
                ForEach(this.changesResult.changesData, (item: cloudDisk.ChangeData) => {
                  ListItem() {
                    Row() {
                      Text(item.updateSequenceNumber.toString()).width('10%').textAlign(TextAlign.Start)
                      Text(item.fileId).width('10%').textAlign(TextAlign.Start)
                      Text(item.parentFileId).width('10%').textAlign(TextAlign.Start)
                      Text(item.relativePath).width('25%').textAlign(TextAlign.Start)
                      Text(item.operationType.toString()).width('15%').textAlign(TextAlign.Start)
                      Text(item.size.toString()).width('10%').textAlign(TextAlign.Start)
                      Text(item.mtime?.toString()).width('10%').textAlign(TextAlign.Start)
                      Text(item.timeStamp.toString()).width('10%').textAlign(TextAlign.Start)
                    }
                    .padding(12)
                    .border({ width: 1, color: '#ddd' })
                  }
                })
              }.width('100%')
            } else {
              Row() {
                Text($r('app.string.no_data')).width('100%').textAlign(TextAlign.Center)
              }
              .padding(12)
              .border({ width: 1, color: '#ddd' })
            }
          }
        }
      }
    }
    .padding(20)
    .width('100%')
    .height('100%')
    .align(Alignment.Top)
  }
}
