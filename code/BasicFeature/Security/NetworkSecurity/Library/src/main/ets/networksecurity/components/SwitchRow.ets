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

/**
 * Reusable row with a label, optional description and a bound switch control.
 */
@ComponentV2
export struct SwitchRow {
  // Prefix used to build the accessibility ids of the inner components.
  @Param idPrefix: string = 'id_switch';
  // Primary label text shown on the left.
  @Param label: ResourceStr = '';
  // Optional secondary description under the label.
  @Param description: ResourceStr = '';
  // Current switch state.
  @Param isOn: boolean = false;
  // Whether the switch accepts user interaction.
  @Param active: boolean = true;
  // Event raised when the user flips the switch.
  @Event onToggle: (value: boolean) => void = (value: boolean) => {
  };

  /**
   * Build the row layout with the text block and the toggle.
   */
  build() {
    Row({ space: 12 }) {
      Column({ space: 4 }) {
        Text(this.label)
          .id(this.idPrefix + '_label')
          .fontSize(14)
          .fontColor($r('app.color.text_primary'))
          .width('100%')
        // Render the description only when the caller provided one.
        if (this.description !== '') {
          Text(this.description)
            .id(this.idPrefix + '_description')
            .fontSize(12)
            .fontColor($r('app.color.text_tertiary'))
            .width('100%')
        }
      }
      .id(this.idPrefix + '_text')
      .layoutWeight(1)
      .alignItems(HorizontalAlign.Start)

      Toggle({ type: ToggleType.Switch, isOn: this.isOn })
        .id(this.idPrefix + '_toggle')
        .enabled(this.active)
        .onChange((isOn: boolean) => {
          // Forward the new switch state to the caller.
          this.onToggle(isOn);
        })
    }
    .id(this.idPrefix + '_row')
    .width('100%')
    .constraintSize({ minHeight: 48 })
    .alignItems(VerticalAlign.Center)
  }
}
