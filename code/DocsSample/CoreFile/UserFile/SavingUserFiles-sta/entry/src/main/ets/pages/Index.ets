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

// [Start import_interface_select]
import { fileUri } from '@kit.CoreFileKit';
import { fileIo } from '@kit.CoreFileKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';
import picker from '@ohos.file.picker';
import {
  State,
  Entry,
  Component,
  Column,
  Row,
  Text,
  Button,
  Blank,
  FontWeight,
  HorizontalAlign,
  FlexAlign,
} from '@kit.ArkUI';
// [End import_interface_save]

@Entry
@Component
struct Index {
  @State text: string = '';
  @State documentResult: string = '';
  @State result: string = '';
  @State downloadResult: string = '';
  @State uri_image: string = '';
  @State uri: string = '';
  @State documentUris: Array<string> = new Array<string>();
  build() {
    Column() {
      Row() {
        // 写入文件按钮
        Button('保存文档文件')
          .width('50%') // 按钮宽度占屏幕宽度50%
          .height('10%') // 按钮高度占屏幕高度10%
          .fontSize(25) // 按钮字体大小为25
          .borderRadius(25) // 按钮圆角半径为25
          .backgroundColor('#FFFFFF') // 按钮背景颜色为白色
          .shadow({
            radius: 10, // 阴影半径为10
            color: '#808080', // 阴影颜色为灰色
            offsetX: 15, // 阴影水平偏移量为15
            offsetY: 15 // 阴影垂直偏移量为15
          })
          .fontColor('#000000') // 按钮字体颜色为黑色
          .onClick(() => {
            this.saveDocumentFile();
          })
        // 读取文件按钮
        Button('读取文件')
          .width('30%') // 按钮宽度占屏幕宽度30%
          .height('10%') // 按钮高度占屏幕高度10%
          .fontSize(25) // 按钮字体大小为25
          .borderRadius(25) // 按钮圆角半径为25
          .backgroundColor('#FFFFFF') // 按钮背景颜色为白色
          .shadow({
            radius: 10, // 阴影半径为10
            color: '#808080', // 阴影颜色为灰色
            offsetX: 15, // 阴影水平偏移量为15
            offsetY: 15 // 阴影垂直偏移量为15
          })
          .fontColor('#000000') // 按钮字体颜色为黑色
          .onClick(() => {
            this.selectDocumentFiles();
          })
      }
      Text(this.documentResult)
        .fontSize(50) // 文本字体大小为50
        .fontWeight(FontWeight.Bold) // 文本字体加粗
        .margin(20) // 文本上边距为20
      // 保存音频文件按钮
      Button('保存音频文件')
        .width('80%') // 按钮宽度占屏幕宽度80%
        .height('10%') // 按钮高度占屏幕高度10%
        .fontSize(25) // 按钮字体大小为25
        .borderRadius(25) // 按钮圆角半径为25
        .backgroundColor('#FFFFFF') // 按钮背景颜色为白色
        .shadow({
          radius: 10, // 阴影半径为10
          color: '#808080', // 阴影颜色为灰色
          offsetX: 15, // 阴影水平偏移量为15
          offsetY: 15 // 阴影垂直偏移量为15
        })
        .fontColor('#000000') // 按钮字体颜色为黑色
        .onClick(() => {
          this.saveAudioFile();
        })
      // 显示文件URI
      Text(this.result)
        .fontSize(50) // 文本字体大小为50
        .fontWeight(FontWeight.Bold) // 文本字体加粗
        .margin(20) // 文本上边距为20
      // Download按钮
      Button('下载保存文件')
        .width('80%') // 按钮宽度占屏幕宽度80%
        .height('10%') // 按钮高度占屏幕高度10%
        .fontSize(25) // 按钮字体大小为25
        .borderRadius(25) // 按钮圆角半径为25
        .backgroundColor('#FFFFFF') // 按钮背景颜色为白色
        .shadow({
          radius: 10, // 阴影半径为10
          color: '#808080', // 阴影颜色为灰色
          offsetX: 15, // 阴影水平偏移量为15
          offsetY: 15 // 阴影垂直偏移量为15
        })
        .fontColor('#000000') // 按钮字体颜色为黑色
        .onClick(() => {
          this.downLoad();
        })
      // 显示downloadResult
      Text(this.downloadResult)
        .fontSize(50) // 文本字体大小为50
        .fontWeight(FontWeight.Bold) // 文本字体加粗
        .margin(20) // 文本上边距为20
    }
    .width('100%') // 外层列布局宽度占满屏幕
    .height('100%') // 外层列布局高度占满屏幕
    .alignItems(HorizontalAlign.Center) // 水平居中对齐
    .justifyContent(FlexAlign.Center) // 垂直居中对齐
    .backgroundColor('#D3D3D3') // 背景颜色为浅灰色
  }
  saveDocumentFile() {
    try {
      // [Start document_save_options]
      const documentSaveOptions: picker.DocumentSaveOptions = {
        newFileNames: ['DocumentViewPicker01.txt'],
        fileSuffixChoices: ['文档|.txt', '.pdf']
      };
      // [End document_save_options]
      // [Start save_file_picker]
      let uris: Array<string> = [];
      let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
      const documentViewPicker = new picker.DocumentViewPicker(context);
      documentViewPicker.save(documentSaveOptions).then((documentSaveResult: Array<string>) => {
        uris = documentSaveResult;
        console.info('documentViewPicker.save to file succeed and uris are:' + uris);
        // [StartExclude save_file_picker]
        this.writeDocumentFile(uris);
        // [EndExclude save_file_picker]
      }).catch((err: Error): void => {
        console.error(`Invoke documentViewPicker.save failed, code is ${err.code}, message is ${err.message}`);
      });
      // [End save_file_picker]
    } catch (err) {
      console.error(`DocumentViewPicker failed with err, code is: ${err.code}, message is: ${err.message}`);
    }
  }
  writeDocumentFile(uris: Array<string>) {
    // [Start document_open_sync]
    if (uris.length > 0) {
      let uri: string = uris[0];
      let file = fileIo.openSync(uri, fileIo.OpenMode.READ_WRITE);
      // [StartExclude document_open_sync]
      try {
        // [EndExclude document_open_sync]
        console.info('file fd: ' + file.fd);
        // [End document_open_sync]
        // [Start document_writesync]
        let writeLen: long = fileIo.writeSync(file.fd, 'hello, world');
        console.info('write data to file succeed and size is:' + writeLen);
        // [StartExclude document_writesync]
      } catch (err) {
        console.error(`DocumentViewPicker failed with err, code is: ${err.code}, message is: ${err.message}`);
      } finally {
        // [EndExclude document_writesync]
        fileIo.closeSync(file);
        // [End document_writesync]
      }
    }
  }
  selectDocumentFiles() {
    try {
      const documentSelectOptions: picker.DocumentSelectOptions = {};
      let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
      const documentViewPicker = new picker.DocumentViewPicker(context);
      documentViewPicker.select(documentSelectOptions).then((documentSelectResult: Array<string>) => {
        this.documentUris = documentSelectResult;
        console.info('documentViewPicker.select to file succeed and uris are:' + this.documentUris);
        if (this.documentUris.length > 0) {
          this.readDocumentFile(this.documentUris[0]);
        }
      }).catch((err: Error): void => {
        console.error(`Invoke documentViewPicker.select failed, code is ${err.code}, message is ${err.message}`);
      });
    } catch (err) {
      console.error(`DocumentViewPicker failed with err, code is: ${err.code}, message is: ${err.message}`);
    }
  }

