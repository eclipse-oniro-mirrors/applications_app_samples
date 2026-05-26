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
import { BusinessError } from '@kit.BasicServicesKit';
import { common } from '@kit.AbilityKit';
import { fileIo } from '@kit.CoreFileKit';
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
// [End import_interface_select]

@Entry
@Component
struct Index {
  @State result: string = '';
  @State saveresult: string = '';
  @State audioUris: string = '';
  @State fileContent: string = '';
  build() {
    Column() { // 设置列内元素间距为10
        // 预制条件保存文件按钮
        Button('Save Document File')
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
            this.saveDocumentFile();
          })

      Blank()
        .height(10)

      Text(this.saveresult)
          .fontSize(50) // 文本字体大小为50
          .fontWeight(FontWeight.Bold) // 文本字体加粗
        // 读取文件按钮
        Button('Select Document File')
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
            this.selectDocumentFiles();
          })

      Blank()
        .height(10)

      Text(this.result)
          .fontSize(50) // 文本字体大小为50
          .fontWeight(FontWeight.Bold) // 文本字体加粗
        // 选择音频文件按钮
        Button('Select Audio File')
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
            this.selectAudioFile();
          })
        // 显示文件内容
        Text(this.fileContent)
          .fontSize(50) // 文本字体大小为50
          .fontWeight(FontWeight.Bold) // 文本字体加粗
    }
    .width('100%') // 设置外层列的宽度为100%
    .height('100%') // 设置外层列的高度为100%
    .alignItems(HorizontalAlign.Center) // 设置子元素水平居中
    .justifyContent(FlexAlign.Center) // 设置子元素垂直居中
    .backgroundColor('#D3D3D3') // 设置背景颜色为浅灰色
  }
  saveDocumentFile() {
    try {
      const documentSaveOptions: picker.DocumentSaveOptions = {
        newFileNames: ['test0.txt', 'test0.pdf']
      };
      let uris: string[] = [];
      let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
      const documentViewPicker = new picker.DocumentViewPicker(context);
      documentViewPicker.save(documentSaveOptions).then((documentSaveResult: string[]) => {
        uris = documentSaveResult;
        console.info('documentViewPicker.save to file succeed and uris are:' + uris);
        this.saveresult = 'Save Success';
      }).catch((err: Error): void => {
        console.error(`Invoke documentViewPicker.save failed, code is ${err.code}, message is ${err.message}`);
      });
    } catch (err) {
      console.error(`DocumentViewPicker failed with err, code is: ${err.code}, message is: ${err.message}`);
    }
  }
  selectDocumentFiles() {
    try {
      // [Start create_document_select_option]
      const documentSelectOptions: picker.DocumentSelectOptions = {};
      // [End create_document_select_option]

      // [Start picker_select]
      let uris: string[] = [];
      let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
      const documentViewPicker = new picker.DocumentViewPicker(context);
      documentViewPicker.select(documentSelectOptions).then((documentSelectResult: string[]) => {
        uris = documentSelectResult;
        console.info('documentViewPicker.select to file succeed and uris are:' + uris);
        // [StartExclude picker_select]
        if (uris.length > 0) {
          this.readDocumentFile(uris);
        }
        // [EndExclude picker_select]
      }).catch((err: Error): void => {
        console.error(`Invoke documentViewPicker.select failed, code is ${err.code}, message is ${err.message}`);
      });
      // [End picker_select]
    } catch (err) {
      console.error(`DocumentViewPicker failed with err, code is: ${err.code}, message is: ${err.message}`);
    }
  }

  readDocumentFile(uris: string[]) {
    // [Start document_fs_read_sync]
    if (uris.length > 0) {
      let uri: string = uris[0];
      //这里需要注意接口权限参数是fileIo.OpenMode.READ_WRITE。
      let file = fileIo.openSync(uri, fileIo.OpenMode.READ_WRITE);
      try {
        console.info('file fd: ' + file.fd);
        let buffer = new ArrayBuffer(4096); // 分配一个大小为4096字节的缓冲区
        let readLen = fileIo.readSync(file.fd, buffer); // 读取文件内容
        console.info('readSync data to file succeed and buffer size is:' + readLen);
      } catch (err) {
        console.error(`DocumentViewPicker failed with err, code is: ${err.code}, message is: ${err.message}`);
      } finally {
        fileIo.closeSync(file);
        // [End document_fs_read_sync]
      }
    }
    this.result = 'Read Success';
  }
  async selectAudioFile() {
    try {
      // [Start audio_select_option]
      const audioSelectOptions: picker.AudioSelectOptions = {};
      // [End audio_select_option]

      // [Start audio_select_picker]
      let uris: string[] = [];
      // 请在组件内获取context，确保this.getUIContext().getHostContext()返回结果为UIAbilityContext
      let context = this.getUIContext().getHostContext() as common.UIAbilityContext;
      const audioViewPicker = new picker.AudioViewPicker(context);
      audioViewPicker.select(audioSelectOptions).then((audioSelectResult: Array<string>) => {
        //文件选择成功后，返回被选中音频的URI结果集。
        uris = audioSelectResult;
        console.info('audioViewPicker.select to file succeed and uri is:' + uris);
        // [StartExclude audio_select_picker]
        this.fileContent = 'Select Success';
        this.readAudioFile(uris);
        // [EndExclude audio_select_picker]
      }).catch((err: Error): void => {
        console.error(`Invoke audioViewPicker.select failed, code is ${err.code}, message is ${err.message}`);
      })
      // [End audio_select_picker]
    } catch (err) {
      console.error(`Invoke audioViewPicker.select failed, code is ${err.code}, message is ${err.message}`);
    }
  }

  readAudioFile(uris: string[]) {
    // [Start file_open_sync]
    if (uris.length > 0) {
      let uri: string = uris[0];
      //这里需要注意接口权限参数是fileIo.OpenMode.READ_ONLY。
      let file = fileIo.openSync(uri, fileIo.OpenMode.READ_ONLY);
      // [StartExclude file_open_sync]
      try {
        // [EndExclude file_open_sync]
        console.info('file fd: ' + file.fd);
        // [End file_open_sync]
        // [Start fs_read_sync]
        const buffer = new ArrayBuffer(4096); // 分配一个大小为4096字节的缓冲区
        const readLen = fileIo.readSync(file.fd, buffer); // 读取文件内容
        console.info('readSync data to file succeed and buffer size is:' + readLen);
        // [StartExclude fs_read_sync]
        this.fileContent = `Read ${readLen} bytes from file.`; // 显示读取的字节数
        // [EndExclude fs_read_sync]
        // [End fs_read_sync]
      } catch (err) {
        console.error(`Failed to read file, code is ${err.code}, message is ${err.message}`);
      } finally {
        fileIo.closeSync(file);
      }
    }
  }

}