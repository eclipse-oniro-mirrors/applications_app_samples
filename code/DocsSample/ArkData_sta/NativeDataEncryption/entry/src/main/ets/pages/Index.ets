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

import {
  Entry,
  Text,
  TextAttribute,
  Column,
  Component,
  Button,
  ClickEvent,
  FontWeight,
  AlignRuleOption,
  VerticalAlign,
  HorizontalAlign,
  ButtonType,
  State,
  UIContext
} from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { defaultConfigRdbStoreTs } from './encryption/Encryption';
import { customizedConfigRdbStoreTs } from './encryption/Encryption';
import { backupManually } from './backuprestore/BackupAndRestore';
import { rebuildingRelationalDatabaseAbnormally } from './backuprestore/BackupAndRestore';
import { restoringManualBackupData } from './backuprestore/BackupAndRestore';

@Entry
@Component
struct Index {
  build() {
    Column() {
      Button() {
        Text('RdbStoreAPITest_ETS')
          .fontSize(18)
          .fontWeight(FontWeight.Bold)
          .alignRules({
            center: { anchor: '__container__', align: VerticalAlign.Center },
            middle: { anchor: '__container__', align: HorizontalAlign.Center }
          } as AlignRuleOption)
      }
      .type(ButtonType.Capsule)
      .margin({ top: 50 })
      .width('60%')
      .height('10%')
      .backgroundColor('#0D9FFB')
      .onClick(() => {
        (async () => {
          await defaultConfigRdbStoreTs(this.getUIContext());
          await customizedConfigRdbStoreTs(this.getUIContext());
          await backupManually(this.getUIContext());
          await rebuildingRelationalDatabaseAbnormally(this.getUIContext());
          await restoringManualBackupData(this.getUIContext());
        })();
      })
    }
    .height('100%')
    .width('100%')
  }
}
