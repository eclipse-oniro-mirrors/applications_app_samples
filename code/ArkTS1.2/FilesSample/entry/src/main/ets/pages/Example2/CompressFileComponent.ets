/**
 *
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 *
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,this
 * list of conditions and the following disclaimer.
 *
 * Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * THIS IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 'AS IS' AND ANY EXPRESS OR IMPLIED WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS,
 *
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

import { memo, __memo_context_type, __memo_id_type } from '@ohos.arkui.stateManagement';
import {
  Text,
  TextAttribute,
  Column,
  Component,
  Button,
  ButtonAttribute,
  ClickEvent,
  Row,
  HorizontalAlign,
  ForEach,
  Image,
  $r,
  Entry
} from '@ohos.arkui.component';
import { State, MutableState, stateOf, observableProxy, Link } from '@ohos.arkui.stateManagement';
import promptAction from '@ohos.promptAction';
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog';
import zlib from '@ohos.zlib';
import common from '@ohos.app.ability.common';
import fs from '@ohos.file.fs';
import { UIContext, PromptAction } from '@ohos.arkui.UIContext';

const TAG: string = 'compressFileComponent';
@Entry
@Component
export struct CompressFileComponent {
  @Link compressBundleName: string = '';
  // 压缩成功后压缩包路径
  @Link compressZipPath: string = '';
  // 待压缩文件所在目录名
  @Link beCompressFileDir: string = '';
  // rawfile被压缩文件的应用沙箱路径
  private rawfilePath: string = '';
  // 应用沙箱目录
  @State pathDir: string = '';
  // 压缩后的文件所处的应用沙箱目录
  @State outFileDir: string = '';
  @State beCompressFiles: Array<string> = new Array<string>();
  context: common.Context = this.getUIContext().getHostContext() as common.Context;
  uiContext: UIContext | undefined = undefined;

  aboutToAppear(): void {
    this.uiContext = this.getUIContext();
    this.initCompressFile(this.beCompressFileDir);
  }

  childWorker(): void {
    this.pathDir = this.context.filesDir; // 沙箱目录
    const rawfileDirName: string = this.beCompressFileDir; // 被压缩文件所在目录名
    const outFilePath: string = `${this.pathDir}/${this.compressZipPath}`; // 压缩包输出路径
    const outFileDir: string = outFilePath.slice(0, outFilePath.lastIndexOf('/')); // 压缩包输出目录
    // 判断结果输出目录是否存在
    if (!fs.accessSync(outFileDir)) {
      fs.mkdirSync(outFileDir);
    }

    let options: zlib.Options = {
      level: zlib.CompressLevel.COMPRESS_LEVEL_DEFAULT_COMPRESSION,
      memLevel: zlib.MemLevel.MEM_LEVEL_DEFAULT,
      strategy: zlib.CompressStrategy.COMPRESS_STRATEGY_DEFAULT_STRATEGY
    };
    try {
      // 对目录下的文件进行压缩
      zlib.compressFile(`${this.pathDir}/${this.beCompressFileDir}`, outFilePath, options,
        (errData: BusinessError<void> | null) => {
          if (errData == null) {
            this.compressBundleName = outFilePath.slice(outFilePath.lastIndexOf('/') + 1, outFilePath.length);
            let isSuccess = fs.accessSync(`${outFilePath}`);
            if(isSuccess){
              let promptAction: PromptAction = this.uiContext!.getPromptAction();
              promptAction.showToast({
                message: '压缩成功：' + this.compressBundleName,
                duration: 2000
              });
            }
          } else if(errData){
            hilog.error(0x0000, 'testTag',
              `compress failed with error message: ${errData.message}, error code: ${errData.code}`);
          }
        })
    } catch (errData) {
      let code = (errData as BusinessError).code;
      let message = (errData as BusinessError).message;
      hilog.error(0x0000, 'testTag', `compress errData is error code: ${code}, message: ${message}`);
    }
  }

  /**
   * 调用EAWorker对文件进行压缩
   * @returns
   */
  compressByWorker(): void {
    let worker: EAWorker = new EAWorker(true);
    worker.run<void>(this.childWorker);
    worker.join();
  }

  /**
   * 将待压缩文件写入到应用沙箱目录
   * @param beCompressFileDir 待压缩文件所处路径
   * @returns
   */
  initCompressFile(beCompressFileDir: string): void {
    //获取rawfile下的所有待压缩文件名
    this.beCompressFiles = this.context.resourceManager.getRawFileListSync(beCompressFileDir);
    this.beCompressFiles.forEach((fileName: string) => {
      let content = this.context.resourceManager.getRawFileContentSync(`${beCompressFileDir}/${fileName}`);
      this.pathDir = this.context.filesDir; // 获取应用沙箱目录
      this.rawfilePath = `${this.pathDir}/${beCompressFileDir}`; // 设置rawfile压缩文件的应用沙箱路径
      if (!fs.accessSync(this.rawfilePath)) {
        fs.mkdirSync(this.rawfilePath);
      }
      // 在指定路径以同步方法打开或创建文件
      let file = fs.openSync(this.rawfilePath + `/${fileName}`, fs.OpenMode.READ_WRITE | fs.OpenMode.CREATE);
      fs.writeSync(file.fd, 'hello world!');
      fs.closeSync(file);
    })
  }

  build() {
    Row() {
      Button('压缩')
        .width(60)
        .height(28)
        .borderRadius(12)
        .id('compressButton')
        .onClick((): void => {
          this.compressByWorker();
        })
    }
  }
}