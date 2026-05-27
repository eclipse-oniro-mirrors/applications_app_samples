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
// [Start LinkStateVarInit]
import { Column, Component, Entry, Link, State, Text } from '@kit.ArkUI';

class Info {
  info: string = 'Hello';
}

@Component
struct Child {
  @Link msg: string;
  @Link info: Info;

  build() {
    Text(this.msg + this.info.info)
  }
}

@Entry
@Component
struct LinkExample {
  @State message: string = 'Hello';
  @State info: Info = new Info();

  build() {
    Column() {
      // 正确写法
      Child({msg: this.message, info: this.info})
    }
  }
}
// [End LinkStateVarInit]

@Builder
export function linkStateVarInit(): void {
  NavDestination() {
    LinkExample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.link_state_var_init_title'))
}