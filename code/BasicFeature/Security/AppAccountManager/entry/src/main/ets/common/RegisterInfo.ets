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

import router from '@ohos.router'
import Logger from '../model/Logger'
import { AccountData } from '../model/AccountData'
import { AccountModel } from '../model/AccountModel'
import { AccountKeyBuilder } from '../model/AccountKeyBuilder'
import { AccountValidator, RegisterInput, RegisterResult } from '../model/AccountValidator'
import { BaseDataSource } from './BaseDataSource'

interface RegisterFieldItem {
  text: Resource
  inputType: InputType
  length: number
  event: number
  inputFilter: string
  promptText: Resource
}

class MyDataSource extends BaseDataSource<RegisterFieldItem> {
  private dataArray: RegisterFieldItem[] = [
    {
      text: $r('app.string.username'),
      inputType: InputType.Normal,
      length: 15,
      event: 0,
      inputFilter: '^[A-Za-z0-9_]+$',
      promptText: $r('app.string.prompt_username')
    },
    {
      text: $r('app.string.email'),
      inputType: InputType.Normal,
      length: 18,
      event: 1,
      inputFilter: '',
      promptText: $r('app.string.prompt_email')
    },
    {
      text: $r('app.string.signature'),
      inputType: InputType.Normal,
      length: 18,
      event: 2,
      inputFilter: '',
      promptText: $r('app.string.prompt_signature')
    },
    {
      text: $r('app.string.password'),
      inputType: InputType.Password,
      length: 18,
      event: 3,
      inputFilter: '',
      promptText: $r('app.string.prompt_password')
    },
    {
      text: $r('app.string.confirm_password'),
      inputType: InputType.Password,
      length: 18,
      event: 4,
      inputFilter: '',
      promptText: $r('app.string.prompt_confirm_password')
    }
  ]

  public totalCount(): number {
    return this.dataArray.length
  }

  public getData(index: number): RegisterFieldItem | undefined {
    return this.dataArray[index]
  }

  public replaceData(result: RegisterFieldItem[]): void {
    this.dataArray = result
  }
}

const TAG: string = '[RegisterInfo]'

@Component
export struct RegisterInfo {
  @State passWord: string = ''
  @State username: string = ''
  @State emailInfo: string = ''
  @State signature: string = ''
  @State confirmPassword: string = ''
  @State dataSet: MyDataSource = new MyDataSource()
  @Prop isWideLayout: boolean
  @Prop bundleName: string = ''
  private storage: AccountData = AccountData.getInstance()
  private accountModel: AccountModel = new AccountModel()

