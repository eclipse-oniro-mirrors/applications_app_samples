/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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
// [Start mutable_builder_binding]
import { UIUtils, MutableBinding } from '@kit.ArkUI';

@Builder
function textBuilder(p: MutableBinding<string>) {
  Text(p.value)
    .margin(20)
    .onClick(() => {
      p.value += 't';
    })
}

@Builder
function buttonBuilder(p: MutableBinding<string>) {
  Button(p.value)
    .margin(20)
    .onClick(() => {
      p.value += 'b';
    })
}

let counter: number = 1;

@Entry
@ComponentV2
struct MyApp {
  @Local message: string = 'init';
  @Local switchingBuilder: MutableBuilder<[MutableBinding<string>]> = mutableBuilder(textBuilder);

  @Monitor('switchingBuilder') variableChange(m: IMonitor): void {
    console.info(`Builder changed. is buttonBuilder: ${m.value<MutableBuilder<[MutableBinding<string>]>>()?.now.builder === buttonBuilder}`);
  }

  build() {
    Column() {
      this.switchingBuilder.builder(UIUtils.makeBinding(()=> this.message, txt => this.message = txt))
      Button('Click to change')
        .onClick(() => {
          counter++;
          if(counter % 2 === 0) {
            this.message += 'B';
            this.switchingBuilder = mutableBuilder(buttonBuilder); // textBuilder--->buttonBuilder，@Monitor会触发回调
          } else {
            this.message += 'T';
            this.switchingBuilder = mutableBuilder(textBuilder); // buttonBuilder--->textBuilder，@Monitor会触发回调
          }
        })
    }.position({x: 120, y: 60})
  }
}
// [End mutable_builder_binding]
@Builder
export function mutableBuilderBinding() {
  NavDestination() {
    MyApp()
  }
}