  readDocumentFile(uri: string) {
    let file = fileIo.openSync(uri, fileIo.OpenMode.READ_ONLY);
    try {
      console.info('file fd: ' + file.fd);
      let buffer = new ArrayBuffer(4096); // 创建一个 4096 字节的缓冲区
      let readLen = fileIo.readSync(file.fd, buffer);
      console.info('readSync data to file succeed and buffer size is:' + readLen);
      this.documentResult = 'Successfully read the file';
    } catch (err) {
      console.error(`DocumentViewPicker failed with err, code is: ${err.code}, message is: ${err.message}`);
    } finally {
      fileIo.closeSync(file);
    }
  }
  saveAudioFile() {
    try {
      // [Start audio_save_options]
      const audioSaveOptions: picker.AudioSaveOptions = {
        newFileNames: ['AudioViewPicker03.mp3']
      };
      // [End audio_save_options]

      // [Start audio_save_file]
      let uris: Array<string> = [];
      let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
      const audioViewPicker = new picker.AudioViewPicker(context);
      audioViewPicker.save(audioSaveOptions).then((audioSelectResult: Array<string>) => {
        uris = audioSelectResult;
        console.info('audioViewPicker.save to file succeed and uri is:' + uris);
        // [StartExclude audio_save_file]
        this.writeAudioFile(uris);
        // [EndExclude audio_save_file]
      }).catch((err: Error): void => {
        console.error(`Invoke audioViewPicker.save failed, code is ${err.code}, message is ${err.message}`);
      });
      // [End audio_save_file]
    } catch (err) {
      console.error(`DocumentViewPicker failed with err, code is: ${err.code}, message is: ${err.message}`);
    }
  }

