'use static'

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file or copy of the License.
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import deviceInfo from '@ohos.deviceInfo';
import logger from '../common/Logger';
import { DISTRIBUTED_FILTER_OPTION_LIST } from '../common/Constant';
import { AppStorage } from '@kit.ArkUI';
import {
  State,
  Entry,
  Component,
  Column,
  Row,
  Text,
  Button,
  Blank,
  FontWeight,
  HorizontalAlign,
  FlexAlign,
  CustomDialog,
  CustomDialogController,
  Resource,
  DialogAlignment,
  Image,
  Flex,
  Alignment,
  Divider,
  ItemAlign,
  Radio,
  List,
  ListItem,
  ForEach,
  Visibility,
  $r,
  Context,
} from '@kit.ArkUI';

@CustomDialog
struct FilterOptionDialog {
  title: string = '';
  filterItems: Array<string> = [];
  controller?: CustomDialogController;
  cancel: () => void = () => {
  };
  confirm: (selectedIndex: int, title: string) => void = () => {
  };
  selectedIndex: int = 0;
  filterOptions: Object = new Object();

  build(): void {
    Column() {
      Text(this.title)
        .fontSize(20)
        .fontColor('#182431')
        .fontFamily('HarmonyHeiTi-Medium')
        .fontWeight(500)
        .margin({ bottom: 24 })

      List() {
        ForEach(this.filterItems, (item: string, index: int) => {
          ListItem() {
            Column() {
              Row() {
                Text(item)
                  .fontSize(16)
                  .fontFamily('HarmonyHeiTi-Medium')
                  .fontWeight(500)
                  .fontColor('#182431')
                Blank()
                Radio({ value: item, group: this.title })
                  .checked(index == this.selectedIndex ? true : false)
                  .onChange((isChecked: boolean) => {
                    if (isChecked) {
                      this.selectedIndex = index;
                    }
                    logger.info(item + ' status is ' + isChecked);
                  })
                  .align(Alignment.End)
              }
              .margin({ bottom: 6, top: 6 })
              .width('100%')

              Divider()
                .color('#182431')
                .opacity(0.05)
                .visibility(index == this.filterItems.length - 1 ? Visibility.None : Visibility.Visible)
            }.width('100%')
            .height(48)
          }
        }, (item: string) => item)
      }.width('100%')
      .height(this.filterItems.length * 48)

      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button($r('app.string.cancel'))
          .onClick(() => {
            this.controller!.close();
            this.cancel();
          })
          .backgroundColor(0xffffff)
          .fontColor('#007DFF')
          .fontWeight(500)
        Divider()
          .vertical(true)
          .height(24)
          .color('#182431')
          .opacity(0.2)
          .alignSelf(ItemAlign.Center)
        Button($r('app.string.confirm'))
          .onClick(() => {
            this.controller!.close();
            this.confirm(this.selectedIndex, this.title);
          })
          .backgroundColor(0xffffff)
          .fontColor('#007DFF')
          .fontWeight(500)
      }
    }
    .margin({ bottom: 12, left: 12, right: 12 })
    .borderRadius(24)
    .backgroundColor('#FFFFFF')
    .alignItems(HorizontalAlign.Start)
    .padding(24)
  }
}

@Entry
@Component
export struct FilterOption {
  @State deviceType: string = '';
  @State authForm: string = '';
  @State isOnline: string = '';
  @State isTrusted: string = '';
  @State range: string = '';
  dialogController: CustomDialogController | undefined = undefined;

