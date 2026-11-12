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
import { KeyCode } from '@kit.InputKit';

const TAB_FOCUS_DELAY = 50;

// Projection settings
@Component
export struct SettingView {
  @State nameFocus: boolean = false;
  @State listFocus: boolean = false;
  @State focusedIndex: number = -1;
  // Handle highlight state changes of child components
  handleActiveChange = (index: number, active: boolean) => {
    if (active) {
      this.focusedIndex = index;
    } else {
      if (this.focusedIndex === index) {
        this.focusedIndex = -1;
      }
    }
  };

  build() {
    Row() {
      Column() {
        NarItem({
          icon: $r('app.media.bianji'),
          title: $r('app.string.screen_projection_device_name'),
          url: 'pages/ChangeNamePage',
          index: 0,
          focusedIndex: this.focusedIndex,
          onActiveChange: this.handleActiveChange
        });

        NarItem({
          icon: $r('app.media.kexingshebeiliebiao'),
          title: $r('app.string.trusted_device_list'),
          url: 'pages/TrustDeviceListPage',
          index: 1,
          focusedIndex: this.focusedIndex,
          onActiveChange: this.handleActiveChange
        });
      }
      .width('864lpx');

      Column() {
        Image($r('app.media.toupingda'))
          .width('320lpx')
          .height('280lpx');

        Text($r('app.string.support_name_modification'))
          .opacity(0.4)
          .fontSize('36lpx')
          .fontWeight(500)
          .fontColor('#dbffffff')
          .margin({ top: '20lpx' });
      }
      .margin({ left: '300lpx', top: '68lpx' })
      .alignItems(HorizontalAlign.Center)
      .justifyContent(FlexAlign.Center);
    }
    .width('100%');
  }
}

@Component
struct NarItem {
  icon: Resource = $r('app.media.bianji');
  title: Resource | string = '';
  url: string = '';
  @Consume('stopTabFocus') stopTabFocus: boolean;
  @State timerId: number = 0;
  @Prop index: number = -1;
  @Prop focusedIndex: number = -1;
  onActiveChange: (index: number, active: boolean) => void = (index: number, active: boolean) => {
  };

  aboutToDisappear(): void {
    if (this.timerId) {
      clearTimeout(this.timerId);
    }
    this.onActiveChange(this.index, false);
  }

  build() {
    Navigator({ target: this.url, type: NavigationType.Push }) {
      Flex({ direction: FlexDirection.Row, justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
        Text(this.title)
          .fontSize('36lpx')
          .fontWeight(500)
          .fontColor($r('app.color.white'))
          .focusable(true)
          .stateStyles({
            focused: {
              .border({
                color: Color.Transparent
              });
            }
          })
          .margin({ left: '32lpx' })
          .fontColor(this.focusedIndex === this.index ? '#db000000' : '#dbffffff');
        Image($r('app.media.icon_arrow_right'))
          .fillColor(this.focusedIndex === this.index ? Color.Black : Color.White)
          .width('24lpx')
          .height('48lpx')
          .opacity(this.focusedIndex === this.index ? 1 : 0.25)
          .objectFit(ImageFit.Fill)
          .align(Alignment.Center)
          .margin({ right: '25lpx' });
      }
    }
    .focusable(true)
    .focusOnTouch(true)
    .borderRadius('18lpx')
    .margin({ bottom: '32lpx' })
    .width('864lpx')
    .height('114lpx')
    .backgroundColor(this.focusedIndex === this.index ? '#dbffffff' : '#33ffffff')
    .onHover((isHover: boolean) => {
      this.onActiveChange(this.index, isHover);
    })
    .onBlur(() => {
      this.onActiveChange(this.index, false);
    })
    .onFocus(() => {
      this.onActiveChange(this.index, true);
    })
    .onKeyEvent((event: KeyEvent) => {
      if (this.url === 'pages/ChangeNamePage') {
        if (event.type === KeyType.Down) {
          if (event.keyCode === KeyCode.KEYCODE_DPAD_UP || event.keyCode === KeyCode.KEYCODE_DPAD_LEFT) {
            this.stopTabFocus = true;
            // Request focus for the projection settings item
            focusControl.requestFocus('projection_Settings');
            this.timerId = setTimeout(() => {
              this.stopTabFocus = false;
            }, TAB_FOCUS_DELAY);
          }
        }
      }
    });
  }
}
