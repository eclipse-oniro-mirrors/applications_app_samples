/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

// [Start pasteboard_usedata]
// [Start pasteboard_useudc]
import { BusinessError, pasteboard } from '@kit.BasicServicesKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
// [StartExclude pasteboard_usedata]
import { unifiedDataChannel, uniformDataStruct, uniformTypeDescriptor } from '@kit.ArkData';
// [EndExclude pasteboard_usedata]
const systemPasteboard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
// [StartExclude pasteboard_usedata]
// [StartExclude pasteboard_useudc]
export namespace TestJs {
  // 使用基础数据类型进行复制粘贴
  // [EndExclude pasteboard_usedata]
  export async function setPlainData(content: string): Promise<void> {
    try {
      let pasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, content);
      await systemPasteboard.setData(pasteData);
      hilog.info(0xFF00, '[Sample_pasteboard]', 'Set data to pasteboard successfully');
    } catch (error) {
      hilog.error(0xFF00, '[Sample_pasteboard]', `Failed to set data to pasteboard, error: ${error}`);
    }
  }
  export async function getPlainData(type: string): Promise<string> {
    //从系统剪贴板中读取数据
    try {
      let data = await systemPasteboard.getData();
      let recordCount = data.getRecordCount();
      let result = '';
      for (let i = 0; i < recordCount; i++) {
        let record = data.getRecord(i).toPlainText();
        hilog.info(0xFF00, '[Sample_pasteboard]', `Get data success, record: ${record}`);
        result = record;
      }
      return result;
    } catch (error) {
      hilog.error(0xFF00, '[Sample_pasteboard]', `Failed to get data from pasteboard, error: ${error}`);
      return '';
    }
  }
  // [End pasteboard_usedata]

  // 使用统一数据类型进行复制粘贴
  // [EndExclude pasteboard_useudc]
  // 1.构造一条PlainText数据
  export async function handleUniformData() {
    let plainText: uniformDataStruct.PlainText = {
      uniformDataType: uniformTypeDescriptor.UniformDataType.PLAIN_TEXT,
      textContent: 'PLAINTEXT_CONTENT',
      abstract: 'PLAINTEXT_ABSTRACT',
    }

    let record = new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainText);
    let data = new unifiedDataChannel.UnifiedData();
    data.addRecord(record);
    // 2.向系统剪贴板中存入一条PlainText数据
    try {
      await systemPasteboard.setUnifiedData(data);
      hilog.info(0xFF00, '[Sample_pasteboard]', 'Succeeded in setting UnifiedData.');
      // 存入成功，处理正常场景
    } catch (err) {
      hilog.error(0xFF00, '[Sample_pasteboard]', `Failed to set UnifiedData. Cause: ${err.message}`);
      // 处理异常场景
    };
    // 3.从系统剪贴板中读取这条text数据
    try {
      let pasteData = await systemPasteboard.getUnifiedData();
      let records: unifiedDataChannel.UnifiedRecord[] = pasteData.getRecords();
      for (let j = 0; j < records.length; j++) {
        if (records[j].getType() === uniformTypeDescriptor.UniformDataType.PLAIN_TEXT) {
          let text = records[j].getValue() as uniformDataStruct.PlainText;
          hilog.info(0xFF00, '[Sample_pasteboard]', `${j + 1}.${text.textContent}`);
        }
      }
    } catch (err) {
      hilog.error(0xFF00, '[Sample_pasteboard]', `Failed to get UnifiedData. Cause: ${err.message}`);
      // 处理异常场景
    };
  }
  // [End pasteboard_useudc]
}
