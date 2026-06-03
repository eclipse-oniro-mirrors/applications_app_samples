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
import { distributedDeviceManager } from '@kit.DistributedServiceKit';
import logger from '../common/Logger';
import remoteDeviceModel from '../model/RemoteDeviceModel';
import {
  State,
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
  TextOverflow,
  Divider,
  ItemAlign,
  $r,
} from '@kit.ArkUI';

@CustomDialog
struct DeleteDeviceDialog {
  deviceName: string = '';
  controller?: CustomDialogController;
  cancel: () => void = () => {
  };
  confirm: () => void = () => {
  };

  build(): void {
    Column() {
      Text('Delete ' + this.deviceName + '?')
        .fontSize(20)
        .fontColor('#182431')
        .fontFamily('HarmonyHeiTi-Medium')
        .fontWeight(500)
        .margin({ bottom: 26 })

      Flex({ justifyContent: FlexAlign.SpaceAround }) {
        Button('Cancel')
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
        Button('Delete')
          .onClick(() => {
            this.controller!.close();
            this.confirm();
          })
          .backgroundColor(0xffffff)
          .fontColor('#FA2A2D')
          .fontWeight(500)
      }
    }
    .margin({ bottom: 12, left: 12, right: 12 })
    .borderRadius(24)
    .backgroundColor('#FFFFFF')
    .alignItems(HorizontalAlign.Center)
    .padding(24)
  }
}

@Component
export struct ListDeviceView {
  @State deviceInfo: distributedDeviceManager.DeviceBasicInfo | undefined = undefined;
  dialogController: CustomDialogController | null = null;

  aboutToAppear(): void {
    let deviceName = this.deviceInfo?.deviceName ?? '';
    let isTablet = deviceInfo.deviceType == 'tablet';
    this.dialogController = new CustomDialogController({
      builder: DeleteDeviceDialog({
        cancel: () => {
          logger.info('Callback when the first button is clicked');
        },
        confirm: () => {
          logger.info('[DeviceManager.RemoteDeviceModel] listDeviceView ' + JSON.stringify(this.deviceInfo));
          remoteDeviceModel.unAuthenticateDevice(this.deviceInfo!);
          logger.info('Callback when the second button is clicked');
        },
        deviceName: deviceName
      }),
      cancel: () => {
        logger.info('Click the callback in the blank area');
      },
      autoCancel: true,
      alignment: isTablet ? DialogAlignment.Center : DialogAlignment.Bottom,
      gridCount: 4,
      customStyle: isTablet ? false : true
    });
  }

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

  build(): void {
    Column() {
      Row() {
        Image(this.getDeviceTypeIcon(Number(this.deviceInfo!.deviceType)))
          .width(24)
          .height(24)
        Column() {
          Text(this.deviceInfo!.deviceName)
            .fontSize(16)
            .fontColor('#182431')
            .fontFamily('HarmonyHeiTi-Medium')
            .fontWeight(FontWeight.Medium)
            .margin({ left: 12 })
            .lineHeight(22)
          Text(this.deviceInfo!.deviceId)
            .fontSize(14)
            .opacity(0.6)
            .margin({ left: 12, top: 2 })
            .fontColor('#182431')
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
            .constraintSize({ maxWidth: '60%' })
        }.alignItems(HorizontalAlign.Start)

        Blank()

        Row() {
          Text('Certified')
            .fontColor('#182431')
            .fontSize(14)
            .opacity(0.6)

          Image($r('app.media.ic_arrow'))
            .width(12)
            .height(24)
            .margin({ left: 6 })
        }
        .margin({ left: 24 })
        .onClick(() => {
          this.dialogController?.open();
        })
      }.width('100%')
      .height(64)
    }.width('100%')
  }
}