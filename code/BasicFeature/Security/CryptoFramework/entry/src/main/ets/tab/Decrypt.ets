/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import promptAction from '@ohos.promptAction';
import Logger from '../util/Logger';
import picker from '@ohos.file.picker';
import { CryptoOperation } from '../cryptoframework/CryptoOperation';
import TextFileManager from '../textfilemanager/TextFileManager';
import common from '@ohos.app.ability.common';

const TAG: string = '[Crypto_Framework]';

@Component
export struct Decrypt {
  @State keyFileName: string = '';
  @State keyFileUri: string = '';
  @State textFileUri: string = '';
  @State textFileName: string = '';
  @State keyString: string = '';
  @State cipherText: string = '';
  @State plainText: string = '';
  @State message: string = '';
  @State decryptedFileUri: string = '';
  private CryptoOperation: CryptoOperation = new CryptoOperation();

  build() {
    Stack({ alignContent: Alignment.Center }) {
      Column() {
        GridRow() {
          GridCol({ span: { xs: 12, sm: 12, md: 12, lg: 12 } }) {
            Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
              List() {
                ListItem() {
                  Row() {
                    Text($r('app.string.open_file'))
                      .fontSize(16)
                      .textAlign(TextAlign.Start)
                      .lineHeight(22)

                    Blank()

                    Text(this.textFileName === '' ? $r('app.string.please_choose') : this.textFileName)
                      .fontSize(14)
                      .textAlign(TextAlign.Start)
                      .lineHeight(19)

                    Image($r('app.media.right_arrow'))
                      .height('19vp')
                      .width('10vp')
                      .margin({ left: 9, right: 9, top: 6, bottom: 6 })
                  }
                  .backgroundColor(0xFFFFFF)
                  .width('100%')
                  .height('52vp')
                  .padding({ top: 4, left: 12, right: 12 })
                }.onClick(() => {
                  this.selectTextFileAndRead();
                })

                ListItem() {
                  Row() {
                    Text($r('app.string.select_key_file'))
                      .fontSize(16)
                      .textAlign(TextAlign.Start)
                      .lineHeight(22)

                    Blank()

                    Text(this.keyFileName === '' ? $r('app.string.please_choose') : this.keyFileName)
                      .fontSize(14)
                      .textAlign(TextAlign.Start)
                      .lineHeight(19)

                    Image($r('app.media.right_arrow'))
                      .height('19vp')
                      .width('10vp')
                      .margin({ left: 9, right: 9, top: 6, bottom: 6 })
                  }
                  .backgroundColor(0xFFFFFF)
                  .width('100%')
                  .height('48vp')
                  .padding({ left: 12, right: 12 })
                }.onClick(() => {
                  this.selectAesKeyFileAndRead();
                })
              }
              .width('100%')
              .height('100%')
              .borderRadius(16)
            }
          }
        }
        .height('100vp')
        .margin({ left: 12, right: 12, bottom: 12 })

        GridRow() {
          GridCol({ span: { xs: 12, sm: 12, md: 12, lg: 12 } }) {
            Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
              Column() {
                Row() {
                  Text($r('app.string.text_context'))
                    .fontSize(16)
                    .textAlign(TextAlign.Start)
                    .fontWeight(500)
                    .lineHeight(22)
                }
                .padding({ left: 12, right: 12 })
                .width('100%')
                .height('48vp')

                Row() {
                  Text() {
                    Span(this.cipherText)
                      .fontSize(16)
                      .fontWeight(400)
                      .fontColor('#182431')
                  }.textAlign(TextAlign.Start)
                }
                .padding({ left: 12, right: 12, bottom: 4 })
                .width('100%')
                .height('52vp')
              }
              .borderRadius(16)
              .width('100%')
              .height('100')
              .backgroundColor(0xFFFFFF)
            }
          }
        }
        .height('100vp')
        .margin({ left: 12, right: 12, bottom: 12 })

        GridRow() {
          GridCol({ span: { xs: 12, sm: 12, md: 12, lg: 12 } }) {
            Flex({ direction: FlexDirection.Column, alignItems: ItemAlign.Center, justifyContent: FlexAlign.Center }) {
              Column() {
                Row() {
                  Text($r('app.string.decrypted_context'))
                    .fontSize(16)
                    .textAlign(TextAlign.Start)
                    .fontWeight(500)
                    .lineHeight(22)
                }
                .padding({ left: 12, right: 12 })
                .width('100%')
                .height('48vp')

                Row() {
                  Text() {
                    Span(this.plainText)
                      .fontSize(16)
                      .fontWeight(400)
                      .fontColor('#182431')
                  }.textAlign(TextAlign.Start)
                }
                .padding({ left: 12, right: 12, bottom: 4 })
                .width('100%')
                .height('52vp')
              }
              .borderRadius(16)
              .width('100%')
              .height('100')
              .backgroundColor(0xFFFFFF)
            }
          }
        }
        .height('100vp')
        .margin({ left: 12, right: 12, bottom: 12 })

        Column() {
          GridRow() {
            GridCol({ span: { xs: 12, sm: 12, md: 12, lg: 12 } }) {
              Column() {
                Button() {
                  Text($r('app.string.decrypt')).fontSize(16).fontWeight(500)
                    .lineHeight(22)
                    .fontColor('#FFFFFF')
                }
                .borderRadius(20)
                .id('decryptionBtn')
                .type(ButtonType.Capsule)
                .margin({ left: 24, right: 24 })
                .width('100%')
                .height('40vp')
                .backgroundColor('#007DFF')
                .onClick(() => {
                  if (this.textFileUri === '' || this.keyFileUri === '') {
                    promptAction.showToast({
                      message: $r('app.string.null_message')
                    });
                  } else {
                    this.decryptFunc();
                  }
                });
              }
            }
          }.margin({ left: 24, right: 24 })
        }.width('100%').height('296vp').justifyContent(FlexAlign.End)
      }
      .width('100%')
      .height('100%')
    }
  }

  async selectAesKeyFileAndRead() {
    let config = {
      action: 'ohos.want.action.OPEN_FILE',
      parameters: {
        startMode: 'choose',
      }
    }
    let context = getContext(this) as common.UIAbilityContext;
    let result = await context.startAbilityForResult(config);
    if (result === null || result === undefined) {
      Logger.error(TAG, `result is null or undefined!`);
      return;
    }
    if (result.resultCode !== 0) {
      Logger.error(TAG, `DocumentPicker.select failed, code is ${result.resultCode}, message is ${result.want.parameters.message}`);
      return;
    }
    if (result.want.parameters.select_item_list === null || result.want.parameters.select_item_list === undefined) {
      Logger.error(TAG, `result uri is null or undefined!`);
      return;
    }
    if (result.want.parameters.file_name_list === null || result.want.parameters.file_name_list === undefined) {
      Logger.error(TAG, `result file name is null or undefined!`);
      return;
    }
    // 获取到密钥文档文件的URI
    this.keyFileUri = result.want.parameters.select_item_list.toString();
    // 获取到密钥文档文件的文件名称
    this.keyFileName = result.want.parameters.file_name_list.toString();
    await TextFileManager.readTextFile(this.keyFileUri);
    this.keyString = TextFileManager.getString();
  }

  async selectTextFileAndRead() {
    let config = {
      action: 'ohos.want.action.OPEN_FILE',
      parameters: {
        startMode: 'choose',
      }
    }
    let context = getContext(this) as common.UIAbilityContext;
    let result = await context.startAbilityForResult(config);
    if (result === null || result === undefined) {
      Logger.error(TAG, `result is null or undefined!`);
      return;
    }
    if (result.resultCode !== 0) {
      Logger.error(TAG, `DocumentPicker.select failed, code is ${result.resultCode}, message is ${result.want.parameters.message}`);
      return;
    }
    if (result.want.parameters.select_item_list === null || result.want.parameters.select_item_list === undefined) {
      Logger.error(TAG, `result uri is null or undefined!`);
      return;
    }
    if (result.want.parameters.file_name_list === null || result.want.parameters.file_name_list === undefined) {
      Logger.error(TAG, `result file name is null or undefined!`);
      return;
    }
    // 获取到文档文件的URI
    this.textFileUri = result.want.parameters.select_item_list.toString();
    // 获取到文档文件的文件名称
    this.textFileName = result.want.parameters.file_name_list.toString();
    await TextFileManager.readTextFile(this.textFileUri);
    this.cipherText = TextFileManager.getString();
  }

  async createTextFileAndWrite() {
    let documentSaveOptions = new picker.DocumentSaveOptions();
    documentSaveOptions.newFileNames = ['plainText.txt'];
    let documentPicker = new picker.DocumentViewPicker();
    let documentSaveResult = await documentPicker.save(documentSaveOptions);
    this.decryptedFileUri = documentSaveResult[0];
    await TextFileManager.writeTextFile(this.decryptedFileUri, this.plainText);
  }

  async decryptFunc() {
    if (this.cipherText === '' || this.keyFileUri === '') {
      promptAction.showToast({
        message: $r('app.string.null_message')
      });
      return;
    }
    try {
      this.plainText = await this.CryptoOperation.aesConvertAndDecrypt(this.keyString, this.cipherText);
    } catch (error) {
      Logger.error(TAG, `decrypt failed, ${error.code}, ${error.message}`);
      promptAction.showToast({
        message: $r('app.string.decrypt_fail')
      });
      return;
    }
    if (this.plainText === '' || this.plainText === null || this.plainText === undefined) {
      promptAction.showToast({
        message: $r('app.string.decrypt_fail')
      });
      return;
    } else {
      try {
        await this.createTextFileAndWrite();
      } catch (error) {
        Logger.error(TAG, `decrypt failed, ${error.code}, ${error.message}`);
      }
    }
    if (this.decryptedFileUri === '' || typeof (this.decryptedFileUri) == 'undefined') {
      promptAction.showToast({
        message: $r('app.string.decrypt_fail')
      });
    } else {
      promptAction.showToast({
        message: $r('app.string.decrypt_success')
      });
    }
  }
}
