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

import { common } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_AccessibilityExtension]';

@Entry
@Component
struct Index {
  @State inputText: string = '';
  @State toggleState: boolean = false;
  @State counter: number = 0;
  @State listItems: Resource[] = [
    $r('app.string.list_item_1'),
    $r('app.string.list_item_2'),
    $r('app.string.list_item_3'),
    $r('app.string.list_item_4'),
    $r('app.string.list_item_5')
  ];
  @State sliderValue: number = 50;
  @State checkboxState: boolean = false;
  @State swiperIndex: number = 0;
  @State counterLabel: string = '';
  @State sliderValueLabel: string = '';

  aboutToAppear(): void {
    let hostContext: common.Context | undefined = this.getUIContext().getHostContext();
    if (hostContext === undefined) {
      hilog.error(DOMAIN, TAG, '%{public}s', 'Failed to get host context.');
      return;
    }
    try {
      this.counterLabel = hostContext.resourceManager.getStringSync($r('app.string.counter_label').id);
      this.sliderValueLabel = hostContext.resourceManager.getStringSync($r('app.string.slider_value_label').id);
    } catch (err) {
      hilog.error(DOMAIN, TAG, 'Failed to resolve label resources. Cause: %{public}s',
        JSON.stringify(err));
    }
  }

  build() {
    Scroll() {
      Column() {
        Text($r('app.string.page_title'))
          .fontSize($r('app.float.title_font_size'))
          .fontWeight(FontWeight.Bold)
          .accessibilityText($r('app.string.page_title'))
          .accessibilityGroup(true)

        Text($r('app.string.section_basic_interaction'))
          .fontSize($r('app.float.section_font_size'))
          .fontWeight(FontWeight.Medium)
          .margin({ top: 20 })

        Button($r('app.string.btn_click_me'))
          .id('clickButton')
          .fontSize($r('app.float.button_font_size'))
          .margin({ top: 10 })
          .accessibilityText($r('app.string.btn_click_me'))
          .accessibilityDescription($r('app.string.btn_click_desc'))
          .onClick(() => {
            this.counter = this.counter + 1;
          })

        Button($r('app.string.btn_long_click'))
          .id('longClickButton')
          .fontSize($r('app.float.button_font_size'))
          .margin({ top: 10 })
          .accessibilityText($r('app.string.btn_long_click'))
          .accessibilityDescription($r('app.string.btn_long_click_desc'))
          .gesture(
            LongPressGesture()
              .onAction(() => {
                hilog.info(DOMAIN, TAG, '%{public}s', 'Long press detected.');
              })
          )

        Text(`${this.counterLabel}: ${this.counter}`)
          .id('counterText')
          .fontSize($r('app.float.normal_font_size'))
          .margin({ top: 10 })
          .accessibilityText(`${this.counterLabel}: ${this.counter}`)

        Text($r('app.string.section_text_input'))
          .fontSize($r('app.float.section_font_size'))
          .fontWeight(FontWeight.Medium)
          .margin({ top: 20 })

        TextInput({ placeholder: $r('app.string.input_placeholder'), text: this.inputText })
          .id('textInput')
          .fontSize($r('app.float.normal_font_size'))
          .margin({ top: 10 })
          .accessibilityText($r('app.string.input_accessibility_text'))
          .accessibilityDescription($r('app.string.input_accessibility_desc'))
          .onChange((value: string) => {
            this.inputText = value;
          })

        Text($r('app.string.section_toggle'))
          .fontSize($r('app.float.section_font_size'))
          .fontWeight(FontWeight.Medium)
          .margin({ top: 20 })

        Toggle({ type: ToggleType.Switch, isOn: this.toggleState })
          .id('toggleSwitch')
          .margin({ top: 10 })
          .accessibilityText($r('app.string.toggle_accessibility_text'))
          .accessibilityDescription($r('app.string.toggle_accessibility_desc'))
          .onChange((isOn: boolean) => {
            this.toggleState = isOn;
          })

        Text($r('app.string.section_list'))
          .fontSize($r('app.float.section_font_size'))
          .fontWeight(FontWeight.Medium)
          .margin({ top: 20 })

        List({ space: 8 }) {
          ForEach(this.listItems, (item: Resource, index: number) => {
            ListItem() {
              Text(item)
                .id(`listItem_${index}`)
                .fontSize($r('app.float.normal_font_size'))
                .width('100%')
                .padding(10)
                .backgroundColor($r('app.color.list_item_background'))
                .borderRadius(8)
                .accessibilityText(item)
                .onClick(() => {
                  hilog.info(DOMAIN, TAG, 'Clicked list item index: %{public}d', index);
                })
            }
          }, (item: Resource, index: number) => {
            return `listItem_${index}`;
          })
        }
        .width('100%')
        .height(200)
        .margin({ top: 10 })
        .accessibilityGroup(true)
        .accessibilityText($r('app.string.list_accessibility_text'))

        Text($r('app.string.section_slider'))
          .fontSize($r('app.float.section_font_size'))
          .fontWeight(FontWeight.Medium)
          .margin({ top: 20 })

        Row() {
          Slider({
            value: this.sliderValue,
            min: 0,
            max: 100,
            step: 1,
            style: SliderStyle.OutSet
          })
            .id('volumeSlider')
            .width('75%')
            .accessibilityText($r('app.string.slider_accessibility_text'))
            .accessibilityDescription($r('app.string.slider_accessibility_desc'))
            .onChange((value: number) => {
              this.sliderValue = value;
            })

          Text(`${this.sliderValueLabel}: ${Math.round(this.sliderValue)}`)
            .id('sliderValueText')
            .fontSize($r('app.float.normal_font_size'))
            .margin({ left: 8 })
        }
        .width('100%')
        .margin({ top: 10 })

        Text($r('app.string.section_checkbox'))
          .fontSize($r('app.float.section_font_size'))
          .fontWeight(FontWeight.Medium)
          .margin({ top: 20 })

        Row() {
          Checkbox({ name: 'notificationCheckbox', group: 'settings' })
            .id('notificationCheckbox')
            .select(this.checkboxState)
            .accessibilityText($r('app.string.checkbox_accessibility_text'))
            .accessibilityDescription($r('app.string.checkbox_accessibility_desc'))
            .onChange((value: boolean) => {
              this.checkboxState = value;
            })

          Text($r('app.string.checkbox_label'))
            .fontSize($r('app.float.normal_font_size'))
            .margin({ left: 8 })
        }
        .width('100%')
        .margin({ top: 10 })

        Text($r('app.string.section_swiper'))
          .fontSize($r('app.float.section_font_size'))
          .fontWeight(FontWeight.Medium)
          .margin({ top: 20 })

        Swiper() {
          Text($r('app.string.swiper_page_1'))
            .id('swiperPage1')
            .width('100%')
            .height(120)
            .textAlign(TextAlign.Center)
            .fontSize($r('app.float.section_font_size'))
            .backgroundColor($r('app.color.swiper_page_1_background'))
            .accessibilityText($r('app.string.swiper_page_1'))

          Text($r('app.string.swiper_page_2'))
            .id('swiperPage2')
            .width('100%')
            .height(120)
            .textAlign(TextAlign.Center)
            .fontSize($r('app.float.section_font_size'))
            .backgroundColor($r('app.color.swiper_page_2_background'))
            .accessibilityText($r('app.string.swiper_page_2'))

          Text($r('app.string.swiper_page_3'))
            .id('swiperPage3')
            .width('100%')
            .height(120)
            .textAlign(TextAlign.Center)
            .fontSize($r('app.float.section_font_size'))
            .backgroundColor($r('app.color.swiper_page_3_background'))
            .accessibilityText($r('app.string.swiper_page_3'))
        }
        .id('pageSwiper')
        .width('100%')
        .height(120)
        .margin({ top: 10 })
        .index(this.swiperIndex)
        .accessibilityText($r('app.string.swiper_accessibility_text'))
        .accessibilityDescription($r('app.string.swiper_accessibility_desc'))
        .onChange((index: number) => {
          this.swiperIndex = index;
          hilog.info(DOMAIN, TAG, 'Swiper page changed to: %{public}d', index);
        })

        Blank()
          .height(40)
      }
      .width('100%')
      .padding(20)
    }
    .width('100%')
    .height('100%')
  }
}
