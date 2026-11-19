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

import { BusinessError } from '@kit.BasicServicesKit';
import { decodeDisplayText } from '../utils/DisplayText';
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN: number = 0x0000;
const TAG: string = 'UsingWordBreak';
const RAW_FILE_NAME: string = 'sanguo.txt';

@Entry
@Component
struct UsingWordBreak {
  @State message: string = 'Using Word Break';

  aboutToAppear(): void {
    hilog.info(DOMAIN, TAG, '%{public}s', 'page appeared');
    getContext().resourceManager.getRawFileContent(RAW_FILE_NAME, (error: BusinessError, value: Uint8Array): void => {
      if (error != null) {
        hilog.error(DOMAIN, TAG, 'Failed to read raw file. Cause: %{public}s', JSON.stringify(error));
        return;
      }
      try {
        this.message = decodeDisplayText(value);
      } catch (decodeError) {
        hilog.error(DOMAIN, TAG, 'Failed to decode raw file: %{private}s', JSON.stringify(decodeError));
      }
    })
  }

  build() {
    Column() {
      Scroll() {
        Text(this.message)
          .fontSize(12)
          .wordBreak(WordBreak.BREAK_ALL)
      }
    }
    .height('100%')
    .width('100%')
  }
}
