/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { memo, __memo_context_type, __memo_id_type } from '@ohos.arkui.stateManagement'; // should be insert by ui-plugins
import { Text, List, ListItem, Column, Button, Image, Row, Stack,ListItemGroup, Divider, Blank,
  Tabs, TabContent, Flex, FlexOptions, Callback, px2vp, ItemAlign, BackgroundBrightnessOptions,
  ButtonAttribute, ClickEvent, Component, BuilderParam, Padding, $r, SafeAreaEdge, BackgroundBlurStyleOptions,
  BarState, NestedScrollOptions, NestedScrollMode, Color, JSON, Alignment, FlexDirection, BarPosition, Position,
  FlexAlign, BlurStyle, LazyForEach, ForEach, Builder, Margin, SafeAreaType, Entry,
  TabsController, TabsOptions ,StackOptions, ThemeColorMode, AdaptiveColor, ResourceStr, SizeOptions
} from '@ohos.arkui.component'  // TextAttribute should be insert by ui-plugins
import { State, StateDecoratedVariable, MutableState, stateOf, observableProxy,ObjectLink, Observed } from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import hilog from '@ohos.hilog';
import camera from '@ohos.multimedia.camera';
import { TabsSample } from './backgroundblur/TabsSample';

@Entry
@Component
struct MyStateSample {
  build() {
    Column(undefined) {
      TabsSample()
    }
  }
}