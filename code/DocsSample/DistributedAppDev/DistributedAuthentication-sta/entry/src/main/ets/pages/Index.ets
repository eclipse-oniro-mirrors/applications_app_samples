'use static'

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

import hilog from '@ohos.hilog'
import deviceInfo from '@ohos.deviceInfo';
import { distributedDeviceManager } from '@kit.DistributedServiceKit';
import logger from '../common/Logger';
import remoteDeviceModel from '../model/RemoteDeviceModel';
import router from '@ohos.router';
import { abilityAccessCtrl, PermissionRequestResult, common } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { AppStorage } from '@kit.ArkUI';
import { ListDeviceView } from '../pages/ListDeviceView';
import {
  State,
  Entry,
  Component,
  Context,
  Column,
  Row,
  Text,
  Button,
  Blank,
  FontWeight,
  HorizontalAlign,
  FlexAlign,
  CustomDialogController,
  Resource,
  DialogAlignment,
  Image,
  Flex,
  Alignment,
  TextOverflow,
  CustomDialog,
  Divider,
  ItemAlign,
  Radio,
  List,
  ListItem,
  ForEach,
  Visibility,
  StorageLink,
  Scroll,
  Scroller,
  LoadingProgress,
  $r,
  BarState,
  ScrollDirection,
} from '@kit.ArkUI';

@Entry
@Component
struct Index {
  @State isShowLoading: boolean = false;
  @StorageLink('localDevice') localDevice: distributedDeviceManager.DeviceBasicInfo | undefined = undefined;
  @StorageLink('trustedDeviceList') trustedDeviceList: Array<distributedDeviceManager.DeviceBasicInfo> =
    new Array<distributedDeviceManager.DeviceBasicInfo>();
  @StorageLink('discoverDeviceList') discoverDeviceList: Array<distributedDeviceManager.DeviceBasicInfo> =
    new Array<distributedDeviceManager.DeviceBasicInfo>();
  @State isSupportRange: boolean = false;
  @State isAllowDiscovered: boolean = true;
  @State isLocalDeviceActive: boolean = false;
  @State filterOption: string = '';
  @State isDiscovering: boolean = false;
  @State isPermissionGranted: boolean = false;
  scroller: Scroller = new Scroller();

  getDeviceTypeIcon(deviceType: Double): Resource {
    logger.info(`getDeviceTypeIcon deviceType: ${deviceType}`)
    if (deviceType == 0x11) {
      return $r('app.media.ic_pad');
    } else if (deviceType == 0x0E) {
      return $r('app.media.ic_phone');
    } else if (deviceType == 0) {
      return $r('app.media.ic_pc');
    } else {
      return $r('app.media.ic_pc');
    }
  }

  aboutToAppear(): void {
    let atManager = abilityAccessCtrl.createAtManager();
    let context: Context = this.getUIContext().getHostContext() as common.UIAbilityContext;

    atManager.requestPermissionsFromUser(context, ['ohos.permission.DISTRIBUTED_DATASYNC'], (err: BusinessError | null, data: PermissionRequestResult | undefined) => {
      if (err) {
        logger.error(`requestPermissionsFromUser fail, code: ${err.code}, message: ${err.message}`);
        this.isPermissionGranted = false;
        return;
      }
      logger.info(`data: ${JSON.stringify(data)}`);
      this.isPermissionGranted = true;
      remoteDeviceModel.createDeviceManager();
      try {
        logger.info(`local deviceType:` + deviceInfo.deviceType);

        AppStorage.setOrCreate('authFormName', 'Auth Form');
        AppStorage.setOrCreate('isOnlineName', 'Online Status');
        AppStorage.setOrCreate('isTrustedName', 'Trusted Status');
        AppStorage.setOrCreate('rangeName', 'Range');

        let filterOptions: Map<string, int> = new Map<string, int>();
        filterOptions.set('Auth Form', 0);
        filterOptions.set('Online Status', 0);
        filterOptions.set('Trusted Status', 0);
        filterOptions.set('Range', 0);
        AppStorage.setOrCreate('filterOptions', filterOptions);
        logger.info(`local filterOptions:` + JSON.stringify(filterOptions));
      } catch (error) {
        let err: BusinessError = error as BusinessError;
        logger.error(`getStringByNameSync failed, error code: ${err.code}, message: ${err.message}.`);
      }
    });
  }

