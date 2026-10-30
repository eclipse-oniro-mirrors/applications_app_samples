/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// [ukey_best_practice_arkts]
import testNapi from "libentry.so";
@Entry
@Component
struct Index {
    /* 通过证书弹窗接口获取 */
    @State keyUri: string = 'Hello World';
    build() {
        Row() {
        Column() {
            Text('Hello World')
                .fontSize(50)
                .fontWeight(FontWeight.Bold)
                .onClick(() => {
                    testNapi.getUkeyCert(keyUri);
                    testNapi.openResource(keyUri);
                    testNapi.getUkeyPinAuthState(keyUri);
                })
        }
        .width('100%')
        }
        .height('100%')
    }
}
// [ukey_best_practice_arkts]
