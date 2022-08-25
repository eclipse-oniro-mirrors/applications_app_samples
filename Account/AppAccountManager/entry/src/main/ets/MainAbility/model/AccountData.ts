/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import Logger from '../model/Logger'
import dataStorage from '@ohos.data.storage'
import featureAbility from '@ohos.ability.featureAbility'

const TAG: string = '[AccountData]'

export class AccountData {
  static instance: AccountData = null
  private storage: dataStorage.Storage = null
  private accountData = []

  public static getInstance() {
    if (this.instance === null) {
      this.instance = new AccountData()
    }
    return this.instance
  }

  async getFromStorage(url: string) {
    const context = featureAbility.getContext()
    let path = await context.getOrCreateLocalDir()
    Logger.info(TAG, `Path is ${path}`)
    this.storage = await dataStorage.getStorage(`${path}/files/${url}`)
    if (this.storage === null) {
      Logger.info(TAG, `Create stroage is fail.`)
    }
  }

  async getStorage(url: string) {
    this.storage = null
    await this.getFromStorage(url)
    return this.storage
  }

  async putStorageValue(key: string, value: string, url: string) {
    this.storage = await this.getStorage(url)
    try {
      await this.storage.put(key, value)
      Logger.info(TAG, `put key && value success`)
    } catch (err) {
      Logger.info(TAG, `aaaaaa put failed`)
    }
    await this.storage.flush()
    return
  }

  async hasStorageValue(key: string, url: string) {
    this.storage = await this.getStorage(url)
    let result = await this.storage.has(key)
    Logger.info(TAG, `hasStorageValue success result is ${result}`)
    return result
  }

  async getStorageValue(key: string, url: string) {
    this.storage = await this.getStorage(url)
    let getValue = await this.storage.get(key, 'null')
    Logger.info(TAG, `getStorageValue success`)
    return getValue
  }

  async deleteStorageValue(key: string, url: string) {
    this.storage = await this.getStorage(url)
    await this.storage.delete(key)
    Logger.info(TAG, `delete success`)
    await this.storage.flush()
    return
  }
}