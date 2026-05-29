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
// [Start PersistentStorageClass]
import { AppStorage, Button, ClickEvent, Column, Component, Entry, Observed, PersistentStorage, StorageLink, Text } from '@kit.ArkUI';

@Observed
class User {
  userId: number = 1;
  userName: string = 'jack';
  isUser: boolean = false;

  constructor(userId?: number, userName?: string, isUser?: boolean) {
    this.userName = userName ?? 'default';
    this.userId = userId ?? 1;
    this.isUser = isUser ?? false;
  }
}

@Entry
@Component
struct ClassSample {
  success: boolean = PersistentStorage.persistProp<User>('user', new User());
  @StorageLink('user') user: User = new User();

  build() {
    Column() {
      Button(`user Id: ${this.user.userId}`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
            this.user.userId += 10;
        })
      Button(`user Id: ${this.user.userId}`)
        .width(300)
        .margin(10)
        .onClick((e: ClickEvent) => {
          this.user = new User(456, 'byAppStorage', true);
          if (AppStorage.has('user')) {
            AppStorage.set<User>('user', this.user);
          }
        })
    }
    .width('100%')
  }
}

// [End PersistentStorageClass]

@Builder
export function persistentStorageClass(): void {
  NavDestination() {
    ClassSample();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.persistent_storage_class_title'))
}