  build() {
    Column() {
      Row() {
        Text($r('app.string.appname'))
          .margin(10)
          .fontSize(18)
          .width('25%')
          .textAlign(TextAlign.End)
        Text(this.bundleName)
          .margin(10)
          .width('55%')
          .fontSize(20)
          .textAlign(TextAlign.Center)
      }
      .margin(5)

      Flex({ direction: FlexDirection.Row, wrap: FlexWrap.Wrap }) {
        LazyForEach(this.dataSet, (item: RegisterFieldItem, index: number) => {
          Row() {
            Text(item.text)
              .margin(10)
              .fontSize(18)
              .width('25%')
              .textAlign(TextAlign.End)
              .backgroundColor($r('app.color.input_background'))
            Column() {
              Text(item.promptText)
                .fontSize(14)
                .width('80%')
                .fontColor($r('app.color.hint_gray'))
                .textAlign(TextAlign.Center)

              TextInput({ placeholder: $r('app.string.input_placeholder') })
                .id('Register' + (index + 1))
                .margin(10)
                .width('55%')
                .fontSize(20)
                .maxLength(20)
                .type(item.inputType)
                .maxLength(item.length)
                .inputFilter(item.inputFilter)
                .fontWeight(FontWeight.Bold)
                .placeholderFont({ size: 16, weight: FontWeight.Normal })
                .onChange((value: string) => {
                  switch (item.event) {
                    case 0:
                      this.username = value
                      break
                    case 1:
                      this.emailInfo = value
                      break
                    case 2:
                      this.signature = value
                      break
                    case 3:
                      this.passWord = value
                      break
                    case 4:
                      this.confirmPassword = value
                      break
                    default:
                      break
                  }
                })
            }
          }
          .margin(5)
            .width(this.isWideLayout ? '48%' : '100%')
        }, (item: RegisterFieldItem) => JSON.stringify(item))
      }
      .width('100%')

      Button($r('app.string.setting'))
        .id('complete')
        .margin(10)
        .width(this.isWideLayout ? '40%' : '60%')
        .fontSize(20)
        .fontColor(Color.White)
        .type(ButtonType.Capsule)
        .onClick(async () => {
          let accountExists: boolean = await this.storage.hasStorageValue(getContext(), this.username, this.bundleName)
          Logger.info(TAG, `This result is ${accountExists}`)
          let input: RegisterInput = {
            username: this.username,
            email: this.emailInfo,
            signature: this.signature,
            password: this.passWord,
            confirmPassword: this.confirmPassword
          }
          let check: RegisterResult = AccountValidator.validateRegister(input, accountExists)
          if (check === RegisterResult.USERNAME_EMPTY) {
            AlertDialog.show(
              {
                message: $r('app.string.blank'),
                confirm: {
                  value: $r('app.string.close'),
                  action: () => {
                    Logger.info(TAG, `AlertDialog enter`)
                  }
                },
                cancel: () => {
                  Logger.info(TAG, `AlertDialog close`)
                }
              })
          } else if (check === RegisterResult.ACCOUNT_EXISTS) {
            AlertDialog.show(
              {
                message: $r('app.string.has'),
                confirm: {
                  value: $r('app.string.close'),
                  action: () => {
                    Logger.info(TAG, `AlertDialog enter`)
                  }
                },
                cancel: () => {
                  Logger.info(TAG, `AlertDialog close`)
                }
              })
          } else if (check === RegisterResult.EMAIL_INVALID) {
            AlertDialog.show(
              {
                message: $r('app.string.emailinfo'),
                confirm: {
                  value: $r('app.string.close'),
                  action: () => {
                    Logger.info(TAG, `AlertDialog enter`)
                  }
                },
                cancel: () => {
                  Logger.info(TAG, `AlertDialog close`)
                }
              })
          } else if (check === RegisterResult.PASSWORD_EMPTY) {
            AlertDialog.show(
              {
                message: $r('app.string.password_blank'),
                confirm: {
                  value: $r('app.string.close'),
                  action: () => {
                    Logger.info(TAG, `AlertDialog enter`)
                  }
                },
                cancel: () => {
                  Logger.info(TAG, `AlertDialog close`)
                }
              })
          } else if (check === RegisterResult.PASSWORD_TOO_SHORT) {
            AlertDialog.show(
              {
                message: $r('app.string.min_password'),
                confirm: {
                  value: $r('app.string.close'),
                  action: () => {
                    Logger.info(TAG, `AlertDialog enter`)
                  }
                },
                cancel: () => {
                  Logger.info(TAG, `AlertDialog close`)
                }
              })
          } else if (check === RegisterResult.CONFIRM_MISMATCH) {
            AlertDialog.show(
              {
                message: $r('app.string.password_error'),
                confirm: {
                  value: $r('app.string.close'),
                  action: () => {
                    Logger.info(TAG, `AlertDialog enter`)
                  }
                },
                cancel: () => {
                  Logger.info(TAG, `AlertDialog close`)
                }
              })
          } else {
            let accountName: string = AccountKeyBuilder.accountName(this.username, this.bundleName)
            if (this.username !== '') {
              await this.accountModel.addAccount(accountName)
            }
            if (this.emailInfo !== '') {
              await this.accountModel.setAccountCredential(accountName,
                AccountKeyBuilder.credentialType(AccountKeyBuilder.EMAIL_FIELD, this.bundleName), this.emailInfo)
            }
            if (this.signature !== '') {
              await this.accountModel.setAccountCredential(accountName,
                AccountKeyBuilder.credentialType(AccountKeyBuilder.SIGNATURE_FIELD, this.bundleName), this.signature)
            }
            await this.accountModel.setAssociatedData(accountName, AccountKeyBuilder.associatedKey(this.bundleName),
              this.passWord)
            await this.storage.putStorageValue(getContext(), this.username, this.passWord, this.bundleName)
            await this.storage.putStorageValue(getContext(), this.bundleName, AccountKeyBuilder.LOGIN_FLAG, accountName)
            AlertDialog.show(
              {
                message: $r('app.string.register_info'),
                confirm: {
                  value: $r('app.string.close'),
                  action: () => {
                    router.push({
                      url: 'pages/Login',
                      params: {
                        bundleName: this.bundleName
                      }
                    })
                  }
                },
                cancel: () => {
                  Logger.info(TAG, `AlertDialog close`)
                }
              })
          }
        })
    }
  }
}
