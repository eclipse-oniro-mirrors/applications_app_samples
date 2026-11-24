/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { overlay } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { OverlayAction, OverlayController, OverlayState } from '../service/OverlayController';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_ResourceManager]';

@Entry
@Component
struct Overlay {
  private resmgr = getContext().resourceManager;
  @State message: string = 'Test Overlay'
  @State resources: string = this.resmgr.getStringSync($r('app.string.test_string').id)
  @State pixmap: PixelMap = this.resmgr.getDrawableDescriptor($r('app.media.icon').id).getPixelMap()
  @State overlayState: string = OverlayState.INITIAL

  /** Maps the controller decision onto the real resource string. */
  private messageOf(action: string, success: boolean): string {
    const key: string = OverlayController.messageKeyOf(action, success);
    switch (key) {
      case 'unEnableSuccess':
        return this.resmgr.getStringSync($r('app.string.unEnableSuccess').id);
      case 'unEnableFailed':
        return this.resmgr.getStringSync($r('app.string.unEnableFailed').id);
      case 'enableSuccess':
        return this.resmgr.getStringSync($r('app.string.enableSuccess').id);
      case 'enableFailed':
        return this.resmgr.getStringSync($r('app.string.enableFailed').id);
      case 'test_string':
        return this.resmgr.getStringSync($r('app.string.test_string').id);
      default:
        return '';
    }
  }

  /** Records the transition and refreshes the overlaid text and image. */
  private applyResult(action: string, success: boolean): void {
    this.message = this.messageOf(action, success);
    this.overlayState = OverlayController.nextStateOf(this.overlayState, action, success);
    hilog.info(DOMAIN, TAG, 'overlay action %{public}s success=%{public}s state=%{public}s',
      action, String(success), this.overlayState);
    this.pixmap = this.resmgr.getDrawableDescriptor($r('app.media.icon').id).getPixelMap();
    this.resources = this.resmgr.getStringSync($r('app.string.test_string').id);
  }

  build() {
    Column() {
      Text($r('app.string.title'))
        .id('overlayTitle')
        .width('100%')
        .height(50)
        .backgroundColor($r('app.color.text_color'))
        .fontColor(Color.White)
        .fontSize(20)
        .padding({ left: 15 })

      Text(`${this.message}`)
        .id('overlayMessage')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .margin({
          top: 40
        })

      Button() {
        Text('disable')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .id('disableBtn')
      .type(ButtonType.Capsule)
      .margin({
        top: 50
      })
      .backgroundColor('#0D9FFB')
      .width('50%')
      .height('5%')
      .onClick(() => {
        // 非使能
        overlay.setOverlayEnabled(OverlayController.OVERLAY_MODULE_NAME, false, (err, data) => {
          const success: boolean = !(err && err.code != 0);
          if (!success) {
            hilog.error(DOMAIN, TAG, 'setOverlayEnabled(false) failed: %{public}s', JSON.stringify(err));
          }
          this.applyResult(OverlayAction.DISABLE, success);
        })
      })

      Button() {
        Text('enable')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .id('enableBtn')
      .type(ButtonType.Capsule)
      .margin({
        top: 20
      })
      .backgroundColor('#0D9FFB')
      .width('50%')
      .height('5%')
      .onClick(() => {
        // 使能
        overlay.setOverlayEnabled(OverlayController.OVERLAY_MODULE_NAME, true, (err, data) => {
          const success: boolean = !(err && err.code != 0);
          if (!success) {
            hilog.error(DOMAIN, TAG, 'setOverlayEnabled(true) failed: %{public}s', JSON.stringify(err));
          }
          this.applyResult(OverlayAction.ENABLE, success);
        })
      })

      Button() {
        Text('addResource')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .id('addResourceBtn')
      .type(ButtonType.Capsule)
      .margin({
        top: 20
      })
      .backgroundColor('#0D9FFB')
      .width('50%')
      .height('5%')
      .onClick(() => {
        const path: string = OverlayController.buildHspPath(getContext().bundleCodeDir);
        try {
          this.resmgr.addResource(path);
          this.applyResult(OverlayAction.ADD_RESOURCE, true);
        } catch (error) {
          let code = (error as BusinessError).code;
          let message = (error as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'addResource failed, error code: %{public}d, message: %{public}s', code, message);
          this.applyResult(OverlayAction.ADD_RESOURCE, false);
        }
      })

      Button() {
        Text('removeResource')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .id('removeResourceBtn')
      .type(ButtonType.Capsule)
      .margin({
        top: 20
      })
      .backgroundColor('#0D9FFB')
      .width('50%')
      .height('5%')
      .onClick(() => {
        const path: string = OverlayController.buildHspPath(getContext().bundleCodeDir);
        try {
          this.resmgr.removeResource(path);
          this.applyResult(OverlayAction.REMOVE_RESOURCE, true);
        } catch (error) {
          let code = (error as BusinessError).code;
          let message = (error as BusinessError).message;
          hilog.error(DOMAIN, TAG, 'removeResource failed, error code: %{public}d, message: %{public}s', code, message);
          this.applyResult(OverlayAction.REMOVE_RESOURCE, false);
        }
      })

      Image(this.pixmap)
        .id('overlayImage')
        .width(100)
        .height(100)

      Text(this.resources)
        .id('overlayResourceText')
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
    }
    .width('100%')
    .height('100%')
  }
}
