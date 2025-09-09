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
import { SearchSwiperComponent } from 'library1_2';
import { ProductWaterFlowPage } from './ArkUI1_2';

@Entry
@Component
struct Index {
  build() {
    Column() {
      Tabs() {
        TabContent(){
          ProductWaterFlowPage()
        }.tabBar('1.2调用1.1')
        TabContent(){
          SearchSwiperComponent()
        }.tabBar('1.1调用1.2')
      }.width('100%').height('100%')
    }
  }
}