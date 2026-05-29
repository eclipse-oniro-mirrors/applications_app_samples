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
// [Start BuilderParamMustBuilderPositive]
import { Entry, Component, Column, Builder, BuilderParam, Text } from '@kit.ArkUI';

@Builder function globalBuilder() {
  Text('Hello World')
}
@Entry
@Component
struct customBuilderDemo {
  build() {
    Column() {
      ChildPage({ChildBuilder: globalBuilder})
    }
  }
}

@Component
struct ChildPage {
  @BuilderParam ChildBuilder: () => void = globalBuilder;
  build() {
    Column() {
      this.ChildBuilder()
    }
  }
}

// [End BuilderParamMustBuilderPositive]

@Builder
export function builderParamMustBuilderPositive(): void {
  NavDestination() {
    customBuilderDemo();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.builderparam_must_builder_title'))
}