  aboutToAppear(): void {
    try {
      let filterOptions = AppStorage.get<Map<string, int>>('filterOptions');
      let authFormItemList = DISTRIBUTED_FILTER_OPTION_LIST.authFormItemList;
      let authFormName = AppStorage.get<string>('authFormName');
      let isOnlineItemList = DISTRIBUTED_FILTER_OPTION_LIST.isOnlineItemList;
      let isOnlineName = AppStorage.get<string>('isOnlineName');
      let isTrustedItemList = DISTRIBUTED_FILTER_OPTION_LIST.isTrustedItemList;
      let isTrustedName = AppStorage.get<string>('isTrustedName');
      let rangeItemList = DISTRIBUTED_FILTER_OPTION_LIST.rangeItemList;
      let rangeName = AppStorage.get<string>('rangeName');
      if (filterOptions && authFormName && isOnlineName && isTrustedName && rangeName) {
        let authFormIndex: int = filterOptions.get(authFormName) ?? 0;
        let isOnlineIndex: int = filterOptions.get(isOnlineName) ?? 0;
        let isTrustedIndex: int = filterOptions.get(isTrustedName) ?? 0;
        let rangeIndex: int = filterOptions.get(rangeName) ?? 0;
        let authFormIdx: int = Math.floor(authFormIndex).toInt();
        let isOnlineIdx: int = Math.floor(isOnlineIndex).toInt();
        let isTrustedIdx: int = Math.floor(isTrustedIndex).toInt();
        let rangeIdx: int = Math.floor(rangeIndex).toInt();
        this.authForm = authFormItemList[authFormIdx];
        this.isOnline = isOnlineItemList[isOnlineIdx];
        this.isTrusted = isTrustedItemList[isTrustedIdx];
        this.range = rangeItemList[rangeIdx];
      }
      logger.info(`getStringByNameSync success, ${this.authForm} ${this.isOnline} ${this.isTrusted} ${this.range}`);
    } catch (error) {
      logger.error(`getStringByNameSync failed, error code: ${error.code}, message: ${error.message}.`);
    }
  }

  onCancel(): void {
    logger.info('Callback when the first button is clicked');
  }

  onSelected(index: int, title: string): void {
    let filterOptions = AppStorage.get<Map<string, int>>('filterOptions');
    if (filterOptions) {
      filterOptions.set(title, index);
      AppStorage.setOrCreate('filterOptions', filterOptions);
    }
    filterOptions = AppStorage.get<Map<string, int>>('filterOptions');
    let authFormItemList = DISTRIBUTED_FILTER_OPTION_LIST.authFormItemList;
    let authFormName = AppStorage.get<string>('authFormName');
    let isOnlineItemList = DISTRIBUTED_FILTER_OPTION_LIST.isOnlineItemList;
    let isOnlineName = AppStorage.get<string>('isOnlineName');
    let isTrustedItemList = DISTRIBUTED_FILTER_OPTION_LIST.isTrustedItemList;
    let isTrustedName = AppStorage.get<string>('isTrustedName');
    let rangeItemList = DISTRIBUTED_FILTER_OPTION_LIST.rangeItemList;
    let rangeName = AppStorage.get<string>('rangeName');
    if (filterOptions && authFormName && isOnlineName && isTrustedName && rangeName) {
      let idx: Double = Math.floor(index);
      this.authForm = authFormItemList[filterOptions.get(authFormName)!.toInt()];
      this.isOnline = isOnlineItemList[filterOptions.get(isOnlineName)!.toInt()];
      this.isTrusted = isTrustedItemList[filterOptions.get(isTrustedName)!.toInt()];
      this.range = rangeItemList[filterOptions.get(rangeName)!.toInt()];
    }
  }

  existApp(): void {
    logger.info('Click the callback in the blank area');
  }

  openDialog(itemList: Array<string>, titleResource: Resource): void {
    let title: string = '';
    let context = this.getUIContext().getHostContext() as Context;
    try {
      title = context.resourceManager.getStringSync(titleResource.id);
    } catch (error) {
      logger.error(`getStringByNameSync failed, error code: ${error.code}, message: ${error.message}.`);
    }

    let filterOptions = AppStorage.get<Map<string, int>>('filterOptions');
    let selectedIndex: int = 0;
    if (filterOptions) {
      let idx: Double = filterOptions.get(title) ?? 0;
      selectedIndex = Math.floor(idx).toInt();
    }

    this.dialogController = new CustomDialogController({
      builder: FilterOptionDialog({
        title: title,
        filterItems: itemList,
        cancel: this.onCancel,
        confirm: this.onSelected,
        selectedIndex: selectedIndex
      }),
      cancel: this.existApp,
      autoCancel: true,
      alignment: deviceInfo.deviceType == 'tablet' ? DialogAlignment.Center : DialogAlignment.Bottom,
      gridCount: 4,
      customStyle: deviceInfo.deviceType == 'tablet' ? false : true
    });
    this.dialogController?.open();
  }