  writeAudioFile(uris: Array<string>) {
    // [Start audio_open_mode]
    if (uris.length > 0) {
      let uri: string = uris[0];
      //这里需要注意接口权限参数是fileIo.OpenMode.READ_WRITE。
      let file = fileIo.openSync(uri, fileIo.OpenMode.READ_WRITE);
      try {
        console.info('file fd: ' + file.fd);
        // [Start audio_write_sync]
        let writeLen = fileIo.writeSync(file.fd, 'hello, world');
        console.info('write data to file succeed and size is:' + writeLen);
        // [StartExclude audio_write_sync]
        this.result = 'Successfully saved audio files';
      } catch (err) {
        console.error(`DocumentViewPicker failed with err, code is: ${err.code}, message is: ${err.message}`);
      } finally {
        // [EndExclude audio_write_sync]
        fileIo.closeSync(file);
        // [End audio_write_sync]
      }
    }
    // [End audio_open_mode]
  }

  downLoad() {
    try {
      // [Start download_save_file]
      let uri: string = '';
      // 请在组件内获取context，确保this.getUIContext().getHostContext()返回结果为UIAbilityContext
      let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
      const documentViewPicker = new picker.DocumentViewPicker(context);
      // [Start download_save_options]
      const documentSaveOptions: picker.DocumentSaveOptions = {
        pickerMode: picker.DocumentPickerMode.DOWNLOAD
      };
      // [End download_save_options]
      documentViewPicker.save(documentSaveOptions).then((documentSaveResult: Array<string>) => {
        if (documentSaveResult && documentSaveResult.length > 0) {
          uri = documentSaveResult[0] || '';
          console.info('documentViewPicker.save succeed and uri is:' + uri);
          if (uri) {
            const fileUriObj = new fileUri.FileUri(uri + '/test.txt');
            const testFilePath: string = fileUriObj.path ?? '';
            let file = fileIo.openSync(testFilePath, fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE);
            try {
              fileIo.writeSync(file.fd, 'Hello World!');
            } catch (err) {
              console.error(`write file failed, code is: ${err.code}, message is: ${err.message}`);
            } finally {
              fileIo.closeSync(file.fd);
            }
          }
        }
      }).catch((err: Error): void => {
        console.error(`Invoke documentViewPicker.save failed, code is: ${err.code}, message is: ${err.message}`);
      });
      // [End download_save_file]
      this.downloadResult = 'Successfully download';
    } catch (err) {
      console.error(`DocumentViewPicker failed with err, code is: ${err.code}, message is: ${err.message}`);
    }
  }
}