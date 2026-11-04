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

import { display } from '@kit.ArkUI';
import { TrustDeviceInfo, Log, TrustDeviceManager } from 'library';
import { KeyCode } from '@kit.InputKit';

const TAG = 'TrustDeviceListPage';

@Entry
@Component
struct TrustDeviceListPage {
  @State devices: Array<TrustDeviceInfo> = [];
  @State exitButtonFocused: boolean = false;
  @State screenWidth: number = display.getDefaultDisplaySync().width;
  @State screenHeight: number = display.getDefaultDisplaySync().height;
  currentItem: TrustDeviceInfo | null = null;
  deleteDialogController: CustomDialogController = new CustomDialogController({
    builder: DeleteDialog({
      confirm: () => {
        if (this.currentItem) {
          this.deleteDataItem(this.currentItem);
        }
      }
    }),
    customStyle: true,
    autoCancel: false,
    alignment: DialogAlignment.Center
  });

  aboutToAppear(): void {
    this.getAllData();
  }

  getAllData() {
    TrustDeviceManager.getIns().getAllDeviceDataList().then((data: Array<TrustDeviceInfo>) => {
      this.devices = data;
    });
  }

  deleteDataItem(item: TrustDeviceInfo) {
    TrustDeviceManager.getIns().deleteDeviceDataItem(item.id).then(() => {
      this.getAllData();
    });
  }

  build() {
    Column() {
      Text($r('app.string.trusted_device_list'))
        .fontSize('64lpx')
        .fontColor('#e6ffffff')
        .opacity(0.9)
        .focusable(false)
        .width('100%');

      Row() {
        Column() {
          List({ space: '32lpx' }) {
            ForEach(this.devices, (item: TrustDeviceInfo, index: number) => {
              ListItem() {
                DeviceItem({
                  info: item,
                  focused: 0 == index,
                  deleteCallback: (item: TrustDeviceInfo) => {
                    this.currentItem = item;
                    this.deleteDialogController.open();
                  }
                });
              }
              .stateStyles({
                focused: {
                  .border({
                    color: Color.Transparent
                  });
                }
              });
            });
          }
          .width('100%')
          .height('100%');
        }
        .width('864lpx')
        .height('100%');

        Column() {
          Image($r('app.media.toupingda'))
            .width('320lpx')
            .height('280lpx');

          Text('查看可信设备列表')
            .fontSize('36lpx')
            .fontWeight(500)
            .opacity(0.4)
            .margin({ top: '20lpx' })
            .fontColor('#dbffffff');
        }
        .margin({ left: '300lpx', top: '187lpx' });
      }
      .width('100%')
      .height('100%')
      .alignItems(VerticalAlign.Top)
      .margin({ top: '70lpx' });
    }
    .padding({ left: '96lpx', top: '53lpx' })
    .width('100%')
    .height('100%')
    .backgroundColor('#18181A');
  }
}

@Component
struct DeviceItem {
  info: TrustDeviceInfo = {
    id: '',
    name: '',
    type: 0,
    date: new Date()
  }
  @State focused: boolean = false;
  private deleteCallback: Callback<TrustDeviceInfo> | undefined;

  build() {
    Row() {
      Image(this.focused ? $r('app.media.shebei_yes') : $r('app.media.shebei_no'))
        .width('64lpx')
        .height('64lpx')
        .margin({ left: '24lpx' })
        .focusable(true)
        .onClick(() => {
          Log.info(TAG, `--->>>>  Image  shebei`);
          if (this.focused && this.deleteCallback) {
            Log.info(TAG, 'onClick item id:' + this.info.id);
            this.deleteCallback(this.info);
          }
        });

      Text(this.info.name)
        .fontColor(this.focused ? '#db000000' : '#dbffffff')
        .fontSize('40lpx')
        .fontWeight(500)// .focusable(true)
        .margin({ left: '24lpx' })
        .onClick(() => {
          Log.info(TAG, `--->>>>  Text`);
          if (this.focused && this.deleteCallback) {
            Log.info(TAG, 'onClick item id:' + this.info.id);
            this.deleteCallback(this.info);
          }
        });

      Blank().layoutWeight(1);

    }
    .width('100%')
    .height('114lpx')
    .alignItems(VerticalAlign.Center)
    .backgroundColor(this.focused ? '#dbffffff' : '#33ffffff')
    .borderRadius('18lpx')
    .focusOnTouch(true)
    .focusable(true)
    .defaultFocus(this.focused)
    .onFocus(() => {
      this.focused = true;
    })
    .onBlur(() => {
      this.focused = false;
    });
  }
}

@CustomDialog
@Component
struct DeleteDialog {
  controller: CustomDialogController;
  @State screenHeight: number = display.getDefaultDisplaySync().height;
  @State cancelFocus: boolean = false;
  @State confirmFocus: boolean = false;
  confirm: () => void = () => {
  }

  tabStartClick() {
    try {
      setTimeout(() => {
        focusControl.requestFocus('confirmBtn');
      }, 50);
    } catch (e) {
      Log.error(TAG, 'focus request failed: ' + JSON.stringify(e));
    }
  }

  onPageShow(): void {
    this.tabStartClick();
  }

  build() {
    Column() {
      Text($r('app.string.tip'))
        .fontWeight(500)
        .fontColor($r('app.color.white'))
        .fontSize(`40lpx`);

      Text('是否移除该信任设备？')
        .fontWeight(500)
        .width('100%')
        .margin({ top: `48lpx` })
        .fontColor($r('app.color.white'))
        .textAlign(TextAlign.Center)
        .fontSize(`28lpx`);

      Row() {
        Button('取消')
          .width(`248lpx`)
          .height(`72lpx`)
          .fontSize(`36lpx`)
          .fontColor(this.cancelFocus ? '#e6000000' : '#dbffffff')
          .backgroundColor(this.cancelFocus ? '#dbffffff' : '#33ffffff')
          .focusOnTouch(true)
          .focusable(true)
          .stateStyles({
            focused: {
              .border({
                color: Color.Transparent
              });
            }
          })
          .onAppear(() => {
            focusControl.requestFocus('cancel');
          })
          .key('cancel')
          .onFocus(() => {
            this.cancelFocus = true;
          })
          .onBlur(() => {
            this.cancelFocus = false;
          })
          .onClick(() => {
            this.controller.close();
          });

        Button('确认')
          .width(`248lpx`)
          .height(`72lpx`)
          .fontSize(`36lpx`)
          .fontColor(this.confirmFocus ? '#e6000000' : '#dbffffff')
          .backgroundColor(this.confirmFocus ? '#dbffffff' : '#33ffffff')
          .focusOnTouch(true)
          .focusable(true)
          .stateStyles({
            focused: {
              .border({
                color: Color.Transparent
              });
            }
          })
          .margin({ left: `47.29lpx` })
          .onFocus(() => {
            this.confirmFocus = true;
          })
          .onBlur(() => {
            this.confirmFocus = false;
          })
          .onClick(() => {
            this.confirm();
            this.controller.close();
          });
      }
      .margin({ top: `63.63lpx` });
    }
    .width(`692lpx`)
    .height(`332lpx`)
    .borderRadius(`24lpx`)
    .backgroundColor('#404040')
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center);
  }
}
