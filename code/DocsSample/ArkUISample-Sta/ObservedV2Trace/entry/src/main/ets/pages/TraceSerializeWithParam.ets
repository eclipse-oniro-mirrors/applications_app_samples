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
// [Start TraceSerializeWithParam]
import { Button, Column, ComponentV2, Entry, Local, ObservedV2, Text, Trace } from '@kit.ArkUI';

@ObservedV2
class Source {
  @Trace public source: int;

  constructor(s: int) {
    // 有参构造
    this.source = s;
  }

  // 用户自定义静态函数
  static FromJSON(e: jsonx.JsonElement): Source {
    return new Source(e.getInteger('source'));
  }
}

@Entry
@ComponentV2
struct Index {
  @Local message: string = 'Hello World';
  @Local source: Source = new Source(1);

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
          // 使用JSON.parseJsonElement反序列生成JSONElement，再传入静态方法构建实例
          this.source = Source.FromJSON(JSON.parseJsonElement('{"source": 123}'));
        })
    }
  }
}

// [End TraceSerializeWithParam]

@Builder
export function traceSerializeWithParam(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.trace_serialize_with_param_title'))
}