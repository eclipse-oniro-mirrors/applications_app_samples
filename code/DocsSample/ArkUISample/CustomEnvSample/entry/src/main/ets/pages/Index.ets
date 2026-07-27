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

interface  PageMessageModel {
  text:string
  url:string
}

@Entry
@Component
struct Index {
  @State pageTextMessage: PageMessageModel[] = [
    {text:'@CustomEnv支持自定义key和value',url:'pages/CustomValuePage'},{text:'@CustomEnv支持多种数据类型',url:'pages/CustomEnvValueClassPage'},{text:'@CustomEnv支持默认初始值',url:'pages/CustomEnvDefaultValPage'},
    {text:'环境变量查找遵循就近原则',url:'pages/CustomEnvNearPage'},{text:'响应式更新能力',url:'pages/CustomEnvValUpdatePage'},{text:'@CustomEnv支持与@Watch连用',url:'pages/CustomEnvSupportWatchPage'},
    {text:'@CustomEnv支持与@Monitor连用',url:'pages/CustomEnvSupportMonitorPage'},{text:'装饰Array类型变量',url:'pages/CustomEnvSupportArrayPage'},{text:'装饰Date类型变量',url:'pages/CustomEnvSupportDatePage'},
    {text:'装饰Map类型变量',url:'pages/CustomEnvSupportMapPage'},{text:'装饰Set类型变量',url:'pages/CustomEnvSupportSetPage'},{text:'@CustomEnv装饰的变量传递给V2只有@Param可以接收外部变量',url:'pages/CustomEnvMixParamV1ToV2Page'},
    {text:'@CustomEnv支持组件冻结',url:'pages/CustomEnvSupportComponentFreezePage'},{text:'@CustomEnv装饰的变量传递给V1时V1不能接收@ObservedV2装饰的class',url:'pages/CustomEnvObservedMixV2ToV1WithenableV2CompatibilityPage'},{text:'当@CustomEnv装饰的变量的类型被@Observed装饰时需要调用enableV2Compatibility',url:'pages/CustomEnvObservedV2MixV2ToV1Page'},
    {text:'@CustomEnv支持@Watch监听二维数组内部变化',url:'pages/CustomEnvSupportDeepWatchPage'}
  ]

  build() {
    Column() {
      ForEach(this.pageTextMessage,(item:PageMessageModel,index:number)=>{
        Button(item.text).onClick(()=>{
          this.getUIContext().getRouter().pushUrl({url:item.url})
        })
      })
    }.justifyContent(FlexAlign.SpaceBetween)

    .height('100%')
    .width('100%')
  }
}