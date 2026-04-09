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
  ButtonType,
  ClickEvent,
  FontWeight,
  VerticalAlign,
  HorizontalAlign,
  LocalizedAlignRuleOptions,
  LocalizedVerticalAlignParam,
  LocalizedHorizontalAlignParam
} from '@ohos.arkui.component' // TextAttribute should be insert by ui-plugins
import { State } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import { setDefaultDistributedTables } from './datasync/RdbDataSync';
import { setCollaborationDistributedTables } from './datasync/RdbDataSync';
import { dataChange } from './datasync/RdbDataSync';
import { syncPush } from './datasync/RdbDataSync';
import { syncPull } from './datasync/RdbDataSync';
import { remoteQuery } from './datasync/RdbDataSync';
import { rdbDataPersistence } from './datapersistence/RdbDataPersistence';
import { UIContext } from '@kit.ArkUI';
import { common } from '@kit.AbilityKit';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';

  build() {
    Column() {
      Button('setDefaultDistributedTables')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center } as LocalizedVerticalAlignParam,
          middle: { anchor: '__container__', align: HorizontalAlign.Center } as LocalizedHorizontalAlignParam
        } as LocalizedAlignRuleOptions)
        .type(ButtonType.Capsule)
        .margin({ top: 50 })
        .width("70%")
        .height("5%")
        .backgroundColor('#0D9FFB')
        .onClick(() => {
          const context: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;
          setDefaultDistributedTables(context);
        })

      Button('setCollaborationDistributedTables')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center } as LocalizedVerticalAlignParam,
          middle: { anchor: '__container__', align: HorizontalAlign.Center } as LocalizedHorizontalAlignParam
        } as LocalizedAlignRuleOptions)
        .type(ButtonType.Capsule)
        .margin({ top: 50 })
        .width("70%")
        .height("5%")
        .backgroundColor('#0D9FFB')
        .onClick(() => {
          const context: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;
          setCollaborationDistributedTables(context);
        })

      Button('dataChange')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center } as LocalizedVerticalAlignParam,
          middle: { anchor: '__container__', align: HorizontalAlign.Center } as LocalizedHorizontalAlignParam
        } as LocalizedAlignRuleOptions)
        .type(ButtonType.Capsule)
        .margin({ top: 50 })
        .width("70%")
        .height("5%")
        .backgroundColor('#0D9FFB')
        .onClick(() => {
          dataChange();
        })

      Button('syncPush')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center } as LocalizedVerticalAlignParam,
          middle: { anchor: '__container__', align: HorizontalAlign.Center } as LocalizedHorizontalAlignParam
        } as LocalizedAlignRuleOptions)
        .type(ButtonType.Capsule)
        .margin({ top: 50 })
        .width("70%")
        .height("5%")
        .backgroundColor('#0D9FFB')
        .onClick(() => {
          syncPush();
        })

      Button('syncPull')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center } as LocalizedVerticalAlignParam,
          middle: { anchor: '__container__', align: HorizontalAlign.Center } as LocalizedHorizontalAlignParam
        } as LocalizedAlignRuleOptions)
        .type(ButtonType.Capsule)
        .margin({ top: 50 })
        .width("70%")
        .height("5%")
        .backgroundColor('#0D9FFB')
        .onClick(() => {
          syncPull();
        })
      Button('remoteQuery')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center } as LocalizedVerticalAlignParam,
          middle: { anchor: '__container__', align: HorizontalAlign.Center } as LocalizedHorizontalAlignParam
        } as LocalizedAlignRuleOptions)
        .type(ButtonType.Capsule)
        .margin({ top: 50 })
        .width("70%")
        .height("5%")
        .backgroundColor('#0D9FFB')
        .onClick(() => {
          remoteQuery();
        })

      Button('dataPersistence')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center } as LocalizedVerticalAlignParam,
          middle: { anchor: '__container__', align: HorizontalAlign.Center } as LocalizedHorizontalAlignParam
        } as LocalizedAlignRuleOptions)
        .type(ButtonType.Capsule)
        .margin({ top: 50 })
        .width("70%")
        .height("5%")
        .backgroundColor('#0D9FFB')
        .onClick(() => {
          const context: common.UIAbilityContext = this.getUIContext().getHostContext() as common.UIAbilityContext;
          rdbDataPersistence(context);
        })
    }
    .height('100%')
    .width('100%')
  }
}