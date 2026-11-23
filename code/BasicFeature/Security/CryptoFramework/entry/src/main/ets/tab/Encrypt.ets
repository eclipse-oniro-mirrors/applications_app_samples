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

import { promptAction } from '@kit.ArkUI';
import Logger from '../util/Logger';
import { picker } from '@kit.CoreFileKit';
import { CryptoOperation } from '../cryptoframework/CryptoOperation';
import TextFileManager from '../textfilemanager/TextFileManager';
import { common, Want } from '@kit.AbilityKit';

const TAG: string = '[Sample_CryptoFramework]';

@Component
export struct Encrypt {
  @State keyFileName: string = '';
  @State keyFileUri: string = '';
  @State textFileUri: string = '';
  @State textFileName: string = '';
  @State keyString: string = '';
  @State cipherText: string = '';
  @State plainText: string = '';
  @State message: string = '';
  @State createKeyUri: string = '';
  @State encryptedFileUri: string = '';
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
                });

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
                });
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
                    Span(this.plainText)
                      .fontSize(16)
                      .fontWeight(400)
                      .fontColor($r('app.color.text_primary'))
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
                  Text($r('app.string.encrypted_context'))
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
                      .fontColor($r('app.color.text_primary'))
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
                  Text($r('app.string.generate_aes_key_randomly')).fontSize(16).fontWeight(500)
                    .lineHeight(22)
                    .fontColor($r('app.color.button_text'))
                }
                .id('encryptAesGenKey')
                .borderRadius(20)
                .type(ButtonType.Capsule)
                .width('100%')
                .height('40vp')
                .margin({ bottom: 16 })
                .backgroundColor($r('app.color.button_background'))
                .onClick(() => {
                  this.genAesKey();
                });

                Button() {
                  Text($r('app.string.encrypt')).fontSize(16).fontWeight(500)
                    .lineHeight(22)
                    .fontColor($r('app.color.button_text'))
                }
                .borderRadius(20)
                .id('encryptionBtn')
                .type(ButtonType.Capsule)
                .margin({ left: 24, right: 24 })
                .width('100%')
                .height('40vp')
                .backgroundColor($r('app.color.button_background'))
                .onClick(() => {
                  if (this.textFileUri === '' || this.keyFileUri === '') {
                    promptAction.showToast({
                      message: $r('app.string.null_message')
                    });
                  } else {
                    this.encryptFunc();
                  }
                });
              }
            }
          }.margin({ left: 24, right: 24 });
        }.width('100%').height('296vp').justifyContent(FlexAlign.End)
      }
      .width('100%')
      .height('100%')
    }
  }

  async selectAesKeyFileAndRead(): Promise<void> {
    let config: Want = {
      action: 'ohos.want.action.OPEN_FILE',
      parameters: {
        startMode: 'choose',
      }
    }
    let context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;
    let result: common.AbilityResult = await context.startAbilityForResult(config);
    if (result === null || result === undefined) {
      Logger.error(TAG, `result is null or undefined!`);
      return;
    }
    let want: Want | undefined = result.want;
    if (want === null || want === undefined) {
      Logger.error(TAG, `result want is null or undefined!`);
      return;
    }
    let parameters: Record<string, Object> | undefined = want.parameters;
    if (parameters === null || parameters === undefined) {
      Logger.error(TAG, `result parameters is null or undefined!`);
      return;
    }
    if (result.resultCode !== 0) {
      Logger.error(TAG, `DocumentPicker.select failed, code is ${result.resultCode}, message is ${parameters.message}`);
      return;
    }
    if (parameters.select_item_list === null || parameters.select_item_list === undefined) {
      Logger.error(TAG, `result uri is null or undefined!`);
      return;
    }
    if (parameters.file_name_list === null || parameters.file_name_list === undefined) {
      Logger.error(TAG, `result file name is null or undefined!`);
      return;
    }
    // 获取到密钥文档文件的URI
    this.keyFileUri = parameters.select_item_list.toString();
    // 获取到密钥文档文件的文件名称
    this.keyFileName = parameters.file_name_list.toString();
    await TextFileManager.readTextFile(this.keyFileUri);
    this.keyString = TextFileManager.getString();
  }

  async selectTextFileAndRead(): Promise<void> {
    let config: Want = {
      action: 'ohos.want.action.OPEN_FILE',
      parameters: {
        startMode: 'choose',
      }
    }
    let context: common.UIAbilityContext = getContext(this) as common.UIAbilityContext;
    let result: common.AbilityResult = await context.startAbilityForResult(config);
    if (result === null || result === undefined) {
      Logger.error(TAG, `result is null or undefined!`);
      return;
    }
    let want: Want | undefined = result.want;
    if (want === null || want === undefined) {
      Logger.error(TAG, `result want is null or undefined!`);
      return;
    }
    let parameters: Record<string, Object> | undefined = want.parameters;
    if (parameters === null || parameters === undefined) {
      Logger.error(TAG, `result parameters is null or undefined!`);
      return;
    }
    if (result.resultCode !== 0) {
      Logger.error(TAG, `DocumentPicker.select failed, code is ${result.resultCode}, message is ${parameters.message}`);
      return;
    }
    if (parameters.select_item_list === null || parameters.select_item_list === undefined) {
      Logger.error(TAG, `result uri is null or undefined!`);
      return;
    }
    if (parameters.file_name_list === null || parameters.file_name_list === undefined) {
      Logger.error(TAG, `result file name is null or undefined!`);
      return;
    }
    // 获取到文档文件的URI
    this.textFileUri = parameters.select_item_list.toString();
    // 获取到文档文件的文件名称
    this.textFileName = parameters.file_name_list.toString();
    await TextFileManager.readTextFile(this.textFileUri);
    this.plainText = TextFileManager.getString();
  }

  async createTextFileAndWrite(): Promise<void> {
    let documentSaveOptions: picker.DocumentSaveOptions = new picker.DocumentSaveOptions();
    documentSaveOptions.newFileNames = ['cipherText.txt'];
    let documentPicker: picker.DocumentViewPicker = new picker.DocumentViewPicker();
    let documentSaveResult: string[] = await documentPicker.save(documentSaveOptions);
    this.encryptedFileUri = documentSaveResult[0];
    await TextFileManager.writeTextFile(this.encryptedFileUri, this.cipherText);
  }

  async createKeyFileAndWrite(): Promise<void> {
    let documentSaveOptions: picker.DocumentSaveOptions = new picker.DocumentSaveOptions();
    documentSaveOptions.newFileNames = ['aesKey.txt'];
    let documentPicker: picker.DocumentViewPicker = new picker.DocumentViewPicker();
    let documentSaveResult: string[] = await documentPicker.save(documentSaveOptions);
    this.createKeyUri = documentSaveResult[0];
    await TextFileManager.writeTextFile(this.createKeyUri, this.keyString);
  }

  async encryptFunc(): Promise<void> {
    if (this.plainText === '' || this.keyFileUri === '') {
      promptAction.showToast({
        message: $r('app.string.null_message')
      });
      return;
    }
    try {
      this.cipherText = await this.CryptoOperation.aesConvertAndEncrypt(this.keyString, this.plainText);
    } catch (error) {
      Logger.error(TAG, `encrypt failed, ${error.code}, ${error.message}`);
      promptAction.showToast({
        message: $r('app.string.encrypt_fail')
      });
    }
    if (this.cipherText === '' || this.cipherText === undefined || this.cipherText === null) {
      promptAction.showToast({
        message: $r('app.string.encrypt_fail')
      });
      return;
    } else {
      try {
        await this.createTextFileAndWrite();
      } catch (error) {
        Logger.error(TAG, `encrypt failed, ${error.code}, ${error.message}`);
      }
    }
    if (this.encryptedFileUri === '' || typeof (this.encryptedFileUri) == 'undefined') {
      promptAction.showToast({
        message: $r('app.string.encrypt_fail')
      });
    } else {
      promptAction.showToast({
        message: $r('app.string.encrypt_success')
      });
    }
  }

  async genAesKey(): Promise<void> {
    try {
      this.keyString = await this.CryptoOperation.generateAesKey();
    } catch (error) {
      Logger.error(TAG, `gen aes key failed, ${error.code}, ${error.message}`);
    }
    if (this.keyString === '' || typeof (this.keyString) == 'undefined') {
      promptAction.showToast({
        message: $r('app.string.gen_key_fail')
      });
      return;
    } else {
      try {
        await this.createKeyFileAndWrite();
      } catch (error) {
        Logger.error(TAG, `write aes key failed, ${error.code}, ${error.message}`);
      }
    }
    if (this.createKeyUri === '' || typeof (this.createKeyUri) == 'undefined') {
      promptAction.showToast({
        message: $r('app.string.gen_key_fail')
      });
    } else {
      promptAction.showToast({
        message: $r('app.string.gen_key_success')
      });
    }
  }
}

