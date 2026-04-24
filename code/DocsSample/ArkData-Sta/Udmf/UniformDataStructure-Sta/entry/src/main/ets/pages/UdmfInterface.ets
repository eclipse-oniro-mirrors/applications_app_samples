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

// [Start import_module]
// 1. 导入unifiedDataChannel和uniformTypeDescriptor模块。
import { uniformDataStruct, uniformTypeDescriptor, unifiedDataChannel } from '@kit.ArkData';
import { hilog } from '@kit.PerformanceAnalysisKit';
// [End import_module]

export function UniformDataStructure_Sta() {
  // [Start unified_data_structure]
  // 2. 创建超链接数据记录。
  let hyperlinkDetails: Record<string, string> = {
    'attr1': 'value1',
    'attr2': 'value2'
  }
  let hyperlink: uniformDataStruct.Hyperlink = {
    uniformDataType: 'general.hyperlink',
    url: 'www.XXX.com',
    description: 'This is the description of this hyperlink',
    details: hyperlinkDetails
  }

  // 修改hyperlink属性description
  hyperlink.description = '...';

  // 访问对象属性。
  hilog.info(0xFF00, '[Sample_Udmf]', `hyperlink.url = ${hyperlink.url}`);

  // 3. 创建纯文本数据类型记录，将其添加到刚才创建的UnifiedData对象。
  let plainTextDetails: Record<string, string> = {
    'attr1': 'value1',
    'attr2': 'value2'
  }
  let plainText: uniformDataStruct.PlainText = {
    uniformDataType: 'general.plain-text',
    textContent: 'This is plainText textContent example',
    details: plainTextDetails
  }
  // 4. 创建一个统一数据对象实例。
  let unifiedData = new unifiedDataChannel.UnifiedData();
  let hyperlinkRecord =
    new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.HYPERLINK, hyperlink);
  let plainTextRecord =
    new unifiedDataChannel.UnifiedRecord(uniformTypeDescriptor.UniformDataType.PLAIN_TEXT, plainText);

  // 5. 添加plainText数据记录。
  unifiedData.addRecord(hyperlinkRecord);
  unifiedData.addRecord(plainTextRecord);

  // 6. 记录添加完成后，可获取当前UnifiedData对象内的所有数据记录。
  let records = unifiedData.getRecords();

  // 7. 遍历每条记录，判断该记录的数据类型，转换为子类对象，得到原数据记录。
  for (let i = 0; i < records.length; i++) {
    let unifiedDataRecord = records[i] as unifiedDataChannel.UnifiedRecord;
    let entries: Record<string, unifiedDataChannel.ValueType> = unifiedDataRecord.getEntries();
    if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.HYPERLINK.toString()) {
      // 读取该数据记录的类型
      let obj: uniformDataStruct.Hyperlink =
        entries[uniformTypeDescriptor.UniformDataType.HYPERLINK] as uniformDataStruct.Hyperlink;
      if (obj != undefined) {
        hilog.info(0xFF00, '[Sample_Udmf]',
          `obj.uniformDataType: ${obj.uniformDataType} + , hyperlink.uniformDataType: ${hyperlink.uniformDataType}`);
      }
    }
    if (unifiedDataRecord.getType() == uniformTypeDescriptor.UniformDataType.PLAIN_TEXT.toString()) {
      let plainTextRead: uniformDataStruct.PlainText =
        entries[uniformTypeDescriptor.UniformDataType.PLAIN_TEXT] as uniformDataStruct.PlainText;
        if (plainTextRead != undefined) {
          hilog.info(0xFF00, '[Sample_Udmf]',
            `plainTextRead.uniformDataType: ${plainTextRead.uniformDataType} + , plainText.uniformDataType: ${plainText.uniformDataType}`);
          }
        }
      }
  // [End unified_data_structure]
}