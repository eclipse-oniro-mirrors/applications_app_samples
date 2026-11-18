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

import { ParamEngine } from '../core/ParamEngine';
import { PARAM_RANGE, PARAM_SELECT, PARAM_TOGGLE, ParamSpec } from '../core/SchemaTypes';

// 参数面板：按 schema 渲染滑杆 / 开关 / 下拉，自身不持有业务状态。
@Component
export struct ParamPanel {
  // specs 必须是 @Prop：切换场景时参数条目整体替换，普通属性不会驱动 ForEach 重建。
  @Prop specs: ParamSpec[] = [];
  // 场景标识：参与 ForEach 键值，避免同一参数位置在不同场景间复用控件而沿用旧的取值范围。
  @Prop sceneKey: string = '';
  @Link values: number[];
  public onValueChange: (index: number, value: number) => void = () => {};

  private selectOptions(spec: ParamSpec): SelectOption[] {
    const options: SelectOption[] = [];
    for (let index = 0; index < spec.options.length; index++) {
      options.push({ value: spec.options[index] });
    }
    return options;
  }

  private selectedText(spec: ParamSpec, index: number): string {
    const optionIndex: number = Math.round(this.valueAt(index));
    if (optionIndex >= 0 && optionIndex < spec.options.length) {
      return spec.options[optionIndex];
    }
    return '';
  }

  private valueAt(index: number): number {
    return index < this.values.length ? this.values[index] : 0;
  }

  // 控件 id：sceneKey 已含 groupKey 与场景号，拼上参数下标即可全模块唯一定位。
  private controlId(prefix: string, index: number): string {
    return prefix + '_' + this.sceneKey + '_' + index.toString();
  }

  build() {
    Column() {
      ForEach(this.specs, (spec: ParamSpec, index: number) => {
        Row() {
          Text(spec.key)
            .id(this.controlId('param_key', index))
            .fontSize(12)
            .fontColor($r('app.color.text_secondary'))
            .width(78)
            .maxLines(1)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
          if (spec.kind === PARAM_RANGE) {
            Slider({ value: this.valueAt(index), min: spec.min, max: spec.max, step: spec.step })
              .id(this.controlId('param_control', index))
              .layoutWeight(1)
              .onChange((value: number) => {
                this.onValueChange(index, value);
              })
          } else if (spec.kind === PARAM_TOGGLE) {
            Toggle({ type: ToggleType.Switch, isOn: this.valueAt(index) > 0.5 })
              .id(this.controlId('param_control', index))
              .layoutWeight(1)
              .align(Alignment.Start)
              .onChange((isOn: boolean) => {
                this.onValueChange(index, isOn ? 1 : 0);
              })
          } else if (spec.kind === PARAM_SELECT) {
            Select(this.selectOptions(spec))
              .id(this.controlId('param_control', index))
              .selected(Math.round(this.valueAt(index)))
              .value(this.selectedText(spec, index))
              .font({ size: 12 })
              .layoutWeight(1)
              .onSelect((optionIndex: number) => {
                this.onValueChange(index, optionIndex);
              })
          }
          Text(ParamEngine.describe(spec, this.valueAt(index)))
            .id(this.controlId('param_value', index))
            .fontSize(12)
            .fontColor($r('app.color.text_primary'))
            .width(72)
            .maxLines(1)
            .textAlign(TextAlign.End)
            .textOverflow({ overflow: TextOverflow.Ellipsis })
        }
        .id(this.controlId('param_row', index))
        .width('100%')
        .height(32)
        .padding({ left: 12, right: 12 })
      }, (spec: ParamSpec, index: number) => this.sceneKey + '-' + spec.key + '-' + index.toString())
    }
    .width('100%')
  }
}
