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

@Entry
@Component
struct SetFileSyncStates {
  @StorageLink('syncFolderPath') syncFolderPath: string = '';
  @State lengthStr: string = '';
  private length: number = 0;
  @State inputItems: Array<FormItem> = [];
  private nextId: number = 1;
  private stateOptions: SelectOption[] = [
    { value: $r('app.string.state_idle') },
    { value: $r('app.string.state_syncing') },
    { value: $r('app.string.state_success') },
    { value: $r('app.string.state_failed') },
    { value: $r('app.string.state_canceled') },
    { value: $r('app.string.state_conflict') },
    { value: $r('app.string.state_invalid_1') },
    { value: $r('app.string.state_invalid_2') },
    { value: $r('app.string.state_invalid_3') },
    { value: $r('app.string.state_invalid_4') },
  ];

  @Builder
  formItemBuilder(item: FormItem) {
    Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
      Text($r('app.string.file_path_label'))
      TextInput({ text: item.data.path, placeholder: $r('app.string.input_file_path') })
        .width('40%')
        .onChange((value: string) => {
          item.data.path = value;
        })
        .margin(10)
      Select(this.stateOptions)
        .width(120)
        .height(40)
        .selected(item.data.state)
        .onSelect((index: number) => {
          item.data.state = index;
        })
        .margin(10)

      Button('-')
        .width(40)
        .height(40)
        .onClick(() => {
          this.inputItems = this.inputItems.filter((i: FormItem) => i.id !== item.id);
        })
        .margin(10)
    }
    .width('100%')
    .margin({ bottom: 10 })
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
          Text('length：')
          TextInput({ text: $$this.lengthStr })
            .type(InputType.Number)
            .inputFilter('^\\d*$', (errVal) => {})
            .onChange((value: string) => {
              const minValue = 0;
              const maxValue = 0xffffffff;
              let processedValue = value.replace(/^0+(?=\d)/, '') || '0';
              const numericValue = parseInt(processedValue);
              if (!isNaN(numericValue)) {
                const clampedValue = Math.min(Math.max(numericValue, minValue), maxValue);
                processedValue = clampedValue.toString();
              }
              if (/^0+$/.test(processedValue)) {
                processedValue = '0';
              }
              if (this.lengthStr !== processedValue) {
                this.lengthStr = processedValue;
              }
              this.length = parseInt(processedValue);
            })
            .width('10%')
            .margin(10)
          Button($r('app.string.add_row'))
            .onClick(() => {
              if (this.inputItems.length < 5) {
                let fileState: cloudDisk.FileSyncState = {
                  path: this.syncFolderPath,
                  state: 0
                };
                let item: FormItem = {
                  id: this.nextId++,
                  data: fileState
                };
                this.inputItems.push(item);
              }
            })
            .margin(10)
          Button($r('app.string.submit'))
            .onClick(() => {
              let syncStates: cloudDisk.FileSyncState[] =
                this.inputItems.map((item: FormItem): cloudDisk.FileSyncState => item.data);
              cloudDisk.setFileSyncStates(this.syncFolderPath, this.length, syncStates);
            })
            .margin(10)
        }
        // 动态列表区域
        List() {
          ForEach(this.inputItems, (item: FormItem) => {
            ListItem() {
              this.formItemBuilder(item)
            }
          })
        }
        .width('100%')
        .height('80%')
      }
    }
    .padding(20)
    .width('100%')
    .height('100%')
    .align(Alignment.Top)
  }
}

interface FormItem {
  id: number,
  data: cloudDisk.FileSyncState
}
