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

// [Start StaDynStorageLspMainPage]
// dynamic_module/src/main/ets/components/MainPage.ets

@Component
export struct LocalStoragePropPage {
  @LocalStorageProp('PropA') storageProp: number = 1;

  build() {
    Column() {
      Button(`click times: ${this.storageProp}`)
        .onClick(() => {
          // 状态变化不会同步给ArkTS-Sta的LocalStorage
          this.storageProp += 1;
        })
        .width(300)
        .margin(10)
    }
    .width('100%')
  }
}
// [End StaDynStorageLspMainPage]

// [Start StaDynStorageLslMainPage]
// dynamic_module/src/main/ets/components/MainPage.ets

@Component
export struct LocalStorageLinkPage {
  @LocalStorageLink('PropA') storageLink: number = 1;

  build() {
    Column() {
      Button(`click times: ${this.storageLink}`)
        .onClick(() => {
          // 状态变化会同步给ArkTS-Sta的LocalStorage，并同步更新ArkTS-Sta组件
          this.storageLink += 1;
        })
        .width(300)
        .margin(10)
    }
    .width('100%')
  }
}
// [End StaDynStorageLslMainPage]

// [Start StaDynStorageSpMainPage]
// dynamic_module/src/main/ets/components/MainPage.ets

@Component
export struct StoragePropPage {
  @StorageProp('PropA') storageProp: number = 1;

  build() {
    Column() {
      Button(`click times: ${this.storageProp}`)
        .onClick(() => {
          // 状态变化不会同步给ArkTS-Sta的AppStorage
          this.storageProp += 1;
        })
        .width(300)
        .margin(10)
    }
    .width('100%')
  }
}
// [End StaDynStorageSpMainPage]

// [Start StaDynStorageSlMainPage]
// dynamic_module/src/main/ets/components/MainPage.ets

@Component
export struct StorageLinkPage {
  @StorageLink('PropA') storageLink: number = 1;

  build() {
    Column() {
      Button(`click times: ${this.storageLink}`)
        .onClick(() => {
          // 状态变化会同步给ArkTS-Sta的AppStorage，并同步更新ArkTS-Sta组件
          this.storageLink += 1;
        })
        .width(300)
        .margin(10)
    }
    .width('100%')
  }
}
// [End StaDynStorageSlMainPage]

// [Start StaDynStorageAppMainPage]
// dynamic_module/src/main/ets/components/MainPage.ets

let gPropA: number = 0;

@Component
export struct AppStoragePage {
  build() {
    Column() {
      Button('change AppStorage')
        .onClick(() => {
          // 通过接口修改ArkTS-Sta的AppStorage并同步更新ArkTS-Sta组件
          AppStorage.setOrCreate('PropA', ++gPropA);
        })
        .width(300)
        .margin(10)
    }
    .width('100%')
  }
}
// [End StaDynStorageAppMainPage]

// [Start StaDynStoragePersistMainPage]
// dynamic_module/src/main/ets/components/MainPage.ets

@Component
export struct PersistentStoragePage {
  // ArkTS-Dyn绑定ArkTS-Sta PersistentStorage数据
  @StorageLink('LinkA') persistLink: string = 'dynamicB';
  @StorageProp('LinkA') persistProp: string = 'dynamicB';

  build() {
    Row() {
      Column() {
        Text('----- dynamic storagelink -----')
          .fontSize(20)
          .margin(10)
         // 退出应用后重新进入，修改保留
        Text(`PersistentStorage LinkA: ${this.persistLink}`)
          .fontSize(20)
          .margin(10)
        Button('change LinkA')
          .onClick((e: ClickEvent) => {
            // 点击后同步更新ArkTS-Dyn和ArkTS-Sta中的Text组件
            this.persistLink += 'b';
          })
          .width(300)
          .margin(10)
        Text('----- dynamic storageprop -----')
          .fontSize(20)
          .margin(10)
        // 退出应用后重新进入，同步为LinkA的值
        Text(`PersistentStorage PropB: ${this.persistProp}`)
          .fontSize(20)
          .margin(10)
        Button('change PropB')
          .onClick((e: ClickEvent) => {
            // 点击后仅更新当前Text组件
            this.persistProp += 'b';
          })
          .width(300)
          .margin(10)
      }
    }
  }
}
// [End StaDynStoragePersistMainPage]

// [Start StaDynStorageEnvMainPage]
// dynamic_module/src/main/ets/components/MainPage.ets

@Component
export struct EnvironmentPage {
  // ArkTS-Dyn绑定ArkTS-Sta Environment数据
  @StorageLink('fontScale') fontScaleLink: number = 4.0;
  @StorageProp('fontScale') fontScaleProp: number = 4.0;

  build() {
    Row() {
      Column() {
        Text('----- dynamic storagelink -----')
          .fontSize(20)
          .margin(10)
        Text(`Environment fontscale link: ${this.fontScaleLink}`)
          .fontSize(this.fontScaleLink)
          .margin(10)
        Button('change fontscale link')
          .onClick((e: ClickEvent) => {
            // 点击后同步更新ArkTS-Dyn和ArkTS-Sta中的Text组件，fontSize加2
            this.fontScaleLink += 2.0;
          })
          .width(300)
          .margin(10)
        Text('----- dynamic storageprop -----')
          .fontSize(20)
          .margin(10)
        Text(`Environment fontscale prop: ${this.fontScaleProp}`)
          .fontSize(this.fontScaleProp)
          .margin(10)
        Button('change fontscale prop')
          .onClick((e: ClickEvent) => {
            // 点击后仅更新当前Text组件，fontSize加2
            this.fontScaleProp += 2.0;
          })
          .width(300)
          .margin(10)
      }
    }
  }
}
// [End StaDynStorageEnvMainPage]