  build(): void {
    Column() {
      Row() {
        Image($r('app.media.ic_back'))
          .height(24)
          .width(24)
          .margin({ right: 16 })
          .onClick(() => {
            this.getUIContext().getRouter().back();
          })
          .visibility(deviceInfo.deviceType == 'tablet' ? Visibility.None : Visibility.Visible)

        Text($r('app.string.filter_options'))
          .fontColor('#182431')
          .fontFamily('HarmonyHeiTi-Medium')
          .fontWeight(500)
          .fontSize(20)
          .lineHeight(26)
      }
      .width('100%')
      .margin({ top: 12, bottom: 24 })
      .padding({ left: 12 })

      Column() {
        Row() {
          Text($r('app.string.is_online'))
            .fontColor('#182431')
            .fontSize(16)
            .fontFamily('HarmonyHeiTi-Medium')
            .fontWeight(500)
          Blank()
          Text(this.isOnline)
            .fontColor('#182431')
            .fontFamily('HarmonyHeiTi')
            .fontSize(14)
            .opacity(0.6)
          Image($r('app.media.ic_arrow'))
            .width(12)
            .height(24)
            .margin({ left: 4 })
        }
        .width('100%')
        .height(48)
        .onClick(() => {
          this.openDialog(DISTRIBUTED_FILTER_OPTION_LIST.isOnlineItemList, $r('app.string.is_online'));
        })

        Divider()
          .color('#182431')
          .opacity(0.05)

        Row() {
          Text($r('app.string.is_trusted'))
            .fontColor('#182431')
            .fontSize(16)
            .fontFamily('HarmonyHeiTi-Medium')
            .fontWeight(500)
          Blank()
          Text(this.isTrusted)
            .fontColor('#182431')
            .fontFamily('HarmonyHeiTi')
            .fontSize(14)
            .opacity(0.6)
          Image($r('app.media.ic_arrow'))
            .width(12)
            .height(24)
            .margin({ left: 4 })
        }
        .width('100%')
        .height(48)
        .onClick(() => {
          this.openDialog(DISTRIBUTED_FILTER_OPTION_LIST.isTrustedItemList, $r('app.string.is_trusted'));
        })

        Divider()
          .color('#182431')
          .opacity(0.05)

        Row() {
          Text($r('app.string.auth_form'))
            .fontColor('#182431')
            .fontSize(16)
            .fontFamily('HarmonyHeiTi-Medium')
            .fontWeight(500)
          Blank()
          Text(this.authForm)
            .fontColor('#182431')
            .fontFamily('HarmonyHeiTi')
            .fontSize(14)
            .opacity(0.6)
          Image($r('app.media.ic_arrow'))
            .width(12)
            .height(24)
            .margin({ left: 4 })
        }
        .width('100%')
        .height(48)
        .onClick(() => {
          this.openDialog(DISTRIBUTED_FILTER_OPTION_LIST.authFormItemList, $r('app.string.auth_form'));
        })

        Divider()
          .color('#182431')
          .opacity(0.05)

        Row() {
          Text($r('app.string.range'))
            .fontColor('#182431')
            .fontSize(16)
            .fontFamily('HarmonyHeiTi-Medium')
            .fontWeight(500)
          Blank()
          Text(this.range)
            .fontColor('#182431')
            .fontFamily('HarmonyHeiTi')
            .fontSize(14)
            .opacity(0.6)
          Image($r('app.media.ic_arrow'))
            .width(12)
            .height(24)
            .margin({ left: 4 })
        }
        .width('100%')
        .height(48)
        .onClick(() => {
          this.openDialog(DISTRIBUTED_FILTER_OPTION_LIST.rangeItemList, $r('app.string.range'));
        })
        .margin({ bottom: 4 })
      }.width('100%')
      .borderRadius(24)
      .padding({ left: 12, right: 12 })
      .backgroundColor('#FFFFFF')
    }.backgroundColor('#F1F3F5')
    .padding(12)
    .width('100%')
    .height('100%')
  }
}