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

import cloudDiskBundleInfoTest from './CloudDiskBundleInfo.test';
import cloudDiskTest from './CloudDisk.test';
import cloudDiskApiExtraTest from './CloudDiskApiExtra.test';
import cloudDiskApiExtraTestPart2 from './CloudDiskApiExtraPart2.test';
import cloudDiskContractExtraTest from './CloudDiskContractExtra.test';
import cloudDiskApiExtra2Test from './CloudDiskApiExtra2.test';
import cloudDiskContractExtra2Test from './CloudDiskContractExtra2.test';
import cloudDiskApiExtra3Test from './CloudDiskApiExtra3.test';
import cloudDiskBundleInfoResidualTest from './CloudDiskBundleInfoResidual.test';
import cloudDiskBundleFormatResidualTest from './CloudDiskBundleFormatResidual.test';

export default function testsuite() {
  cloudDiskBundleInfoTest();
  cloudDiskTest();
  cloudDiskApiExtraTest();
  cloudDiskApiExtraTestPart2();
  cloudDiskContractExtraTest();
  cloudDiskApiExtra2Test();
  cloudDiskContractExtra2Test();
  cloudDiskApiExtra3Test();
  cloudDiskBundleInfoResidualTest();
  cloudDiskBundleFormatResidualTest();
}
