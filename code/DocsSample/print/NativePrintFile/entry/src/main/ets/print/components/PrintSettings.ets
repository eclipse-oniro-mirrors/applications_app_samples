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

@Component
export struct PrintSettings {
  @Link copyNumber: number;
  @Link borderless: boolean;
  @Link leftMargin: string;
  @Link topMargin: string;
  @Link rightMargin: string;
  @Link bottomMargin: string;
  @Link colorMode: number;
  @Link duplexMode: number;
  @Link orientationMode: number;
  @Link printQuality: number;
  @Link mediaType: string;

  private resetMargins(): void {
    this.leftMargin = '0';
    this.topMargin = '0';
    this.rightMargin = '0';
    this.bottomMargin = '0';
  }

  @Builder
  MarginInput(label: Resource, value: () => string, inputId: string, update: (value: string) => void) {
    Column({ space: 4 }) {
      Text(label)
        .fontSize(12)
        .fontColor($r('app.color.text_secondary'))
      TextInput({ text: value() })
        .id(inputId)
        .type(InputType.Number)
        .height(40)
        .enabled(!this.borderless)
        .onChange((text: string) => {
          update(text);
        })
    }
    .width('48%')
    .alignItems(HorizontalAlign.Start)
  }

  build() {
    Column({ space: 12 }) {
      Row({ space: 12 }) {
        Text($r('app.string.copy_number'))
          .layoutWeight(1)
        Button($r('app.string.decrease'))
          .id('copy_subtract')
          .enabled(this.copyNumber > 1)
          .onClick(() => {
            if (this.copyNumber > 1) {
              this.copyNumber--;
            }
          })
        Text(this.copyNumber.toString())
          .id('copy_value')
          .width(32)
          .textAlign(TextAlign.Center)
        Button($r('app.string.increase'))
          .id('copy_add')
          .enabled(this.copyNumber < 99)
          .onClick(() => {
            if (this.copyNumber < 99) {
              this.copyNumber++;
            }
          })
      }
      .width('100%')

      Row({ space: 8 }) {
        Text($r('app.string.media_type'))
          .width('38%')
        Select([
          { value: $r('app.string.media_type_plain') },
          { value: $r('app.string.media_type_photo') }
        ])
          .id('media_type_select')
          .selected(this.mediaType === 'photographic-glossy' ? 1 : 0)
          .value(this.mediaType === 'photographic-glossy' ? $r('app.string.media_type_photo') :
            $r('app.string.media_type_plain'))
          .layoutWeight(1)
          .onSelect((index: number) => {
            this.mediaType = index === 1 ? 'photographic-glossy' : 'stationery';
          })
      }
      .width('100%')

      Row() {
        Text($r('app.string.borderless'))
          .layoutWeight(1)
        Toggle({ type: ToggleType.Switch, isOn: this.borderless })
          .id('borderless_switch')
          .onChange((isOn: boolean) => {
            this.borderless = isOn;
            if (isOn) {
              this.resetMargins();
            }
          })
      }
      .width('100%')

      Flex({ wrap: FlexWrap.Wrap, justifyContent: FlexAlign.SpaceBetween }) {
        this.MarginInput($r('app.string.margin_left'), () => this.leftMargin, 'margin_left', (value: string) => {
          this.leftMargin = value;
        })
        this.MarginInput($r('app.string.margin_top'), () => this.topMargin, 'margin_top', (value: string) => {
          this.topMargin = value;
        })
        this.MarginInput($r('app.string.margin_right'), () => this.rightMargin, 'margin_right', (value: string) => {
          this.rightMargin = value;
        })
        this.MarginInput($r('app.string.margin_bottom'), () => this.bottomMargin, 'margin_bottom', (value: string) => {
          this.bottomMargin = value;
        })
      }
      .width('100%')

      Row({ space: 8 }) {
        Text($r('app.string.color_mode'))
          .width('38%')
        Select([
          { value: $r('app.string.monochrome') },
          { value: $r('app.string.color') },
          { value: $r('app.string.auto') }
        ])
          .id('color_mode_select')
          .selected(this.colorMode)
          .value(this.colorMode === 0 ? $r('app.string.monochrome') :
            (this.colorMode === 1 ? $r('app.string.color') : $r('app.string.auto')))
          .layoutWeight(1)
          .onSelect((index: number) => {
            this.colorMode = index;
          })
      }
      .width('100%')

      Row({ space: 8 }) {
        Text($r('app.string.duplex_mode'))
          .width('38%')
        Select([
          { value: $r('app.string.one_sided') },
          { value: $r('app.string.long_edge') },
          { value: $r('app.string.short_edge') }
        ])
          .id('duplex_mode_select')
          .selected(this.duplexMode)
          .value(this.duplexMode === 0 ? $r('app.string.one_sided') :
            (this.duplexMode === 1 ? $r('app.string.long_edge') : $r('app.string.short_edge')))
          .layoutWeight(1)
          .onSelect((index: number) => {
            this.duplexMode = index;
          })
      }
      .width('100%')

      Row({ space: 8 }) {
        Text($r('app.string.orientation'))
          .width('38%')
        Select([
          { value: $r('app.string.portrait') },
          { value: $r('app.string.landscape') }
        ])
          .id('orientation_select')
          .selected(this.orientationMode)
          .value(this.orientationMode === 0 ? $r('app.string.portrait') : $r('app.string.landscape'))
          .layoutWeight(1)
          .onSelect((index: number) => {
            this.orientationMode = index;
          })
      }
      .width('100%')

      Row({ space: 8 }) {
        Text($r('app.string.print_quality'))
          .width('38%')
        Select([
          { value: $r('app.string.quality_draft') },
          { value: $r('app.string.quality_normal') },
          { value: $r('app.string.quality_high') }
        ])
          .id('print_quality_select')
          .selected(this.printQuality - 3)
          .value(this.printQuality === 3 ? $r('app.string.quality_draft') :
            (this.printQuality === 4 ? $r('app.string.quality_normal') : $r('app.string.quality_high')))
          .layoutWeight(1)
          .onSelect((index: number) => {
            this.printQuality = index + 3;
          })
      }
      .width('100%')
    }
    .width('100%')
    .padding(16)
    .backgroundColor($r('app.color.card_background'))
    .borderRadius(16)
  }
}
