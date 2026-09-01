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

// [Start get_pasteboard_data]
// [Start set_pasteboard_data]
import pasteboard from '@ohos.pasteboard';
import { BusinessError } from '@ohos.base';
// [StartExclude get_pasteboard_data]

// 设备A复制数据，写入剪贴板服务。
export async function setPasteDataTest(): Promise<void> {
    let text: string = 'hello world';
    let pasteData: pasteboard.PasteData = pasteboard.createData(pasteboard.MIMETYPE_TEXT_PLAIN, text);
    let systemPasteBoard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
    await systemPasteBoard.setData(pasteData).catch((err: BusinessError) => {
        console.error(`Failed to set pastedata. Code: ${err.code}, message: ${err.message}`);
    });
}
// [End set_pasteboard_data]
// [EndExclude get_pasteboard_data]

// 设备B粘贴数据，读取剪贴板内容
export async function getPasteDataTest(): Promise<void> {
    let systemPasteBoard: pasteboard.SystemPasteboard = pasteboard.getSystemPasteboard();
    systemPasteBoard.getData((err: BusinessError, data: pasteboard.PasteData) => {
        if (err) {
            console.error(`Failed to get pastedata. Code: ${err.code}, message: ${err.message}`);
            return;
        }
        // 对pastedata进行处理，获取类型，个数等
        let recordCount: number = data.getRecordCount(); // 获取剪贴板内record的个数
        let types: string = data.getPrimaryMimeType(); // 获取剪贴板内数据的类型
        let primaryText: string = data.getPrimaryText(); // 获取剪贴板内数据的内容
    });
}
// [End get_pasteboard_data]