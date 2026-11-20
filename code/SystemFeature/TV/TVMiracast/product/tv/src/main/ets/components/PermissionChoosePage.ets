/*
 * Copyright (C) 2026 HiHope Open Source Organization.
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

import { emitter } from '@kit.BasicServicesKit';
import { PermissionType, PermissionPanelSizeUtils, Log } from 'library';
import { resourceManager } from '@kit.LocalizationKit';

const TAG = 'PermissionChoosePage';

export const entryName: string = 'PermissionChoosePage';

@Entry({ routeName: entryName, storage: LocalStorage.getShared() })
@Component
export struct PermissionChoosePage {
  @State scaling: number = 0;
  @State focusForever: boolean = false;
  @State focusOnce: boolean = false;
  @State focusNone: boolean = false;
  @State showTipText: string = '';
  @LocalStorageProp('deviceName') deviceName: string = '';

  aboutToAppear(): void {
    this.scaling = PermissionPanelSizeUtils.getIns().getZoomRatio();
    Log.info(TAG, `scaling = ${this.scaling}`);

    globalThis.resourceManager.getStringValue($r('app.string.first_connect')).then((res: string) => {
      this.showTipText = this.deviceName + ' ' + res;
    });
  }

  onDidBuild(): void {
    setTimeout(() => {
      this.tabStartClick();
    }, 100);
  }

  tabStartClick() {
    try {
      setTimeout(() => {
        focusControl.requestFocus('allowBtn');
      }, 50);
    } catch (e) {
      Log.error(TAG, 'focus request failed: ' + JSON.stringify(e));
    }
  }

  build() {
    Column() {

      Text($r('app.string.tip'))
        .fontSize(`57lpx`)
        .fontColor($r('app.color.white'))
        .opacity(0.9);

      Text(this.showTipText)
        .fontSize(`32lpx`)
        .fontColor($r('app.color.white'))
        .opacity(0.9)
        .textAlign(TextAlign.Center)
        .margin('48lpx');
      Column() {
        Text($r('app.string.permanent_trust'))
          .fontSize(`42lpx`)
          .width(`594lpx`)
          .height(`72lpx`)
          .focusable(true)
          .key('permanent_trust')
          .focusOnTouch(true)
          .defaultFocus(true)
          .textAlign(TextAlign.Center)
          .backgroundColor(this.focusForever ? '#dbffffff' : '#33ffffff')
          .fontColor(this.focusForever ? '#e6000000' : '#dbffffff')
          .borderRadius(`72lpx`)
          .stateStyles({
            focused: {
              .border({
                color: Color.Transparent
              });
            }
          })
          .onFocus(() => {
            this.focusForever = true;
          })
          .onBlur(() => {
            this.focusForever = false;
          })
          .onClick(() => {
            this.sendEmitterEvent(PermissionType.FOREVER);
          });
      }
      .padding('6lpx')
      .border({
        width: '2lpx',
        color: this.focusForever ? Color.White : Color.Transparent,
        radius: '72lpx',
        style: BorderStyle.Solid
      })
      .justifyContent(FlexAlign.Center)
      .focusable(true)
      .margin('5lpx');

      Column() {
        Text($r('app.string.only_for_this_time'))
          .fontSize(`42lpx`)
          .width(`594lpx`)
          .height(`72lpx`)
          .focusable(true)
          .focusOnTouch(true)
          .textAlign(TextAlign.Center)
          .backgroundColor(this.focusOnce ? '#dbffffff' : '#33ffffff')
          .fontColor(this.focusOnce ? '#e6000000' : '#dbffffff')
          .borderRadius(`72lpx`)
          .stateStyles({
            focused: {
              .border({
                color: Color.Transparent
              });
            }
          })
          .onFocus(() => {
            this.focusOnce = true;
          })
          .onBlur(() => {
            this.focusOnce = false;
          })
          .onClick(() => {
            this.sendEmitterEvent(PermissionType.ONCE);
          });
      }
      .padding('6lpx')
      .border({
        width: '2lpx',
        color: this.focusOnce ? Color.White : Color.Transparent,
        radius: '72lpx',
        style: BorderStyle.Solid
      })
      .justifyContent(FlexAlign.Center)
      .focusable(true)
      .margin('5lpx');

      Column() {
        Text($r('app.string.cancel'))
          .fontSize(`42lpx`)
          .width(`594lpx`)
          .height(`72lpx`)
          .focusable(true)
          .focusOnTouch(true)
          .stateStyles({
            focused: {
              .border({
                color: Color.Transparent
              });
            }
          })
          .textAlign(TextAlign.Center)
          .backgroundColor(this.focusNone ? '#dbffffff' : '#33ffffff')
          .fontColor(this.focusNone ? '#e6000000' : '#dbffffff')
          .borderRadius(`72lpx`)
          .onFocus(() => {
            this.focusNone = true;
          })
          .onBlur(() => {
            this.focusNone = false;
          })
          .onClick(() => {
            globalThis.miracastImpl.stopMiracastService((errCode: number, returnValue: number) => {
              Log.info(TAG, 'stopMiracastService callback errcode:' + errCode + ', returnValue:' + returnValue);
              if (errCode == 0) {
                setTimeout(() => {
                  globalThis.miracastImpl.startMiracastService((errCode: number, returnValue: number) => {
                    Log.info(TAG, 'startMiracastService callback errcode:' + errCode + ', returnValue:' + returnValue);
                  });
                }, 1000);
              }
            });
            this.sendEmitterEvent(PermissionType.CANCEL);
          });
      }
      .padding('6lpx')
      .border({
        width: '2lpx',
        color: this.focusNone ? Color.White : Color.Transparent,
        radius: '72lpx',
        style: BorderStyle.Solid
      })
      .justifyContent(FlexAlign.Center)
      .focusable(true)
      .margin('5lpx');

    }
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
    .width(`${PermissionPanelSizeUtils.getIns().getRealSize().width}px`)
    .height(`${PermissionPanelSizeUtils.getIns().getRealSize().height}px`)
    .borderRadius(`${24 * this.scaling}px`)
    .backgroundColor('#404040');
  }

  onBackPress(): boolean | void {
    this.sendEmitterEvent(PermissionType.CANCEL);
  }

  sendEmitterEvent(type: PermissionType) {
    let event: emitter.InnerEvent = {
      eventId: 1000
    }
    let data: emitter.EventData = {
      data: { 'PermissionType': type }
    }
    emitter.emit(event, data);
    Log.info(TAG, `send emitter success, type is ${type}`);
  }
}
