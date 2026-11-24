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

/**
 * @file entry/src/main/ets/pages/Index.ets
 * 文件职责：Index 相关的 ArkTS 声明与 UI 构建逻辑。
 * 主要声明：Index。
 * 约定：所有 UI 组件均带 .id() 便于自动化测试按 id 定位；注释描述组件职责与关键属性。
 */

import testNapi from 'libentry.so';
import resourceManager from '@ohos.resourceManager';
import { util } from '@kit.ArkTS';
import { Logger } from '../utils/Logger';

/**
 * Index：自定义组件定义，承载本文件对应的UI 结构与状态。
 */
@Entry
@Component
struct Index {
  private resMgr: resourceManager.ResourceManager = getContext().resourceManager;
  private rawFileList: string = '';
  private rawFileContent: string = '';
  private rawFileDescriptor: resourceManager.RawFileDescriptor | undefined = undefined;
  private rawFileContentWithOffset: string = '';
  private rawFileContent64: string = '';
  private rawFileDescriptor64: resourceManager.RawFileDescriptor | undefined = undefined;
  private rawFileContentWithOffset64: string = '';

  /**
   * aboutToAppear：组件即将挂载时回调，用于初始化数据与订阅。
   */
  aboutToAppear() {
    let textDecoder = new util.TextDecoder();
    // get raw file list
    this.rawFileList = JSON.stringify(testNapi.getFileList(this.resMgr, ''));

    // get content of rawfile.txt
    let rawFileArray = testNapi.getRawFileContent(this.resMgr, 'rawfile.txt');
    this.rawFileContent = textDecoder.decodeToString(rawFileArray);

    // get raw file descriptor of rawfile.txt
    this.rawFileDescriptor = testNapi.getRawFileDescriptor(this.resMgr, 'rawfile.txt');

    // get content of rawfile.txt with offset 3
    rawFileArray = testNapi.getRawFileContent(this.resMgr, 'rawfile.txt', 3);
    this.rawFileContentWithOffset = textDecoder.decodeToString(rawFileArray);

    // get content of rawfile1.txt by getRawFileContent64
    rawFileArray = testNapi.getRawFileContent64(this.resMgr, 'rawfile1.txt');
    this.rawFileContent64 = textDecoder.decodeToString(rawFileArray);

    // get raw file descriptor of rawfile1.txt by getRawFileDescriptor64
    this.rawFileDescriptor64 = testNapi.getRawFileDescriptor64(this.resMgr, 'rawfile1.txt');

    // get content of rawfile1.txt by getRawFileContent64 with offset 6
    rawFileArray = testNapi.getRawFileContent64(this.resMgr, 'rawfile1.txt', 8);
    this.rawFileContentWithOffset64 = textDecoder.decodeToString(rawFileArray);
  }

  /**
   * aboutToDisappear：组件即将销毁时回调，用于释放资源与取消订阅。
   */
  aboutToDisappear(): boolean | void {
    Logger.info('aboutToDisappear');
    if (this.rawFileDescriptor) {
      let result = testNapi.releaseRawFileDescriptor(this.resMgr, this.rawFileDescriptor);
      Logger.info(`releaseRawFileDescriptor: ${result}`);
    }

    if (this.rawFileDescriptor64) {
      let result = testNapi.releaseRawFileDescriptor64(this.resMgr, this.rawFileDescriptor64);
      Logger.info(`releaseRawFileDescriptor64: ${result}`);
    }
  }

  /**
   * build：UI 构建入口，声明本组件的组件树结构。
   */
  build() {
    // Row：水平布局容器
    // 关键属性：高度
    Row() {
      // Column：垂直布局容器
      // 关键属性：内边距、宽度
      Column() {
        // Text：文本
        // 关键属性：字号、宽度、外边距
        Text('file list: ' + this.rawFileList)
          .id('raw_file_list')
          .fontSize(20)
          .width('100%')
          .margin({ bottom: 15 })
        // Text：文本
        // 关键属性：字号、宽度、外边距
        Text('rawfile.txt content: ' + this.rawFileContent)
          .id('raw_file_content')
          .fontSize(20)
          .width('100%')
          .margin({ bottom: 15 })
        // Text：文本
        // 关键属性：字号、宽度、外边距
        Text('rawfile.txt content with offset: ' + this.rawFileContentWithOffset)
          .id('raw_file_content_offset')
          .fontSize(20)
          .width('100%')
          .margin({ bottom: 15 })
        // Text：文本
        // 关键属性：字号、宽度、外边距
        Text('rawfile.txt fd: ' + this.rawFileDescriptor?.fd)
          .id('raw_file_fd')
          .fontSize(20)
          .width('100%')
          .margin({ bottom: 15 })
        // Text：文本
        // 关键属性：字号、宽度、外边距
        Text('rawfile.txt fd.offset: ' + this.rawFileDescriptor?.offset)
          .id('raw_file_fd_offset')
          .fontSize(20)
          .width('100%')
          .margin({ bottom: 15 })
        // Text：文本
        // 关键属性：字号、宽度、外边距
        Text('rawfile.txt fd.length: ' + this.rawFileDescriptor?.length)
          .id('raw_file_fd_length')
          .fontSize(20)
          .width('100%')
          .margin({ bottom: 15 })

        // Text：文本
        // 关键属性：字号、宽度、外边距
        Text('rawfile.txt content64: ' + this.rawFileContent64)
          .id('raw_file_content64')
          .fontSize(20)
          .width('100%')
          .margin({ bottom: 15, top: 15 })
        // Text：文本
        // 关键属性：字号、宽度、外边距
        Text('rawfile.txt content with offset64: ' + this.rawFileContentWithOffset64)
          .id('raw_file_content_offset64')
          .fontSize(20)
          .width('100%')
          .margin({ bottom: 15 })
        // Text：文本
        // 关键属性：字号、宽度、外边距
        Text('rawfile.txt fd64: ' + this.rawFileDescriptor64?.fd)
          .id('raw_file_fd64')
          .fontSize(20)
          .width('100%')
          .margin({ bottom: 15 })
        // Text：文本
        // 关键属性：字号、宽度、外边距
        Text('rawfile.txt fd.offset64: ' + this.rawFileDescriptor64?.offset)
          .id('raw_file_fd_offset64')
          .fontSize(20)
          .width('100%')
          .margin({ bottom: 15 })
        // Text：文本
        // 关键属性：字号、宽度、外边距
        Text('rawfile.txt fd.length64: ' + this.rawFileDescriptor64?.length)
          .id('raw_file_fd_length64')
          .fontSize(20)
          .width('100%')
          .margin({ bottom: 15 })
      }.id('index_column_2')
      .padding({ left: 15, right: 15 })
      .width('100%')
    }.id('index_row_1')
    .height('100%')
  }
}
