'use static'

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
import { NavDestination, $r } from '@kit.ArkUI';
// [Start ObjectLinkSerializeNoParam]
import { Button, Column, Component, Entry, Observed, State, Text } from '@kit.ArkUI';

@Observed
class Source {
  public source: int = 123;
}

@Entry
@Component
struct Index {
  @State message: string = 'Hello World';
  @State source: Source = new Source();

  build() {
    Column() {
      Text(`Source ${this.source.source} and message ${this.message}`)
      Button('+1')
        .onClick((e) => {
          this.source.source += 1;
        })
      Button('Serialize')
        .onClick((e) => {
          this.message = JSON.stringify(this.source);
        })
      Button('Deserialize')
        .onClick((e) => {
          // 反序列化生成@Observed类并赋值
          this.source = JSON.parse<Source>('{"source": 123}', Type.from<Source>())!;
        })
    }
  }
}
// [End ObjectLinkSerializeNoParam]

@Builder
export function objectLinkSerializeNoParam(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.object_link_serialize_no_param_title'))
}