  build(): void {
    Row() {
      Scroll(this.scroller) {
        Column() {
          Column() {
            Text($r("app.string.app_name"))
              .fontColor('#182431')
              .fontSize(24)
              .fontFamily('HarmonyHeiTi-Medium')
              .fontWeight(FontWeight.Medium)
              .width('100%')
              .margin({ top: 12, bottom: 20 })
          }.width('100%')
          .margin({ left: 24 })

          Column() {
            Row() {
              Image(this.getDeviceTypeIcon(Number(this.localDevice?.deviceType)))
                .width(24)
                .height(24)
              Text(this.localDevice?.deviceName)
                .fontSize(16)
                .fontColor('#182431')
                .fontFamily('HarmonyHeiTi-Medium')
                .fontWeight(FontWeight.Medium)
                .margin({ left: 8 })
            }
            .width('100%')
            .height(48)
          }.borderRadius(24)
          .backgroundColor('#FFFFFF')
          .padding({ left: 12, right: 12, top: 4, bottom: 4 })
          .width('100%')

          Column() {
            Row() {
              Text($r('app.string.trusted_devices'))
                .fontSize(14)
                .fontColor('#182431')
                .fontFamily('HarmonyHeiTi-Medium')
                .lineHeight(19)
                .margin({ left: 12, top: 19, bottom: 10 })
                .opacity(0.6)

              Blank()

              Text($r('app.string.refresh'))
                .fontSize(14)
                .fontColor('#007DFF')
                .fontFamily('HarmonyHeiTi-Medium')
                .lineHeight(19)
                .margin({ left: 12, top: 19, bottom: 10, right: 12 })
                .onClick(() => {
                  remoteDeviceModel.getTrustedDeviceList();
                  this.isShowLoading = true;
                  let gThis = this;
                  setTimeout(() => {
                    gThis.isShowLoading = false;
                  }, 3000);
                })
                .visibility(this.isShowLoading ? Visibility.None : Visibility.Visible)
              LoadingProgress()
                .color('#007DFF')
                .width(24)
                .height(24)
                .margin({ left: 12, top: 19, bottom: 10, right: 12 })
                .visibility(this.isShowLoading ? Visibility.Visible : Visibility.None)
            }.width('100%')

            List() {
              ForEach(this.trustedDeviceList, (item: distributedDeviceManager.DeviceBasicInfo, index: int) => {
                ListItem() {
                  Column() {
                    ListDeviceView({ deviceInfo: item, visible: Visibility.Visible })
                    Divider()
                      .color('#182431')
                      .opacity(0.05)
                      .visibility(index == this.trustedDeviceList.length - 1 ? Visibility.None : Visibility.Visible)
                  }
                }
              }, (item: distributedDeviceManager.DeviceBasicInfo) => JSON.stringify(item))
            }
            .width('100%')
            .borderRadius(24)
            .padding({ left: 12, right: 12, top: 4, bottom: 4 })
            .backgroundColor('#FFFFFF')
            .visibility(this.trustedDeviceList.length == 0 ? Visibility.None : Visibility.Visible)
          }

          Column() {
            Row() {
              Text($r('app.string.usable_devices'))
                .fontSize(14)
                .fontColor('#182431')
                .fontFamily('HarmonyHeiTi-Medium')
                .lineHeight(19)
                .opacity(0.6)
                .margin({ left: 12, top: 19, bottom: 10 })

              Blank()

              Text(this.isDiscovering == false ? $r('app.string.discover') : $r('app.string.stop'))
                .fontSize(14)
                .fontColor(this.isDiscovering == false ? '#007DFF' : '#FA2A2D')
                .lineHeight(19)
                .margin({ left: 12, top: 19, bottom: 10, right: 12 })
                .onClick(() => {
                  if (this.isDiscovering) {
                    logger.info('calling stopDeviceDiscovery');
                    remoteDeviceModel.stopDeviceDiscovery();
                    this.isDiscovering = false;
                  } else {
                    if (!this.isPermissionGranted) {
                      logger.error('Permission not granted, cannot start discovery');
                      return;
                    }
                    if (remoteDeviceModel.deviceManager === undefined) {
                      logger.error('DeviceManager not initialized, cannot start discovery');
                      return;
                    }
                    logger.info('calling startDeviceDiscovery');
                    remoteDeviceModel.startDeviceDiscovery();
                    this.isDiscovering = true;
                  }
                })
            }.width('100%')
          }.width('100%')

          Column() {
            List() {
              ForEach(this.discoverDeviceList, (item: distributedDeviceManager.DeviceBasicInfo, index: int) => {
                ListItem() {
                  Column() {
                    ListDeviceView({ deviceInfo: item })
                    Divider()
                      .color('#182431')
                      .opacity(0.05)
                      .visibility(index == this.discoverDeviceList.length - 1 ? Visibility.None : Visibility.Visible)
                  }
                }
                .onClick(() => {
                  remoteDeviceModel.authenticateDevice(item);
                })
              }, (item: distributedDeviceManager.DeviceBasicInfo) => JSON.stringify(item))
            }
            .visibility(this.discoverDeviceList.length == 0 ? Visibility.None : Visibility.Visible)
            .width('100%')
          }.width('100%')
          .borderRadius(24)
          .padding({ left: 12, right: 12, bottom: 4, top: 4 })
          .backgroundColor('#FFFFFF')
          .visibility(this.discoverDeviceList.length == 0 ? Visibility.None : Visibility.Visible)
        }
        .padding(12)
        .width('100%')
      }
      .scrollBar(BarState.Off)
      .scrollable(ScrollDirection.Vertical)
      .height('100%')
      .backgroundColor('#F1F3F5')
      .align(Alignment.Top)
    }
  }
}
