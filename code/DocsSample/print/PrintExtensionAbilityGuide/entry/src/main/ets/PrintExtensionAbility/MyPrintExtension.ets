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

// [Start print_extension_impl]
// [Start print_extension_import]
import { PrintExtensionAbility } from '@kit.BasicServicesKit';
// [End print_extension_import]
import { Want } from '@kit.AbilityKit';
// 创建打印扩展能力类，继承PrintExtensionAbility，并实现打印扩展功能。
export default class MyPrintExtension extends PrintExtensionAbility {
    // 系统首次连接打印扩展时调用。
    onCreate(want: Want): void {
        console.info('onCreate');
        // 初始化扩展能力，可以在此注册事件。
    }
    // 结束打印扩展时调用。
    onDestroy(): void {
        console.info('onDestroy');
        // 注销事件。
    }
    // 开始发现打印机时调用。
    onStartDiscoverPrinter(): void {
        console.info('onStartDiscoverPrinter enter');
        // 实现发现打印机的逻辑。
    }
    // 停止发现打印机时调用。
    onStopDiscoverPrinter(): void {
        console.info('onStopDiscoverPrinter enter');
        // 实现停止发现打印机的逻辑。
    }
    // 连接某台打印机时调用。
    onConnectPrinter(printerId: number): void {
        console.info('onConnectPrinter enter');
        // 实现连接打印机逻辑。可以通过打印机ID连接指定的打印机、查询打印机能力等。
    }
    // 断开与某台打印机的连接时调用。
    onDisconnectPrinter(printerId: number): void {
        console.info('onDisconnectPrinter enter');
        // 实现断开打印机连接逻辑。可以通过打印机ID断开与指定打印机的连接。
    }
}
// [End print_extension_impl]
